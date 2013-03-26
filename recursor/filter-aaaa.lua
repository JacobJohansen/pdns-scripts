-- PowerDNS recursor: Filter AAAA records
-- Copyright (c) 2013 SATOH Fumiyasu @ OSS Technology Corp., Japan
--               https://GitHub.com/fumiyas/
--               https://twitter.com/satoh_fumiyasu
--
-- License GPLv3+: GNU GPL version 3 or later
--
-- PowerDNS recursor 3.4+ is required

function postresolve(remoteip, domain, qtype, records, rcode)
  rcode_new = rcode
  records_new = {}

  for key, record in ipairs(records) do
    if record.qtype ~= pdns.AAAA then
      records_new[key] = record
    end
  end

  if #records_new == 0 then
    rcode_new = pdns.NXDOMAIN
  end

  return rcode_new, records_new
end

