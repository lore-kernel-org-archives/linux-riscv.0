Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BBAC02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqZZS+HiYP9L8Kh8rxQRRZ9/7yyffc0ex8L1x9WESlw=; b=Oh4QRyhUtk+znF
	sbbDHOB6AjqWUzO8N/VqCHRTkC8bkY7ok2pbLk1G6ToEBJ/92qLzuT85kFyjrOEvHKfeCCgprXXQy
	0ttHX/c3cXlkyvR3zebhpcwr0lJNfSpvEJ2RRy1LxGkv19DWe+slLbE4zcyCEtPflH8jlqDcExKoU
	wdjOB4KaYyznarhREtMD3GNmp6z5fMe3WvfKP+uvxtzxlAyR1mYSCb//WpNtP2YI4cVzPgDVW1SJK
	C1+Q+fg4ElkA95kj+i6QQwl4bDzdCpDRFwRZ4nJ59b+vtXhswJlrOffavOvc/YFtuTHuWsOX+X3Tl
	+IhK8jE/jHDez2CIxmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKIH-00000000idp-1lNH;
	Tue, 04 Feb 2025 14:52:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKH9-00000000iU1-2oBe
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 14:51:44 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54025432becso5953536e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680702; x=1739285502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=lUGiyv+6UYXevOZb8XSkbMQt0EYLG+ujCdA0edeld5GfLzmcHXqrCVCjTKEzI6wp6v
         Tcy31hoH0P+vwZdWwuLBh42vvl849M7d9e5xUu86n8mBYeTQpC9ODXlmZXa91fKm+c4I
         YwUhTbq8I4+2t1KKWTzLGLZkI4ZIZ2QQ2XVRNpwNHCwzAV654arGer2fOYDN/flAbsKI
         855N3a+rY3UlHDfUMqTk5/9yLOtAd9npKN7tkjQGQXWgZ/sTRSdzFEA9+db3Ziy245S/
         5G2QM6eIkiINR/bwSpGVRD3jGb3dTY5ti0oI9STPnfCKwajisbF9VjWu5TMxCOeZR6Jr
         uI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680702; x=1739285502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=OT1PNcVdnSVbqBqr1OdT6Xx+KFybLGWFZlYaMyM2PJ/CFMrcph7nhdWNhdnz/FJnu0
         H4WymSzGZPBH7bn2nnRm2iNdYSanY8ATA+0p43tpFvv+WLGlvrDCyYxiBtqfxXhjaZ1c
         CCYhbxhVV0tbwbyg65nB6zt5teb2GLhUdJGMaWvJa3SbDdwUID2pDKugodTq5QPS50xr
         4IgQ1UyItScYVW/V+FwxsNBF0MZNhVJkf6hbYlAEMdL3F7yX6cPbNkQ0BXekBDF55JKE
         vMEj/hxLysNzumuNPeDpoVDVwL6mFAnoecW+WUw3TyGYuoTFhhcDCAwgC8O8OjbAKUJ0
         ZJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB7sdtQrtLszqPGPwWFBJCPTMRwC+4MNzz3uheouzMES3ve84pONn/dwAJi9rp+lt1zNRq4Mpdw+qVLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaNnazllEhujwhe3lH/NxW0ZA9jlPJtFkRViQVh+USA5uQJxr7
	F09/Jfx4ISiBBu3edgAR3ti68REqjob1Vo99uPIbOsboheSvt/P7zZb8ttoMz5eyr/Led44xELd
	wdcU6/3bgieJ5820z8w6YGVSbOrPKZb8P9IWeUg==
X-Gm-Gg: ASbGncuEZNYfHrpBMK7DZ+L0mFWkokhRZ0elfrqwJKPM/P3hz5mN8RJLXbC+3mqxy2R
	RssSAaZSzxwEV9V1EYDX4pUaPn/EnvHBNYK/FKlrxa0QsVi/JliqCZmeliNi0axghhytAfkZ28w
	==
X-Google-Smtp-Source: AGHT+IFWTKRZ04zHi9yazDmOAR+9nHPiC9DLDSwxIssSS1/sYlKHwCu1qRW2q05nuJpua/OP5aauc8pAw8aEMUpq3to=
X-Received: by 2002:a05:6512:239e:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-543e4c3c98cmr8359830e87.50.1738680701650; Tue, 04 Feb 2025
 06:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com> <87frktoo16.ffs@tglx>
In-Reply-To: <87frktoo16.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:21:30 +0530
X-Gm-Features: AWEUYZmlBEyFq7UPY0VRDrxJd2P92k6Zjc43uE6bTATPsZOqON-E7U5h2zWhfaQ
Message-ID: <CAK9=C2WOnB9g55r9bfWW4X-BjrST8WArDT8+wLwt7B=TDwYjdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065143_713689_E14692DD 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA2OjM44oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMDQgMjAyNSBhdCAxMzoyMywgQW51
cCBQYXRlbCB3cm90ZToKPiA+IERldmljZSBoYXZpbmcgbm9uLWF0b21pYyBNU0kgdXBkYXRlIG1p
Z2h0IHNlZSBhbiBpbnRlcm1lZGlhdGUKPiA+IHN0YXRlIHdoZW4gY2hhbmdpbmcgdGFyZ2V0IElN
U0lDIHZlY3RvciBmcm9tIG9uZSBDUFUgdG8gYW5vdGhlci4KPiA+Cj4gPiBUbyBoYW5kbGUgc3Vj
aCBpbnRlcm1lZGlhdGUgZGV2aWNlIHN0YXRlLCB1cGRhdGUgTVNJIGFkZHJlc3MKPiA+IGFuZCBN
U0kgZGF0YSB0aHJvdWdoIHNlcGFyYXRlIE1TSSB3cml0ZXMgdG8gdGhlIGRldmljZS4KPgo+IEFz
IHBvaW50ZWQgb3V0IGluIHRoZSBvdGhlciBtYWlsLCB0aGlzIGludGVybWVkaWF0ZSBzdGVwIGRv
ZXMgbm90IGZpeAo+IHRoZSBpc3N1ZS4gSXQgcmVxdWlyZXMgdGhhdCB0aGUgTVNJIG1lc3NhZ2Ug
d3JpdGUgaGFwcGVucyBvbiB0aGUKPiBvcmlnaW5hbCB0YXJnZXQgQ1BVIHNvIHRoYXQgYW4gaW50
ZXJydXB0IHdoaWNoIGlzIHJhaXNlZCBvbiB0aGF0Cj4gaW50ZXJtZWRpYXRlIHZlY3RvciBjYW4g
YmUgb2JzZXJ2ZWQuCgpPa2F5LCBJIHdpbGwgZHJvcCB0aGlzIHBhdGNoIGFuZCBpbnN0ZWFkIGhh
dmUgdGhlIGxhc3QgcGF0Y2ggZG8KdGhlIGludGVybWVkaWF0ZSBzdGVwLgoKUmVnYXJkcywKQW51
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
