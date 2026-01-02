Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8C3FA374B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD55PKgzaffuFzdqFnNod2ZnZzn1Cn/UqyBfTbLNcls=; b=ovIBd7ypn9LPY0
	hsuFwAN8bg760tCF/HBtUO/EJ4XRaaUYu9r8be3l/hPnSmiBG77PDg+xp7vZxjGEifmA3h0NHR2wl
	IHU5eRFoXwk3nFCgXkPCQDyusgvU41S6BHpYBZuYkWsBVMS/GUGZtSBtSIwGxudRxa7+jeEmGfgse
	RirZNqWqrpB6jLZiLsRKYeInJfYWV5IICFrWO6vYYFheWEDtf+6lPv1XbkfOuJRSXCz2fiDY3ltXh
	QGdmfPvlaowlAUTokKAmB0SNkLxopRDGcGak+BI0Lb5DBztcYwILRRp5EAXz8AEc0cc3sui1enD1Z
	p1YH34UzVl2qLKpxHVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfNc-00000008IuS-0bmn;
	Fri, 02 Jan 2026 13:39:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfNa-00000008ItU-0O4U
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 13:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73A3740633
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 13:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAE1C116D0
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 13:39:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bW2ENvpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1767361177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVGIiSWIzg80Bqq7LCYYlALqbBWZ2ofIsrcdUHfyZPU=;
	b=bW2ENvpWXyyENTYao9a8vpF6KdMw2iFyt3fMDnWm28sEiGCG1ZAVfj8QBckNS1URBdKuSy
	qMkKWGSU/R3XJnRP9oKK+a6PfgA0khTJvm4Y4kYpV+AgAW4PmlGOVPDAd3T5sq+1zoMJ/V
	G5EA9eYLmQnrQH/pUXdhhleeLIDRB8c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50e00835 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Fri, 2 Jan 2026 13:39:37 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7ce2b14202fso32045a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 05:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXefZ4hJKjnVWJixBkCvHN+uAqCSnhlUz9j+Up4fEsmQTNX01aK1zARjyHJiCfOVhDzjUfStWgDof7mhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDa+xp2qtUTUKzyCfqd1z0nZMkq06f2ZElb+8UhLpPRszBFhSO
	iGGiRtFj7IlyhjbVxttZVzQudQ1FPTkhlZ/ZjaoNGr7T/gkOJXBvtW3QHFbvQIcvyZQcB5m93jA
	Kv20shsjElEDEe7tFZEiBcY/hnbR+y5I=
X-Google-Smtp-Source: AGHT+IFV0P4UwOKgGcidVSe3+C3GT9JSRutBmyTJY+Ko+TYwuWXifwQH5m/QQSPv0qrqCY9iwE1wKuoYX25E7txH4AI=
X-Received: by 2002:a05:6830:4c08:b0:7c7:65f4:1120 with SMTP id
 46e09a7af769-7cc66a6f068mr24618037a34.23.1767361173696; Fri, 02 Jan 2026
 05:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20260102131156.3265118-1-ryan.roberts@arm.com> <20260102131156.3265118-3-ryan.roberts@arm.com>
In-Reply-To: <20260102131156.3265118-3-ryan.roberts@arm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Jan 2026 14:39:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Gm-Features: AQt7F2qdo3e8gMqv9IRozONnOouAGf6XyGKVO6JwEtjeNVfJ3A-5G4I57eyZbDw
Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to __always_inline
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_053946_185956_41A7B38F 
X-CRM114-Status: GOOD (  10.95  )
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

SGkgUnlhbiwKCk9uIEZyaSwgSmFuIDIsIDIwMjYgYXQgMjoxMuKAr1BNIFJ5YW4gUm9iZXJ0cyA8
cnlhbi5yb2JlcnRzQGFybS5jb20+IHdyb3RlOgo+IGNvbnRleHQuIEdpdmVuIHRoZSBmdW5jdGlv
biBpcyBqdXN0IGEgaGFuZGZ1bCBvZiBvcGVyYXRpb25zIGFuZCBkb2Vzbid0CgpIb3cgbWFueT8g
V2hhdCdzIHRoaXMgbG9va2luZyBsaWtlIGluIHRlcm1zIG9mIGFzc2VtYmx5PyBJdCdkIGFsc28g
YmUKbmljZSB0byBoYXZlIHNvbWUgYnJpZWYgYW5hbHlzaXMgb2Ygb3RoZXIgY2FsbCBzaXRlcyB0
byBoYXZlCmNvbmZpcm1hdGlvbiB0aGlzIGlzbid0IGJsb3dpbmcgdXAgb3RoZXIgdXNlcnMuCgo+
ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiBwcmFuZG9tX3UzMl9zdGF0ZShzdHJ1Y3Qgcm5k
X3N0YXRlICpzdGF0ZSkKCldoeSBub3QganVzdCBub3JtYWwgYGlubGluZWA/IElzIGdjYyBkaXNh
Z3JlZWluZyB3aXRoIHRoZSBpbmxpbmFiaWxpdHkKb2YgdGhpcyBmdW5jdGlvbj8KCkphc29uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
