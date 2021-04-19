Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38EDC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 02:44:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1787660FEA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 02:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1787660FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a7roSz3iehmStMuKZ/KFXcUwaK6vjUsQlKvVrWmH3YQ=; b=nlC3Xa0pBpW7GB4nAz13Td0UG
	kxnVtZq45ZmE21sAj6pGZEPEGWDFYsrPIgiCBmwr6DloLm732CNqmIEjE108KWmMxYxWtpxlma3ef
	gg5KYr3zQ6G2Q8DpVx3V4hgEgcuHmBGtXXP7dHXPagG3OQ60HclPWhpndq0UDU8gX3sZ7PpYR7rNW
	is+M3f/ICxM8/KqTv5K1+n8MCDv4ykyWPjok6ZtwBu07bpJPJwPui+0v2f15OjiZfbP6HAYyXIESR
	1+uLCnTkM4vZW6YFrMiCMS2GwK2C+bKuBcp6odhiyw5ia5ZqFcZYR1HD0bG6R+fEOgPrgaNl7LjBz
	15+TuhDpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYJt6-008xuc-Rq; Mon, 19 Apr 2021 02:43:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYJt3-008xuP-Pr
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 02:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Sx7h0f2GZxD3nAjPPDDUPLWWYJCyRbQKUNjPW59daPo=; b=BARcSfM/GW4tluq6eqIg3wROId
 lSTVvyPod4+EHkRsUX3i9dyyRqZJzuVOACsVp9gB1cOY9EiGOGpn57PPEhMIjIjVRlPy3vps4IQQa
 tpNsB0JE4kpGxcH2JiPVWe22g3RC5d/+8jRTH0G4ohIRpCRp7DdJ4BERkIGQ6xBVKlk8o/4wYZp/k
 8PGaM7d2+fXgmN9e16MUWVJ0GHBAw4RM4lZPssjRjM+PADt85K4kGQS2Rd4PVqc7w0mOHnWZ6bc7q
 As/+eHKQNKDLOSkuCP9Dfxi57BPT/Ia6JS7EBbtRU1Unoa6LfzD+8WetarrVQ0JyaM+RRvwshLGyW
 ffonbD1Q==;
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYJsx-00AtYm-6h
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 02:43:42 +0000
Received: by mail-qt1-x831.google.com with SMTP id y12so25109337qtx.11
 for <linux-riscv@lists.infradead.org>; Sun, 18 Apr 2021 19:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sx7h0f2GZxD3nAjPPDDUPLWWYJCyRbQKUNjPW59daPo=;
 b=KwlvFeQWVR/uxKtcJ2SY+8qVoqs3VJGOGaLKPkos/++5xUzVOq/KPh47X/sAZdvj/V
 qCDBiJXTvRK8f8nGQTtHqW8pYwwukQRknOp5cT93YwADCUUwAIephISjfWzAhpvwbSl5
 6hcWmhf0MkhR4HYPV2vAZIQ6MUOZ+UOpPvqCJoIc3v+5fOLmHzvZRmh3GV9TrKQ4SWLW
 j8dBgB4u63HgjaiJjP8X6ExOJRPEGZTQflnt3uKdk5Dwec9k3FrdBC3b9vfyXEjNN55Y
 +9GeDymJGoZS9Uanohn4SD7WUaR6sazddH9qZtPcwasUI0t40lW6UyAeGBtiduaEikWx
 ElSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sx7h0f2GZxD3nAjPPDDUPLWWYJCyRbQKUNjPW59daPo=;
 b=Iw5yoMT70W28D+ZWkpr6etpkiV4cpMvOrVFbwfJgxkz8azaBm+l1T1+64ALUqkRa6b
 cuWtuDgrrSHQ5KIURueFiPzeaFxe7kBg03MBR8CpAVHaM2fEvjbxdPlUcconvssAJKR1
 LUi1NOJfiSvRgNnEDs93zQ79ZYZwqnSr0lMBHELm77iz4F95wm2qTvJ7Kb2o6nLtJdtJ
 fg2JLVJzqhxIE0YcigudbYFOPinh49sbKWDjj8AaWPA61Lz36QCyoATOainOB+NnA7bB
 WM1CYmGM2LHhjk1oTzW9jItJZGaVSu9z6C/+PFy2o2u8QEbKUPhy3QZrfrTOoEyOL9Jt
 DRdA==
X-Gm-Message-State: AOAM532eh7LWIdTFy6kB1DVr/leLLa0r4P6msGL+tCZVB9yWz5w+Vdoo
 rAnXwCmDq3wOrfOkITny6p1gwQTscRkNiYcXwh9PNw==
X-Google-Smtp-Source: ABdhPJzVmkhzl9leyhZ9ljuuMImwewyFcTNGBbjtAcCIixr8PrGFghNigQ+fWIFC9V5deD3rl4jtmuriLP4mGsSeH+Q=
X-Received: by 2002:ac8:502:: with SMTP id u2mr9576775qtg.218.1618800216887;
 Sun, 18 Apr 2021 19:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <17994571deaf703e65ece7e44c742f82c988cf39.1615954046.git.greentime.hu@sifive.com>
 <mhng-30f397a9-b7af-4247-baa0-d8e1d30c6b97@palmerdabbelt-glaptop>
In-Reply-To: <mhng-30f397a9-b7af-4247-baa0-d8e1d30c6b97@palmerdabbelt-glaptop>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 19 Apr 2021 10:43:28 +0800
Message-ID: <CAHCEehL+3ZxKv_nxSR6s0vWEFtNHSYOX_dHrpfGq1hM8xwhHRQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] riscv: dts: Add PCIe support for the SiFive
 FU740-C000 SoC
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 alex.dewar90@gmail.com, khilman@baylibre.com, hayashi.kunihiko@socionext.com, 
 vidyas@nvidia.com, jh80.chung@samsung.com, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_194339_302037_7BE0AB03 
X-CRM114-Status: GOOD (  16.18  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5pa8IDIwMjHlubQz5pyIMzHml6Ug
6YCx5LiJIOS4iuWNiDg6MjTlr6vpgZPvvJoKPgo+IE9uIFdlZCwgMTcgTWFyIDIwMjEgMjM6MDg6
MTMgUERUICgtMDcwMCksIGdyZWVudGltZS5odUBzaWZpdmUuY29tIHdyb3RlOgo+ID4gU2lnbmVk
LW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+
ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaSB8IDM0ICsrKysr
KysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9mdTc0MC1jMDAw
LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9mdTc0MC1jMDAwLmR0c2kKPiA+IGlu
ZGV4IGQxYmIyMmIxMTkyMC4uZDA4Mzk3MzliNDI1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NpZml2ZS9mdTc0MC1jMDAwLmR0c2kKPiA+IEBAIC0xNTgsNiArMTU4LDcgQEAgcHJj
aTogY2xvY2stY29udHJvbGxlckAxMDAwMDAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MCAweDEwMDAwMDAwIDB4MCAweDEwMDA+Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwmaGZjbGs+LCA8JnJ0Y2Nsaz47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNyZXNldC1j
ZWxscyA9IDwxPjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+ICAgICAgICAgICAgICAgdWFydDA6
IHNlcmlhbEAxMDAxMDAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJzaWZpdmUsZnU3NDAtYzAwMC11YXJ0IiwgInNpZml2ZSx1YXJ0MCI7Cj4gPiBAQCAtMjg4LDUg
KzI4OSwzOCBAQCBncGlvOiBncGlvQDEwMDYwMDAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBjbG9ja3MgPSA8JnByY2kgUFJDSV9DTEtfUENMSz47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+ICsgICAgICAg
ICAgICAgcGNpZUBlMDAwMDAwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDM+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMg
PSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgI251bS1sYW5lcyA9IDw4PjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTc0MC1wY2llIjsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHhlIDB4MDAwMDAwMDAgMHgxIDB4MAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweGQgMHhmMDAwMDAwMCAweDAgMHgxMDAwMDAwMAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAweDAgMHgxMDBkMDAwMCAweDAgMHgxMDAwPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAiZGJpIiwgImNvbmZpZyIsICJtZ210IjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGRtYS1jb2hlcmVudDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBi
dXMtcmFuZ2UgPSA8MHgwIDB4ZmY+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9
IDwweDgxMDAwMDAwICAweDAgMHg2MDA4MDAwMCAgMHgwIDB4NjAwODAwMDAgMHgwIDB4MTAwMDAg
ICAgICAgIC8qIEkvTyAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDgy
MDAwMDAwICAweDAgMHg2MDA5MDAwMCAgMHgwIDB4NjAwOTAwMDAgMHgwIDB4ZmY3MDAwMCAgICAg
IC8qIG1lbSAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDgyMDAwMDAw
ICAweDAgMHg3MDAwMDAwMCAgMHgwIDB4NzAwMDAwMDAgMHgwIDB4MTAwMDAwMCAgICAgIC8qIG1l
bSAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGMzMDAwMDAwIDB4MjAg
MHgwMDAwMDAwMCAweDIwIDB4MDAwMDAwMDAgMHgyMCAweDAwMDAwMDAwPjsgIC8qIG1lbSBwcmVm
ZXRjaGFibGUgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBudW0tbGFuZXMgPSA8MHg4PjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDU2IDU3IDU4IDU5IDYwIDYx
IDYyIDYzIDY0PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAi
bXNpIiwgImludGEiLCAiaW50YiIsICJpbnRjIiwgImludGQiOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWMwPjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8MHgwIDB4MCAweDAgMHg3PjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwID0gPDB4MCAweDAgMHgwIDB4MSAmcGxpYzAgNTc+
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4MCAweDAg
MHgyICZwbGljMCA1OD4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwweDAgMHgwIDB4MCAweDMgJnBsaWMwIDU5PiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPDB4MCAweDAgMHgwIDB4NCAmcGxpYzAgNjA+Owo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjaWVfYXV4IjsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8JnByY2kgUFJDSV9DTEtfUENJRV9BVVg+Owo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHB3cmVuLWdwaW9zID0gPCZncGlvIDUgMD47Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcGVyc3RuLWdwaW9zID0gPCZncGlvIDggMD47Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmVzZXRzID0gPCZwcmNpIDQ+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICAgICAgIH07Cj4gPiAgfTsKPgo+
IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Cj4g
SSdtIGhhcHB5IHRvIHRha2UgdGhlc2UgYWxsIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlIGlmIHRo
YXQgaGVscHMsIGJ1dAo+IGFzIHVzdWFsIEknZCBsaWtlIHJldmlld3Mgb3IgYWNrcyBmcm9tIHRo
ZSBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMuICBJdAo+IGxvb2tzIGxpa2UgdGhlcmUgYXJlIHNvbWUg
aXNzdWVzIHNvIEknbSBnb2luZyB0byBkcm9wIHRoaXMgZnJvbSBteQo+IGluYm94LgoKSGkgUGFs
bWVyLAoKU2luY2UgdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyIGhhcyBwaWNrIHRoZSBmaXJzdCA1
IHBhdGNoZXMgdG8gaGlzCmJyYW5jaCwgd291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHBpY2sgdGhl
IDZ0aCBwYXRjaCBvZiB2ZXJzaW9uIDY/ClRoYW5rIHlvdS4gOikKCmh0dHBzOi8vd3d3LnNwaW5p
Y3MubmV0L2xpc3RzL2xpbnV4LWNsay9tc2c1NzIxMy5odG1sCmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIxMDQwNjA5MjYzNC41MDQ2NS03
LWdyZWVudGltZS5odUBzaWZpdmUuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
