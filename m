Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F929C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 04:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAQ2BjGEwzFziY6iZdFK70ROk7YzO8rzyaFYc6K2TcU=; b=FaaTAaJmnmVAK6
	E00fWL2RS91E+LkGmiBMZTKlMAQtlIYXo1tAhCvYfMmcoXCUd5B9+SqB3Hc7OcCRUN57RRIWRdepv
	L77qeRQlbHlmuIsSSsVtWAkqXbGWw6+EGydzE+6stHDuVFInL5ijWkN7SBQbg0eIAh4/uZ+SeK4kT
	+H9rVPsGnxNR9LdPaGTQbzp0G+oIZelf9hgBP1ZhSpYQpApKStGwxk/X3wgGaRwVrWtLYfZPR9KdD
	sqaZwDriXs8cDu00U/Ts7389BCfIdYifW9nYG8qYCbvjx/AiXPMxdRd4twsHuU19SS5WSC6liXlhR
	WMtSUUXVLRHlGK0XY9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsoU-00000003FKx-1msf;
	Mon, 17 Feb 2025 04:32:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsi1-00000003E3j-0kQg
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 04:26:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abb892fe379so146998666b.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Feb 2025 20:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739766375; x=1740371175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=DmDiAi1PKcbBNrGCQImS2i5pvZOirJfB2nw/Xp1mpNn76whB6tr6XLmEtfxVR1ITeI
         ls9/Io0cjYHUSSPiRUHpTPxGYZYmF+pflKsZXBE79dZaMESIbr4PpwQx7hPxRW+nzkik
         r4rWtSWuGDbg6B9c/hOvEsL3UmLmkHuIxGshmrmTSvtE+jE/tobx2OSLTghYfd5ELn1B
         xOOYX0nO/hRTJ00xW9r9lvAe6GiC0Kb3xzFwsMwrPyZWXXO1dnsFt27yyRGtYJuLNNlN
         deFNbb8b3E887MzTxgS0Zoz/GncvO4srnrhLUWnfE6Xzhae1V1jAnVkZXfzOIt1eDfx6
         FAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739766375; x=1740371175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=J7IcdJxLqbNqp7kLzhYjBMRvvBp6+lyiFyEklgS+H3VS4gGO8gFq/dE447k9Q67F0O
         rPx/i4EGlHkv9w56ucnbT3FNGsRVMBDU7bjzKgqTJAuP9W6iLc2bnfAemuFAWE0Zdwn2
         K/c6XVST5p7bC52DO9h2ifkw2Js1LhGiCmMPlgzciX7rkFg2OExiEQ1h3qaVQn7ganQs
         QAJGTa3X20JPQNA83PiCVlRN82YwWSixMGBV1eRlwvDLL/Ylz7+yoUMySgvg1VnUx9F7
         My1WHXrso5usGlGsh+xwNV60twvyStc0WBkiMXAIt1ZflQtI8IwUJboq1RgdD5L+tr1P
         lsrA==
X-Forwarded-Encrypted: i=1; AJvYcCUMutUfeNc2pcaNAsXAmxCg/+uL8YqOOF6WIIxM7/bvuPKzXiq569+SZOS6bq4PLt1xIbTRzy66fhzECg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyuavSuMtff05yDh+tNuCmn/pnGCujlMCZcUfa+RiwlDk6IwSx
	mWQKknTlkLlJRiy0izY3vhC+VBGng17nCPfV0o7nZR1fVbtTPkm9E2jzHY9OTMWiMt3zDPGjCq3
	C4vF4rvX8KiFYvr8Bbc4zaTHJFp/RmcyOnuxKIg==
X-Gm-Gg: ASbGnctEHuMkaZk+4R02o4PS/4DsIjMoEmiP3mBdMkkEtwoHHS9/rxirMlD488dBCkD
	A70cndRdrxPGIo04qLd/40DiQ2LgXsl+2SklzzhA3iuVCyfX9QPOIJysu47P3DMT6p264h0vfHA
	==
X-Google-Smtp-Source: AGHT+IGqR09ncd7RtDiYCHnqel0IwA8/KPIVmtCxbKbZIlJpbL6zVOLcVJ6dwuzAFLdjeOGKZ9qI9z1ate7AXjr0ds8=
X-Received: by 2002:a05:6402:5201:b0:5dc:d8d2:e38f with SMTP id
 4fb4d7f45d1cf-5e03618307amr20113776a12.31.1739766375048; Sun, 16 Feb 2025
 20:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20250209041655.331470-1-apatel@ventanamicro.com>
 <20250209041655.331470-2-apatel@ventanamicro.com> <87seoijb5q.ffs@tglx>
In-Reply-To: <87seoijb5q.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Feb 2025 09:56:03 +0530
X-Gm-Features: AWEUYZnsLDuB-_3nJekaV0ZQ27JIbe7lpoXoicZXgPN5kJR_Ra7fWK8_x1q1rco
Message-ID: <CAK9=C2UyC1bOaRuvjUcZ=YWyOGhne8Yt5X7aYSAjQUPiUUUX5g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for
 IMSIC base
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_202617_227199_E4DD95FF 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, hpa@zytor.com, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, x86@kernel.org, Andrew Jones <ajones@ventanamicro.com>, Sascha Hauer <s.hauer@pengutronix.de>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Anup Patel <anup@brainfault.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgNTo0MuKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFN1biwgRmViIDA5IDIwMjUgYXQgMDk6NDYsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBGcm9tOiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgo+ID4KPiA+IEluc3RlYWQgb2YgdXNpbmcgaW1zaWNfaXJxX3NldF9hZmZpbml0eSgp
IGZvciBsZWFmIE1TSSBkb21haW5zLAo+ID4gdXNlIGltc2ljX2lycV9zZXRfYWZmaW5pdHkoKSBm
b3IgdGhlIG5vbi1sZWFmIElNU0lDIGJhc2UgZG9tYWluCj4gPiBhbmQgdXNlIGlycV9jaGlwX3Nl
dF9hZmZpbml0eV9wYXJlbnQoKSBmb3IgbGVhZiBNU0kgZG9tYWlucy4KPgo+IFRoaXMgY2xlYXJs
eSBsYWNrcyBhbiBleHBsYW5hdGlvbiBvZiB0aGUgcHVycG9zZS9yZWFzb24gb2YgdGhpcyBjaGFu
Z2UuCj4KCk9rYXksIEkgd2lsbCBpbXByb3ZlIHRoZSBjb21taXQgZGVzY3JpcHRpb24gaW4gdGhl
IG5leHQgcmV2aXNpb24uCgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
