Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A58CF4BB8A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqiIAVwTM/0jmNuHGbGnPdzRNNhgYu9moSMVdBGdHeU=; b=ptv7uywmw/oj8i
	I42K9aL4tWURaOj2c2W9eirRHTn6GkPbKAhATIFlxQaiHcL9Iw9nGUrd8mjBsk0hgTM9BvqYWAO81
	H7ch4j3DUKsgLQxf/3UaobwpXOzuNUSsaAshceB6pcSO0ERhDUpMgSucSDs/b3en35QTLH/S7vxxJ
	jJIziT/7JycaTJ1u/p40zVDjM7shyJw9gCcMk9EKC8Ad2zhcqUbRf066XvaIcXDGLcLu84KsmGXxj
	/vQ62iUvdXcdGwq4R2DK2D+9JScU0hQSfg7A+J6JKF3dN5Y8GIQSVfoLBCN44spIHGMKurKBe7KzR
	TZwyFkESlBaa2/5NVbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzRb-00000002mV3-0TG4;
	Tue, 24 Feb 2026 20:55:47 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzRY-00000002mTr-0PoU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 20:55:46 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id us1GvEu1OipkCuzRVvcgee; Tue, 24 Feb 2026 20:55:41 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id uzRUv9lh6SqlVuzRUvEsXd; Tue, 24 Feb 2026 20:55:40 +0000
X-Authority-Analysis: v=2.4 cv=I7FlRMgg c=1 sm=1 tr=0 ts=699e104c
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=7jLG3vr0xv3RlmufI5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=605D1atgrhxBK+g/fa4UaJI857HWMWFLmIjAiil6I1I=; b=y5Zgh8rsy0gArKveqbuKhkEZIt
	Z6a5DQ/DxsNIuzv0rP5sjhacVvbGEJaHaR6/s309cUj+lcdWRZH/t36PhAmJ7zEaMV1eVeDhMDyV+
	pi54uIw3TlVLgHQIJTQBlKMM7yE0Gs1jFhnAgKccaQnf+gutAa5ij9XfqQ7fUOXAc8kUtukTY14Kv
	uwgQcLJI9jED4zf5V7y2oo8ex0EOIYwQY2WZrjHTh+iXBSmyt6HTZwI6F7lcM5KTkBdZKMeFvdJap
	a07VBh9hbByd/2tAGkvy1hiMvY1/9502XXOjzU4Q/PfmgwRAwmsACU/e/aJEfv/xmV+5+xGojimje
	vMfZLk1g==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:52214 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <re@w6rz.net>)
	id 1vuzRT-00000000bqv-39S0;
	Tue, 24 Feb 2026 13:55:39 -0700
Message-ID: <5a08d5c5-a91b-458b-8434-84566387a27e@w6rz.net>
Date: Tue, 24 Feb 2026 12:55:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
To: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: wangkefeng.wang@huawei.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 jackmanb@google.com, jane.chu@oracle.com, hannes@cmpxchg.org,
 willy@infradead.org, muchun.song@linux.dev, osalvador@suse.de,
 sidhartha.kumar@oracle.com, vbabka@suse.cz,
 claudiu.beznea.uj@bp.renesas.com, Mark Brown <broonie@kernel.org>,
 akpm@linux-foundation.org, pjw@kernel.org
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
 <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
 <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
 <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1vuzRT-00000000bqv-39S0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:52214
X-Source-Auth: re@w6rz.net
X-Email-Count: 13
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDfTH4zjfUo9KEl2xve+qdg3Lb5NQT3RQ0gvYweH3UlGCJteFtiS02glCy5zkKbeAkdVFXjzw3v8LcRKKFSU3a32uXV/UoD4pLr+j8vikXa4bFph/0L7
 tM0uwmN7wrMnHHfwkd22J6maziX8o1gBOPL/9Le4ZT7v7jZqdiTx3/faPOCGKVSPBRZEMfgUGZIbwZXEFS+306IP4IDzvGMsIEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_125544_217410_2E83EFF0 
X-CRM114-Status: GOOD (  15.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8yNC8yNiAwOToyOSwgWmkgWWFuIHdyb3RlOgo+IE9uIDI0IEZlYiAyMDI2LCBhdCAxMjox
NywgWmkgWWFuIHdyb3RlOgo+Cj4+IE9uIDI0IEZlYiAyMDI2LCBhdCAxMjoxNCwgWmkgWWFuIHdy
b3RlOgo+Pgo+Pj4gT24gMjQgRmViIDIwMjYsIGF0IDEyOjA3LCBEYXZpZCBIaWxkZW5icmFuZCB3
cm90ZToKPj4+Cj4+Pj4+IERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3Jn
PiBoYXQgYW0gMjQuMDIuMjAyNiAxMjowMCBDRVQgZ2VzY2hyaWViZW46Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDIvMjQvMjYgMDk6MzcsIFJvbiBFY29ub21vcyB3cm90
ZToKPj4+Pj4KPj4+Pj4+IEknbSBnZXR0aW5nIGEgQlVHIGR1bXAgZHVyaW5nIHNodXRkb3duIHdp
dGggTGludXggdjcuMC1yYzEgb24gUklTQy1WLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4g
WyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgc2h1dGRvd24udGFyZ2V0IC0gU3lzdGVtIFNodXRkb3du
Lgo+Pj4+Pj4KPj4+Pj4+IFsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IGZpbmFsLnRhcmdldCAtIExh
dGUgU2h1dGRvd24gU2VydmljZXMuCj4+Pj4+Pgo+Pj4+Pj4gWyAgT0sgIF0gRmluaXNoZWQgc3lz
dGVtZC1yZWJvb3Quc2VydmljZSAtIFN5c3RlbSBSZWJvb3QuCj4+Pj4+Pgo+Pj4+Pj4gWyAgT0sg
IF0gUmVhY2hlZCB0YXJnZXQgcmVib290LnRhcmdldCAtIFN5c3RlbSBSZWJvb3QuCj4+Pj4+Pgo+
Pj4+Pj4gWyAgMTczLjk4NTI0OV0gQlVHOiBCYWQgcGFnZSBzdGF0ZSBpbiBwcm9jZXNzIHNodXRk
b3duICBwZm46Zjg4NTAKPj4+Pj4+Cj4+Pj4+PiBbICAxNzMuOTg1MzExXSBwYWdlOiByZWZjb3Vu
dDoxIG1hcGNvdW50OjAgbWFwcGluZzowMDAwMDAwMDAwMDAwMDAwCj4+Pj4+Pgo+Pj4+Pj4gaW5k
ZXg6MHgwIHBmbjoweGY4ODUwCj4+Pj4+Pgo+Pj4+Pj4gWyAgMTczLjk4NTMzNl0gZmxhZ3M6IDB4
ZmZmZjgwMDAwMDAwMDAwKG5vZGU9MHx6b25lPTB8Cj4+Pj4+Pgo+Pj4+Pj4gbGFzdGNwdXBpZD0w
eDFmZmZmKSBDTUEKPj4+Pj4+Cj4+Pj4+PiBbICAxNzMuOTg1MzY1XSByYXc6IDBmZmZmODAwMDAw
MDAwMDAgZmZmZmZmYzUwMWUyMTQ0OCBmZmZmZmZjNjAwZjJhZTg4Cj4+Pj4+Pgo+Pj4+Pj4gMDAw
MDAwMDAwMDAwMDAwMAo+Pj4+Pj4KPj4+Pj4+IFsgIDE3My45ODUzODZdIHJhdzogMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAxZmZmZmZmZmYKPj4+Pj4+Cj4+Pj4+PiAw
MDAwMDAwMDAwMDAwMDAwCj4+Pj4+Pgo+Pj4+Pj4gWyAgMTczLjk4NTQwM10gcGFnZSBkdW1wZWQg
YmVjYXVzZTogbm9uemVybyBfcmVmY291bnQKPj4+Pj4gU28sIHdlJ3JlIGZyZWVpbmcgc29tZXRo
aW5nIGZyb20gQ01BIGluIGNtYV9yZWxlYXNlKCkuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IElu
IGNtYV9yZWxlYXNlKCkgd2UgaXRlcmF0ZSBhbGwgcGFnZXMgdG8gZGVjcmVtZW50IHRoZWlyIHJl
ZmNvdW50Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFZNX1dBUk5fT04oIXB1dF9wYWdlX3Rlc3R6
ZXJvKHBmbl90b19wYWdlKHBmbikpKTsKPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gSSB3b3VsZCBl
eHBlY3QgdGhhdCB0aGlzIHdvdWxkIGZpcmUgYWxyZWFkeSBpZiB0aGVyZSBpcyBzdGlsbCBhIHBh
Z2UKPj4+Pj4KPj4+Pj4gcmVmZXJlbmNlZC4KPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gQXJlIHlv
dSBydW5uaW5nIHdpdGggQ09ORklHX0RFQlVHX1ZNPXkgPwo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+
Pgo+Pj4+Pgo+Pj4+PiAtLQo+Pj4+Pgo+Pj4+PiBDaGVlcnMsCj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IERhdmlkCj4+Pj4gVGhpbmtpbmcgYWdhaW4gd2l0aG91dCBteSBjb21wdXRlciBhdCBoYW5k
IOKApiBpc27igJh0IHRoZSBjYWxsIGNvbXBsZXRlbHkgb3B0aW1pemVkIG91dCB3aXRob3V0IENP
TkZJR19ERUJVR19WTT8KPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBBdCBsZWFzdCB0aGF04oCZcyB3aGF0
IEkgcmVtZW1iZXIuCj4+PiBSaWdodC4gV2l0aG91dCBDT05GSUdfREVCVUdfVk09eSwgVk1fV0FS
Tl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpCj4+PiBhbmQgaXNfY2hl
Y2tfcGFnZXNfZW5hYmxlZCgpLCB3aGljaCBsZWFkcyB0byBmcmVlX3BhZ2VfaXNfYmFkKCnigJlz
Cj4+PiDigJxwYWdlIGR1bXBlZCBiZWNhdXNlOiBub256ZXJvIF9yZWZjb3VudOKAnSwgYXJlIGRp
c2FibGVkLgo+Pj4KPj4+IEl0IHNlZW1zIHRvIG1lIHRoYXQgc29tZW9uZSBlbHNlIGJ1bXAgdGhl
IHBhZ2UgcmVmY291bnQgYmV0d2Vlbgo+Pj4gVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVzdHplcm8o
cGZuX3RvX3BhZ2UocGZuKSkpIGFuZCBmcmVlX3BhZ2VfaXNfYmFkKCkuCj4+Pgo+PiBNZXJnaW5n
IFJvbuKAmXMgcmVwbHkgZnJvbSBhbm90aGVyIHRocmVhZFsxXToKPj4KPj4g4oCcU29tZXRoaW5n
IHN0cmFuZ2UgaXMgZ29pbmcgb24uIEkgZW5hYmxlZCBDT05GSUdfREVCVUdfVk0gYnkgaXRzZWxm
IGFuZAo+PiB0aGUgaXNzdWUgd2VudCBhd2F5LiBMZXQgbWUgdHJ5IENPTkZJR19ERUJVR19QQUdF
X1JFRi7igJ0KPj4KPj4gTG9va3MgbGlrZSBzb21ldGhpbmcgaXMgcmFjeSwgc2luY2UgaXQgaXMg
cmVwcm9kdWNpYmxlIHJlbGlhYmx5Lgo+Pgo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzMwZGQxZWZjLTliZDktNDY2NC05OTllLTYxMGQxODE2MDBmOUB3NnJ6Lm5ldC8KPiBWTV9X
QVJOX09OKCkgaXMgQlVJTERfQlVHX09OX0lOVkFMSUQoKSB3aGVuIENPTkZJR19ERUJVR19WTSBp
cyBvZmYuIE9ubHkKPiB0aGUgdmFsaWRpdHkgb2YgdGhlIGV4cHJlc3Npb24gaXMgY2hlY2tlZCBh
bmQgbm8gY29kZSBpcyBnZW5lcmF0ZWQuCj4gU28gdGhhdCBwdXRfcGFnZV90ZXN0emVybygpIGJl
Y29tZXMgYSBOT1AuCj4KPiBIaSBSb24sCj4KPiBDYW4geW91IGNoZWNrIGlmIHRoZSBwYXRjaCBi
ZWxvdyBmaXggdGhlIGlzc3VlIHdpdGhvdXQgQ09ORklHX0RFQlVHX1ZNPwo+Cj4gZGlmZiAtLWdp
dCBhL21tL2NtYS5jIGIvbW0vY21hLmMKPiBpbmRleCA5NGI1ZGE0NjhhN2QuLjk2YmU2MmViMzcx
MyAxMDA2NDQKPiAtLS0gYS9tbS9jbWEuYwo+ICsrKyBiL21tL2NtYS5jCj4gQEAgLTEwMjAsOCAr
MTAyMCwxMSBAQCBib29sIGNtYV9yZWxlYXNlKHN0cnVjdCBjbWEgKmNtYSwgY29uc3Qgc3RydWN0
IHBhZ2UgKnBhZ2VzLAo+ICAgCQlyZXR1cm4gZmFsc2U7Cj4KPiAgIAlwZm4gPSBwYWdlX3RvX3Bm
bihwYWdlcyk7Cj4gLQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKywgcGZuKyspCj4gLQkJVk1f
V0FSTl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpOwo+ICsJZm9yIChp
ID0gMDsgaSA8IGNvdW50OyBpKyssIHBmbisrKSB7Cj4gKwkJaW50IF9fbWF5YmVfdW51c2VkIHJl
dCA9IHB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19wYWdlKHBmbikpOwo+ICsKPiArCQlWTV9XQVJO
X09OKCFyZXQpOwo+ICsJfQo+Cj4gICAJX19jbWFfcmVsZWFzZV9mcm96ZW4oY21hLCBjbXIsIHBh
Z2VzLCBjb3VudCk7Cj4KPgo+Cj4gQmVzdCBSZWdhcmRzLAo+IFlhbiwgWmkKClllcywgdGhhdCBw
YXRjaCBmaXhlcyB0aGUgaXNzdWUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
