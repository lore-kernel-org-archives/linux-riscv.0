Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F3C3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vr9LqrJIkhdgqODSkWjUUM/rBKn7WQAlhARDfFiAP2M=; b=T04uns70xJiBjv
	0wbvdbJx1K887/4+8VrYo+6ibZydvooHVvZIuBqGMKIehgC9Xg5QLQIb53aRN6wqv5xeqlSq5+OFz
	pF+dB6G8TkXPKUBjPt42yZF8UfNipnBKBid92LuYJQlQICExaRDLgLNmPo+nj9J0B0kN7NM1pPvJ0
	tpvUWZhp69LwGb/nqtHR0rKJ8E3UywH/PkJML/oGQjMREYp2WCG5i4fNPyemEQdg9EKonblNi7QME
	hDt7KEPolriAgT5EtLOmEP/qyPKU2uFCIzYdvqzv3D2hTJjC4KJiY+rk/wD6vWDh88xC+GDVZboto
	ZPWCZbBokKr9m7dvTlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT4dM-00000004yad-1u7r;
	Sun, 14 Jul 2024 19:11:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT4d2-00000004yWC-11T1;
	Sun, 14 Jul 2024 19:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 670FACE0B24;
	Sun, 14 Jul 2024 19:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CC1C116B1;
	Sun, 14 Jul 2024 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720984281;
	bh=j1K+FHZkDrmPGCmRtv9k9UB1axm98p1I0h+AuSiKzUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A+nuQVp5ZEwffsx6rIecXnpK41vjZDiLOoL5o+FCJiO8VxalFH6JoiKHBdpqoZsSY
	 VrP1v46Dib0ytBm6Qdct+qMiKhvcUhsYvhiEKWHDmlvA4C+ii52h5Q27GwKC+V/vUZ
	 r1tV2rwG7MTma2/mgZOIN/aXET5V8GeYZE2j9UjuPAfw/uyPnPnhZD1F62KdK04nEj
	 V9SUYwlR6GSaxKhgfq9GTaUPSSwVI+6/HG+cxeK7cFkLdTg98AElknhvar5KN6R5ML
	 QavCnPdmj9LbYrLb6zYTGfrPkn4CJe2MlbAFHIhHbouCr4O7P2m5uhlTK25HEDgHKs
	 hPRaqSiWKrc2g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so50179361fa.2;
        Sun, 14 Jul 2024 12:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv5qPOKV45ntHPXEe13s7G2DMS7yQslgBHfxZT97toSzEo7FhFMvz9MYHTI5LodYG9Phwoyf2dYwkmo6N3fGopzx1AKVfA8W4/wwFCnf7T9VH5abZA61kXfEbaP4Lzc2zHk4w/VdNyzONku9RJx4DChbfZGNc=
X-Gm-Message-State: AOJu0Yxpcv8qZe5h88fr37Zq4XJ2cJc01+ACa8Gymp5t5xlCEq4opLJa
	Usa0Uiv1f8iT7Ut9BFS/ukFwidpv8DgfRLU3NgCnGtBUvI9WZIIkstJ3l4tK8NP43/WC4st7c3a
	CHx6zrJNbAT4Gwd2V4/tOd9zdkf0=
X-Google-Smtp-Source: AGHT+IHco7JMHnTGGI6P5HuxenTXttge5tcKuT+hmuXdenuS/OHkLGnMUkXSXoFgko7rH3SUNvioLnYHIzgG21hNw84=
X-Received: by 2002:a05:6512:124d:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-52eb99d4c0fmr12914869e87.42.1720984260332; Sun, 14 Jul 2024
 12:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240714085751.176357-1-xtex@envs.net> <20240714085751.176357-2-xtex@envs.net>
In-Reply-To: <20240714085751.176357-2-xtex@envs.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 04:10:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_121124_639955_34113EF2 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMTQsIDIwMjQgYXQgNTo1OOKAr1BNIFpoYW5nIEJpbmd3dSA8eHRleEBlbnZz
Lm5ldD4gd3JvdGU6Cj4KPiBGcm9tOiBaaGFuZyBCaW5nd3UgPHh0ZXhjaG9vc2VyQGR1Y2suY29t
Pgo+Cj4gU2V0dGluZyAnLWUnIGZsYWcgdGVsbHMgc2hlbGxzIHRvIGV4aXQgd2l0aCBlcnJvciBl
eGl0IGNvZGUgaW1tZWRpYXRlbHkKPiBhZnRlciBhbnkgb2YgY29tbWFuZHMgZmFpbHMsIGFuZCBj
YXVzZXMgbWFrZSgxKSB0byByZWdhcmQgcmVjaXBlcyBhcwo+IGZhaWxlZC4KPgo+IEJlZm9yZSB0
aGlzLCBtYWtlIHdpbGwgc3RpbGwgY29udGludWUgdG8gc3VjY2VlZCBldmVuIGFmdGVyIHRoZQo+
IGluc3RhbGxhdGlvbiBmYWlsZWQsIGZvciBleGFtcGxlLCBmb3IgaW5zdWZmaWNpZW50IHBlcm1p
c3Npb24gb3IKPiBkaXJlY3RvcnkgZG9lcyBub3QgZXhpc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuZyBCaW5nd3UgPHh0ZXhjaG9vc2VyQGR1Y2suY29tPgoKCkFwcGxpZWQgdG8gbGludXgta2J1
aWxkLiBUaGFua3MhCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
