Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02DE784BD
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYHCQgILNVMQKMt53Ays/L0cd72k0D+R6CT8t2QzKlg=; b=WUSCbXtq6q5VyP
	AE8PR0xSL3S1w7kHUTb5bCBh3sF3zPHZZGkVaXO5v0iSZTivCqDIO9cKtsAfWOe+IglihLpIIuDmJ
	iqGcQ7vimGg3AKkxXjFVrgq19wCqo74dht25TH8eVieIexeQubWdqSOJDgK3EaO9+nps2zb9F0brM
	3UjEib9QwqsnBMzqM37tFePvcNIcsCMlbVx5HejZTRr4Pu6en1JPah2CAEpH2swe66tLCdW4ByAm9
	gkr8tMN013QsgsTv3SdpsgmaHrn+YGFlMsRp5o2UAw4VrdNl6OlDWrTnsrCQPw3Ppy4OzR71Cu4qM
	WkK4MZvSMSjGTN7S9OaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKgo-00CyI8-1w;
	Mon, 02 Oct 2023 15:18:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKgl-00CyGv-1n
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:18:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2773af0c5dbso9336635a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696259905; x=1696864705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw7QdnIT6pMfMgjKXoJDij3f+XvSgPQK38vQOQ+QTs8=;
        b=hnipoAcVFTu11wp8tn5o35JcYtlCreVqD3ryaz0iTdbIYfHKP+kTiPBgnMiAKlc40n
         I/s2MHTVjBILFlMelEFGBRZaTsILd0A3m012lex8KQLADWTVLzSt5gTM02orCasQOUno
         +w4m9iuUNPhm2baTBTBOk0C0FTeAF4KPq97OkdfZvRo5BYc4iMzAZRhc5BJz3hm7DBnf
         i7HeiTRXGr8gvaq5F4v94qXmHtu9aaCMxzHVuqGXd3XEB7WJfljCpUmUbe77CUp52yI6
         jFm/sJpLn6ssvikmy2yF2NCTsuQMpFCh9nIS7X0nK5Mu9V7HoQcu/XcSp31wXfd0yW11
         wKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259905; x=1696864705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw7QdnIT6pMfMgjKXoJDij3f+XvSgPQK38vQOQ+QTs8=;
        b=cRbikk1F0XRX0SJBbeHtVHEvx4889S8tBKIL8WYHRD3CPL1q3NyNFUzTBhcg9BolsT
         L4aduptqllpfRmmFMMhu2yDon39yam2HdA5aeP9iQCehvfii/aYO+B3GoJipq9S7O4rY
         UR//NBUCiWZ60Z65wHT+N6jO5ZQuKVsjrIuX+UB7X/GPZpFLF0BV29Ih21iEfL+59MYA
         0qkQgUwMZZD6kODk+I/hYCZomPH5mA9PCnvsXmYcTI1BAS9p7cbfksiaVeUUSRQUUJsf
         N4U2w5X6Jlx/KQg8wzGyljzpoRFIKbwKWQY+lYwPebqWELolrVWXsgRqeoNSdUihZL2F
         8WEw==
X-Gm-Message-State: AOJu0YzUjrohvWWemclWtCWUEnHog7hjKPCHuHq1Y9K9PxBMcM1uBSfX
	5RCaAqLtK+RefVZifkWm4MHkb1ofKfguHPxENx99MQ==
X-Google-Smtp-Source: AGHT+IExQzqmMZpcgxUYWYYZRO3DyThsJv/MhEoZGi6g+28XkYKxTqNm3icOqRRCLuljZY21JBxxTIp2JmHSnkkcNF0=
X-Received: by 2002:a17:90a:5ac6:b0:268:93d:b936 with SMTP id
 n64-20020a17090a5ac600b00268093db936mr8611041pji.18.1696259904904; Mon, 02
 Oct 2023 08:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
 <20230928061207.1841513-6-apatel@ventanamicro.com> <87bkdlma6j.wl-maz@kernel.org>
In-Reply-To: <87bkdlma6j.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 2 Oct 2023 20:48:12 +0530
Message-ID: <CAK9=C2VfsSMaawuTRcrbSFGE9yYBDO1Q0oBksD-NKmrz8WynMw@mail.gmail.com>
Subject: Re: [PATCH v9 05/15] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081827_598145_589538ED 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgNjowMuKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyOCBTZXAgMjAyMyAwNzoxMTo1NyArMDEwMCwKPiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIFBM
SUMgZHJpdmVyIGRvZXMgbm90IHJlcXVpcmUgdmVyeSBlYXJseSBpbml0aWFsaXphdGlvbiBzbyBs
ZXQKPiA+IHVzIGNvbnZlcnQgaXQgaW50byBhIHBsYXRmb3JtIGRyaXZlci4KPiAgIF5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4KPiA+IEFzIHBhcnQgb2YgdGhlIGNvbnZl
cnNpb24sIHRoZSBQTElDIHByb2JpbmcgdW5kZXJnb2VzIHRoZSBmb2xsb3dpbmcKPiA+IGNoYW5n
ZXM6Cj4gPiAxLiBVc2UgZGV2X2luZm8oKSwgZGV2X2VycigpIGFuZCBkZXZfd2FybigpIGluc3Rl
YWQgb2YgcHJfaW5mbygpLAo+ID4gICAgcHJfZXJyKCkgYW5kIHByX3dhcm4oKQo+ID4gMi4gVXNl
IGRldm1feHl6KCkgQVBJcyB3aGVyZXZlciBhcHBsaWNhYmxlCj4gPiAzLiBQTElDIGlzIG5vdyBw
cm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11cCBzbyB3ZSBoYXZlIHRvCj4gPiAgICBzZXR1
cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhhbmRsZXIgb2YgYWxsIG9ubGluZSBDUFVzCj4g
PiAgICBhcmUgaW5pdGlhbGl6ZWQgb3RoZXJ3aXNlIHdlIHNlZSBjcmFzaCBvbiBtdWx0aS1zb2Nr
ZXQgc3lzdGVtcwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxp
Yy5jIHwgMjQyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgODggZGVsZXRpb25zKC0pCj4gPgo+Cj4gWy4uLl0KPgo+
ID4gK2NvcmVfaW5pdGNhbGwocGxpY19pbml0KTsKPgo+IE9yIG5vdC4gVGhlcmUgYXJlIG9ubHkg
dHdvIGNob2ljZXM6IGVpdGhlciB5b3UgYWJzb2x1dGVseSByZXF1aXJlCj4gZWFybHkgaW5pdCwg
YW5kIHlvdSBzdGljayB3aXRoIHRoZSBjdXJyZW50IHNpdHVhdGlvbiwgb3IgeW91IGRvbid0LAo+
IGFuZCB5b3UgY2FuIHJlbHkgb24gZGVwZW5kZW5jaWVzLgo+Cj4gSSdtIG5vdCBwcmVwYXJlZCB0
byBoYXZlIGEgdGhpcmQgb3B0aW9uLgoKVGhpcyBpcyBub3QgcmVxdWlyZWQgZm9yIERUIGJhc2Vk
IHBsYXRmb3JtIGRyaXZlciBwcm9iaW5nIHNvCkkgd2lsbCB1c2UgYnVpbHRpbl9wbGF0Zm9ybV9k
cml2ZXIoKSBvdmVyIGhlcmUgYW5kIGluIEFQTElDCmFzIHdlbGwgYXMgSU1TSUMgcGxhdGZvcm0g
ZHJpdmVycy4KClJlZ2FyZHMsCkFudXAKCj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQg
ZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
