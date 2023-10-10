Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E749CD68E4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 02:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5aB0N5ourXP17/jJZO8H9dPZkiPOZYlvtfKBzYMiPc=; b=ai4SiMxWIwTvdq
	0FEGkUVO8fv7FgMGlukwkDEcz+yBl91Xae8tc29NfmmL0nLys40aaHfNC3w0CDUrCs+tWOlC5NCwK
	a51Je5IAtqZ1taR81YoftB+ggL9f+mf8u7L3hhRwNogBmJdcg9QUPdtZ2FDeoWbL/sF4Z/M566cN+
	TaOhZsZ9gkTo+wD6Jg7F+3iW3MdJEK+fwCc4DNjmyStRqSCFjiuT+4NkS0b6WYGX40JFuEbTy9FUc
	WFXERodQMkZl7jEfxiufCSPvzSZh2RYnYWNABYScyTC8idNUd/Mn0uwjt2rggN7CHBmDHmfgnfsaf
	ttCtajjPPFskMBZ3swrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2Yv-00C7b5-1v;
	Tue, 10 Oct 2023 02:33:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2Ys-00C7YG-0O
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 02:33:32 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C286624E269;
	Tue, 10 Oct 2023 10:32:56 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Oct
 2023 10:32:56 +0800
Received: from [192.168.125.85] (183.27.96.95) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Oct
 2023 10:32:55 +0800
Message-ID: <7db511de-526a-4270-a65e-a809fa5375ce@starfivetech.com>
Date: Tue, 10 Oct 2023 10:32:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/19] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
 <fd5b8d0f-67d0-4e0e-9a15-6f3ae53b6db2@starfivetech.com>
 <20231009-matchless-confined-d0d0d3188f76@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20231009-matchless-confined-d0d0d3188f76@wendy>
X-Originating-IP: [183.27.96.95]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_193330_497498_F50F77FA 
X-CRM114-Status: GOOD (  22.10  )
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

CgpPbiAyMDIzLzEwLzkgMTk6MTYsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBNb24sIE9jdCAw
OSwgMjAyMyBhdCAwNjo1ODo0MlBNICswODAwLCBNaW5kYSBDaGVuIHdyb3RlOgo+PiAKPj4gCj4+
IE9uIDIwMjMvOS8yNyAxODowNywgTWluZGEgQ2hlbiB3cm90ZToKPj4gPiBUaGlzIHBhdGNoc2V0
IGZpbmFsIHB1cnBvc2UgaXMgYWRkIFBDSWUgZHJpdmVyIGZvciBTdGFyRml2ZSBKSDcxMTAgU29D
Lgo+PiA+IEpINzExMCB1c2luZyBQTERBIFhwcmVzc1JJQ0ggUENJZSBJUC4gTWljcm9jaGlwIFBv
bGFyRmlyZSBVc2luZyB0aGUKPj4gPiBzYW1lIElQIGFuZCBoYXZlIGNvbW1pdCB0aGVpciBjb2Rl
cywgd2hpY2ggYXJlIG1peGVkIHdpdGggUExEQQo+PiA+IGNvbnRyb2xsZXIgY29kZXMgYW5kIE1p
Y3JvY2hpcCBwbGF0Zm9ybSBjb2Rlcy4KPj4gPiAKPj4gPiBGb3IgcmUtdXNlIHRoZSBQTERBIGNv
bnRyb2xsZXIgY29kZXMsIEkgcmVxdWVzdCByZWZhY3RvcmluZyBtaWNyb2NoaXAKPj4gPiBjb2Rl
cywgbW92ZSBQTERBIGNvbW1vbiBjb2RlcyB0byBQTERBIGZpbGVzLgo+PiA+IERlc2lnd2FyZSBh
bmQgQ2FkZW5jZSBpcyBnb29kIGV4YW1wbGUgZm9yIHJlZmFjdG9yaW5nIGNvZGVzLgo+PiA+IAo+
PiA+IFNvIGZpcnN0IHN0ZXAgaXMgZXh0cmFjdCB0aGUgUExEQSBjb21tb24gY29kZXMgZnJvbSBt
aWNyb2NoaXAsIGFuZAo+PiA+IHJlZmFjdG9yaW5nIHRoZSBtaWNyb2NoaXAgY29kZXMuKHBhdGNo
MSAtIDE2KQo+PiA+IFRoZW4sIGFkZCBTdGFyZml2ZSBjb2Rlcy4gKHBhdGNoMTcgLSAxOSkKPj4g
PiAKPj4gPiBUaGlzIHBhdGNoc2V0IGlzIGJhc2Ugb24gdjYuNi1yYzMKPj4gPiAKPj4gPiBwYXRj
aDEgaXMgbW92ZSBQTERBIFhwcmVzc1JJQ0ggUENJZSBob3N0IGNvbW1vbiBwcm9wZXJ0aWVzIGR0
LWJpbmRpbmcKPj4gPiAgICAgICAgZG9jcyBmcm9tIG1pY3JvY2hpcCxwY2llLWhvc3QueWFtbAo+
PiA+IHBhdGNoMiBpcyBtb3ZlIFBvbGFyRmlyZSBjb2RlcyB0byBQTERBIGRpcmVjdG9yeS4KPj4g
PiBwYXRjaDMgaXMgbW92ZSBQTERBIElQIHJlZ2lzdGVyIG1hY3JvcyB0byBwbGRhLXBjaWUuaAo+
PiA+IHBhdGNoNCBpcyByZW5hbWUgZGF0YSBzdHJ1Y3R1cmUgaW4gbWljcm9jaGlwIGNvZGVzLgo+
PiA+IHBhdGNoNSBpcyByZW5hbWUgdHdvIHNldHVwIGZ1bmN0aW9ucyBpbiBtaWNyb2NoaXAgY29k
ZXMsIHByZXBhcmUgdG8gbW92ZQo+PiA+IHRvIGNvbW1vbiBmaWxlLgo+PiA+IHBhdGNoNiBpcyBj
aGFuZ2UgdGhlIGFyZ3VtZW50cyBvZiBwbGRhX3BjaWVfc2V0dXBfaW9tZW1zKCkKPj4gPiBwYXRj
aDcgaXMgbW92ZSB0aGUgdHdvIHNldHVwIGZ1bmN0aW9ucyB0byBjb21tb24gZmlsZSBwY2llLXBs
ZGEtaG9zdC5jCj4+ID4gcGF0Y2g4IGlzIEFkZCBQTERBIGV2ZW50IGludGVycnVwdCBjb2RlcyBh
bmQgSVJRIGRvbWFpbiBvcHMuCj4+ID4gcGF0Y2g5IGlzIHJlbmFtZSB0aGUgSVJRIHJlbGF0ZWQg
ZnVuY3Rpb25zLCBwcmVwYXJlIHRvIG1vdmUgdG8KPj4gPiBwY2llLXBsZGEtaG9zdC4KPj4gPiBw
YXRjaDEwIC0gMTQgaXMgbW9kaWZ5IHRoZSBldmVudCBjb2RlcywgcHJlcGFyaW5nIGZvciBzdXBw
b3J0IHN0YXJmaXZlCj4+ID4gYW5kIG1pY3JvY2hpcCB0d28gcGxhdGZvcm1zLgo+PiA+IHBhdGNo
MTUgaXMgbW92ZSBJUlEgcmVsYXRlZCBmdW5jdGlvbnMgdG8gcGNpZS1wbGRhLWhvc3QuYwo+PiA+
IHBhdGNoMTYgaXMgc2V0IHBsZGFfZXZlbnRfaGFuZGxlciB0byBzdGF0aWMuCj4+ID4gcGF0Y2gx
NyBpcyBhZGQgU3RhckZpdmUgSkg3MTEwIFBDSWUgZHQtYmluZGluZyBkb2MuCj4+ID4gcGF0Y2gx
OCBpcyBhZGQgU3RhckZpdmUgSkg3MTEwIFNvYyBQQ0llIGNvZGVzLgo+PiA+IHBhdGNoMTkgaXMg
U3RhcmZpdmUgZHRzIGNvbmZpZwo+PiA+IAo+PiBIaSBDb25vciBhbmQgRGFpcmUKPj4gSGF2ZSB5
b3UgZXZlciB0ZXN0IHRoaXMgcGF0Y2hzZXTvvJ8gSSdtIHN1cmUgSSBhbSBub3QgIGNoYW5nZSBs
b2dpYyBvZiB0aGUgUG9sYXJGaXJlIFBDSWUgZHJpdmVyLAo+PiBCdXQgSSBjYW4gbm90IHRlc3Qg
aXQuCj4+IFNpbmNlIHRoaXMgc2VyaWVzIHBhdGNoIGlzIGRlbGVnYXRlIHRvIG5vYm9keSBhbmQg
bm8gcmVzcG9uc2Ugbm93LiBJIGRvbid0IGtub3cgd2hlbiB0aGlzIHBhdGNoIHNldCBjYW4gYmUg
YWNjZXB0ZWQuCj4gCj4gSSdsbCB0cnkgdG8gbG9vayBhdCB0aGlzIHNlcmllcyBhZ2FpbiB0aGlz
IHdlZWsuIEkndmUgYmVlbiBBRksgYSBiaXQKPiB3aXRoIGhvbGlkYXlzIGV0YyByZWNlbnRseSwg
YW5kIGJlZW4gYSBiaXQgZGVsYXllZCBpbiBnZW5lcmFsLiBJIHdhcwo+IG1vc3RseSBoYXBweSB3
aXRoIGl0IGJlZm9yZSwgYW5kIGhhZCBsZWZ0IHJldmlld2VkLWJ5cyBvbiBtb3N0IG9mIHRoZQo+
IHNlcmllcyBJIHRoaW5rLgo+IAo+PiBJIHN0aWxsIGhvcGUgdGhlIHJlZmFjdG9yaW5nIHBhdGNo
ZXMgY2FuIGJlIGFjY2VwdGVkIGZpcnN0Cj4gCj4gVGhlIGxhc3QgcGF0Y2hzZXQgRGFpcmUgc2Vu
dCBoYXMgYmVlbiBhcHBsaWVkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNjkxNDky
MzM5NjMuNzkzOTkuNTIzMjI5Njg3MDA1NDIzOTA2NS5iNC10eUBrZXJuZWwub3JnLwo+IAo+PiAo
SSBrbm93IHlvdSB3YW50IHRvIGFkZCB0aGUgZnVuY3Rpb24gb2YgaW5ib3VuZCBhbmQgb3V0Ym91
bmQgYWRkcmVzcyB0cmFuc2xhdGlvbiwgSG9wZSB0aGlzIHNlcmllcyBwYXRjaCBkbyBub3QgaW5m
bHVlbmNlIHlvdXIgdXBzdHJlYW0gcGxhbikKPiAKPiBJJ2QgZXhwZWN0IHRoaXMgc2VyaWVzIHRv
IGdvIGluIGJlZm9yZSB0aGUgaW5ib3VuZC9vdXRib3VuZCB0cmFuc2xhdGlvbgo+IG9uZSwgc2lu
Y2UgdGhpcyBpcyBhIGxvdCBjbG9zZXIgdG8gcmVhZHkgJiBpcyBiZWluZyByZXNlbnQgbW9yZSBv
ZnRlbi4KPiAKPiBDaGVlcnMsCj4gQ29ub3IuClRoYW5rcyEgSSB3aWxsIGZvbGxvdyB0aGUgY29t
bWVudHMgYW5kIHNlbmQgdjggaW4gdGhpcyB3ZWVrLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
