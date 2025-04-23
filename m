Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4247DC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 05:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RmUmDWT5/WRD05V1it7mQCzZA1liwLq328QlH/M5Kyo=; b=1ORkEy28dssvdM
	nrdzv9myqVYD63kpzG6YD/vt5zowsIPWMfMIfBFn82/i0p2+qXVhFdDKyfYABs4xboXFi76uHIzNP
	l4ky/JV9pjk5z7a0wU4CvrjRVq7YQ2rExCC9Uqdm9hsmhXXkwHMkNbj5cX6QzueiEII8AXd44UVgE
	DnJDnwm/FaZ7s6mPueBTJjEhOIXG4XIoV7KCFC0UZR/Z5vAtyZW8wcRyo7+mwLukmRS+53iTiWHtz
	JoweDZoBTFXPgVGgyePlJnqagEgDJEPcPg5BrjDevV4RIs+Ez72q9i6UPiR6HSyY6E4VdrGh2sKtT
	H87bvEqJzLcMcvIYpyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Scw-00000009EtR-0MGz;
	Wed, 23 Apr 2025 05:26:30 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Sct-00000009Esj-1ZFd
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 05:26:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745385976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j4T1Ed4R3k73KdamnHsMmZBsui+ZsxIU0PSccow0xZM0eu7Dy4xb6O7wADSX8FI30nDHGCRV2XxJ1Uhkdp16TSyGLmQ0q/AdrV0cmRIYhnFJ9gRsqTqQE3KLGHfHA1XKUA+QSADPlw2gNdgvdtAugDAtUISlnhKc3QGy67o//G8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745385976; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hGYoMoYLu8GyrYod3MxWMAE0ztSXKwl0WzJYu/+s57g=; 
	b=Vs/uDy9QYkaGMQlMXWZOqEkcJ0QDD4+gjCOan11DXouG0Rix4ZvrjHO2/4D2ARF/ueZ15WTMRoJxXHUemSGoOGYihAyUjkRhXbkTDvvOQnrGwkN04APySYhbqeICTNrofsK4Rc5qIpn3Km5da1bCMRX8omCNVqW1nhfX8L+kOaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745385976;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hGYoMoYLu8GyrYod3MxWMAE0ztSXKwl0WzJYu/+s57g=;
	b=bt6qR3qbnNiKIZqBr6dQ+D8yb4g0XCObFe6Bk5UnFixxfM5euX9NAMhVvhy5xatR
	NAHF2MvefKOgOyDxFAXbt8Uu22jF42Rk96HVRqxl1n/F4NjH/L3tDu4pL6CI+NjKaFd
	AZazMXncniJsSOx+xRcLYUqLGyTvlUCPY211IEeI=
Received: by mx.zohomail.com with SMTPS id 1745385974137770.0188727737329;
	Tue, 22 Apr 2025 22:26:14 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chen Wang" <unicorn_wang@outlook.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>
In-Reply-To: <MA0P287MB22620E425A4AC72E5C32D325FEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: add support for canaan,k230-rst
Message-ID: <1838db49cac2e508.c9188a72125bc5d9.d099f51ccc5d9fb5@Jude-Air.local>
Date: Wed, 23 Apr 2025 05:26:05 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_222627_816905_D6280B85 
X-CRM114-Status: GOOD (  11.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ2hlbiwKClRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiAyMy8wNC8yMDI1IDEwOjIxLCBD
aGVuIFdhbmcgd3JvdGU6Cj4gaGnvvIxKdW5odWnvvIwKPiAKPiBPbiAyMDI1LzQvMjAgMTowOSwg
SnVuaHVpIExpdSB3cm90ZToKPj4gSW50cm9kdWNlcyBhIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVy
IGZvciB0aGUgS2VuZHJ5dGUgSzIzMCBTb0MsCj4+IHJlc3Bvc2libGUgZm9yIG1hbmFnaW5nIHRo
ZSByZXNldCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBDUFVzIGFuZAo+PiB2YXJpb3VzIHN1Yi1tb2R1
bGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFs
LnRlY2g+Cj4+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jYW5hYW4s
azIzMC1yc3QueWFtbCB8IDM5ICsrKysrKysrKysKPj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2NhbmFhbixrMjMwLXJzdC5oICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysK
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2FuYWFuLGsyMzAtcnN0
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2FuYWFuLGsy
MzAtcnN0LnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZDM1MmQwZTEyZDgxMDZhMjMyYmI1ZTZkN2Ux
Mzg2OTdkMjEwNjkzNwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jYW5hYW4sazIzMC1yc3QueWFtbAo+PiBAQCAtMCwwICsx
LDM5IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkKPiAKPiBUaGUgY29weXJpZ2h0IHN0YXRlbWVudCBpbiB5YW1sIGFuZCBoZWFk
ZXIgZmlsZXMgc2hvdWxkIGJlIGNvbnNpc3RlbnQuCj4gCj4gT3RocmVzIExHVE0uCj4gCj4gUmV2
aWV3ZWQtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+IAo+IFRoYW5r
cywKPiAKPiBDaGVuCj4gCj4gWy4uLi4uLl0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvY2FuYWFuLGsyMzAtcnN0LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0
L2NhbmFhbixrMjMwLXJzdC5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjUzZTNmZDgxNzcwNzFhZWY4OTgz
YzYzMTcwNmQ2N2FjODZhYjY0NWIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L2NhbmFhbixrMjMwLXJzdC5oCj4+IEBAIC0wLDAgKzEsOTAgQEAKPj4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KPiAKPiBIZXJlLgo+
IAoKSSB3aWxsIHVwZGF0ZSBpdCB0byAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgaW4g
bmV4dCB2ZXJzaW9uLgoKPiBbLi4uLl0KPiAKPiAKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjMtMjAyNCBDYW5hYW4gQnJpZ2h0IFNpZ2h0IENvLiwgTHRkCj4+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMjQtMjAyNSBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4+ICsg
Ki8KPj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX0NBTkFBTl9LMjMwX1JTVF9IXwo+PiArI2RlZmlu
ZSBfRFRfQklORElOR1NfQ0FOQUFOX0syMzBfUlNUX0hfCj4+ICsKPj4gKyNkZWZpbmUgUlNUX0NQ
VTAJCTAKPj4gKyNkZWZpbmUgUlNUX0NQVTEJCTEKPj4gKyNkZWZpbmUgUlNUX0NQVTBfRkxVU0gJ
CTIKPj4gKyNkZWZpbmUgUlNUX0NQVTFfRkxVU0gJCTMKPj4gKyNkZWZpbmUgUlNUX0FJCQkJNAo+
PiArI2RlZmluZSBSU1RfVlBVCQkJNQo+PiArI2RlZmluZSBSU1RfSFMJCQk2Cj4+ICsjZGVmaW5l
IFJTVF9IU19BSEIJCTcKPj4gKyNkZWZpbmUgUlNUX1NESU8wCQk4Cj4+ICsjZGVmaW5lIFJTVF9T
RElPMQkJOQo+PiArI2RlZmluZSBSU1RfU0RJT19BWEkJCTEwCj4+ICsjZGVmaW5lIFJTVF9VU0Iw
CQkxMQo+PiArI2RlZmluZSBSU1RfVVNCMQkJMTIKPj4gKyNkZWZpbmUgUlNUX1VTQjBfQUhCCQkx
Mwo+PiArI2RlZmluZSBSU1RfVVNCMV9BSEIJCTE0Cj4+ICsjZGVmaW5lIFJTVF9TUEkwCQkxNQo+
PiArI2RlZmluZSBSU1RfU1BJMQkJMTYKPj4gKyNkZWZpbmUgUlNUX1NQSTIJCTE3Cj4+ICsjZGVm
aW5lIFJTVF9TRUMJCQkxOAo+PiArI2RlZmluZSBSU1RfUERNQQkJMTkKPj4gKyNkZWZpbmUgUlNU
X1NETUEJCTIwCj4+ICsjZGVmaW5lIFJTVF9ERUNPTVBSRVNTCQkyMQo+PiArI2RlZmluZSBSU1Rf
U1JBTQkJMjIKPj4gKyNkZWZpbmUgUlNUX1NIUk1fQVhJTQkJMjMKPj4gKyNkZWZpbmUgUlNUX1NI
Uk1fQVhJUwkJMjQKPj4gKyNkZWZpbmUgUlNUX05PTkFJMkQJCTI1Cj4+ICsjZGVmaW5lIFJTVF9N
Q1RMCQkyNgo+PiArI2RlZmluZSBSU1RfSVNQCQkJMjcKPj4gKyNkZWZpbmUgUlNUX0lTUF9EVwkJ
MjgKPj4gKyNkZWZpbmUgUlNUX0RQVQkJCTI5Cj4+ICsjZGVmaW5lIFJTVF9ESVNQCQkzMAo+PiAr
I2RlZmluZSBSU1RfR1BVCQkJMzEKPj4gKyNkZWZpbmUgUlNUX0FVRElPCQkzMgo+PiArI2RlZmlu
ZSBSU1RfVElNRVIwCQkzMwo+PiArI2RlZmluZSBSU1RfVElNRVIxCQkzNAo+PiArI2RlZmluZSBS
U1RfVElNRVIyCQkzNQo+PiArI2RlZmluZSBSU1RfVElNRVIzCQkzNgo+PiArI2RlZmluZSBSU1Rf
VElNRVI0CQkzNwo+PiArI2RlZmluZSBSU1RfVElNRVI1CQkzOAo+PiArI2RlZmluZSBSU1RfVElN
RVJfQVBCCQkzOQo+PiArI2RlZmluZSBSU1RfSERJCQkJNDAKPj4gKyNkZWZpbmUgUlNUX1dEVDAJ
CTQxCj4+ICsjZGVmaW5lIFJTVF9XRFQxCQk0Mgo+PiArI2RlZmluZSBSU1RfV0RUMF9BUEIJCTQz
Cj4+ICsjZGVmaW5lIFJTVF9XRFQxX0FQQgkJNDQKPj4gKyNkZWZpbmUgUlNUX1RTX0FQQgkJNDUK
Pj4gKyNkZWZpbmUgUlNUX01BSUxCT1gJCTQ2Cj4+ICsjZGVmaW5lIFJTVF9TVEMJCQk0Nwo+PiAr
I2RlZmluZSBSU1RfUE1VCQkJNDgKPj4gKyNkZWZpbmUgUlNUX0xTX0FQQgkJNDkKPj4gKyNkZWZp
bmUgUlNUX1VBUlQwCQk1MAo+PiArI2RlZmluZSBSU1RfVUFSVDEJCTUxCj4+ICsjZGVmaW5lIFJT
VF9VQVJUMgkJNTIKPj4gKyNkZWZpbmUgUlNUX1VBUlQzCQk1Mwo+PiArI2RlZmluZSBSU1RfVUFS
VDQJCTU0Cj4+ICsjZGVmaW5lIFJTVF9JMkMwCQk1NQo+PiArI2RlZmluZSBSU1RfSTJDMQkJNTYK
Pj4gKyNkZWZpbmUgUlNUX0kyQzIJCTU3Cj4+ICsjZGVmaW5lIFJTVF9JMkMzCQk1OAo+PiArI2Rl
ZmluZSBSU1RfSTJDNAkJNTkKPj4gKyNkZWZpbmUgUlNUX0pBTUxJTkswX0FQQgk2MAo+PiArI2Rl
ZmluZSBSU1RfSkFNTElOSzFfQVBCCTYxCj4+ICsjZGVmaW5lIFJTVF9KQU1MSU5LMl9BUEIJNjIK
Pj4gKyNkZWZpbmUgUlNUX0pBTUxJTkszX0FQQgk2Mwo+PiArI2RlZmluZSBSU1RfQ09ERUNfQVBC
CQk2NAo+PiArI2RlZmluZSBSU1RfR1BJT19EQgkJNjUKPj4gKyNkZWZpbmUgUlNUX0dQSU9fQVBC
CQk2Ngo+PiArI2RlZmluZSBSU1RfQURDCQkJNjcKPj4gKyNkZWZpbmUgUlNUX0FEQ19BUEIJCTY4
Cj4+ICsjZGVmaW5lIFJTVF9QV01fQVBCCQk2OQo+PiArI2RlZmluZSBSU1RfU0hSTV9BUEIJCTcw
Cj4+ICsjZGVmaW5lIFJTVF9DU0kwCQk3MQo+PiArI2RlZmluZSBSU1RfQ1NJMQkJNzIKPj4gKyNk
ZWZpbmUgUlNUX0NTSTIJCTczCj4+ICsjZGVmaW5lIFJTVF9DU0lfRFBIWQkJNzQKPj4gKyNkZWZp
bmUgUlNUX0lTUF9BSEIJCTc1Cj4+ICsjZGVmaW5lIFJTVF9NMAkJCTc2Cj4+ICsjZGVmaW5lIFJT
VF9NMQkJCTc3Cj4+ICsjZGVmaW5lIFJTVF9NMgkJCTc4Cj4+ICsjZGVmaW5lIFJTVF9TUEkyQVhJ
CQk3OQo+PiArCj4+ICsjZW5kaWYKPj4KCi0tIApCZXN0IHJlZ2FyZHMsCkp1bmh1aSBMaXUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
