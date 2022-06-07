Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB75C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBCd9MeZG23hk+8Dht5SFbtFF2AeDyWh8s021foE+7w=; b=E6yQEHav8y2xiPB8vyjmhvqCWk
	LayvQ4MHSvwHhe3nrJs0PXKfbCuWzx6c1ztLWF71bW58hRZoREvo++k6L/1EU59nIikJfOWb27HQS
	Bs6O1QGPKjN5gSmkNpZXdvgs93yDqwzid2DXGGFMx7vN/XB015Xex5g1+y0AZO7MtgsvMqtvEPb38
	dlYv6tUjvkOhRa9czwKUVmJZP070i/MHVsCQRL9lNf62+uYoUArCkTVPK+5ykMTqYid1YkvOvCgYh
	avArCCQE+vU0rZP3HglMQsKEvTIt668s+TDYFzhrR/38njoOCn4Q3wMy6Vf5Q2ogG2CeXv+ZpxEAR
	RH4zq/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyg6o-009cA3-Bm; Tue, 07 Jun 2022 20:47:26 +0000
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyg6j-009bqf-5z
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 20:47:22 +0000
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
	by progateway6.mail.pro1.eigbox.com (Postfix) with ESMTP id 3A32F10041232
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jun 2022 20:46:55 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id yg6InfKjAegIbyg6JnuiGX; Tue, 07 Jun 2022 20:46:55 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=cY8XElPM c=1 sm=1 tr=0 ts=629fb93f
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=JPEYwPQDsx4A:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=VwQbUJbxAAAA:8
 a=FDXPpHPgRJWCp2rMUuoA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yPiHGqKsGbhSH2O3uOVjEGQO1t3l3ZCczdGfr/fjGfY=; b=esuVSpsGq0mTBzUDjf/iWJo/Gl
	ck6jcfSL37XcusiPq+rtpfPUlhouLtrc8tedChFRFDZbj7i1jSEYwPl3fEnfjVRfo/ckeOGN6BOcH
	FJMnMurxB6ggzOgRKjj1ObhYg2HSBYA0zrv/Zdiwy3/pqKBEM3L8MMC7IYynRTGDtdwRzhPA1wh7i
	z6FFu9luLCVWYJew2tO9eOAJHjNUXNOenrSD1743E6wpXLOTBkQJVtOxsqXkuXUVDF8c6ccimWZ3F
	qjM3ffsanIQCfVSPTH+uaC0mzNieXrSQWU1+rzMuA1rTb51Lwa9PiFvkS4ju+zcivHssAOcB6oBI5
	y+0adxjA==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:54014 helo=[10.0.1.48])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1nyg6I-001GrC-GR;
	Tue, 07 Jun 2022 14:46:54 -0600
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>, heiko@sntech.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
From: Ron Economos <re@w6rz.net>
Message-ID: <d7c8ee82-ce85-5d55-2865-4b610c9d3b9d@w6rz.net>
Date: Tue, 7 Jun 2022 13:46:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1nyg6I-001GrC-GR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.48]) [73.162.232.9]:54014
X-Source-Auth: re@w6rz.net
X-Email-Count: 3
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_134721_387770_9FF158AE 
X-CRM114-Status: GOOD (  11.07  )
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

T24gNS8zMS8yMiAxMDoxMyBBTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA5MjgyZDA5OTY5MzZjNWZiZjg3N2MwZDA5NmEzZmViNDU2
Yzg3OGFkOgo+Cj4gICAgY3NreTogTW92ZSB0byBnZW5lcmljIHRpY2tldC1zcGlubG9jayAoMjAy
Mi0wNS0xMSAxMTo1MDoxNSAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+Cj4gICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdCB0YWdzL3Jpc2N2LWZvci1saW51cy01LjE5LW13MAo+Cj4g
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc2OTlmN2FhY2YzZWJmZWU1MWM2NzBiNmY3
OTZiMjc5N2YwZjc0ODc6Cj4KPiAgICBSSVNDLVY6IFByZXBhcmUgZHJvcHBpbmcgd2VlayBhdHRy
aWJ1dGUgZnJvbSBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zW19hZGRdICgyMDIyLTA1LTMw
IDE2OjA0OjM3IC0wNzAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFJJU0MtViBQYXRjaGVzIGZvciB0aGUgNS4x
OSBNZXJnZSBXaW5kb3csIFBhcnQgMQo+Cj4gKiBTdXBwb3J0IGZvciB0aGUgU3ZwYm10IGV4dGVu
c2lvbiwgd2hpY2ggYWxsb3dzIG1lbW9yeSBhdHRyaWJ1dGVzIHRvIGJlCj4gICAgZW5jb2RlZCBp
biBwYWdlcy4KPgo+Cj4gSGVpa28gU3R1ZWJuZXIgKDEyKToKPiAgICAgICAgcmlzY3Y6IGludGVn
cmF0ZSBhbHRlcm5hdGl2ZXMgYmV0dGVyIGludG8gdGhlIG1haW4gYXJjaGl0ZWN0dXJlCj4gICAg
ICAgIHJpc2N2OiBhbGxvdyBkaWZmZXJlbnQgc3RhZ2VzIHdpdGggYWx0ZXJuYXRpdmVzCj4gICAg
ICAgIHJpc2N2OiBpbXBsZW1lbnQgbW9kdWxlIGFsdGVybmF0aXZlcwo+ICAgICAgICByaXNjdjog
aW1wbGVtZW50IEFMVEVSTkFUSVZFXzIgbWFjcm8KPiAgICAgICAgcmlzY3Y6IGV4dGVuZCBjb25j
YXRlbmF0ZWQgYWx0ZXJuYXRpdmVzLWxpbmVzIHRvIHRoZSBzYW1lIGxlbmd0aAo+ICAgICAgICBy
aXNjdjogcHJldmVudCBjb21wcmVzc2VkIGluc3RydWN0aW9ucyBpbiBhbHRlcm5hdGl2ZXMKPiAg
ICAgICAgcmlzY3Y6IG1vdmUgYm9vdCBhbHRlcm5hdGl2ZXMgdG8gYWZ0ZXIgZmlsbF9od2NhcAo+
ICAgICAgICByaXNjdjogRml4IGFjY2Vzc2luZyBwZm4gYml0cyBpbiBQVEVzIGZvciBub24tMzJi
aXQgdmFyaWFudHMKPiAgICAgICAgcmlzY3Y6IGFkZCBSSVNDLVYgU3ZwYm10IGV4dGVuc2lvbiBz
dXBwb3J0Cj4gICAgICAgIHJpc2N2OiByZW1vdmUgRklYTUFQX1BBR0VfSU8gYW5kIGZhbGwgYmFj
ayB0byBpdHMgZGVmYXVsdCB2YWx1ZQo+ICAgICAgICByaXNjdjogZG9uJ3QgdXNlIGdsb2JhbCBz
dGF0aWMgdmFycyB0byBzdG9yZSBhbHRlcm5hdGl2ZSBkYXRhCj4gICAgICAgIHJpc2N2OiBhZGQg
bWVtb3J5LXR5cGUgZXJyYXRhIGZvciBULUhlYWQKPgpBbiBpc3N1ZSB3YXMgZm91bmQgb24gdGhl
IEhpRml2ZSBVbm1hdGNoZWQgd2l0aCB0aGUgNS4xOS1yYzEga2VybmVsLiBUaGUgCmZvbGxvd2lu
ZyB3YXJuaW5nIG9jY3VycyBkdXJpbmcgYm9vdDoKCnJpc2N2NjQga2VybmVsOiAKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpy
aXNjdjY0IGtlcm5lbDogV0FSTklORzogTWlzc2luZyB0aGUgZm9sbG93aW5nIGVycmF0YSBtYXkg
Y2F1c2UgCnBvdGVudGlhbCBpc3N1ZXMKcmlzY3Y2NCBrZXJuZWw6wqDCoMKgwqDCoMKgwqDCoCBT
aUZpdmUgRXJyYXRhWzBdOmNpcC00NTMKcmlzY3Y2NCBrZXJuZWw6wqDCoMKgwqDCoMKgwqDCoCBT
aUZpdmUgRXJyYXRhWzFdOmNpcC0xMjAwCnJpc2N2NjQga2VybmVsOiBQbGVhc2UgZW5hYmxlIHRo
ZSBjb3JyZXNwb25kaW5nIEtjb25maWcgdG8gYXBwbHkgdGhlbQpyaXNjdjY0IGtlcm5lbDogCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KCkkndmUgbWFudWFsbHkgYmlzZWN0ZWQgdGhlIHByb2JsZW0gdG8gdGhpcyBjb21taXQ6
CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9pZD1mZjY4OWZkMjFjYjEzMDk4MzA1YmFlM2Y4ZDBjMDA2NWRm
MmUyZmMxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
