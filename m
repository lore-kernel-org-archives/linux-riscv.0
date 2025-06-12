Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B67C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKdHD9h/vaO/eg8MutlowPc2wMDw2KQwyu8EUQDfHOw=; b=vPzV5VJvP/Fyci
	6oNWWvNjqd9CW6e/jjykzlxPzSObH8XzJbnpzUyVAFLdFtj4tQnK5aSIA8FAjkA+0b7oqQ0mk7026
	v4BzVEQUMTqYF6OHQ0+PSBf1FePxlNOz5KHLmtysutZ74QzoGix2Advu9EVLejbg0GfE/1K7DU3+e
	PuegrmFGccGe9Hl7yzbLPE8eLObx4Xqe22FJ5day3K45BRcq4pDHS1Z/BUpq/nG/K2iGdCMTAap5+
	rK0CF0yPZJjYoC58PFXs14k1PR7JQsIzL6Ibfow+YRq0cd673IWm9MtMSsU/8/3SjvjiR4P8rTxgU
	hXRlyShPz7P49GnFOgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdXu-0000000CgTJ-28We;
	Thu, 12 Jun 2025 08:44:26 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcsD-0000000CXcX-20Qr
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 08:01:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1540866a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749715280; x=1750320080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=L5dtWG50X2tMNEjxy8tDdlFGJQecoecIY/nmeAdSBSaTq4Dvn8BkyvIwN3KtKWyS8o
         D9eWv+8HnGlqQuLiP8WZqoIuwpN6zkwPzz7YSvxiiInANgU9bBuTPzk03ybegl/l/Yfr
         9DRYWZjAzkpcJIk/JcpUmjM8xYQY1+zK7yB5ulQy/0iLc3JadUfd2zxRnBNs9ed3F6GB
         kFnbR40vkrPTXjjumXiLOAEGpq/YVbedSyjTRrk6rArGcJslt+tyJm41cc5Uk2cuRMVD
         3ZVF00oz3ilkW2yJDECz/tnemLDzQShmWjCKtuMPvQroroqj+oz9vVCKcjsELp7PbcoI
         Pm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715280; x=1750320080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=kP2h1Zs8jKw8oX8dSstKJW90z5D0Jw9xogt/NHWs0tLtNhSurgjmPvtW2mBKLFxnuT
         mWs1uWYettgyH6v0cx9BUaVOnuwdhXaxJBHUOql8J5PWwsGdNEQWQXauHFjC0J2RumYc
         vbQ1K4UuN3OnoI5bZCcUhFZ5u1YCLuv2BqbM/p3wSasDbA7ltgheXwn/mHPCsm3KvLna
         GtJC3VON1oxXIYKXZycx7uyhaWuWd292tmd0WFEzaxq2t1KSRztvdIC3QvodA1ve4u1o
         9Ql5//4kpEoH1KZv+uJOdPFakz+PDOJlvx08wYQ1jBBhXTcYyFj14+1WwBOtUC7kiiNL
         9WPA==
X-Forwarded-Encrypted: i=1; AJvYcCWyXv6st77PmpiNS4qaFmYEiBY3m0ajc4nihmVXDconSDEPfrwtx7OIVLZmpBJi+XujgmmM8lM0+KVYEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsbssszxqbXsrheNy2zFEFqilNsjvtZqKvb2rhbmF5+nv4T19w
	0XAWjdnKXgsBxvOcg6OrN38x771KHAQJcZm31slpZlo/y8/Xs5dPfXOusOqjJ4ZTarr5nMAc0af
	kjVN6t9zUFHJyPnhrE8/ZxwUn+EY4ygPobWkjidZYpg==
X-Gm-Gg: ASbGncvMuuRcyq3Hb1xztHqM2Tir8O/EfQf9vB8fFRqzY3abeCv0OPa6ngQFEQ40L10
	7qG/E0FM4n9+G4hncy6Fx7JIn8jVdH9PdcbPgTxQAIRET2cbQWWQ9rKzzYa/FsbWRhurg4pCbrk
	CH/i4/untiBxcQPXg7SeNu4Kacv6ln5H+xNhtP1X1S5fCR
X-Google-Smtp-Source: AGHT+IHDczhcOV54f0XomIKx+8AvFzloZqJPe+NAcKM5RDeAoHNu5Itf848xFcRsOPgv8woiTaDbH1WF8g3ZBcPtFeQ=
X-Received: by 2002:a17:907:d03:b0:ade:3bec:ea29 with SMTP id
 a640c23a62f3a-adea2ec74a3mr265693466b.25.1749715278188; Thu, 12 Jun 2025
 01:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo> <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
 <20250611150227-GYA127466@gentoo>
In-Reply-To: <20250611150227-GYA127466@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 16:00:57 +0800
X-Gm-Features: AX0GCFtVVlHqZ-iio4sy0I0p_9gClOFpDAZk_842S7V7_Hx6vWxgyXXCaFMBON4
Message-ID: <CAH1PCMbNEMvpU=eNvrHj3pcLEMn=ObCOZZHVM4tjZbL9-BiraQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_010121_619422_05FB5A26 
X-CRM114-Status: GOOD (  19.80  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMTE6MDLigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24gMjI6MzIgV2VkIDExIEp1biAgICAg
LCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOTo1OOKAr1BN
IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgR3VvZG9u
ZywKPiA+ID4KPiA+ID4gT24gMjA6NTcgV2VkIDExIEp1biAgICAgLCBHdW9kb25nIFh1IHdyb3Rl
Ogo+ID4gPiA+IEVuYWJsZSB0aGUgUGVyaXBoZXJhbCBETUEgY29udHJvbGxlciAoUERNQTApIG9u
IHRoZSBTcGFjZW1pVCBLMS1iYXNlZAo+ID4gPiA+IEJhbmFuYSBQaSBGMyBib2FyZCBieSBzZXR0
aW5nIGl0cyBzdGF0dXMgdG8gIm9rYXkiLiBUaGlzIGJvYXJkLXNwZWNpZmljCj4gPiA+ID4gY29u
ZmlndXJhdGlvbiBhY3RpdmF0ZXMgdGhlIFBETUEgY29udHJvbGxlciBkZWZpbmVkIGluIHRoZSBT
b0MncyBiYXNlCj4gPiA+ID4gZGV2aWNlIHRyZWUuCj4gPiA+ID4KPiA+ID4gICBBbHRob3VnaCB0
aGlzIHNlcmllcyBpcyBhY3RpdmVseSBkZXZlbG9wZWQgdW5kZXIgQmFuYW5hcGktZjMgYm9hcmQK
PiA+ID4gYnV0IGl0IHNob3VsZCB3b3JrIGZpbmUgd2l0aCBqdXBpdGVyIGJvYXJkLCBzbyBJJ2Qg
c3VnZ2VzdCB0byBlbmFibGUKPiA+ID4gaXQgdG9vLCB0aGFua3MKPiA+ID4KPiA+Cj4gPiBJJ2Qg
YmUgZ2xhZCB0byBpbmNsdWRlIHRoZSBKdXBpdGVyIGJvYXJkIGFzIHdlbGwuIFNpbmNlIEkgZG9u
J3QgaGF2ZSBKdXBpdGVyCj4gPiBoYXJkd2FyZSBmb3IgdGVzdGluZywgY291bGQgc29tZW9uZSB3
aXRoIGFjY2VzcyB2ZXJpZnkgaXQgd29ya3MgYmVmb3JlIEkKPiA+IGFkZCBpdCB0byB0aGUgc2Vy
aWVzPwo+ID4KPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBob3cgdG8gdGVzdD8gbGlrZSBp
ZiBhbnkgdGVzdCBjYXNlcyB0aGVyZT8KPgoKSSBhbSB1c2luZyB0aGUgZG1hdGVzdCAoQ09ORklH
X0RNQVRFU1QpIGZvciBtZW1vcnktdG8tbWVtb3J5CmFuZCB1c2luZyBzcGkzIHRvIHRlc3QgZGV2
aWNlLXRvLW1lbW9yeSAvIG1lbW9yeS10by1kZXZpY2UuCgo+IEkgd291bGQgYXNzdW1lIGl0IHdv
cmsgZmluZSBvbiBqdXBpdGVyIHNpbmNlIGl0J3MgYSBTb0MgbGV2ZWwgZmVhdHVyZT8KPiBpbnN0
ZWFkIG9mIGJvYXJkIHNwZWNpZmljLi4KPgoKWWVhaCwgdGhhdCdzIGEgU29DIGxldmVsIGRldmlj
ZS4gSSB3b3VsZCBzYXkgYSBib290IHRlc3QgYW5kIHNvbWUKYmFzaWMgbWVtLXRvLW1lbSB0ZXN0
IHNob3VsZCBiZSBlbm91Z2guCgotR3VvZG9uZwoKPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
