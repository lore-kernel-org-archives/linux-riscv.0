Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E268EC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5y34NVeMuxN3JKtqKBgx9/uEY6VUUB2SeunbzSS7Qzc=; b=pJTEwlQSj4MWqs
	EUyLrpV5n336KcV3VbVwCEKjpizjDmlxRSazF6G7bw2cQbJWpcW8H9TuGcxkXeawA9QL4k/cz4q3N
	XUfRnFfgc58y1sulaUsuNa409xWbNYE1cKs2omjEcOlYZhepOOFDX1WdYAEIxm1GKqXhxrOESBzx/
	ZPJJytSokLkBVvX3NpcBj2ZGOP78meooQ8zoWR/5gJAGgNueyR/eIVLd/FRnjLx4QltBgf921O9GB
	3ee9xb27LM8xHgQ6R+Tc+xzrbL9RMt/bw8s+ynFjBgLEzHR/6Xj/F8hI/sMChDHPbKspG++QifA3E
	juYt6uQ2Qm82Am7/OrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7oW-0000000CiAD-3WvP;
	Wed, 15 Jan 2025 18:08:24 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7oU-0000000Ci9m-2125
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:08:23 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6dccccd429eso1000486d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736964500; x=1737569300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVAxd3zBy5y7f7CQ/DxNy1wYULNrzX1ZLzl4D6RE/Uo=;
        b=A3kov7Cl2ia6t0kXpyggsJ9oy3J2QQgnA8fcmBcA2wdaw7fu+RAsn2hdrNc+6pjdEt
         bIpvIqa5nDs6BQn6S7bol8FAlctrZ1++Jbfdhaj+tiN/FCFsSolBPKYqLrGlqTRFz8XA
         iE57FcqMC162MSc/DCaRSfOdH+/jiSrhXjUyLDX2DUhilqDgifXS413V/3lB/RgUszV4
         CYUFq9l3Z7ewlN4+CItykrVLOvH1V3PQ91mPNAITvLU2W6K54LLoy8heR3owBT/pF1XI
         oqESYnB1hOh87iDyTJZQk0lmhzg/Y6kCknSyylbkiXGv3T23oJWJc/5Ml0sH5XPuYuvK
         v0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964500; x=1737569300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVAxd3zBy5y7f7CQ/DxNy1wYULNrzX1ZLzl4D6RE/Uo=;
        b=M+TT63o2CuMKcwP65+QCuh74NVevUiDl5A/MOXLD7/78L0JRPCLK7OYx0VLNbmZyQ7
         te+LdJ/pW+tgN/hbahI+Q+xHIgHzjkdnG4AvXmaIhQxYhupNoFfOXj9BYHSeMtQP1JiO
         y4FteVRgaiS02uRqQsGnF5eIsvfklwijErsd34oYd9ornlGiUUdxBNrsowECG2Zjnycx
         4g33wWBxCv+OI/VQ3zadxeT1Eix52KSfJUw8dlwyHGaPRCqjnMdKFben41hvYh7gRtOX
         oM0EspXoRSM28gh0kmnjC7366nIZFNUrg51ZdKsRXsSSPklDsV31ExFecd2sgnAGroe6
         AXBg==
X-Gm-Message-State: AOJu0YzF33RDs2rJex28R2uGqpYIiWx2v8loXnJAcuOzOt4A2UYVfVdQ
	NLrcGI5Nm9KV/ikLXn/Kd0Bc+PCpoH9ydaaR3KbsMkGbcM6HFPTjSLidFoKAYy5z16SgtUipq10
	gcCYw8UMwZD+g8p9SJ/p4M2LpQng=
X-Gm-Gg: ASbGncuJCxM06CJ67ixwwM/r7ChUPF31AeJ/hN8gJYsLC+GGBqyLm6/QyJOqvilUoDF
	WJrKjijBnZnIeFHTef+xz9ff1/uprknohDK0xNA==
X-Google-Smtp-Source: AGHT+IGFU6Cpsmr7C29OyQc7heB1EWXPIOaqr8NIc91ZyH2jiYN8FoqP3+W/ADTqDwyc+/xzyTGsbdLQtFh2zzoJMIE=
X-Received: by 2002:a05:6214:5bc2:b0:6d8:a730:110d with SMTP id
 6a1803df08f44-6df9b0eea41mr463994756d6.0.1736964500692; Wed, 15 Jan 2025
 10:08:20 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <CAAhSdy2rfbNT6tTK7i7rV6M1kNs2bFOQtN5QZpJ2xPrJx6WXjw@mail.gmail.com>
In-Reply-To: <CAAhSdy2rfbNT6tTK7i7rV6M1kNs2bFOQtN5QZpJ2xPrJx6WXjw@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 19:08:10 +0100
X-Gm-Features: AbW1kvaLrXlpYISDcragOXfUEvYS3I_dYhZbSgLg1Ehoz_myWQJSREjiwkAvkNc
Message-ID: <CAKp59VGvJ6dOU06BhLVU30ioWTShWyo-0Ngty9MM_aH1rKYoWA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_100822_537380_5A67F06D 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNTo0MeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgOTo0MeKAr1BNIE1p
bGFuIERqb2tpYyA8bWlsYW5kam9raWMxOTk1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJv
bTogU2xhdmlzYSBQZXRyb3ZpYyA8U2xhdmlzYS5QZXRyb3ZpY0BydC1yay5jb20+Cj4gPgo+ID4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGluaXRpYWwgc3VwcG9ydCBmb3IgcnVubmluZyBSSVNDLVYg
YXMgYSBYZW4gZ3Vlc3QuCj4gPiBJdCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0
dXJlIGFuZCBzdHVicyBmb3IgWGVuLXNwZWNpZmljCj4gPiBvcGVyYXRpb25zLiBLZXkgY2hhbmdl
cyBpbmNsdWRlOgo+ID4KPiA+IC0gTW9kaWZpY2F0aW9ucyB0byB0aGUgUklTQy1WIGtlcm5lbCB0
byBpbnRlZ3JhdGUgWGVuLXNwZWNpZmljIGh5cGVyY2FsbHMKPiA+ICAgYW5kIGludGVyZmFjZXMs
IHdpdGggZnVuY3Rpb24gaW1wbGVtZW50YXRpb25zIHN0dWJiZWQgZm9yIGZ1dHVyZSB3b3JrLgo+
ID4gLSBJbnRyb2R1Y3Rpb24gb2YgWGVuLXNwZWNpZmljIGhlYWRlcnMgZm9yIFJJU0MtViwgaW5j
bHVkaW5nIGV2ZW50Cj4gPiAgIGhhbmRsaW5nLCBoeXBlcnZpc29yIGludGVyYWN0aW9uLCBhbmQg
cGFnZSBtYW5hZ2VtZW50LiBGdW5jdGlvbnMgYXJlCj4gPiAgIGRlZmluZWQgYnV0IG5vdCB5ZXQg
aW1wbGVtZW50ZWQuCj4gPiAtIFN0dWIgaW1wbGVtZW50YXRpb25zIGZvciBtZW1vcnkgbWFuYWdl
bWVudCwgZ3JhbnQgdGFibGVzLCBhbmQgY29udGV4dAo+ID4gICBzd2l0Y2hpbmcgaW4gdGhlIFhl
biBlbnZpcm9ubWVudCwgYWxsb3dpbmcgZnVydGhlciBkZXZlbG9wbWVudCBhbmQKPiA+ICAgaW50
ZWdyYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxNaWxhbi5Eam9r
aWNAcnQtcmsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU2xhdmlzYSBQZXRyb3ZpYyA8U2xhdmlz
YS5QZXRyb3ZpY0BydC1yay5jb20+Cj4KPiBBIHNpbmdsZSBwYXRjaCB3aXRoIG1hbnkgY2hhbmdl
cyBpcyBoYXJkIHRvIHJldmlldy4KPgo+IFBsZWFzZSBjb252ZXJ0IHRoaXMgcGF0Y2ggaW50byBh
IHNlcmllcyB3aXRoIHNtYWxsZXIgcGF0Y2hlcy4KPiBBbHNvLCBpbmNsdWRlIGEgY292ZXIgbGV0
dGVyIGluIHRoZSBzZXJpZXMgZXhwbGFpbmluZyBob3cgdG8KPiB0ZXN0IFhlbiBvbiBSSVNDLVYu
Cj4KPiBSZWdhcmRzLAo+IEFudXAKPgpIZWxsbyBBbnVwLAoKV2UncmUgY3VycmVudGx5IHdvcmtp
bmcgb24gcGF0Y2ggYnJlYWtkb3duIGluIHNtYWxsZXIgbG9naWNhbCBwYXJ0cy4KV2lsbCBiZSBj
b252ZXJ0ZWQgaW50byBwYXRjaCBzZXJpZXMgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpCUiwKTWls
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
