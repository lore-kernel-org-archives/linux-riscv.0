Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F231E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALcluEw29Qcgyfyjdb+yyianUIrJaeWhISN/WCYuqNA=; b=Ra3L8YW9iRuqT/
	sSGOvlnxI0y2Ctj/iAZWxOmmNf/kM+k54AXXwyYCk3gIK0KPQE1AreZ+aIaMETzqjm0aL8JWYnq70
	Ho77ngv32NAwZZA6OS0W+/9VpIhE2fiboWtf/6U4K1QZmxa0hfCUBS0m+rCW4t1jXzcgy40JJiRCU
	wWPHIBGYEMxTm6Suqe/CH2PNe5+1EfBb8R6emaweyDBeoqtisyRdv5BjBEGbQuuXDzWADvtOJbBjg
	UJqlZ86cRqkt00d5bB/v4NZv/dS0ysW432WfqwTtUvLxmRXl2R2/sWsE7k9/337opy2oBIbGhfWWv
	ylXdpG0tzwR4N9Ax2KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzLd-0000000348R-1lRv;
	Sun, 28 Dec 2025 22:34:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzLO-0000000347Z-3T7R
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 22:34:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb2314f52so4774132f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 14:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766961272; x=1767566072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXjZf+tn3B3Qabds0F1z0VkO28kPzyfD3esGmMbwL7c=;
        b=a3BdZPEGf+/V652vr13vU/DYTlf0xB9Yzy6HgFI+woj50/GRZWvvfGypo9F4jL49sG
         lqQcv0NBeX88jbrkXLV9aPxfZxk7/bv5+/w7NdmyQb6ntoS1TIMCEya9sm6zxhBHxrRT
         iSCu84tn9Ig/5f9WCfQ67Dlq8VJCvMm0ViDVzdYdIqvtjdfyX5EC0dWn/VSLkPvAcCQ7
         m3Aar3JkwRhARZRX5Z/8liWiLUdI8Vea4Zd1mBesQWs9tzIigkqqDjsnQamoeXslWtUJ
         Z7FYY/EkNrd8R1eLuYGcG0BVyMCqW4xEjMOfzrzFk4XoETAEzgwxO3JpRx4XoqlB2GZb
         FCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766961272; x=1767566072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXjZf+tn3B3Qabds0F1z0VkO28kPzyfD3esGmMbwL7c=;
        b=LmHAqidDDgUXbtd1tfEGZWVkyNx+wWhkasnGibTYwERYFWLk2XwB6jmykFnBRZeRDP
         Xg9FRIDJ3e46ZiXpUjATcuhaZXAZyF7ml0GjJy/UExI2+Hv7t3+YQRlRJw0EFG7qly+/
         HQc/Z48ygaIwJWFkbFQ3/an+Wci80ybi3mcJUd1oM/ahkWcWkv1cqxUfyTU+2b8UaZqL
         igEZb73zlTfOL/db3KlBsj9ePbH9dq+OSfrjUtBV7VkZ7UrtQwnpUWnIIi75Sod5ziRO
         rqRLJrjJhoc1bRYJ9g/2LqMB4Sx+GycRrwMb1CoP0AHjSjWGHWs3htWwYwDwj8Cak/k5
         TVBg==
X-Forwarded-Encrypted: i=1; AJvYcCXqHECljOlzmx2EjUoqxwnQCiIPUhAO5tYXNmhcinSrROD7sxxezSYZgo6ixU3JhTGejLIHo6nQNGQXgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJkQyGknQZQugsr/tLPTIPwoXQHVvVdmTMjCvSdO24B4FcuDE+
	Eq9RmSVYxAzKdNJoVBYC4OAdaBLadexKGvA9EvKg0l+0jqCKiWPyMsK7
X-Gm-Gg: AY/fxX7hB0iFvwkjtUXvCY8nNa5FRS66xTKm2Q0/L6l3cCvA0B7yVl3yJ2ctTB5pFaH
	auuGxG0+frEDlayhhboR5Ia8WflD8bkWus+3vgN/nKUjUb/Pjcig2lfF2o6NtkTb5j+VcNETR7m
	D5c3WXuYHqYlTAL4LoroSFywduUaYxqgDQqMJR2Zw6WBmsMWmmH6ken/JV2bSwMHCzXCG35+5BN
	7M22NuuG0HwGGMIB3tBWOOnKn4huEdO9rzY2TbuMuWYrpKA5TWsDgb07hKbD3KSxzVes7hqRKH3
	D8LBXHLyV0xz/OWMTfkNm2XElb6EWCoc8atcFBfGHJUYkDHgoD97SztrrorBYjP+q6gcnxsb/bH
	us7E3TKfNGdLpVrkiIRprr6E6ueUEgscnjNVs00Nm3F62QtgORtp5XStxOyTzLhsTKLUT/LJmPU
	H4GnYAoJyS/KMkNzYLg99fvCvBy1LA+Oiz+dtZmy3ES5FtXvdJyQnY
X-Google-Smtp-Source: AGHT+IFoq4x6do98drZk2/+TsAmmyZxgFWNlbbcTlwdADP+61k5uWEghVQlJcCQJSCQ8JKhIGVdnCw==
X-Received: by 2002:a05:6000:4024:b0:42f:b9c6:c894 with SMTP id ffacd0b85a97d-4324e70957dmr33395938f8f.52.1766961272230;
        Sun, 28 Dec 2025 14:34:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43264613923sm43242644f8f.26.2025.12.28.14.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 14:34:31 -0800 (PST)
Date: Sun, 28 Dec 2025 22:34:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
 michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <20251228223430.43f14d51@pumpkin>
In-Reply-To: <aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
	<20251218191332.35849-2-lukas.gerlach@cispa.de>
	<aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
	<20251227212859.3a83d65e@pumpkin>
	<aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_143434_929937_6C6B933F 
X-CRM114-Status: GOOD (  43.04  )
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

On Sat, 27 Dec 2025 17:59:38 -0800
Deepak Gupta <debug@rivosinc.com> wrote:

> On Sat, Dec 27, 2025 at 09:28:59PM +0000, David Laight wrote:
> >On Fri, 19 Dec 2025 16:44:11 -0800
> >Deepak Gupta <debug@rivosinc.com> wrote:
> >  
> >> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:  
> >> >Similarly to x86 and arm64, mitigate speculation past an access_ok()
> >> >check by masking the pointer before use.
> >> >
> >> >On RISC-V, user addresses have the MSB clear while kernel addresses
> >> >have the MSB set. The uaccess_mask_ptr() function clears the MSB,
> >> >ensuring any kernel pointer becomes invalid and will fault, while
> >> >valid user pointers remain unchanged. This prevents speculative
> >> >access to kernel memory via user copy functions.
> >> >
> >> >The masking is applied to __get_user, __put_user, raw_copy_from_user,
> >> >raw_copy_to_user, clear_user, and the unsafe_* variants.
> >> >
> >> >Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> >> >---
> >> > arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
> >> > 1 file changed, 32 insertions(+), 9 deletions(-)
> >> >
> >> >diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> >> >index 36bba6720c26..ceee1d62ff9b 100644
> >> >--- a/arch/riscv/include/asm/uaccess.h
> >> >+++ b/arch/riscv/include/asm/uaccess.h
> >> >@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
> >> > #define __typefits(x, type, not) \
> >> > 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> >> >
> >> >+/*
> >> >+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
> >> >+ *
> >> >+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
> >> >+ * User addresses have the MSB clear; kernel addresses have the MSB set.
> >> >+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
> >> >+ * fault, while valid user pointers remain unchanged.
> >> >+ */
> >> >+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
> >> >+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
> >> >+{
> >> >+	unsigned long val = (unsigned long)ptr;
> >> >+
> >> >+	val = (val << 1) >> 1;
> >> >+	return (void __user *)val;  
> >>
> >> This is only clearing b63 which is what we don't need here.  
> >
> >It is also entirely the wrong operation.
> >A kernel address needs converting into an address that is guaranteed
> >to fault - not a user address that might be valid.  
> 
> This is about speculative accesses and not actual accesses. Due to some
> speculation it is possible that in speculative path a wrong address is
> generated with MSB=1. This simply ensures that bit is cleared for agen
> even in speculative path.

You said you were following what x86 did - this isn't what is does.
Avoiding the conditional branch in access_ok() is actually a big win.
That is true even without the issues with speculative accesses to kernel
memory.
The 'address masking' (badly named - it isn't just masking) is a replacement
for access_ok(), it changes kernel addresses to invalid ones so that the
access faults and the trap/fault fixup code detects the error.

	David

> 
> >
> >You need a guard page of address space between valid user addresses
> >and valid kernel addresses that is guaranteed to not be used.  
> 
> IIUC, risc-v does that already (last user page is unmapped and first
> kernel page is unmapped).
> 
> >Typically this is the top page of the user address space.
> >All kernel addresses need converting to the base of the guard page
> >using ALU operations (to avoid speculative accesses).
> >So: ptr = min(ptr, guard_page); easiest done (as in x86-64) with
> >a compare and conditional move.
> >The ppc version is more complex because there isn't a usable conditional
> >move instruction.
> >I think this would work for x86-32:
> >	offset = ptr + -guard_page;
> >	mask = sbb(x,x); // ~0u if the add set the carry flag.
> >	ptr -= offset & mask;
> >You need to find something that works for riscv.  
> 
> I believe what you're describing is `access_ok` in x86. `__access_ok` in
> `asm-generic/access_ok.h` should cover same behavior for risc-v.
> 
> >  
> >>
> >> You should be clearing b47 (if bit indexing starts at 0) on Sv48 and b56
> >> on Sv57 system.
> >>
> >> Anything above b47/b56 isn't going to be used anyways in indexing into
> >> page tables and will be ignored if pointer masking is enabled at S.  
> >
> >Gah more broken hardware...
> >Ignoring the high address bits doesn't work and is really a bad idea.
> >Arm did it as well.
> >Trying to do 'user pointer masking' for uaccess validation is a PITA
> >if you have to allow for non-zero values in the high bits it makes
> >life even more complicated.  
> 
> Pointer masking and preventing speculative accesses to kernel addresses
> are two different things (although they're related because they impact
> address generation part). 
> 
> Kernel may not have pointer masking enabled and in that case, it'll just
> trap if high unused bits don't match b38/47/56. To accomodate that, there
> already are patches in riscv to remove the tag in high unused bits before
> access is made by the kernel.
> 
> >
> >And 'pointer masking' is so broken unless it is done at the page level
> >and enforced by the hardware.
> >What it does is make random/invalid addresses much more likely to be valid.
> >An interpreter can use them internally, but they are so slow software
> >masking  (following the validation) shouldn't be a real issue.
> >
> >	David
> >
> >  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
