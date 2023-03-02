Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE7C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYncR1TLEOlMtIoEm9RV0Xjdj9cEUbNRj2eQ/9Y+7Mc=; b=3dmcDxmWYzZB4R
	+NWg12bZ88dwHl78ZQUuQ1WbLb8ECo2q4oMyQhx8OLOVFcNcdsJarYpy4qzXmMmLChpRSdlDpXaTY
	JKpU3tY96ThW/xxEVKS5yvQG8EcZIRQJBldrvY0VDIiErG+J1vXep07GaN24qxnfr7BEy8o8QGr3h
	QBVvKuihqiUE1sJQ9ka6nigU2u6GNhfDtLq/IdsryDCEjL+uyqSZnzy1WPJuUJT+T+g8okxUYsMeT
	f45jCgsD+ikOFZCRqrxbkyA2+rxJ2cVfw+/ULf4vNAdjVxB028zWvvogUdJzor2ps2m83TtFodTLA
	GNRBadkuVCJNysqEn6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdhu-001BSu-Jn; Thu, 02 Mar 2023 07:50:30 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdhj-001BR0-My; Thu, 02 Mar 2023 07:50:21 +0000
Received: by mail-oi1-f180.google.com with SMTP id s41so12094962oiw.13;
        Wed, 01 Mar 2023 23:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9NdTpfDEMV32UTE9lZbQp6kQQhUJVdsU2kqbFsl+ZA=;
        b=Uv/97LEQ2o8HPmxJPcs3NIn9Fuk94mcTe+fVDLHyr2Xeltmrh0SnXAQAAL2Vag8S1H
         0L6kCr6o3REik/kxlRaYNKlCvERttxA9kHztl9mqGnNr30zGCCSxkAEDYFjajyz2OoGT
         CMmNz4dFeFTSQ54whh4g7qzZuo9+lW7e7qx8l6E5QYQGfXQi/d98hzV91z4bJXlJ+dzr
         /40cmtcqGLerAaj09lQr9VRrRMxnFUCwpE3fzgiFlVpnWFEmFl5dYqr3DKIjWh56IYwk
         B9oGFC6sCAomma2KBdS/O66Ypvv9bb50Vy+Zcigb39GzUO/TmhmSnG1s8MwiqEtK60VL
         CeHg==
X-Gm-Message-State: AO0yUKVEak98zVX8go3sVdQzvx/atjudd63tSnD39XxRmwAFTQo4PwL3
	hph0yq8wKj80SC9zwihTlV9saxCdQI02Ng==
X-Google-Smtp-Source: AK7set+c3GKOJQOV+niWaki9KXS8F59UWL/qgX3UK/0bD6duj8lkmioX4v5QJDdv9eI7llkqMXfQ6w==
X-Received: by 2002:a05:6808:a:b0:378:2ac9:b7bc with SMTP id u10-20020a056808000a00b003782ac9b7bcmr4291651oic.56.1677743417761;
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id r204-20020acadad5000000b003785996ef36sm6705930oig.19.2023.03.01.23.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-17652f24da7so166174fac.4;
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
X-Received: by 2002:a81:ad1b:0:b0:52f:1c23:ef1 with SMTP id
 l27-20020a81ad1b000000b0052f1c230ef1mr5784211ywh.5.1677743396691; Wed, 01 Mar
 2023 23:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com> <20230301185209.274134-3-jjhiblot@traphandler.com>
In-Reply-To: <20230301185209.274134-3-jjhiblot@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 08:49:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: saravanak@google.com, clement.leger@bootlin.com, 
	Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, zajec5@gmail.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Marc Zyngier <maz@kernel.org>, afaerber@suse.de, 
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nishanth Menon <nm@ti.com>, ssantosh@kernel.org, 
	mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_235019_792985_20430F99 
X-CRM114-Status: GOOD (  22.49  )
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

SGkgSmVhbi1KYWNxdWVzLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gV2VkLCBNYXIgMSwg
MjAyMyBhdCA3OjUz4oCvUE0gSmVhbi1KYWNxdWVzIEhpYmxvdAo8ampoaWJsb3RAdHJhcGhhbmRs
ZXIuY29tPiB3cm90ZToKPiBvZl9pcnFfcGFyc2Vfb25lKCkgZG9lcyBhIGdldCgpIG9uIHRoZSBk
ZXZpY2Ugbm9kZSByZXR1cm5lZCBpbiBvdXRfaXJxLT5ucC4KPiBDYWxsZXJzIG9mIG9mX2lycV9w
YXJzZV9vbmUoKSBtdXN0IGRvIGEgcHV0KCkgd2hlbiB0aGV5IGFyZSBkb25lIHdpdGggaXQuCgpX
aGF0IGRvZXMgImJlIGRvbmUgd2l0aCBpdCIgcmVhbGx5IG1lYW4gaGVyZT8KCj4gU2lnbmVkLW9m
Zi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdHJhcGhhbmRsZXIuY29tPgoKPiAt
LS0gYS9hcmNoL2FybS9tYWNoLXNobW9iaWxlL3JlZ3VsYXRvci1xdWlyay1yY2FyLWdlbjIuYwo+
ICsrKyBiL2FyY2gvYXJtL21hY2gtc2htb2JpbGUvcmVndWxhdG9yLXF1aXJrLXJjYXItZ2VuMi5j
Cj4gQEAgLTE4NCw2ICsxODQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByY2FyX2dlbjJfcmVndWxh
dG9yX3F1aXJrKHZvaWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUocXVpcmspOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICB9Cj4g
KyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGFyZ3NhLT5ucCk7CgpUaGUgcXVpcmsgb2JqZWN0
LCB3aGljaCBpcyBhIGNvbnRhaW5lciBvZiBhcmdzYSwgaXMgc3RpbGwgdXNlZCBiZWxvdywKYW5k
IHN0b3JlZCBpbiBhIGxpbmtlZCBsaXN0LiAgSSBhZ3JlZSBhcmdzYS0+bnAgaXMgbm90IGRlcmVm
ZXJlbmNlZCwKYnV0IHRoZSBwb2ludGVyIGl0c2VsZiBpcyBzdGlsbCBjb21wYXJlZCB0byBvdGhl
ciBwb2ludGVycy4KSUlVSUMsIGNhbGxpbmcgb2Zfbm9kZV9wdXQoKSBtaWdodCBjYXVzZSB0aGUg
cmVmZXJlbmNlIGNvdW50IHRvIGRyb3AgdG8KemVybywgYW5kIHRoZSB1bmRlcmx5aW5nIHN0cnVj
dCBub2RlIG9iamVjdCB0byBiZSBkZWFsbG9jYXRlZC4KU28gd2hlbiBhIGZ1dHVyZSByZWZlcmVu
Y2UgdG8gdGhlIHNhbWUgRFQgbm9kZSB3aWxsIGJlIHRha2VuLCBhIG5ldwpzdHJ1Y3Qgbm9kZSBv
YmplY3Qgd2lsbCBiZSBhbGxvY2F0ZWQsIGFuZCB0aGUgcG9pbnRlciBjb21wYXJpc29uIGJlbG93
CndpbGwgZmFpbD8KCk9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
