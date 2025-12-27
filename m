Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F244BE92716
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 21:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCdACo6q1KsFUycX2kII1DMFXa7vgkcDsM5GcK1Jqc8=; b=xoJc5ZijH3SWcm
	I/ouM/mqIvLAeERtBbwHUCUDCVSphJmoNJZQ0Ap/J9S5NrmpCuZjYXAKdpEzipCfRdcIVhXY6vlTo
	sFm8D0/Bb+S11x8uNdniMDCQES9kKc26QChapuxNCrbRsFA9eyNSC/HlB1R8Z24YriKlMUAjBwl52
	bjh15r5DSF5/F50/Y0k7y86ljuoH9bCzfXQqdIWVJZKc/FfUj3oUy0izfoOxjQ8CuvFH1thqeWpv0
	b3sGBVat0ueHWo46nfaAke1oqEXEnIXdRC9cd7oq7fjSAB90JNkKRsyJ42e/KGhOtdI4xLgknXeIa
	VcSXjtzHlhJ40TIR/7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbqU-00000002DBm-3jt6;
	Sat, 27 Dec 2025 21:29:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbqR-00000002DB8-3Z4x
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 21:29:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-431048c4068so4395389f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 13:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870941; x=1767475741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHxGUXHdDKjBEJt6gdAHmJtT/TC6JT7WBnoFRnVfOAg=;
        b=epAQSjMkZb2ZTdUNxC7ivcdKdEPUpBjB1htbC3I7MaQsU+4mcND/9Ms08UAQy8N8bA
         JifhuWgH7mJze0rW9t4RLZiu8fWxDelGpxfqfFYDloSSA2uDiBZ3QEIkpmtiqfzTlC0R
         ponVHsX0uq4jAlpxzdR+Dzx1dgdcosFYwQxVSyfQ5J1iIB7XOsKd0tUe9WEi/HERh4dD
         a4kNtZKQNxjcmqGkwty9K+sYN69lBIn9Gf/GJSEIHCGfloRb4Qp3D4GEE1m/lVNQK/QS
         DhHR4vqKeH9/lBYUfKEzdB1qeYNkLwLBZ/BCq3suUGEgXyRuIxAO9HfViUjeRKZxn0Cs
         qzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870941; x=1767475741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHxGUXHdDKjBEJt6gdAHmJtT/TC6JT7WBnoFRnVfOAg=;
        b=rgEkg7QE8nFNJRuCiJ2rV95ZuybRlCL+JU5rmxI0GZWksAe2+M/amqB2TdAuyJ7xpq
         +a1az9IrtpAR/3d9YVKtaezbNaHXB4tptUaMWJNBDBnpcU54FoU5XQwRBJWdldnBy8xB
         ex6xEe6ZayWT386Xv0nqRdNxwkJtrM/A5f2yoDbQxGjf8AXUkFcI922lFCS6FFkzRNX8
         iZ4IqsFfGOvniYfcbsDJcwaBkLpqCThf0HKIsFu9b7xz0hdVJev5tNG4L8Ix3VCVfJ55
         eCO13P29UPmxuqgXt5yJQZj6xuZxQLoF6iX8yOtjkoxRzeDnnGIhXDSoC1v/SEY98KED
         EC+g==
X-Forwarded-Encrypted: i=1; AJvYcCV2AtY/uRyYFE2uN0zNSbOC3xZ0B+zyM1lmc8KCa0xBGSSwjzFveG4YcFo33nnvloCmCA/1lZi8Vk0y0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwldWPmSdjGioSc6RwUTQNGjaHwU8P67S5FxhpqSSo2ZQWBg0Xz
	MeOuupTJPP6w2iVG1NrtRe04qey6Efz7FnVnVls7iXRywhMfZ+1haVD7
X-Gm-Gg: AY/fxX4Wm4JYMH4RTeigf5NYM1uM4zi2vzxwyXD+bIjv0OiE+6r7coIySnJUHHcQilR
	R0HTCHQPHmztfcGZoVfz4GHoWA+Adidm/HzuIgC9S+gxDogB5nd38FEv8qQF9llcwtwo15vfdUk
	2qLvhZyl2PlWEoAF15/FQKZDRcMyVu7EJ7VkCR/ps14bR/lJmWcIDX12n8UsS/Jw//LFqNSiELI
	A0NUYeZsOAC2u338B9Nxk98YfXQua6dEU1T3VEbiTq0vvhH8T47xA8dTfe+QuzEL3h6c1O+T4TR
	W5pL9tNwZdXXVpLHRI+Hl71+HFelx+oRS6grCjWuirx5AZsZakl2PMj5uVpbcv/H80l+1S21dGy
	13WmJSCw8CyCwLdviFduyECSb4OpTv7htijAD8AP10nXE2JoNF5mFmBvEQeHIhoziIdzMSa+xeb
	NyrjkMGkjhJS5Xxos8TqbYvKS3DOxBewsJYvaAz+u2eXgJ06AujoThqwBo0zPqVw==
X-Google-Smtp-Source: AGHT+IEp3AixBs6DuHhs/EFr8jwXwRGuKnRwB1g0/0NqpwjTisNWrX9O8srAllOgZCHhiOvgQWCqAg==
X-Received: by 2002:a05:6000:2586:b0:430:fdc8:8bd6 with SMTP id ffacd0b85a97d-4324e437897mr33047121f8f.31.1766870941136;
        Sat, 27 Dec 2025 13:29:01 -0800 (PST)
Received: from pumpkin (host-2-103-239-165.as13285.net. [2.103.239.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm53178291f8f.15.2025.12.27.13.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:29:00 -0800 (PST)
Date: Sat, 27 Dec 2025 21:28:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
 michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <20251227212859.3a83d65e@pumpkin>
In-Reply-To: <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
	<20251218191332.35849-2-lukas.gerlach@cispa.de>
	<aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_132903_928911_8140CE72 
X-CRM114-Status: GOOD (  25.71  )
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

On Fri, 19 Dec 2025 16:44:11 -0800
Deepak Gupta <debug@rivosinc.com> wrote:

> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:
> >Similarly to x86 and arm64, mitigate speculation past an access_ok()
> >check by masking the pointer before use.
> >
> >On RISC-V, user addresses have the MSB clear while kernel addresses
> >have the MSB set. The uaccess_mask_ptr() function clears the MSB,
> >ensuring any kernel pointer becomes invalid and will fault, while
> >valid user pointers remain unchanged. This prevents speculative
> >access to kernel memory via user copy functions.
> >
> >The masking is applied to __get_user, __put_user, raw_copy_from_user,
> >raw_copy_to_user, clear_user, and the unsafe_* variants.
> >
> >Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> >---
> > arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
> > 1 file changed, 32 insertions(+), 9 deletions(-)
> >
> >diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> >index 36bba6720c26..ceee1d62ff9b 100644
> >--- a/arch/riscv/include/asm/uaccess.h
> >+++ b/arch/riscv/include/asm/uaccess.h
> >@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
> > #define __typefits(x, type, not) \
> > 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> >
> >+/*
> >+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
> >+ *
> >+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
> >+ * User addresses have the MSB clear; kernel addresses have the MSB set.
> >+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
> >+ * fault, while valid user pointers remain unchanged.
> >+ */
> >+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
> >+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
> >+{
> >+	unsigned long val = (unsigned long)ptr;
> >+
> >+	val = (val << 1) >> 1;
> >+	return (void __user *)val;  
> 
> This is only clearing b63 which is what we don't need here.

It is also entirely the wrong operation.
A kernel address needs converting into an address that is guaranteed
to fault - not a user address that might be valid.

You need a guard page of address space between valid user addresses
and valid kernel addresses that is guaranteed to not be used.
Typically this is the top page of the user address space.
All kernel addresses need converting to the base of the guard page
using ALU operations (to avoid speculative accesses).
So: ptr = min(ptr, guard_page); easiest done (as in x86-64) with
a compare and conditional move.
The ppc version is more complex because there isn't a usable conditional
move instruction.
I think this would work for x86-32:
	offset = ptr + -guard_page;
	mask = sbb(x,x); // ~0u if the add set the carry flag.
	ptr -= offset & mask;
You need to find something that works for riscv.

> 
> You should be clearing b47 (if bit indexing starts at 0) on Sv48 and b56
> on Sv57 system.
> 
> Anything above b47/b56 isn't going to be used anyways in indexing into
> page tables and will be ignored if pointer masking is enabled at S.

Gah more broken hardware...
Ignoring the high address bits doesn't work and is really a bad idea.
Arm did it as well.
Trying to do 'user pointer masking' for uaccess validation is a PITA
if you have to allow for non-zero values in the high bits it makes
life even more complicated. 

And 'pointer masking' is so broken unless it is done at the page level
and enforced by the hardware.
What it does is make random/invalid addresses much more likely to be valid.
An interpreter can use them internally, but they are so slow software
masking  (following the validation) shouldn't be a real issue.

	David



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
