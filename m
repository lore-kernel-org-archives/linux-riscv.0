Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUeeIgtICK/LAMuLn3KaA4xslhckSTIwgup2cagz36E=; b=uq3mkvIYoAcevI
	qATl/6F8C5LQDUdmMxCEQpAf7Qx440lAiQz49KKXx2uMHYeqRLtfJGq1QDTuH4jzJmfBa8iGySW5S
	caxfrj0bR/R+r8HabLpvy3VeDCFL3Jfe1VY9ZJdm0V/UPhvqvQMQ7GkvG31voH8eZlEX8+/I1B/gB
	pe/MJeM5ZB8J3eycKQDkwbdOj6pI2GauSUmccaEN5LZg5sI8dImlcyC1hzkw0672CdO55SnEebIBW
	b9dVDmaCN/56cOYN4OO/5TL+XLUba+RpDfwuRC7032JTCncXy4/odiFmD9OPHGda1Y5oMwJLDgmup
	r5C1WePQ37cw8sM/DGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYsi-000uft-Mp; Mon, 14 Nov 2022 12:48:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYsf-000ual-T9
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:48:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id r12so19103247lfp.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=277nrnbYzAZk/w5w/zJEQJYzC9TXxmjAmZORtqnxwbU=;
        b=oiHLmY3pa47eTHSa7CSjZSo4eMNx72CvsxvrRcOOoOIvzqbPNcv4IlbNS2U1mbc4Ht
         GrQTHhUD6VXSgI+gqC9vTc2pXy8Wza1X+GUnrW5nSngG75pRBNpHdHpnxI98QJHyuHGO
         gCaScJjsR2fcFJyZSIMAlDiOz6pMgADL7ug5cdxr5W7IOfwEzpBreTmhZFOZPcUSSTYw
         Q+YL+HiQ1rZvqWLecgUc41bh122WbnXkA2ZpegcY+1fLcHj0dCbvMhL9PbrIvBIXd5kW
         c2sQO0bp6JLsRK7uS1z2Kw1tq5+LDTckYML/9VDPYRrbfdC7HAT4vLgHBed7t0sr3Sz6
         fQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=277nrnbYzAZk/w5w/zJEQJYzC9TXxmjAmZORtqnxwbU=;
        b=arFUj4/UaC58+LJwhO/iO87EjVqJ7h92HGMFLMmc9vgAP0S75OtnndE7ffo1LDFeal
         uFmpQYGrKj7zDsQAZRiWKC5Xc8gXfdJQ6WuRle8h9v2wPbiuZO7HZ8HXzv0f17YJa3fC
         4mm4hEfct8e7whldnLTuy8bZ3R86bQOJMQtB29tqd5CORu2hHqXlvAVWlEyUxfchWqEf
         p6YYfazujTXL1R4zTMx5Ib+YZUbHMP3mC/htEaYCbFoH8rCKU368HNWD2VJRsyOkYZx+
         j8Sch1owVheu59jtCnYYfxWrXDYbX3JORfbk2I5v1R+trBM+Ebp9aVMd+CdtovsPF1Je
         2+5w==
X-Gm-Message-State: ANoB5pkUntRII8UlNdjk5XEUZ2affdVvV/Gj5iCeHX99Jz5vDpFEmhXt
	NYGozONcxI5aYEvzXzKJW83dFk+Bf1yl60RfjJpY8A==
X-Google-Smtp-Source: AA0mqf5MwWfb4vInIotloMa3VOdpLwMvYfT3Ee0+yPbVnXMBC1vCMsr0d4csqv7WF1K+lelWDxofALTZ6IeZds3hzxw=
X-Received: by 2002:a05:6512:3497:b0:4b1:753b:e671 with SMTP id
 v23-20020a056512349700b004b1753be671mr3784906lfr.441.1668430076188; Mon, 14
 Nov 2022 04:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
 <20221114113553.3dxrumhk72jouzek@kamzik> <2234530.yKVeVyVuyW@diego>
In-Reply-To: <2234530.yKVeVyVuyW@diego>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 14 Nov 2022 13:47:45 +0100
Message-ID: <CAAeLtUBSnVXmxMAtVg-X5gTgV_sMG_jx3ndzBZ_93fRgweD_7A@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, 
	conor@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_044805_963446_160CF53E 
X-CRM114-Status: GOOD (  19.65  )
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

T24gTW9uLCAxNCBOb3YgMjAyMiBhdCAxMjozOCwgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVj
aC5kZT4gd3JvdGU6Cj4KPiBBbSBNb250YWcsIDE0LiBOb3ZlbWJlciAyMDIyLCAxMjozNTo1MyBD
RVQgc2NocmllYiBBbmRyZXcgSm9uZXM6Cj4gPiBPbiBNb24sIE5vdiAxNCwgMjAyMiBhdCAxMTo1
NzoyOUFNICswMTAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+ID4gT24gVGh1LCAx
MCBOb3YgMjAyMiBhdCAxNzo1MCwgSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3Jv
dGU6Cj4gPiAuLi4KPiA+ID4gPiBAQCAtMzE2LDggKzM4NCwxNSBAQCB2b2lkIF9faW5pdF9vcl9t
b2R1bGUgcmlzY3ZfY3B1ZmVhdHVyZV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJlZ2lu
LAo+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgdG1wID0gKDFVIDw8IGFsdC0+ZXJyYXRhX2lkKTsKPiA+ID4gPiAtICAgICAgICAgICAgICAg
aWYgKGNwdV9yZXFfZmVhdHVyZSAmIHRtcCkKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICBwYXRjaF90ZXh0X25vc3luYyhhbHQtPm9sZF9wdHIsIGFsdC0+YWx0X3B0ciwgYWx0LT5hbHRf
bGVuKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKGNwdV9yZXFfZmVhdHVyZSAmIHRtcCkg
ewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIGRvIHRoZSBiYXNpYyBwYXRjaGlu
ZyAqLwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhdGNoX3RleHRfbm9zeW5jKGFs
dC0+b2xkX3B0ciwgYWx0LT5hbHRfcHRyLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFsdC0+YWx0X2xlbik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJpc2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKGFsdC0+
b2xkX3B0ciwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhbHQtPmFsdF9sZW4sCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWx0LT5vbGRfcHRyIC0gYWx0
LT5hbHRfcHRyKTsKPiA+ID4KPiA+ID4gSGVyZSB5b3UncmUgY2FzdGluZyBhIHZvaWQgcG9pbnRl
ciB0byBhbiBpbnN0cnVjdGlvbiB0byBhbiB1bnNpZ25lZAo+ID4gPiBpbnQgcG9pbnRlciwgYnV0
IHNpbmNlIHdlIGVuYWJsZSBjb21wcmVzc2VkIGluc3RydWN0aW9ucyB0aGlzIG1heQo+ID4gPiBy
ZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIuIFVzaW5nIHRoaXMgcG9pbnRlciB3aWxsIHdv
cmssIGJ1dCBtYXkKPiA+ID4gYmUgc2xvdy4gRWcuIGZhdWx0IHRvIG0tbW9kZSB0byBiZSBwYXRj
aGVkIHVwLiBXZSBhbHJlYWR5IGRvIHRoYXQgaW4KPiA+ID4gb3RoZXIgcGxhY2VzIGluIHRoZSBh
cmNoL3Jpc2N2LCBidXQgSSdkIHByZWZlciBub3QgdG8gYWRkIG5ldwo+ID4gPiBpbnN0YW5jZXMg
b2YgdGhpcy4KPiA+Cj4gPiBBbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbiBzZXF1ZW5jZXMgKG9sZCBh
bmQgbmV3KSBoYXZlIGNvbXByZXNzaW9uIGRpc2FibGVkLgo+Cj4gVGhhdCB3YXMgbXkgZmlyc3Qg
dGhvdWdodCBhcyB3ZWxsLCBidXQgSSB0aGluayBFbWlsIHdhcyB0YWxraW5nIG1vcmUgYWJvdXQg
dGhlCj4gcGxhY2VtZW50IG9mIHRoZSBhbHRlcm5hdGl2ZSBibG9jayBpbnNpZGUgdGhlIHJ1bm5p
bmcga2VybmVsLgo+Cj4gaS5lLiBJIGd1ZXNzIHRoZSBzdGFydGluZyBwb2ludCBvZiBhbiBhbHRl
cm5hdGl2ZSBzZXF1ZW5jZSBjb3VsZCBhbHNvIGJlIHVuYWxpZ25lZC4KCkluZGVlZC4gSW5zdHJ1
Y3Rpb24gYWxpZ25tZW50IGlzIG9ubHkgZ3VhcmFudGVlZCB0byBiZSAxNmJpdHMsIGV2ZW4KZm9y
IGxhcmdlciBpbnN0cnVjdGlvbnMuCgo+IFRob3VnaCBJIGRvbid0IF95ZXRfIHNlZSBob3cgYW4g
aW1wcm92ZW1lbnQgY291bGQgbG9vayBsaWtlLgoKVGhlIGdlbmVyYWwgc3RyYXRlZ3kgd291bGQg
YmUgbXVsdGlwbGUgc21hbGxlciBhY2Nlc3NlcyB0aGF0IGFyZSB0aGVuCnN0aXRjaGVkIHRvZ2V0
aGVyLgpUaGlzIHdpbGwgcmVxdWlyZSAoZm9yIGEgMzJiaXQgb3Bjb2RlKSBhdCBsZWFzdCAyIGxv
YWRzLCAxIHNoaWZ0IGFuZCAxCm9yIOKAlCBmb3IgYSBjcml0aWNhbCBwYXRoIG9mIDMgaW5zdHJ1
Y3Rpb25zLgoKR2l2ZW4gdGhhdCB3ZSBhcmUgcnVubmluZyBvbiBSVjY0LCB5b3UgY2FuIGhhbmRs
ZSB1cCB0byA0OGJpdCBieQphbGlnbmluZyBkb3duLCBwZXJmb3JtaW5nIGEgNjRiaXQgbG9hZCBh
bmQgKGlmIG5lZWRlZCkgc2hpZnRpbmcuCgpGaW5hbGx5LCBwcm9maWxlcyBsb29rcyBsaWtlIGl0
IHdpbGwgZ2l2ZSB1cyBzdXBwb3J0IGZvciBtaXNhbGlnbmVkCmxvYWRzIChzZWUgaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LXByb2ZpbGVzL2Jsb2IvbWFpbi9wcm9maWxlcy5hZG9jI3J2
YTIyLXByb2ZpbGVzCmFuZCB3aGVyZSB0aGUgWmljY2xzbSBleHRlbnNpb24gaXMgbWFuZGF0ZWQp
LgoKUGhpbGlwcC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
