Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FACFC9EC0
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 23:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLMohvTzKtvzOB8qmZJ3LZTNSYuOXl56Z+X0v/KtejA=; b=c7Eml9q0TjImd6
	Q1/oQZIttVs9iFBWVJbiUZRD0FSCaJQvgIpJQ7yFJ5B2Oyws/uDpAkTHuypc07YdcCiQRDfj2U05d
	Eb1Z1gp39owiI9dYyLWgKmskr4c0QK8xDY7+RhbRBZDZo8qig1av9LUvDGvP6hZ+Up1YzorODMbHF
	bsPSmKz0SYzV4/LSZtmYZZ6PEGQEbdtVxh91Kc6+HH7AeAryZla9xr3YOnYDE8A9nGPz7uYkOp62W
	Pv5SgVVzaxuvWL3gqw3g9D/SGWQkbacjc+udwIxLmiJhiTMR245Jxf54UFUo7/OC1w9ue2M8723Fo
	tMJCguxLDCVQjIKe6ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyejr-00000004edm-29m2;
	Fri, 06 Mar 2026 23:37:47 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyejn-00000004ecn-3nRc
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 23:37:45 +0000
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id ycHlv45geCxrGyejZvz3rt; Fri, 06 Mar 2026 23:37:29 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id yejYv7Js0jAxuyejYvePSj; Fri, 06 Mar 2026 23:37:28 +0000
X-Authority-Analysis: v=2.4 cv=EoDSrTcA c=1 sm=1 tr=0 ts=69ab6538
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7vwVE5O1G3EA:10 a=qNABUOcEAAAA:8
 a=VwQbUJbxAAAA:8 a=xnXoI3Q-Js2OMDcH0-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Ytm653ucTKQjCvbzLygB:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R7eSIQ9PWsy1l0xwhOzzafvIk3P6i6NImXb6Jaj1Ic8=; b=yiWBKtihdLLUr6EF7dmIsIHt64
	YBvRcsRdYSHf6JFVbc9P4+iDuvfXGL9UxB4r2mI4GZWL21c9srjn0oBNBuQ4CyIZ3dtzeY1336+Z7
	/QDT6TrR+b9V3tfy271iR82K5ml2kEGJIF5jw2RNWrd2ed5m3Yqnst7pf84Wjo+r5qM6goeI3WfgZ
	XlOhhD0IoVRcZ7WB5sgwdwYCudG3u1EWRTTW3+tXz867RhN3VvCmOHlS3FjwRM8ponCjbNVzxB71F
	p8IT1xghsZbsrjLRsZ+zBCTh7FLEgd9pLeBPgy4gS9h+z9+N2vOagNzOENZrtVZnELgAKPpyHOZVR
	n6OXiYxA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:42920 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <re@w6rz.net>)
	id 1vyejX-000000044Yt-4A1d;
	Fri, 06 Mar 2026 16:37:28 -0700
Message-ID: <c965f23f-4e71-46e8-915f-7c9ab3e5385a@w6rz.net>
Date: Fri, 6 Mar 2026 15:37:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
To: Mark Brown <broonie@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley
 <conor@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, wsa+renesas@sang-engineering.com
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
 <aaL2WVO_7bl6vNp5@sirena.co.uk> <20260228-ragweed-theater-b02967937353@spud>
 <20260228-defuse-extenuate-cf2a90ae66ea@spud> <87tsuvh6iw.fsf@bootlin.com>
 <96e93ca0-ea10-4071-99ca-98f7219833d7@w6rz.net>
 <aatIrfp7fIznkgsq@sirena.co.uk>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <aatIrfp7fIznkgsq@sirena.co.uk>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1vyejX-000000044Yt-4A1d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:42920
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH/H03RKvVZqwWqVnyAyZNUm6dYzbh66u6Rb5p1vQGmKmBqSO7itFPeigMpW4Z1qkiut0gKgsZIeRCJhfrX9Iwb6fEtROL/WVBas6xKlvi+aaKy9WjHX
 +17vDEjuffJx5s5Gwz42uZFwzulbEKDDUkS+MHX0kRPfYwjuDUoUzmc6PRB3qWcvYYuG9i27JQ1wre37rFGYrerLV5V9PdrBvAg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153744_062688_56948BCA 
X-CRM114-Status: GOOD (  25.60  )
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

T24gMy82LzI2IDEzOjM1LCBNYXJrIEJyb3duIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDA0LCAyMDI2
IGF0IDAxOjUyOjA4UE0gLTA4MDAsIFJvbiBFY29ub21vcyB3cm90ZToKPj4gT24gMy80LzI2IDA5
OjAyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gVGhlIG90aGVyIGNoYW5nZSB0aGF0IGNvdWxk
IGJlICJpdCIgaXMgdGhlIGNoYW5nZSBvZiBvcmRlciBiZXR3ZWVuIHJlc2V0Cj4+PiBoYW5kbGlu
ZyBhbmQgY2xvY2suIFRoYXQgd291bGQgYmUgcXVpdGUgbWVzc3kgaWYgdGhhdCB3YXMgdGhlIGVy
cm9yIGJ1dAo+Pj4gSSBjYW5ub3QgZmluZCBhbm90aGVyIGV4cGxhbmF0aW9uLiBSb24sIGNhbiB5
b3UgcGxlYXNlIHRyeSB0byByZXZlcnQKPj4+IHRoaXMgcGF0Y2ggbG9jYWxseSBhbmQgdGhlbiBt
b3ZlIHRoZSBjbGtfcHJlcGFyZV9lbmFibGUoKSBvZiB0aGUgQVBCIGFuZAo+Pj4gQUhCIGNsb2Nr
cyBlYXJsaWVyLCByaWdodCBhZnRlciB0aGUgcmVmIGNsb2NrIGlzIGFsc28gZW5hYmxlZD8gSWYg
dGhlCj4+PiBwbGF0Zm9ybSBmYWlscyB0byBib290LCB0aGVyZSBpcyBtYXliZSBhIHdlaXJkIGlu
dGVybmFsIHJlbGF0aW9uc2hpcAo+Pj4gd2l0aCB0aGUgcmVzZXRzLgo+Pj4gT3RoZXJ3aXNlIGNh
biB5b3UgY29tcGFyZSB0aGUgY2xrX2dldF9yYXRlKCkgb24gYWxsIHRocmVlIGNsb2NrcyBpbiBi
b3RoCj4+PiBjYXNlcz8KPj4gSSdtIGhhcHB5IHRvIGhlbHAgeW91IGRlYnVnIHRoaXMsIGJ1dCB5
b3UgaGF2ZSB0byBzZW5kIG1lIGEgcGF0Y2ggdG8KPj4gdGhlIHJldmVydGVkIGZpbGUuIEkgaGF2
ZSBubyBpZGVhIHdoZXJlIHRoZSByZWYgY2xvY2sgaXMgZW5hYmxlZC4KPiBJIHRoaW5rIE1pcXVl
bCBtZWFucwo+Cj4gY29tbWl0IGM5MTE3NjAyYTg3YzQ0MWM0ZjA1YTJjYzRkOWJlNDVjOTYxNDAx
NDYKPiBBdXRob3I6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBEYXRlOiAgIEZy
aSBNYXIgNiAyMDoxNjozMyAyMDI2ICswMDAwCj4KPiAgICAgIHRlc3QKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2Fk
ZW5jZS1xdWFkc3BpLmMKPiBpbmRleCAyZDI4Nzk1MGQ0NGMuLmQ3NDQ0NmY2ZGI1YSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPiArKysgYi9kcml2ZXJz
L3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPiBAQCAtMTkzMiw2ICsxOTMyLDEyIEBAIHN0YXRp
YyBpbnQgY3FzcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlyZXNl
dF9jb250cm9sX2Fzc2VydChyc3RjX29jcCk7Cj4gICAJcmVzZXRfY29udHJvbF9kZWFzc2VydChy
c3RjX29jcCk7Cj4gICAKPiArCWlmIChkZGF0YS0+amg3MTEwX2Nsa19pbml0KSB7Cj4gKwkJcmV0
ID0gY3FzcGlfamg3MTEwX2Nsa19pbml0KHBkZXYsIGNxc3BpKTsKPiArCQlpZiAocmV0KQo+ICsJ
CQlnb3RvIGRpc2FibGVfY2xrOwo+ICsJfQo+ICsKPiAgIAljcXNwaS0+bWFzdGVyX3JlZl9jbGtf
aHogPSBjbGtfZ2V0X3JhdGUoY3FzcGktPmNsayk7Cj4gICAJaG9zdC0+bWF4X3NwZWVkX2h6ID0g
Y3FzcGktPm1hc3Rlcl9yZWZfY2xrX2h6Owo+ICAgCj4gQEAgLTE5NTksMTEgKzE5NjUsNiBAQCBz
dGF0aWMgaW50IGNxc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJ
CWlmIChkZGF0YS0+cXVpcmtzICYgQ1FTUElfTkVFRFNfQVBCX0FIQl9IQVpBUkRfV0FSKQo+ICAg
CQkJY3FzcGktPmFwYl9haGJfaGF6YXJkID0gdHJ1ZTsKPiAgIAo+IC0JCWlmIChkZGF0YS0+amg3
MTEwX2Nsa19pbml0KSB7Cj4gLQkJCXJldCA9IGNxc3BpX2poNzExMF9jbGtfaW5pdChwZGV2LCBj
cXNwaSk7Cj4gLQkJCWlmIChyZXQpCj4gLQkJCQlnb3RvIGRpc2FibGVfY2xrOwo+IC0JCX0KPiAg
IAkJaWYgKGRkYXRhLT5xdWlya3MgJiBDUVNQSV9ESVNBQkxFX1NUSUdfTU9ERSkKPiAgIAkJCWNx
c3BpLT5kaXNhYmxlX3N0aWdfbW9kZSA9IHRydWU7Cj4gICAKPiB3aGljaCBkb2VzIHRoZSByaWdo
dCB0aGluZzoKPgo+ICAgICBodHRwczovL2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVsZXIvam9i
LzI1MzU2MTAKPgo+IGJ1dCBJJ20gZmFpcmx5IHN1cmUgaXQncyBub3QgYW4gb3JkZXJpbmcgdGhp
bmcuICBUaGUgcGF0Y2ggaW5jbHVkZXM6Cj4KPiAtICAgICAgIHN0YXRpYyBzdHJ1Y3QgY2xrX2J1
bGtfZGF0YSBxc3BpY2xrW10gPSB7Cj4gLSAgICAgICAgICAgICAgIHsgLmlkID0gImFwYiIgfSwK
PiAtICAgICAgICAgICAgICAgeyAuaWQgPSAiYWhiIiB9LAo+IC0gICAgICAgfTsKPgo+IGJ1dCBu
ZXZlciBhZGRzIHRob3NlIG5hbWVzIGJhY2ssIHRoaXMgbWVhbnMgdGhhdCB3aGlsZSB3ZSBkbyBh
c2sgZm9yCj4gdGhyZWUgY2xvY2tzIG5vbmUgb2YgdGhlbSBoYXZlIElEcyBzcGVjaWZpZWQgc28g
d2UganVzdCBlbmQgdXAKPiByZXF1ZXN0aW5nIHRoZSBzYW1lIGNsb2NrIHRocmVlIHRpbWVzIHdo
aWNoIG1pZ2h0IGJlIHdoYXQncyBuZWVkZWQgb24KPiBtb3N0IGludGVncmF0aW9ucyBidXQgbm90
IGhlcmUuICBUaGUgYmVsb3cgc2VlbXMgdG8gZG8gdGhlIHRyaWNrIGZvciBtZSwKPiBJJ2xsIHdy
aXRlIGEgY29tbWl0IGxvZyBhbmQgcG9zdCAtIHRlc3RpbmcgYXBwcmVjaWF0ZWQ6Cj4KPiAgICBo
dHRwczovL2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVsZXIvam9iLzI1MzU2NjIKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMgYi9kcml2ZXJzL3NwaS9z
cGktY2FkZW5jZS1xdWFkc3BpLmMKPiBpbmRleCA2NDlmZjU1MzMzZjAuLjdhN2Y5MmU5YzdhMyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPiArKysgYi9k
cml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPiBAQCAtNzYsNiArNzYsMTEgQEAgc3Ry
dWN0IGNxc3BpX2ZsYXNoX3BkYXRhIHsKPiAgIAl1OAkJY3M7Cj4gICB9Owo+ICAgCj4gK3N0YXRp
YyBzdHJ1Y3QgY2xrX2J1bGtfZGF0YSBjcXNwaV9jbGtzW0NMS19RU1BJX05VTV0gPSB7Cj4gKwlb
Q0xLX1FTUElfQVBCXSA9IHsgLmlkID0gImFwYiIgfSwKPiArCVtDTEtfUVNQSV9BSEJdID0geyAu
aWQgPSAiYWhiIiB9LAo+ICt9Owo+ICsKPiAgIHN0cnVjdCBjcXNwaV9zdCB7Cj4gICAJc3RydWN0
IHBsYXRmb3JtX2RldmljZQkqcGRldjsKPiAgIAlzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIJKmhvc3Q7
Cj4gQEAgLTE4MjMsNiArMTgyOCw3IEBAIHN0YXRpYyBpbnQgY3FzcGlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgIAl9Cj4gICAKPiAgIAkvKiBPYnRhaW4gUVNQSSBjbG9j
a3MuICovCj4gKwltZW1jcHkoJmNxc3BpLT5jbGtzLCAmY3FzcGlfY2xrcywgc2l6ZW9mKGNxc3Bp
LT5jbGtzKSk7Cj4gICAJcmV0ID0gZGV2bV9jbGtfYnVsa19nZXRfb3B0aW9uYWwoZGV2LCBDTEtf
UVNQSV9OVU0sIGNxc3BpLT5jbGtzKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsKCldvcmtzIGdvb2Qg
aGVyZS4gSSdsbCBzZW5kIGEgdGVzdGVkLWJ5OiB3aGVuIHlvdSBwb3N0IHRoZSBwYXRjaC4KCnVi
dW50dUB2aXNpb25maXZlOn4kIGxzYmxrCk5BTUXCoCDCoCDCoCDCoCDCoE1BSjpNSU4gUk3CoCDC
oFNJWkUgUk8gVFlQRSBNT1VOVFBPSU5UUwptdGRibG9jazDCoCDCoCDCoDMxOjDCoCDCoCAwwqAg
wqAgMTZNwqAgMCBkaXNrwqAgwqAgwqA8LS0tLS0KbW1jYmxrMcKgIMKgIMKgIDE3OTowwqAgwqAg
MCAxMTkuM0fCoCAwIGRpc2sK4pSU4pSAbW1jYmxrMXAxwqAgMTc5OjHCoCDCoCAwIDExOS4yR8Kg
IDAgcGFydApudm1lMG4xwqAgwqAgwqAgMjU5OjDCoCDCoCAwIDQ2NS44R8KgIDAgZGlzawrilJzi
lIBudm1lMG4xcDHCoCAyNTk6McKgIMKgIDAgNDY1LjZHwqAgMCBwYXJ0IC8K4pSc4pSAbnZtZTBu
MXAywqAgMjU5OjLCoCDCoCAwwqAgwqAgMTZNwqAgMCBwYXJ0CuKUnOKUgG52bWUwbjFwMTIgMjU5
OjPCoCDCoCAwwqAgwqAgwqA0TcKgIDAgcGFydArilJzilIBudm1lMG4xcDEzIDI1OTo0wqAgwqAg
MMKgIMKgIMKgMk3CoCAwIHBhcnQK4pSU4pSAbnZtZTBuMXAxNSAyNTk6NcKgIMKgIDDCoCDCoDEw
ME3CoCAwIHBhcnQgL2Jvb3QvZWZpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
