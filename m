Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E41D3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcieDrleC8f/O/Q+SVoDl8NCO5TOqBXpmwdEU+bbE9M=; b=tGFxlO7R0552FQ
	Eu7OHP4xcFfY+mzfJx88JmLZjJ9Waw/HBQVCm4G60edzHjPQ5wTD/UDsv47UV3qumy3EMIz9OTtTY
	vtd6wC8bakQirZvheV+0kBjRdDg+RhRmk6G5W7uc+OLCh/I91oYbq9P0zsP/lrWwe3X8zK7Ly6twy
	DbdzrpJCWte4Mfg0NUirC3ky6iosPBK6Bh9x5Dc0edz0NsQrrkhtWCIfScqZpl1yfN/nj/9PxUhqm
	fvhqiCQ7ZncjPayopDJwj9LwiEbW6QpjndjmKGmpdjYmC8djTDfuBZsk4NgxC35W1csgp1AoP8SpS
	s5WN4M1wsJFqjliNqrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCQ7-00000003gG5-1JuE;
	Mon, 29 Dec 2025 12:32:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCQ4-00000003gF5-3WXl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 12:32:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775ae77516so89404535e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 04:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767011535; x=1767616335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2V9Ak1hhV3PFxTTSxFSosEA2ZLO7sEq/1ixLGM2KGU=;
        b=f/A0NYn12K9X3wcR9bNcwwmLHPq3UzvBpPHA6ySB01UeOUIhT6eJ08qp+46G1+NXey
         wudZ4zYPV7yUMS+GNMgqGFHzDDeDZUcjZC0TRyP7jTM+WNxeKyKg2WDgxnZ6gVS530M6
         xFi9QhmAoafuihYLbPZ/BR8HCos+ynK2D+F/JdH1Fn4QDaaWcn2qSzhtkuklC5FbY57j
         HA0/7c4pvQJThRn6ABdHwWY8E2PSHqxat28A2zY4xUQ+J7pZ/pGNwFZ8CpELFHmNUTac
         Yc0znEKDh3WYdTwE2XfFmDjw3I+BCq3i1d76/EfnkZPfdUE7hM3Yz2DwDujqbNaLOJuj
         GOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011535; x=1767616335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2V9Ak1hhV3PFxTTSxFSosEA2ZLO7sEq/1ixLGM2KGU=;
        b=pn9nUA3MsQjhsxl6QRYmZFMHLimapTnbgbqZZ6yOioylbm1/mwO5yhBpNVvkR4rHKR
         4o10q6ddVzNlBeCmyGMD88S68dQbZmkHE0Ycf6rCldoF1omR6I/VT6BRYkOefX2JggB0
         lKd5iGIlEJlhppaQTV17QFUS5R5r8BZS2KBr/Y70jkKdydshT5y37GPQGZthpyDdZWK/
         VAIPXuCvIsv4aK0b1bku+oJ8wPTd7vroLOWaiW9ImFHzsPhUO8bjGOJHxVrWa6g+D+hH
         /CPcVZLeqO6Rndr121r4JhfydxLHFQQ7vJ7mPokmovznv85lKLyJ8zENYFdRknAuW1uc
         ICkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZO9gTjJ7M2ETby7CQdtPN100WE0cAuq4da+opj7e4i0yQru9JDwPbP+WBz0UQHHLzMBjmHAx6J4XPUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyQsw2otnAerAcTba+itx6uZ5465BRVyiSn1sxmye4411n5c2c
	yDIXSVLD+SDNia3ROfUgDhCbNLTa6T0zrT8HARYb1J+WCyT729keeo+R
X-Gm-Gg: AY/fxX5nfIzZjJtPA0dfzZw1DTm8Gi+yxRUJzzRiErzE4a+jFz6wjqoWUcT0rJKlCkD
	dBChUtChIz4ViRAnuMIMcAFtkxYtrWOtTKSfz/oMM1i9IrJCwXvC9D3zXOIk8hoKYEaOpvjAYNJ
	uN4Vg1cKaHWyh5M8IxYU6lCuTE9d90000hAieoQwlbRQb4sDxMY5zCnG9NHaJ4S8ZQz9GOp73SS
	+6GzKOa2wW+Yf7gj/dFiV8F3r+XsYjfEg6Eh/90EyuuY4MNpWI9aoIPtq889Mj1v47C8oD81Duz
	m6VQCVX+fOkW5h2dt3uY7Gk5OO92xilf6F5xbC5KdRru76O86qqFUBZLY0gdhynz7fP0eKNuwnW
	nVraykpAuXY+UIXmtYlwn4G2IMnJCBKqF7yo89w4SJ9xKlojViainSDZQ9MKg+II2mx7XQFsr+g
	u2fZcZxUK6vNLCSIJmhFgl+b42mERoLXInvNvh6sN1sjmE6Rq+76vV
X-Google-Smtp-Source: AGHT+IG4R0XM6pGY+rb+2/l7j74aLN1kVTk1EU43NCr+8FaP/KTxj4Yb63lWebxPABA2dOPJSd8OUw==
X-Received: by 2002:a05:600c:1389:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-47d403e4fd0mr167579975e9.10.1767011534639;
        Mon, 29 Dec 2025 04:32:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aac6d9sm245141465e9.4.2025.12.29.04.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:32:14 -0800 (PST)
Date: Mon, 29 Dec 2025 12:32:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
 michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <20251229123212.25ef3c4b@pumpkin>
In-Reply-To: <20251228223430.43f14d51@pumpkin>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
	<20251218191332.35849-2-lukas.gerlach@cispa.de>
	<aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
	<20251227212859.3a83d65e@pumpkin>
	<aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com>
	<20251228223430.43f14d51@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_043216_917467_E836BD4C 
X-CRM114-Status: GOOD (  31.44  )
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

On Sun, 28 Dec 2025 22:34:30 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Sat, 27 Dec 2025 17:59:38 -0800
> Deepak Gupta <debug@rivosinc.com> wrote:
> 
> > On Sat, Dec 27, 2025 at 09:28:59PM +0000, David Laight wrote:  
> > >On Fri, 19 Dec 2025 16:44:11 -0800
> > >Deepak Gupta <debug@rivosinc.com> wrote:
> > >    
> > >> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:    
> > >> >Similarly to x86 and arm64, mitigate speculation past an access_ok()
> > >> >check by masking the pointer before use.
> > >> >
> > >> >On RISC-V, user addresses have the MSB clear while kernel addresses
> > >> >have the MSB set. The uaccess_mask_ptr() function clears the MSB,
> > >> >ensuring any kernel pointer becomes invalid and will fault, while
> > >> >valid user pointers remain unchanged. This prevents speculative
> > >> >access to kernel memory via user copy functions.
> > >> >
> > >> >The masking is applied to __get_user, __put_user, raw_copy_from_user,
> > >> >raw_copy_to_user, clear_user, and the unsafe_* variants.
> > >> >
> > >> >Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> > >> >---
> > >> > arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
> > >> > 1 file changed, 32 insertions(+), 9 deletions(-)
> > >> >
> > >> >diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> > >> >index 36bba6720c26..ceee1d62ff9b 100644
> > >> >--- a/arch/riscv/include/asm/uaccess.h
> > >> >+++ b/arch/riscv/include/asm/uaccess.h
> > >> >@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
> > >> > #define __typefits(x, type, not) \
> > >> > 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> > >> >
> > >> >+/*
> > >> >+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
> > >> >+ *
> > >> >+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
> > >> >+ * User addresses have the MSB clear; kernel addresses have the MSB set.
> > >> >+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
> > >> >+ * fault, while valid user pointers remain unchanged.
> > >> >+ */
> > >> >+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
> > >> >+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
> > >> >+{
> > >> >+	unsigned long val = (unsigned long)ptr;
> > >> >+
> > >> >+	val = (val << 1) >> 1;
> > >> >+	return (void __user *)val;    
> > >>
> > >> This is only clearing b63 which is what we don't need here.    
> > >
> > >It is also entirely the wrong operation.
> > >A kernel address needs converting into an address that is guaranteed
> > >to fault - not a user address that might be valid.    
> > 
> > This is about speculative accesses and not actual accesses. Due to some
> > speculation it is possible that in speculative path a wrong address is
> > generated with MSB=1. This simply ensures that bit is cleared for agen
> > even in speculative path.  
> 
> You said you were following what x86 did - this isn't what is does.
> Avoiding the conditional branch in access_ok() is actually a big win.
> That is true even without the issues with speculative accesses to kernel
> memory.
> The 'address masking' (badly named - it isn't just masking) is a replacement
> for access_ok(), it changes kernel addresses to invalid ones so that the
> access faults and the trap/fault fixup code detects the error.

If you can guarantee that address 0 is never mapped into userspace
(not true for x86 for historic reasons) then I think you can convert
kernel addresses to zero - which will then fault.
This is simpler than using the base of the guard page (which is still
needed for sequential accesses).
Something like:
	addr &= (addr >= guard_page) - 1;
will then work - but it needs (partially) coding in assembler to
guarantee that 'setae' (or equivalent) is used rather than a
conditional branch.
 
	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
