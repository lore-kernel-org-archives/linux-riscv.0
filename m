Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2BCFA3727
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySU/F5n5y7RsLerQqwOQVMGX8IwiBX+X7vwo0IJCOxo=; b=poNa7LOBF22poR
	OXP6UbiRO5mmvKvItk4NukTNoYCej+UE01p9McF7ZtXGmhAVtaEqr+iWeYooIxkd6E0rSDMfrGe2m
	j1Op4xcROchhGT7IS6pxXowGNna7CAoGiCaGIVvRYBekdbYd3AgwTsUHd8TwnIWeg1i3LqOwZ6BoC
	uhXLqYXJseB2Ixh+vgwMwusvrFL/GlDM1yeC00RvUvpit6ie3K17j444knzl7dTenuc3IWtP+PKSG
	+Z53tTiDd8Wh4slgA9g/xRmY1WgnuKs59ncTx+SUTYUBG3fEr31gE3/5VO6S71/Lgt6E/oZysSS/6
	2HNdHtWipXFKh0HA2adQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbo2B-00000008lZe-13tM;
	Fri, 02 Jan 2026 22:54:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbo24-00000008lYq-118t
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 22:54:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f57cd471so5855746f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 14:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767394446; x=1767999246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=WKXP+dusyiXr2HpiwDKr/rj0U6VekvJkp99psk45kXDMvG+8ParsnA8Vuu1FNyyr0+
         +JIJVtdE+XjLJnvfH8G3YUs0kCtGeHP77NVqqxXukhVIi7/mAhgao8yKTMfG6yJHihY0
         ghQoXMPQ87LkkiuQehNEEU67P302yiR7Pq9FwXL6oK77XR+PUpDmVq9l2rj0axZDG+ow
         EJjYvB0uI0ae1TDyVf2iZ4xW1EBkZhp/BD6olkjSv2hzNwQ7II+PfIXQHkKxVm8mAmM4
         9K5YufbgVemdsyYBEwLyY00bT8O4AKdm5mhY0wirp5vjStDHoHO/XFtER43K98CcmbPa
         kniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767394446; x=1767999246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=L6aA3+4miYZyBSca8+is7VEh6ZUqfsTYDBp27f5X4/hHvJKGA9hvGLrup/Cb4GtuB4
         USGqECr1fLk8P1jPlo5W/7wJm5cfCKpQIF4eiNiTpVx5Kdj2UtZA6wHUwK98vIKyWCdB
         McfasrXtFwudeKRTzVILSXtcQx+wH8R782kUCFmOVNWebfFfQsZFagKRhoSep56ugX4H
         xVfzA2AHw2S75F97xF2vG4vXyLepW0dLJhtySiJ3mqdEm1r5c7FyfkH4ATfNMxcdxgst
         ALz8hxQ6uI3gseYBZsRHrfbK7VpJ2BARoJsmyZLWlSI2rNC34yJbi6CRhXmVof1HQOYw
         Rzqw==
X-Forwarded-Encrypted: i=1; AJvYcCUW29EhFZbDC7SsEoNRdLMkyAH65o276uZ6yRI5i3WzUXF95jiY7qjoYWvdBSa62bH1W4bxIuORUZZ7GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywli0x+g/OA7A8ChRX1ACfFn7xt8Z8ZbF7FFqi+wxwX4gbIG4SN
	XTiKthJxdzV+URMM97EwOAfJL3zTyaNuaXUUFVMuv6f63LEWfQik0/v4
X-Gm-Gg: AY/fxX4OC5uqlBi8Io4W36V1KVginruiu+V10NU0w45rQc5D7nwVYe/IUfPLcwFuAv7
	ZPUz2oCDb+Sr2h3ybXKLR8pk5EEsKR6Qj1wh+DCOvAZIJRqRbPiIF93w4/+dVl3c1WAkJsYviui
	LYHcjhe6M5ANMGYakBa6LiOwzux0r7H7rdR/k+B0iH2kK79etPWl920fN/1rYVzlNXoceI0FFeE
	taeEYqRV3YDqwdn2uJ1WSSJV9tY2LczDBN47o4oLRPoJHQ0NgA5Hj4YEBW6vsU4dMB4Q7AEP2/O
	Y1kQDQXgyRZFV4AlvgNrpsbyl226N8i1KEOzYBNE8d4PzJwUw0KSfRxOeSwTl1ne72E2Brz1XsN
	rBGpL4R06S8uAjBZs07RTUyUpcaopxIQe2qjQvFxGoKE4BakJHK6rP+F7zXC9Y7m2r+M4zXZcj1
	CfFPvgRinWFcLWAGn86/yLjFkk2n//z+VYby/dh9KByZzjOv3xxLva
X-Google-Smtp-Source: AGHT+IHhZlcstoHojBz97OFk5owjy0cbb1cp4fYnQEbcnWo+WUycqSneA9mdGDNlnSrZ5xQclO2tXg==
X-Received: by 2002:a5d:5392:0:b0:42f:edb6:3642 with SMTP id ffacd0b85a97d-4324e704c03mr44422531f8f.60.1767394445433;
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm86000586f8f.40.2026.01.02.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Date: Fri, 2 Jan 2026 22:54:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260102225403.78e26214@pumpkin>
In-Reply-To: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_145408_343696_ED3196AC 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2 Jan 2026 14:39:21 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Ryan,
...
> > +static __always_inline u32 prandom_u32_state(struct rnd_state *state)  
> 
> Why not just normal `inline`? Is gcc disagreeing with the inlinability
> of this function?

gcc has a mind of its own when it comes to inlining.
If there weren't some massive functions marked 'inline' that should never
really be inlined then making 'inline' '__always_inline' would make sense.
But first an audit would be needed.
(This has come up several times in the past.)
But if you need a function to be inlined (for any reason) it needs to be
always_inline.

Whether there should be an non-inlined 'option' here is another matter.
There could be a normal function that calls the inlined version.

	David


> 
> Jason
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
