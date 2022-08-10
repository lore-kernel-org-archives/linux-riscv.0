Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE1C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 22:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0FBsgbqoRa24F9tyG+7pYP5r0qM6Vq+5+KP7QjzNPUo=; b=DrtwtfN6kV+cX2iN/794wn6Eux
	je9tvZdDoiP4End1Ug/5XEQT8ElqP5olDbACeDfm+UK+N+bzBx/vywcjaqv4KqG/8dkMhl5qXJR0N
	tlkb7SgayZ1jeW5nqaUIwm+vZk7wnKfVQ2y6XBYSWjGxhKSgAfqz1/EjVz9FwLILWEeZ+CHxK8EMi
	wf/HAdloNaBzvmmE/3NQ1rcQZzu3SKvrf0Jsns4DVuf4d9F/2/lu+VpNuQZj7GcNvWn+CRpxKrhVx
	+EvVgR/Sa5DEkVobaulZsKqKmZKBIOKQOT+DGteooSdJpegwlUST/QVhkpf2UZHdajHw8eoRSmVUL
	xQu17TRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtlt-00FZHv-Sf; Wed, 10 Aug 2022 22:01:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtlo-00FZDG-5p
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 22:01:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so3458010pjl.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=jp9l0Ro/JdxDhmDJRS2kwEBWz37R0gfYtLWESZmTTdo=;
        b=pR/Uz73diROtKoK45pSsnr9gDkyqdToZ6bxo/wDiwdfGMSRghz3CDbk46kMtQwAFO3
         x22iXNjmkw6auGPluUNkD2GpzL9z734QfkCy9bn0Gv+2AgX5bsK1CBg+TTz2q4Lb8a0u
         3T6PRK5CoElkC2XrFW0em//AvrYpm+7+C4IJZVYZJR71jicazAfVHoEokRhkpuEu2OiY
         CCXQUmnc6fWyvGdzopEWFni24vLVkD1UncUMn+2pHen8sb5PGlGazWUWsWvcPabpO10+
         F1qMKGxOoXI3JW1qYA6ANnXZml7AHYP11NQa0uG/wg33C4hNlUfavJ68c6gZ3kNZaK36
         SQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=jp9l0Ro/JdxDhmDJRS2kwEBWz37R0gfYtLWESZmTTdo=;
        b=6T7PdfZ7SFq0iVQb5MWhfu4ex098o59BpXsMrXhiGmpIff7HB7sXJbfEZGc6k9fSZ+
         vxOsU2qfhmFN5W21FDGsy207+SQZkcNIhKPZTA8ahnnpP0esdb5Cf4g8Qk+4EdTrAQv9
         8Pn+0WbQGaGsyB4fhw1JFLRBowdClhcyr+bzeTCpx625Pv9icbyNkvSbWmyGTCLe5gl3
         xxoR5QXHxe5vNv7AUKLSqFazDW5BEy2Md8IbdJJnAIKOLcWnRYVbzZqXyqNY172Isw5M
         OlUzMzwcdKGWagDzAnyBWiF6Rez8vR99T2CN0fsFpWdG+KjkjcPDvnisS3GuBpQrDjxT
         LTqA==
X-Gm-Message-State: ACgBeo0xVtjFK9BAeW2uNBz7D/YHGI85qosdw5EUP5XF/+diYSCXESbh
	rG+VxmpzyXlZw4ffkWUm69Pgqw==
X-Google-Smtp-Source: AA6agR7JMJRtaF35vTSx4M/wwukmZAy0p6XS3yEu9BKdT7sblcvfXr74D3tJ4lir0IU2VY1RyB2MJQ==
X-Received: by 2002:a17:902:dac7:b0:16f:13c6:938d with SMTP id q7-20020a170902dac700b0016f13c6938dmr29705635plx.11.1660168900898;
        Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902da8600b001618b70dcc9sm13779572plx.101.2022.08.10.15.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
Date: Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
X-Google-Original-Date: Wed, 10 Aug 2022 14:38:28 PDT (-0700)
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
In-Reply-To: <338e4fd5-9d6d-6f83-30fb-3ab3ed0ead31@microchip.com>
CC: airlied@linux.ie, robh+dt@kernel.org, vkoul@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, daniel@ffwll.ch, thierry.reding@gmail.com, sam@ravnborg.org,
  Eugeniy.Paltsev@synopsys.com, fancer.lancer@gmail.com, daniel.lezcano@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, masahiroy@kernel.org, damien.lemoal@opensource.wdc.com,
  geert@linux-m68k.org, niklas.cassel@wdc.com, dillon.minfei@gmail.com,
  dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  dmaengine@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-1373d9c2-ae29-488e-b2c1-032ab2cd52ba@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150144_578599_EF256BC5 
X-CRM114-Status: GOOD (  15.56  )
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

T24gRnJpLCAwNSBBdWcgMjAyMiAxMDo1MTowMCBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gT24gMTQvMDcvMjAyMiAyMzoxMSwgQ29ub3IgRG9vbGV5IC0g
TTUyNjkxIHdyb3RlOgo+PiBPbiAxNC8wNy8yMDIyIDIzOjA0LCBQYWxtZXIgRGFiYmVsdCB3cm90
ZToKPj4+IEknbSB0cnlpbmcgdG8gc29ydCBvdXQgaG93IHRvIG1lcmdlIHRoaXMgb25lLsKgIEkn
bSBub3Qgb3Bwb3NlZCB0byB0YWtpbmcgaXQgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgYXMgUm9i
J3MgcmV2aWV3ZWQvYWNrZWQgdGhlIGJpbmRpbmdzLCBidXQganVzdCBmaWd1cmVkIEknZCBzYXkg
c29tZXRoaW5nIGJlZm9yZSBwdXR0aW5nIGFueXRoaW5nIG9uIGZvci1uZXh0IHRvIHRyeSBhbmQg
bWluaW1pemUgY29uZnVzaW9uLgo+Pj4KPj4+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcg
aXQncyBqdXN0IHBhdGNoIDMgdGhhdCdzIGJlZW4gdGFrZW4gc28gZmFyLCB2aWEgVmlub2QncyB0
cmVlLsKgIEkndmUgZHJvcHBlZCB0aGF0IG9uZSBhbmQgcHV0IHRoZSByZXN0IG9uIHBhbG1lci9y
aXNjdi1jYW5hYW5fZHRfc2NoZW1hLCBpZiB0aGF0IGxvb2tzIGdvb2QgdGhlbiBJJ2xsIHRha2Ug
aXQgaW50byByaXNjdi9mb3ItbmV4dCB3aGVuIHRoaXMgbG9vcHMgYmFjayB0byB0aGUgdG9wIG9m
IG15IHF1ZXVlLgo+Pj4KPj4+IFRoYW5rcyEKPj4gCj4+IFBhdGNoZXMgMSAmIDIgbmV2ZXIgZ290
IHJldmlldyBmcm9tIHRoZSBEUk0gc2lkZSBhbmQgcGF0Y2ggMTIKPj4gZGVwZW5kcyBvbiB0aG9z
ZS4gSWYgaXQgY29tZXMgdG8gaXQsIHlvdSBjb3VsZCBkcm9wIHRob3NlIHRocmVlCj4+IChhbmQg
cGF0Y2ggMyB0aGF0IFZpbm9kIHRvb2spLiBUaGUgb25seSBvdGhlciBvbmUgaXMgcGF0Y2ggNCwK
Pj4gd2hpY2ggaGFzIEtyenlzenRvZidzIGFjayBhcyBtZW1vcnktY29udHJvbGxlciBtYWludGFp
bmVyLCBzbwo+PiB0aGF0IG9uZSBzaG91bGQgYmUgb2theS4KPiAKPiBIZXkgUGFsbWVyLAo+IFRo
ZXNlIGZpeGVzIGhhdmUgYmVlbiBzaXR0aW5nIG9uIHBhbG1lci9yaXNjdi1jYW5hYW5fZHRfc2No
ZW1hIGZvcgo+IGEgZmV3IHdlZWtzIG5vdywgd2l0aG91dCBhbiBhdXRvYnVpbGRlciBjb21wbGFp
bnQgZXRjLiBDb3VsZCB5b3UKPiBtb3ZlIGl0IG9udG8gZm9yLW5leHQ/CgpUaGVzZSBhcmUgb24g
Zm9yLW5leHQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
