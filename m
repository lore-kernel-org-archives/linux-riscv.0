Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93335E9271B
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 02:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbrwR7NkPaYKcdjHXZVVvidlQegq++nmECk68ORtDoQ=; b=mvJl+VliTeQL/v/klfaUBFypl1
	5lQn8iTgjrHUHJaZNmW0IudoYNQsmPTtYYiRP1Z+xslUgfIHIGl/Qin6X/Tp1mMtzJyuRv0ESzafj
	HcN9AZaCjw7d2veRK81Vhd6SX4UwYeoYw1AIew581nEITHXiUlwXq4Sk5WmWkoT2RRtAf0m3X2k03
	lrpK4wGe+7RhiccRANMHEWw2ylTvAj4hqcfPsQTUAwe+5Gfzo5yMNJkD8s084oQauccVsgljmJ29K
	iC79vKSoCxiTltF3PUlQbIQEHbqEb8xjya7djEt34kC7zPekUQNSA04v5qHYASO+hBFmgSm1lDDm5
	Bfa8RMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZg4P-00000002KoO-1aJ2;
	Sun, 28 Dec 2025 01:59:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZg4M-00000002Knz-1HFK
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 01:59:43 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso6083180a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 17:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766887181; x=1767491981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwK/WtRE1URKQu/wEiiLSymaVuBrwwLZzwrg6P+n/NU=;
        b=GdM9fwjNhUwnftvS0mW3bmzhBNaqm5aOyuVCB/UWrPV7z+jdDJukTjVz6+ZDCu4XpM
         yYztU1itWT7Ntf0rkTIOPRWwNMBB42ALVQFu3R/kquabyHw1XuZAiBiFgZmG/9DEjhjr
         omLVoB26LByTtHVfEJr0PIzxMjUnb0/AcL9iZp0q6ueQXAA+s1RhJ7i4XCZwwUG54Tt/
         unk4Smu8DAKpw3PqlBWPxYw2BjJU5SvT+Bsu8nE8lk4P58seOpkkgmxAaziLfv4vCGxk
         Us7qFi8fZ5SZHEsLGMMuUL9juy5ed9cPrDpz5jNlTnp4Q0Y82zMmAlWovbnYfTYd+OKQ
         ltqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766887181; x=1767491981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwK/WtRE1URKQu/wEiiLSymaVuBrwwLZzwrg6P+n/NU=;
        b=knyNCQwNOf7BOE4UZf1ZvpbRc5gxdlDsqzvfUAQfi7GTpZrtaBr4cgQmNwAcVu/V7q
         moLLPBVGYSfv310A/udG5/7yhFXC4QD0CS2MpVV+5HfarDbMJ5JksvHD7vaWGYDXFym+
         8ELDr1qyuiEWwUOjZzScsS2OFhGRMyd8DdEMC9BLDNzTze6LjEuRg5R0Ed0zFCyCAbqL
         ohmrv6xpvHmUzz4azxUaKhAmFnLTyQuQ8rZoH8RWCWoT56vjSlbIXNX5TIvlFpHN/zrv
         f2wC7H+UoLqH7FQFwBRkxorzPZSoYtbL77yOTHleRiMXEq6+01uVzxvd/P4BfhUZ8v02
         9fqw==
X-Forwarded-Encrypted: i=1; AJvYcCUrkXor8LMri91FW8plt81Qn+HppgTPaBy1M3vSMfJQUFXezpVNSaYg92vnY6Ij9Qh/97kQ04dhVyEEfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRziu7kawP4a3BhCfvPUDCr7cTx/XOURv1OdT8YprucAUAZubr
	gpQoTrbRXYqBse5KhGhSRsQVWvpgbjB7ufTXXF87SZF3uGMerQezFN8GYpGlALtYwx0=
X-Gm-Gg: AY/fxX7Exp/RWRYlvkVw8K07zU585QPeNX+H62Kp1wVrUM0opbuxtTEISWEI/UBpVMJ
	tmK+O6BXBBxTUZhwlwKQH+ibfUYlfjJp7kwJAkHkvJvsgdYOV3kjm1SlxvsL/ct60zoYhkrSAEv
	3mxT5gVoGZ2TXfvUACcR7f8pdkSTF8fb4wZ96OmiVGVfVtv3wPq9yWmhOeKjSXsc4/+FIoYFG7l
	eNmC1ZzwP4M2ekczaXQHd9giEjJeiVK6EYoDIs84SzDWbt2gCQG0GAOD/Zq+f3oms90E3T4VXSv
	cYjg+u9AJ+W8me3BIF/ZXasUje1bqxZvhmYts7Ek5nBDk29kYqlt+kNoiPJC598SSbueHsdCURp
	ziDQdFeQXbAGzZ8FicSZ7snRUSMYe14J41ZL4ifaIUXqTsX6+0Q5z4ouiCj4ESZeKjI5H6T7HkX
	2dnwvtTcM2wov76jZD28E0
X-Google-Smtp-Source: AGHT+IGNuBlPIRiYFjBvShXA4Nrx8Q9TrbfmMnCwgNLDU+kIlceQV38rIKRBeT80Y7XFehbCXbOl3A==
X-Received: by 2002:a05:7022:6887:b0:11b:a892:80b4 with SMTP id a92af1059eb24-121721ab83amr31513090c88.5.1766887181046;
        Sat, 27 Dec 2025 17:59:41 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm79381703c88.8.2025.12.27.17.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 17:59:40 -0800 (PST)
Date: Sat, 27 Dec 2025 17:59:38 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
	michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
	jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
 <20251218191332.35849-2-lukas.gerlach@cispa.de>
 <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
 <20251227212859.3a83d65e@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227212859.3a83d65e@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_175942_370034_BB96C491 
X-CRM114-Status: GOOD (  28.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 09:28:59PM +0000, David Laight wrote:
>On Fri, 19 Dec 2025 16:44:11 -0800
>Deepak Gupta <debug@rivosinc.com> wrote:
>
>> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:
>> >Similarly to x86 and arm64, mitigate speculation past an access_ok()
>> >check by masking the pointer before use.
>> >
>> >On RISC-V, user addresses have the MSB clear while kernel addresses
>> >have the MSB set. The uaccess_mask_ptr() function clears the MSB,
>> >ensuring any kernel pointer becomes invalid and will fault, while
>> >valid user pointers remain unchanged. This prevents speculative
>> >access to kernel memory via user copy functions.
>> >
>> >The masking is applied to __get_user, __put_user, raw_copy_from_user,
>> >raw_copy_to_user, clear_user, and the unsafe_* variants.
>> >
>> >Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
>> >---
>> > arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
>> > 1 file changed, 32 insertions(+), 9 deletions(-)
>> >
>> >diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> >index 36bba6720c26..ceee1d62ff9b 100644
>> >--- a/arch/riscv/include/asm/uaccess.h
>> >+++ b/arch/riscv/include/asm/uaccess.h
>> >@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
>> > #define __typefits(x, type, not) \
>> > 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
>> >
>> >+/*
>> >+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
>> >+ *
>> >+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
>> >+ * User addresses have the MSB clear; kernel addresses have the MSB set.
>> >+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
>> >+ * fault, while valid user pointers remain unchanged.
>> >+ */
>> >+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
>> >+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>> >+{
>> >+	unsigned long val = (unsigned long)ptr;
>> >+
>> >+	val = (val << 1) >> 1;
>> >+	return (void __user *)val;
>>
>> This is only clearing b63 which is what we don't need here.
>
>It is also entirely the wrong operation.
>A kernel address needs converting into an address that is guaranteed
>to fault - not a user address that might be valid.

This is about speculative accesses and not actual accesses. Due to some
speculation it is possible that in speculative path a wrong address is
generated with MSB=1. This simply ensures that bit is cleared for agen
even in speculative path.

>
>You need a guard page of address space between valid user addresses
>and valid kernel addresses that is guaranteed to not be used.

IIUC, risc-v does that already (last user page is unmapped and first
kernel page is unmapped).

>Typically this is the top page of the user address space.
>All kernel addresses need converting to the base of the guard page
>using ALU operations (to avoid speculative accesses).
>So: ptr = min(ptr, guard_page); easiest done (as in x86-64) with
>a compare and conditional move.
>The ppc version is more complex because there isn't a usable conditional
>move instruction.
>I think this would work for x86-32:
>	offset = ptr + -guard_page;
>	mask = sbb(x,x); // ~0u if the add set the carry flag.
>	ptr -= offset & mask;
>You need to find something that works for riscv.

I believe what you're describing is `access_ok` in x86. `__access_ok` in
`asm-generic/access_ok.h` should cover same behavior for risc-v.

>
>>
>> You should be clearing b47 (if bit indexing starts at 0) on Sv48 and b56
>> on Sv57 system.
>>
>> Anything above b47/b56 isn't going to be used anyways in indexing into
>> page tables and will be ignored if pointer masking is enabled at S.
>
>Gah more broken hardware...
>Ignoring the high address bits doesn't work and is really a bad idea.
>Arm did it as well.
>Trying to do 'user pointer masking' for uaccess validation is a PITA
>if you have to allow for non-zero values in the high bits it makes
>life even more complicated.

Pointer masking and preventing speculative accesses to kernel addresses
are two different things (although they're related because they impact
address generation part). 

Kernel may not have pointer masking enabled and in that case, it'll just
trap if high unused bits don't match b38/47/56. To accomodate that, there
already are patches in riscv to remove the tag in high unused bits before
access is made by the kernel.

>
>And 'pointer masking' is so broken unless it is done at the page level
>and enforced by the hardware.
>What it does is make random/invalid addresses much more likely to be valid.
>An interpreter can use them internally, but they are so slow software
>masking  (following the validation) shouldn't be a real issue.
>
>	David
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
