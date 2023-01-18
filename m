Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69333C004D4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 06:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCzSzSdkhLiDKSbXWJBzrzauleGpHTGY10w8Fbqs11w=; b=dg53esyUI4CIKM
	WB2y9wN0BHxOxI/cOTUz+MBgftMzZQesykSWkM78LdvDPCprh1GlvdR6m3BpZOlohtfy3b+fK65BW
	7LtqW7J4pXDWWpykQWI07dGPdQ7DHvop4tKcrwf7aDdtEVmBvrPjYMhq3WdS2/r8FKtlSAgqVv2oj
	d6r2+ZCLvs4Vr6m/6rnlj8J0ODW8m8pN7n4ArlnQVwvSZ7Uvcp+bCeo+BRF4kHwVhuP+JNWW8X2sZ
	Cu8lPiRD6z+EzgfPFAZ7+aIi0V5n+YEePPeuRe1M7dDr7WXLKi3hFrK0y33ndXAej+kILqTyEh1Ez
	MyYchMZkvMpETPJjKkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2Cx-00H7fu-DM; Wed, 18 Jan 2023 06:46:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2Ct-00H7fP-6S
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 06:46:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7759024DC7D;
	Wed, 18 Jan 2023 14:45:45 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 18 Jan
 2023 14:45:45 +0800
Received: from [192.168.125.95] (113.72.144.40) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 18 Jan
 2023 14:45:44 +0800
Message-ID: <0ce3f9ba-4cb4-4257-21f3-818ff0b959cd@starfivetech.com>
Date: Wed, 18 Jan 2023 14:45:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/3] soc: starfive: Add StarFive JH71XX pmu driver
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
 <20230116074259.22874-3-walker.chen@starfivetech.com>
 <10209933.nUPlyArG6x@diego>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <10209933.nUPlyArG6x@diego>
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_224559_572755_8E3C1EC9 
X-CRM114-Status: GOOD (  19.82  )
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

T24gMjAyMy8xLzE3IDE4OjA5LCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBIaSBXYWxrZXIsCj4g
Cj4gQW0gTW9udGFnLCAxNi4gSmFudWFyIDIwMjMsIDA4OjQyOjU4IENFVCBzY2hyaWViIFdhbGtl
ciBDaGVuOgo+PiArc3RhdGljIGludCBqaDcxeHhfcG11X2dldF9zdGF0ZShzdHJ1Y3Qgamg3MXh4
X3BtdV9kZXYgKnBtZCwgdTMyIG1hc2ssIGJvb2wgKmlzX29uKQo+PiArewo+PiArCXN0cnVjdCBq
aDcxeHhfcG11ICpwbXUgPSBwbWQtPnBtdTsKPj4gKwo+PiArCWlmICghbWFzaykgewo+PiArCQkq
aXNfb24gPSBmYWxzZTsKPiAKPiBuaXQ6IFdoaWxlIGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGJhZCwg
SSBkb24ndCB0aGluayBjYWxsZXJzIG9mCj4gamg3MXh4X3BtdV9nZXRfc3RhdGUoKSBzaG91bGQg
ZXhwZWN0IHRoaXMgdG8gYmUgc2V0IGluIGVycm9yIGNhc2UuCgpNYXliZSBzZXR0aW5nICdpc19v
bicgaW4gdGhpcyBjYXNlIGlzIHJlZHVuZGFudCBvcGVyYXRpb24uIFdpbGwgYmUgZHJvcHBlZC4K
Cj4gCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCX0KPj4gKwo+PiArCSppc19vbiA9IHJlYWRs
KHBtdS0+YmFzZSArIEpINzFYWF9QTVVfQ1VSUl9QT1dFUl9NT0RFKSAmIG1hc2s7Cj4+ICsKPj4g
KwlyZXR1cm4gMDsKPj4gK30KPiAKPiBbLi4uXQo+IAo+PiArc3RhdGljIGludCBqaDcxeHhfcG11
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2
LT5vZl9ub2RlOwo+PiArCWNvbnN0IHN0cnVjdCBqaDcxeHhfcG11X21hdGNoX2RhdGEgKm1hdGNo
X2RhdGE7Cj4+ICsJc3RydWN0IGpoNzF4eF9wbXUgKnBtdTsKPj4gKwl1bnNpZ25lZCBpbnQgaTsK
Pj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJcG11ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpw
bXUpLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXBtdSkKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+
ICsKPj4gKwlwbXUtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7Cj4+ICsJaWYgKElTX0VSUihwbXUtPmJhc2UpKQo+PiArCQlyZXR1cm4gUFRSX0VSUihwbXUt
PmJhc2UpOwo+PiArCj4+ICsJcG11LT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+
PiArCWlmIChwbXUtPmlycSA8IDApCj4+ICsJCXJldHVybiBwbXUtPmlycTsKPj4gKwo+PiArCXJl
dCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBwbXUtPmlycSwgamg3MXh4X3BtdV9pbnRlcnJ1cHQs
Cj4+ICsJCQkgICAgICAgMCwgcGRldi0+bmFtZSwgcG11KTsKPj4gKwlpZiAocmV0KQo+PiArCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byByZXF1ZXN0IGlycVxuIik7Cj4+ICsKPj4gKwltYXRjaF9k
YXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4+ICsJaWYgKCFtYXRjaF9kYXRh
KQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArCXBtdS0+Z2VucGQgPSBkZXZtX2tjYWxs
b2MoZGV2LCBtYXRjaF9kYXRhLT5udW1fZG9tYWlucywKPj4gKwkJCQkgIHNpemVvZihzdHJ1Y3Qg
Z2VuZXJpY19wbV9kb21haW4gKiksCj4+ICsJCQkJICBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXBt
dS0+Z2VucGQpCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJcG11LT5kZXYgPSBkZXY7
Cj4+ICsJcG11LT5tYXRjaF9kYXRhID0gbWF0Y2hfZGF0YTsKPj4gKwlwbXUtPmdlbnBkX2RhdGEu
ZG9tYWlucyA9IHBtdS0+Z2VucGQ7Cj4+ICsJcG11LT5nZW5wZF9kYXRhLm51bV9kb21haW5zID0g
bWF0Y2hfZGF0YS0+bnVtX2RvbWFpbnM7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgbWF0Y2hf
ZGF0YS0+bnVtX2RvbWFpbnM7IGkrKykgewo+PiArCQlyZXQgPSBqaDcxeHhfcG11X2luaXRfZG9t
YWluKHBtdSwgaSk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGluaXRpYWxpemUgcG93ZXIgZG9tYWluXG4iKTsKPj4gKwkJCXJldHVybiByZXQ7Cj4+ICsJ
CX0KPj4gKwl9Cj4+ICsKPj4gKwlzcGluX2xvY2tfaW5pdCgmcG11LT5sb2NrKTsKPj4gKwlqaDcx
eHhfcG11X2ludF9lbmFibGUocG11LCBKSDcxWFhfUE1VX0lOVF9BTExfTUFTSyAmIH5KSDcxWFhf
UE1VX0lOVF9QQ0hfRkFJTCwgdHJ1ZSk7Cj4+ICsKPj4gKwlyZXQgPSBvZl9nZW5wZF9hZGRfcHJv
dmlkZXJfb25lY2VsbChucCwgJnBtdS0+Z2VucGRfZGF0YSk7Cj4+ICsJaWYgKHJldCkgewo+PiAr
CQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBnZW5wZCBkcml2ZXI6ICVkXG4iLCBy
ZXQpOwo+PiArCQlyZXR1cm4gcmV0Owo+PiArCX0KPj4gKwo+PiArCWRldl9pbmZvKGRldiwgInJl
Z2lzdGVyZWQgJXUgcG93ZXIgZG9tYWluc1xuIiwgaSk7Cj4gCj4gbml0OiBJIGd1ZXNzIHRoYXQg
Y291bGQgYmUgYSBkZXZfZGJnIHRvIG5vdCBzcGFtIHRoZSBrZXJuZWwgbG9nIHRvbyBtdWNoPwoK
T0ssIHdpbGwgYmUgdXNlZCB3aXRoIGRldl9kYmcoKS4KCj4gCj4gCj4+ICsJcmV0dXJuIDA7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgamg3MXh4X2RvbWFpbl9pbmZvIGpoNzEx
MF9wb3dlcl9kb21haW5zW10gPSB7Cj4+ICsJW0pINzExMF9QRF9TWVNUT1BdID0gewo+PiArCQku
bmFtZSA9ICJTWVNUT1AiLAo+PiArCQkuYml0ID0gMCwKPj4gKwkJLmZsYWdzID0gR0VOUERfRkxB
R19BTFdBWVNfT04sCj4+ICsJfSwKPj4gKwlbSkg3MTEwX1BEX0NQVV0gPSB7Cj4+ICsJCS5uYW1l
ID0gIkNQVSIsCj4+ICsJCS5iaXQgPSAxLAo+PiArCQkuZmxhZ3MgPSBHRU5QRF9GTEFHX0FMV0FZ
U19PTiwKPj4gKwl9LAo+PiArCVtKSDcxMTBfUERfR1BVQV0gPSB7Cj4+ICsJCS5uYW1lID0gIkdQ
VUEiLAo+PiArCQkuYml0ID0gMiwKPj4gKwl9LAo+PiArCVtKSDcxMTBfUERfVkRFQ10gPSB7Cj4+
ICsJCS5uYW1lID0gIlZERUMiLAo+PiArCQkuYml0ID0gMywKPj4gKwl9LAo+PiArCVtKSDcxMTBf
UERfVk9VVF0gPSB7Cj4+ICsJCS5uYW1lID0gIlZPVVQiLAo+PiArCQkuYml0ID0gNCwKPj4gKwl9
LAo+PiArCVtKSDcxMTBfUERfSVNQXSA9IHsKPj4gKwkJLm5hbWUgPSAiSVNQIiwKPj4gKwkJLmJp
dCA9IDUsCj4+ICsJfSwKPj4gKwlbSkg3MTEwX1BEX1ZFTkNdID0gewo+PiArCQkubmFtZSA9ICJW
RU5DIiwKPj4gKwkJLmJpdCA9IDYsCj4+ICsJfSwKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgamg3MXh4X3BtdV9tYXRjaF9kYXRhIGpoNzExMF9wbXUgPSB7Cj4+ICsJLm51bV9k
b21haW5zID0gQVJSQVlfU0laRShqaDcxMTBfcG93ZXJfZG9tYWlucyksCj4+ICsJLmRvbWFpbl9p
bmZvID0gamg3MTEwX3Bvd2VyX2RvbWFpbnMsCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBqaDcxeHhfcG11X29mX21hdGNoW10gPSB7Cj4+ICsJewo+PiAr
CQkuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtcG11IiwKPj4gKwkJLmRhdGEgPSAodm9p
ZCAqKSZqaDcxMTBfcG11LAo+PiArCX0sIHsKPj4gKwkJLyogc2VudGluZWwgKi8KPj4gKwl9Cj4+
ICt9Owo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBqaDcxeHhfcG11X2Ry
aXZlciA9IHsKPj4gKwkuZHJpdmVyID0gewo+PiArCQkubmFtZSA9ICJqaDcxeHgtcG11IiwKPj4g
KwkJLm9mX21hdGNoX3RhYmxlID0gamg3MXh4X3BtdV9vZl9tYXRjaCwKPiAKPiBJbiB0aGUgcm9j
a2NoaXAgcG0tZG9tYWlucyBkcml2ZXIgd2UgaGF2ZQo+IAo+ICAgICAgICAgICAgICAgICAvKgo+
ICAgICAgICAgICAgICAgICAgKiBXZSBjYW4ndCBmb3JjaWJseSBlamVjdCBkZXZpY2VzIGZyb20g
dGhlIHBvd2VyCj4gICAgICAgICAgICAgICAgICAqIGRvbWFpbiwgc28gd2UgY2FuJ3QgcmVhbGx5
IHJlbW92ZSBwb3dlciBkb21haW5zCj4gICAgICAgICAgICAgICAgICAqIG9uY2UgdGhleSB3ZXJl
IGFkZGVkLgo+ICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgLnN1cHByZXNz
X2JpbmRfYXR0cnMgPSB0cnVlLAo+IAo+IGhlcmUsIHdoaWNoIG1pZ2h0IGJlIHZhbGlkIGZvciB5
b3VyIHBtdSBkcml2ZXIgYXMgd2VsbC4KCk9rYXksIHRoaXMgYXR0cmlidXRlIHdpbGwgYmUgYWRk
ZWQgaW4gbmV4dCB2ZXJzaW9uLgoKPiAKPiAKPiBPdGhlciB0aGFuIHRoYXQKPiBSZXZpZXdlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiAKClRoYW5rcyBmb3IgeW91ciBy
ZXZpZXcuCgpCZXN0IHJlZ2FyZHMsCldhbGtlciBDaGVuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
