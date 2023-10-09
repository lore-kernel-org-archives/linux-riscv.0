Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C76E95A99
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZfpHZCy/fgL+G8K++RLWCrQzPzTWS34fBI2o+Olxz4=; b=KnFOJV/iH0aen5
	qutHAEb9UzVEZzi1zYYy1sxB8k7ROnHimhJRU3Url61gfbyeqqFmSInlg/q+TbszacrK+rkxj+fr3
	8MvhKSD8emC+yBfblqRCdgXjG+o+sSKdf6xzUCRdxKKNJFvp/KcWQpDOfyVoW+RxeRCj9ed1XvB14
	LqRxXG9oAiK5Nx4CKbH2F+dLfHlzXXmUHEVdgnFAcp14d2i6hVs6KEBzFsy4bDOlOsb9VhrDuMOz3
	4ecCBvT4ovBe3pIHCCI4V19l3WA1P4dIvGCCCRAf9mcAnxh5nb7XZSe0fiP368mupIrKyLzd9V0Ti
	bEYd/Ltbz5uDlazhnx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnzK-00AP2R-13;
	Mon, 09 Oct 2023 10:59:50 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnzG-00AP10-2m
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:59:49 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 70B5C24E225;
	Mon,  9 Oct 2023 18:59:00 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Oct
 2023 18:59:00 +0800
Received: from [192.168.125.85] (183.27.97.165) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Oct
 2023 18:58:59 +0800
Message-ID: <fd5b8d0f-67d0-4e0e-9a15-6f3ae53b6db2@starfivetech.com>
Date: Mon, 9 Oct 2023 18:58:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/19] Refactoring Microchip PCIe driver and add
 StarFive PCIe
To: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
Content-Language: en-US
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230927100802.46620-1-minda.chen@starfivetech.com>
X-Originating-IP: [183.27.97.165]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_035947_209135_D340EC9C 
X-CRM114-Status: GOOD (  14.14  )
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

CgpPbiAyMDIzLzkvMjcgMTg6MDcsIE1pbmRhIENoZW4gd3JvdGU6Cj4gVGhpcyBwYXRjaHNldCBm
aW5hbCBwdXJwb3NlIGlzIGFkZCBQQ0llIGRyaXZlciBmb3IgU3RhckZpdmUgSkg3MTEwIFNvQy4K
PiBKSDcxMTAgdXNpbmcgUExEQSBYcHJlc3NSSUNIIFBDSWUgSVAuIE1pY3JvY2hpcCBQb2xhckZp
cmUgVXNpbmcgdGhlCj4gc2FtZSBJUCBhbmQgaGF2ZSBjb21taXQgdGhlaXIgY29kZXMsIHdoaWNo
IGFyZSBtaXhlZCB3aXRoIFBMREEKPiBjb250cm9sbGVyIGNvZGVzIGFuZCBNaWNyb2NoaXAgcGxh
dGZvcm0gY29kZXMuCj4gCj4gRm9yIHJlLXVzZSB0aGUgUExEQSBjb250cm9sbGVyIGNvZGVzLCBJ
IHJlcXVlc3QgcmVmYWN0b3JpbmcgbWljcm9jaGlwCj4gY29kZXMsIG1vdmUgUExEQSBjb21tb24g
Y29kZXMgdG8gUExEQSBmaWxlcy4KPiBEZXNpZ3dhcmUgYW5kIENhZGVuY2UgaXMgZ29vZCBleGFt
cGxlIGZvciByZWZhY3RvcmluZyBjb2Rlcy4KPiAKPiBTbyBmaXJzdCBzdGVwIGlzIGV4dHJhY3Qg
dGhlIFBMREEgY29tbW9uIGNvZGVzIGZyb20gbWljcm9jaGlwLCBhbmQKPiByZWZhY3RvcmluZyB0
aGUgbWljcm9jaGlwIGNvZGVzLihwYXRjaDEgLSAxNikKPiBUaGVuLCBhZGQgU3RhcmZpdmUgY29k
ZXMuIChwYXRjaDE3IC0gMTkpCj4gCj4gVGhpcyBwYXRjaHNldCBpcyBiYXNlIG9uIHY2LjYtcmMz
Cj4gCj4gcGF0Y2gxIGlzIG1vdmUgUExEQSBYcHJlc3NSSUNIIFBDSWUgaG9zdCBjb21tb24gcHJv
cGVydGllcyBkdC1iaW5kaW5nCj4gICAgICAgIGRvY3MgZnJvbSBtaWNyb2NoaXAscGNpZS1ob3N0
LnlhbWwKPiBwYXRjaDIgaXMgbW92ZSBQb2xhckZpcmUgY29kZXMgdG8gUExEQSBkaXJlY3Rvcnku
Cj4gcGF0Y2gzIGlzIG1vdmUgUExEQSBJUCByZWdpc3RlciBtYWNyb3MgdG8gcGxkYS1wY2llLmgK
PiBwYXRjaDQgaXMgcmVuYW1lIGRhdGEgc3RydWN0dXJlIGluIG1pY3JvY2hpcCBjb2Rlcy4KPiBw
YXRjaDUgaXMgcmVuYW1lIHR3byBzZXR1cCBmdW5jdGlvbnMgaW4gbWljcm9jaGlwIGNvZGVzLCBw
cmVwYXJlIHRvIG1vdmUKPiB0byBjb21tb24gZmlsZS4KPiBwYXRjaDYgaXMgY2hhbmdlIHRoZSBh
cmd1bWVudHMgb2YgcGxkYV9wY2llX3NldHVwX2lvbWVtcygpCj4gcGF0Y2g3IGlzIG1vdmUgdGhl
IHR3byBzZXR1cCBmdW5jdGlvbnMgdG8gY29tbW9uIGZpbGUgcGNpZS1wbGRhLWhvc3QuYwo+IHBh
dGNoOCBpcyBBZGQgUExEQSBldmVudCBpbnRlcnJ1cHQgY29kZXMgYW5kIElSUSBkb21haW4gb3Bz
Lgo+IHBhdGNoOSBpcyByZW5hbWUgdGhlIElSUSByZWxhdGVkIGZ1bmN0aW9ucywgcHJlcGFyZSB0
byBtb3ZlIHRvCj4gcGNpZS1wbGRhLWhvc3QuCj4gcGF0Y2gxMCAtIDE0IGlzIG1vZGlmeSB0aGUg
ZXZlbnQgY29kZXMsIHByZXBhcmluZyBmb3Igc3VwcG9ydCBzdGFyZml2ZQo+IGFuZCBtaWNyb2No
aXAgdHdvIHBsYXRmb3Jtcy4KPiBwYXRjaDE1IGlzIG1vdmUgSVJRIHJlbGF0ZWQgZnVuY3Rpb25z
IHRvIHBjaWUtcGxkYS1ob3N0LmMKPiBwYXRjaDE2IGlzIHNldCBwbGRhX2V2ZW50X2hhbmRsZXIg
dG8gc3RhdGljLgo+IHBhdGNoMTcgaXMgYWRkIFN0YXJGaXZlIEpINzExMCBQQ0llIGR0LWJpbmRp
bmcgZG9jLgo+IHBhdGNoMTggaXMgYWRkIFN0YXJGaXZlIEpINzExMCBTb2MgUENJZSBjb2Rlcy4K
PiBwYXRjaDE5IGlzIFN0YXJmaXZlIGR0cyBjb25maWcKPiAKSGkgQ29ub3IgYW5kIERhaXJlCkhh
dmUgeW91IGV2ZXIgdGVzdCB0aGlzIHBhdGNoc2V077yfIEknbSBzdXJlIEkgYW0gbm90ICBjaGFu
Z2UgbG9naWMgb2YgdGhlIFBvbGFyRmlyZSBQQ0llIGRyaXZlciwKQnV0IEkgY2FuIG5vdCB0ZXN0
IGl0LgpTaW5jZSB0aGlzIHNlcmllcyBwYXRjaCBpcyBkZWxlZ2F0ZSB0byBub2JvZHkgYW5kIG5v
IHJlc3BvbnNlIG5vdy4gSSBkb24ndCBrbm93IHdoZW4gdGhpcyBwYXRjaCBzZXQgY2FuIGJlIGFj
Y2VwdGVkLgpJIHN0aWxsIGhvcGUgdGhlIHJlZmFjdG9yaW5nIHBhdGNoZXMgY2FuIGJlIGFjY2Vw
dGVkIGZpcnN0LiAKKEkga25vdyB5b3Ugd2FudCB0byBhZGQgdGhlIGZ1bmN0aW9uIG9mIGluYm91
bmQgYW5kIG91dGJvdW5kIGFkZHJlc3MgdHJhbnNsYXRpb24sIEhvcGUgdGhpcyBzZXJpZXMgcGF0
Y2ggZG8gbm90IGluZmx1ZW5jZSB5b3VyIHVwc3RyZWFtIHBsYW4pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
