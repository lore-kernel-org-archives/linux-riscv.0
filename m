Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F5BC282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnlTZOJoostBQt6uMUAgxxngsm/pM1ABNZ7WRsi83P8=; b=d/z0BS0kEqmJX4
	zP1Ldjr+qEJSAKSx5K1q5KOuOyr8CD3J4+o2b5Baq2V4QYfM0NGt/i+NGSmHetAuhQkxqWQfU+itC
	rmmgGVdhtFohMZjjhcG26C38hGVcuo1+fs0O8bB7ZRb4KPfDhYgRpqVyJ1hmTY4ZE8X5aWgLbSn6V
	n5FuBfMlArJBo+tCairTJ8dXXCYR4lj0HAd5ZqQxU9F6M7dhT4fO3hJBMdDsiEWWIXLs1mmyx4M6W
	CMRyhS29s8urSv1y5aLJqTY2idooDXoeU78eM9n901xLE0V/qYI5bJjS9jk2wqR/1NTsiies8KDCs
	DacS0jAuBCL+3Q2u5DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp588-00000000mQT-0Qeq;
	Mon, 03 Mar 2025 12:42:44 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4sh-00000000k36-3Stv
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 12:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741004806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dCLmGOpMTmAuxvDdTWEmL7fKkPuH+dQVKI2GbNGEEroHR74o+fJ9Ksu7j8zBBKcab98QwVAg3SpP/eBDQUu+oH5U8orSSG3nCJUgUp6ta70uDZ1YXkgYlUX4oH+55L6EYmc6iKE//z4xO2tsVJhj2WaHiZ7MJECp8THtONN+HaQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741004806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KfBeFzP/GHd5Ky/PKHGXYMvqyX5pKSIENWPgz66iSM4=; 
	b=LEm5jIlzhczQCmMjF9behFjYEXVl2qlXt2A4wF06HjSHE9jFInFLsQTeWXI7Z1nF327ScTZQohUs9K8r4u2Zx0kxxS4N3xkfuxf1UDVoqAuRGE4FV/o8rpZIxZ1cmQoiTBT5HRTi/0Ik6V00c8J0fE5O2q/ee016MVe52liHB/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741004806;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=KfBeFzP/GHd5Ky/PKHGXYMvqyX5pKSIENWPgz66iSM4=;
	b=CVNQlvezC9BgEqfUTl+0TxoPgFK5gwalMGh62+cf7hsN2qMQj6BVRH6H6r/2NdBs
	Wx9BDzmYV04a7WDf8+QA9EMa6kC2SPrUPv1eTfWY3Y5C5fW/37MmSi4qEugw/zQdA79
	UEcR/9cyl8Z/a6H6Qo9UhJaWwmm0j3OBYpk1w8zw=
Received: by mx.zohomail.com with SMTPS id 1741004802325445.1739152543331;
	Mon, 3 Mar 2025 04:26:42 -0800 (PST)
Message-ID: <c9d436ff-1fc6-4f28-845c-c7635b31917f@zohomail.com>
Date: Mon, 3 Mar 2025 20:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
References: <20250303-b4-k230-clk-v5-0-748d121283e3@zohomail.com>
 <20250303-b4-k230-clk-v5-1-748d121283e3@zohomail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250303-b4-k230-clk-v5-1-748d121283e3@zohomail.com>
Feedback-ID: rr080112274afbe326d615e5b0444854c80000c326b26460fff2c574191e95b569a673be03c75ba6492d517c:zu08011227797b7a52fbefa521f9d5fee3000064a766f903853869ab26a37756b41ca77faa2d9e0002872fe9:rf0801122cfa59d5f02a79194a230f625700008f460aca7cd1b032c309e3721df5b9f8152e653064bd03aef47ebc6dabbd:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_042647_943753_C08F4957 
X-CRM114-Status: GOOD (  13.92  )
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

Ck9uIDIwMjUvMy8zIDIwOjIwLCBYdWthaSBXYW5nIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyB0
aGUgRGV2aWNlIFRyZWUgYmluZGluZyBmb3IgdGhlIGNsb2NrIGNvbnRyb2xsZXIKPiBvbiBDYW5h
YW4gazIzMC4gVGhlIGJpbmRpbmcgZGVmaW5lcyB0aGUgbmV3IGNsb2NrcyBhdmFpbGFibGUgYW5k
Cj4gdGhlIHJlcXVpcmVkIHByb3BlcnRpZXMgdG8gY29uZmlndXJlIHRoZW0gY29ycmVjdGx5Lgo+
Cj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KClRoaXMgcGF0Y2ggaGFzIGJlZW4gbW9kaWZpZWQsCgpidXQgaXQgb25seSBh
ZGRzIGEgZmV3IG5lY2Vzc2FyeSBVQVJUcyBhbmQgRE1BIG1hY3JvcywKCnNvIEkgZGlkbuKAmXQg
cmVtb3ZlIHlvdXIgYFJldmlld2VkLWJ5YCB0YWcuCgo+IFNpZ25lZC1vZmYtYnk6IFh1a2FpIFdh
bmcgPGtpbmd4dWthaUB6b2hvbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL2NhbmFhbixrMjMwLWNsay55YW1sIHwgNDMgKysrKysrKysrKysrKysKPiAgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9jYW5hYW4sazIzMC1jbGsuaCAgICAgICAgfCA2OSArKysr
KysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
Y2FuYWFuLGsyMzAtY2xrLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svY2FuYWFuLGsyMzAtY2xrLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmQ3MjIwZmEzMGU0Njk5
YTY4ZmE1Mjc5YzA0YWJjNjNjMTkwNWZhNGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2NhbmFhbixrMjMwLWNsay55YW1sCj4g
QEAgLTAsMCArMSw0MyBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Nsb2NrL2NhbmFhbixrMjMwLWNsay55YW1sIwo+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4g
K3RpdGxlOiBDYW5hYW4gS2VuZHJ5dGUgSzIzMCBDbG9jawo+ICsKPiArbWFpbnRhaW5lcnM6Cj4g
KyAgLSBYdWthaSBXYW5nIDxraW5neHVrYWlAem9ob21haWwuY29tPgo+ICsKPiArcHJvcGVydGll
czoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGNhbmFhbixrMjMwLWNsawo+ICsKPiAr
ICByZWc6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogUExMIGNvbnRyb2wg
cmVnaXN0ZXJzLgo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTeXNjbGsgY29udHJvbCByZWdpc3Rl
cnMuCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgICcjY2xvY2st
Y2VsbHMnOgo+ICsgICAgY29uc3Q6IDEKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJs
ZQo+ICsgIC0gcmVnCj4gKyAgLSBjbG9ja3MKPiArICAtICcjY2xvY2stY2VsbHMnCj4gKwo+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsg
ICAgY2xvY2stY29udHJvbGxlckA5MTEwMjAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJj
YW5hYW4sazIzMC1jbGsiOwo+ICsgICAgICAgIHJlZyA9IDwweDkxMTAyMDAwIDB4MTAwMD4sCj4g
KyAgICAgICAgICAgICAgPDB4OTExMDAwMDAgMHgxMDAwPjsKPiArICAgICAgICBjbG9ja3MgPSA8
Jm9zYzI0bT47Cj4gKyAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsgICAgfTsKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9jYW5hYW4sazIzMC1jbGsuaCBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svY2FuYWFuLGsyMzAtY2xrLmgKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LjQxZWRiMTNlYTA0YmZmYWExZGRkMWQxYWY4N2FlMzQwNmI2ODgzMzIKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9jYW5hYW4sazIzMC1jbGsuaAo+IEBA
IC0wLDAgKzEsNjkgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+ICsvKgo+ICsgKiBLZW5kcnl0ZSBDYW5hYW4gSzIzMCBD
bG9jayBEcml2ZXJzCj4gKyAqCj4gKyAqIEF1dGhvcjogWHVrYWkgV2FuZyA8a2luZ3h1a2FpQHpv
aG9tYWlsLmNvbT4KPiArICovCj4gKwo+ICsjaWZuZGVmIENMT0NLX0syMzBfQ0xLX0gKPiArI2Rl
ZmluZSBDTE9DS19LMjMwX0NMS19ICj4gKwo+ICsvKiBLZW5kcnl0ZSBLMjMwIFNvQyBjbG9jayBp
ZGVudGlmaWVycyAoYXJiaXRyYXJ5IHZhbHVlcykuICovCj4gKyNkZWZpbmUgSzIzMF9DUFUwX1NS
QwkJCTAKPiArI2RlZmluZSBLMjMwX0NQVTBfQUNMSwkJCTEKPiArI2RlZmluZSBLMjMwX0NQVTBf
UExJQwkJCTIKPiArI2RlZmluZSBLMjMwX0NQVTBfTk9DX0REUkNQNAkJMwo+ICsjZGVmaW5lIEsy
MzBfQ1BVMF9QQ0xLCQkJNAo+ICsjZGVmaW5lIEsyMzBfUE1VX1BDTEsJCQk1Cj4gKyNkZWZpbmUg
SzIzMF9IU19IQ0xLX0hJR0hfU1JDCQk2Cj4gKyNkZWZpbmUgSzIzMF9IU19IQ0xLX0hJR0hfR0FU
RQkJNwo+ICsjZGVmaW5lIEsyMzBfSFNfSENMS19TUkMJCTgKPiArI2RlZmluZSBLMjMwX0hTX1NE
MF9IU19BSEJfR0FUCQk5Cj4gKyNkZWZpbmUgSzIzMF9IU19TRDFfSFNfQUhCX0dBVAkJMTAKPiAr
I2RlZmluZSBLMjMwX0hTX1NTSTFfSFNfQUhCX0dBCQkxMQo+ICsjZGVmaW5lIEsyMzBfSFNfU1NJ
Ml9IU19BSEJfR0EJCTEyCj4gKyNkZWZpbmUgSzIzMF9IU19VU0IwX0hTX0FIQl9HQQkJMTMKPiAr
I2RlZmluZSBLMjMwX0hTX1VTQjFfSFNfQUhCX0dBCQkxNAo+ICsjZGVmaW5lIEsyMzBfSFNfU1NJ
MF9BWEkxNQkJMTUKPiArI2RlZmluZSBLMjMwX0hTX1NTSTEJCQkxNgo+ICsjZGVmaW5lIEsyMzBf
SFNfU1NJMgkJCTE3Cj4gKyNkZWZpbmUgSzIzMF9IU19RU1BJX0FYSV9TUkMJCTE4Cj4gKyNkZWZp
bmUgSzIzMF9IU19TU0kxX0FDTEtfR0FURQkJMTkKPiArI2RlZmluZSBLMjMwX0hTX1NTSTJfQUNM
S19HQVRFCQkyMAo+ICsjZGVmaW5lIEsyMzBfSFNfU0RfQ0FSRF9TUkMJCTIxCj4gKyNkZWZpbmUg
SzIzMF9IU19TRDBfQ0FSRF9UWAkJMjIKPiArI2RlZmluZSBLMjMwX0hTX1NEMV9DQVJEX1RYCQky
Mwo+ICsjZGVmaW5lIEsyMzBfSFNfU0RfQVhJX1NSQwkJMjQKPiArI2RlZmluZSBLMjMwX0hTX1NE
MF9BWElfR0FURQkJMjUKPiArI2RlZmluZSBLMjMwX0hTX1NEMV9BWElfR0FURQkJMjYKPiArI2Rl
ZmluZSBLMjMwX0hTX1NEMF9CQVNFX0dBVEUJCTI3Cj4gKyNkZWZpbmUgSzIzMF9IU19TRDFfQkFT
RV9HQVRFCQkyOAo+ICsjZGVmaW5lIEsyMzBfSFNfT1NQSV9TUkMJCTI5Cj4gKyNkZWZpbmUgSzIz
MF9IU19VU0JfUkVGXzUwTQkJMzAKPiArI2RlZmluZSBLMjMwX0hTX1NEX1RJTUVSX1NSQwkJMzEK
PiArI2RlZmluZSBLMjMwX0hTX1NEMF9USU1FUl9HQVRFCQkzMgo+ICsjZGVmaW5lIEsyMzBfSFNf
U0QxX1RJTUVSX0dBVEUJCTMzCj4gKyNkZWZpbmUgSzIzMF9IU19VU0IwX1JFRkVSRU5DRQkJMzQK
PiArI2RlZmluZSBLMjMwX0hTX1VTQjFfUkVGRVJFTkNFCQkzNQo+ICsjZGVmaW5lIEsyMzBfTFNf
QVBCX1NSQwkJCTM2Cj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMF9BUEIJCTM3Cj4gKyNkZWZpbmUg
SzIzMF9MU19VQVJUMV9BUEIJCTM4Cj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMl9BUEIJCTM5Cj4g
KyNkZWZpbmUgSzIzMF9MU19VQVJUM19BUEIJCTQwCj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUNF9B
UEIJCTQxCj4gKyNkZWZpbmUgSzIzMF9MU19JMkMwX0FQQgkJNDIKPiArI2RlZmluZSBLMjMwX0xT
X0kyQzFfQVBCCQk0Mwo+ICsjZGVmaW5lIEsyMzBfTFNfSTJDMl9BUEIJCTQ0Cj4gKyNkZWZpbmUg
SzIzMF9MU19JMkMzX0FQQgkJNDUKPiArI2RlZmluZSBLMjMwX0xTX0dQSU9fQVBCCQk0Ngo+ICsj
ZGVmaW5lIEsyMzBfTFNfUFdNX0FQQgkJCTQ3Cj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMAkJCTQ4
Cj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMQkJCTQ5Cj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMgkJ
CTUwCj4gKyNkZWZpbmUgSzIzMF9MU19VQVJUMwkJCTUxCj4gKyNkZWZpbmUgSzIzMF9MU19VQVJU
NAkJCTUyCj4gKyNkZWZpbmUgSzIzMF9TSFJNX0FYSV9TUkMJCTUzCj4gKyNkZWZpbmUgSzIzMF9T
SFJNX1NETUFfQVhJX0dBVEUJCTU0Cj4gKyNkZWZpbmUgSzIzMF9TSFJNX1BETUFfQVhJX0dBVEUJ
CTU1Cj4gKwo+ICsjZW5kaWYgLyogQ0xPQ0tfSzIzMF9DTEtfSCAqLwo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
