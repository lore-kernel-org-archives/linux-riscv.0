Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF40C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzDRXehHAYrwKoh8T8JJ7mHHx8QtYgle+I5ViEIoizk=; b=RJpPFrTDy+soTr
	elhLoDIJUKC0lhIEWOvE1hUTlTlfAfEMV+rjdAhtXjkWPf0IUh6Jzgyf69Ne6GDtD9ql9LjRbVw5F
	Eopas76n2Ky3wWeoRsLDFly97BoeVoZLgxfdqvqVgL5wY1U3en7wvpqntEntDqj2qB6ovw7WGJ9VF
	vE/rvRC8pQc8XuJhumft+CKjxT8Lnmu5hTfDhZvbafs24y8PCuQwOFKMfhyN4opL4sl+r0ZzsqVZK
	I86voYFIt6MZ5or/Xp/HCPM4NSDl7+BSw75nJ5o/l5PDEWphbuZXw+aH5cnB81Tvwv2WJrqImz4G5
	7VAHVKSniCpkrA+KAR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQPX-00000005Cpw-2uzD;
	Fri, 21 Feb 2025 10:37:35 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQEf-00000005ApD-3Ioh
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 10:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7C061190
	for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 10:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59F2C4CEDD
	for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133580;
	bh=/8/8sr5tXAM5If0IVypRSEE4sz+/sFVU6d/4Ly9Ee8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n70omxeJhI8GCp8OfWW3RO1kx3qMNRL8zuW4wrLcnOcdV1NRdzSKJ+YYJWVFePAXP
	 hADz+lCPObX7VXDowr9pvrMtHIR5lSzec00e4bN8DnELBOeKMnAdE6V/AzOOklPK+Y
	 ndxqN6VKDp2vw5H2t4k5tmqaetzZjacd7iZ+yjQMmtbj4tX/IXSgYBEAXMjPF1IzOl
	 NOtmrlbfgr6x9tXLHtpTD2Q+R7ap2Qmjl98Lv1l759WGzwkx5qUWMIaQMf1aprGs8t
	 R0quwt9wMqd6rbapKN4XvfA+y+cj87SyWiZy/ZerRjII2X3+J8e1JVciYWav+jDFHy
	 u+HdFxVBVp9Hg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeec07b705so306315166b.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 02:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvPP/VjNx1MzFNw3cU9LtOEAFn8Asq1U5lkn/T57V/kA9ZcllEDdHdn8VFSu5EyyI3RpJB/Bhlat+OcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq/Db0P6uhKFvRl2wc63pXcrOLA1322eBBOYXz7aXT3Uzq/jL5
	0Gwy4eeyYcb+KjngAp5cHy0fWhadBYcVIldsZoxh8mKPu+ddNoyGVrQhSHwlkFE8BJfieRJPnXv
	j0ZpOp7Uv8xmkuouV/TZK6MxPD8A=
X-Google-Smtp-Source: AGHT+IF+dx1y8jdurtmAxgFLSYpG20X3+0Wp7NOu9CNU4jC2DPzEUAFWpRZ/vYkn9p1RrniyY9Wnwf42URprP3GZyU0=
X-Received: by 2002:a17:906:318b:b0:abb:b322:2b37 with SMTP id
 a640c23a62f3a-abc0d9888eemr172218566b.7.1740133579401; Fri, 21 Feb 2025
 02:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20250221092523.85632-1-xry111@xry111.site> <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
 <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site>
In-Reply-To: <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Feb 2025 18:26:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
X-Gm-Features: AWEUYZkKtsq-lGYG5QXtYRBdszSLZp8SfNp0lQCGpiQmL0851ruHkeCLcoUwyFg
Message-ID: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
To: Xi Ruoyao <xry111@xry111.site>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>, 
	WANG Xuerui <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, "Jason A. Donenfeld" <Jason@zx2c4.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-arch@vger.kernel.org
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgNjoyM+KAr1BNIFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTEx
MS5zaXRlPiB3cm90ZToKPgo+IE9uIEZyaSwgMjAyNS0wMi0yMSBhdCAxNzo0NyArMDgwMCwgSHVh
Y2FpIENoZW4gd3JvdGU6Cj4gPiBIaSwgUnVveWFvLAo+ID4KPiA+IE9uIEZyaSwgRmViIDIxLCAy
MDI1IGF0IDU6MjXigK9QTSBYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IGdsaWJjIGFkZGVkIHN1cHBvcnQgZm9yIC5nbnUuaGFzaCBpbiAyMDA2IGFuZCAu
aGFzaCBoYXMgYmVlbiBvYnNvbGV0ZWQKPiA+ID4gZmFyIGJlZm9yZSB0aGUgZmlyc3QgTG9vbmdB
cmNoIENQVSB3YXMgdGFwZWQuICBVc2luZwo+ID4gPiAtLWhhc2gtc3R5bGU9c3lzdiBtaWdodCBp
bXBseSB1bmFkZHJlc3NlZCBpc3N1ZXMgYW5kIGNvbmZ1c2UgcmVhZGVycy4KPiA+ID4KPiA+ID4g
SW4gdGhlIHBhc3Qgd2UgcmVhbGx5IGhhZCBhbiB1bmFkZHJlc3NlZCBpc3N1ZTogdGhlIHZkc28g
c2VsZnRlc3RzIGRpZAo+ID4gPiBub3Qga25vdyBob3cgdG8gcHJvY2VzcyAuZ251Lmhhc2guICBC
dXQgaXQgaGFzIGJlZW4gYWRkcmVzc2VkIGJ5IGNvbW1pdAo+ID4gPiBlMDc0NmJkZTZmODIgKCJz
ZWxmdGVzdHMvdkRTTzogc3VwcG9ydCBEVF9HTlVfSEFTSCIpIG5vdy4KPiA+ID4KPiA+ID4gSnVz
dCBkcm9wIHRoZSBvcHRpb24gYW5kIHJlbHkgb24gdGhlIGxpbmtlciBkZWZhdWx0LCB3aGljaCBp
cyBsaWtlbHkKPiA+ID4gImJvdGgiIChBT1NDKSBvciAiZ251IiAoQXJjaCwgRGViaWFuLCBHZW50
b28sIExGUykgb24gYWxsIExvb25nQXJjaAo+ID4gPiBkaXN0cm9zLgo+ID4gV2hhdCBhYm91dCBj
aGFuZ2luZyB0byAiLS1oYXNoLXN0eWxlPWJvdGgiIGFzIG1vc3QgYXJjaGl0ZWN0dXJlcyBkbz8K
Pgo+IElNTyB3ZSBhcmUgbW9yZSBjbG9zZSB0byBBUk02NCBmb3IgdGhlIGFzcGVjdCB0aGF0IHRo
ZXJlIGFyZSBubyBsaWJjCj4gKGdsaWJjIG9yIG11c2wpIHJlbGVhc2VzIGxhY2tpbmcgR05VIGhh
c2ggc3VwcG9ydCwgc28gSSBwcmVmZXIgdGhlIEFSTTY0Cj4gd2F5Lgo+Cj4gTWF5YmUgdGhpcyBz
aG91bGQgYmUgY2hhbmdlZCBmb3Igc29tZSBvZiBvdGhlciBhcmNoaXRlY3R1cmVzIChSSVNDLVYg
YW5kCj4gQy1TS1k/KSBhcyB3ZWxsIGJlY2F1c2UgSSBndWVzcyB0aGUgb25seSByZWFzb24gdGhl
eSB1c2VkICJib3RoIiB3YXMKPiAiaGV5LCB3aXRob3V0IHRoaXMgdGhlIHNlbGYgdGVzdHMgZG9u
J3Qgd29yayBvbiBEZWJpYW4iIGJ1dCB0aGlzIGlzCj4gcmVzb2x2ZWQgbm93LiAgQWRkaW5nIGEg
ZmV3IHJlY2lwaWVudHMgYW5kIENjIGZvciBkaXNjdXNzaW9uLgpPSywgbWF5YmUgd2UgY2FuIGNo
YW5nZSBpdCBmb3IgUklTQy1WL0MtU0tZIGFuZCBzZWUgd2hhdCB0aGV5IHdpbGwuCgpIdWFjYWkK
Cj4KPiAtLQo+IFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgo+IFNjaG9vbCBvZiBBZXJv
c3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
