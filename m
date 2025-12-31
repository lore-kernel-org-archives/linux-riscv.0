Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82460EE6425
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSHFNO+cGEnhsP6NWx/moK4wj4qyNuDbOQVvm8wSYoI=; b=Nj0pXbIoevGowx
	FdHez86cTZ+voVDxUgNcIn+cCNmwKbi83g7Otrao6RUvAF9EJxHoZiscc3Is/Gh9XxS+iqIB1lGlO
	Vf2BhrZjsIn0cei89DHVEMxdKh0TrSJ3pkKREz4suaT3uqJy34RBQ5krhCSdRzHm5AByZoaIOSdyB
	LASx+zTG0uWh36oUIfNFimkVvrFmvKrhjQpwA4CZroUVhLD2d8qKFE90sNnhPr7hpWQ/RM3Y6m0Uc
	ttUHTX7s4Jos2BgHXdUG9pxr0bLHNv+S4woAFTUM576VSIAPpo/5GYRDKqb/pYdbTA6KgBOa5XT/+
	82fwEi/Vu+gF638HhF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatXx-00000005t5D-3JGg;
	Wed, 31 Dec 2025 10:35:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatXw-00000005t4q-0IhV
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 10:35:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso56262005e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Dec 2025 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767177314; x=1767782114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxgVjlzXoj/7VVIT7fpDBTaGCP9fmvaOXIxXQVrJfKk=;
        b=ZJGe8kM+OVzJKxMb3w+AX22r+D1IRv0QdQ1EceOO6dZWPFjUnKEFKDhO0m6fC6K2D9
         TGIrBALKFEkOGAXwWAkgngWJBKOtbU9nGazPV0ZC99it+9nuQ4hcxhCSIdwHCWpYYYij
         0AxLblTBG2BjVcZkduNJDlgQhGyR9KmG2HGPzUqyoP4G9vRtTx/gVIGy7eXzLwhyLoc8
         +upYa/koW4SMPg3aKvZ8d1oGPHvj9E770zbUv62DJHcMaMrJ5HcdfyPY3YV9te8mBU/8
         pSB4K2Q9QgYxoBOYwClvzXSLDaDbRe61olKzCw86t+kTQtD4McsVRiZIFEA5Hof1gtzE
         tiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767177314; x=1767782114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxgVjlzXoj/7VVIT7fpDBTaGCP9fmvaOXIxXQVrJfKk=;
        b=hQLbSabUhvRcJZtwZHMtoV/N3O9bO1tRGZdTwYjYTEKltOdVgMkYkyd9TSUaH2q/6y
         uKYcXqIxT1gNv6bkg08RXiuk6nQKCBx0sDfkEwJOBbQCb9V3GYL2HVJt9nucbB7VgVEH
         /YiH/q/85JNyFtqNnb+TpKivy10KaOtZWgjWn5LVhO+7mrAxYmZpNbk25/ogAraRDNzL
         47E+ZnHsNuLOl6vJ/j0sDLuSvy/vLWvKLbIJG1tjSAe0BwML/VAoZyNwYhioP3AQBrru
         PCUg8dIUaIDrIrx+pEzt4bbX46WOBDtjVgTUDyxScrFaAww/lyaf4pjJGJp9vt+nXA1F
         0nfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzOvs/29guzYUfcjHe+f0RsOYYn67pm471CNbkJ7YuInX9TPU8kAKdtjIZV3xgAgS0rCZAHrCluI869g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVz6Cb67uaO/kM5Rwk2KoX/c8VNFMsB8lEq/mAZ0j7CVrr0CPU
	nRumCZHVe46+VpYMHkfPio9xF68BsH4ScInv6Rx5YtsfpJSgrnRY3+fs
X-Gm-Gg: AY/fxX4yH07F/xT8IVEvGLpZPI3VnHNZz0B2oAgpQ8kWnlU8tM8Qmw0sYmCCgVVVbxb
	wOEAI76kgMRMLrbpIx563Q9US3kkM2mubyEH2P/yLE7dpyFjcop+W5b7Y2lEIAAag8LwWBw5Vb8
	t7dj9yD3SChqnUi54MfjJNQ9B4PN8bTnI30eNi5TM5Sxoa3OrQt744Zm9cRbdjw4cQjW3ELy0JF
	4MO5/uZr/yMlP4p1Dst6ACTjLZQujUUBJcmUZwIrH1Y1itCaDNLwvBQBrpxTyr8V+qdBQXCayAu
	mWP5VZEPDVHIqNGmP0Pc4UL+0wntfrnISfOaBkGSa6TMrfHJBOwh2/55bLgbfRRvP54/2NLBgh2
	NiS6uZsocmjPvbCQZhE/8oHwuj69raTwlFBqn+07i9WBv5+Rg254LXAPnOXC/l+lPTA9dsoAwwt
	5IxPEDct7JsPM45mXioknzG+T7cv25BbcxAiGgWZbQ/229Yt0U2uJA
X-Google-Smtp-Source: AGHT+IGFZOTIgtWFSH0pU0VnrIeE7lu8+s32LkUBkL8YW4CdU6oEKIiSIf2E8TP6yxBnZSZw2e2I2Q==
X-Received: by 2002:a05:600c:444d:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-47d18bdfc61mr473615595e9.13.1767177313452;
        Wed, 31 Dec 2025 02:35:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346dfcsm773106345e9.1.2025.12.31.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:35:13 -0800 (PST)
Date: Wed, 31 Dec 2025 10:35:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Deepak Gupta <debug@rivosinc.com>, Lukas Gerlach
 <lukas.gerlach@cispa.de>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, daniel.weber@cispa.de,
 michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <20251231103511.5ddb768b@pumpkin>
In-Reply-To: <d6076efd-d5e4-49f9-a0ed-62195ee20e01@iscas.ac.cn>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
	<20251218191332.35849-2-lukas.gerlach@cispa.de>
	<aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
	<20251227212859.3a83d65e@pumpkin>
	<aVCPCm2mHUxSzQJi@debug.ba.rivosinc.com>
	<20251228223430.43f14d51@pumpkin>
	<20251229123212.25ef3c4b@pumpkin>
	<d6076efd-d5e4-49f9-a0ed-62195ee20e01@iscas.ac.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_023516_164450_0778A50F 
X-CRM114-Status: GOOD (  41.41  )
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

On Wed, 31 Dec 2025 11:47:16 +0800
Vivian Wang <wangruikang@iscas.ac.cn> wrote:

> On 12/29/25 20:32, David Laight wrote:
> > On Sun, 28 Dec 2025 22:34:30 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
> >  
> >> On Sat, 27 Dec 2025 17:59:38 -0800
> >> Deepak Gupta <debug@rivosinc.com> wrote:
> >>  
> >>> On Sat, Dec 27, 2025 at 09:28:59PM +0000, David Laight wrote:    
> >>>> On Fri, 19 Dec 2025 16:44:11 -0800
> >>>> Deepak Gupta <debug@rivosinc.com> wrote:
> >>>>      
> >>>>> On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:      
> >>>>>> Similarly to x86 and arm64, mitigate speculation past an access_ok()
> >>>>>> check by masking the pointer before use.
> >>>>>>
> >>>>>> On RISC-V, user addresses have the MSB clear while kernel addresses
> >>>>>> have the MSB set. The uaccess_mask_ptr() function clears the MSB,
> >>>>>> ensuring any kernel pointer becomes invalid and will fault, while
> >>>>>> valid user pointers remain unchanged. This prevents speculative
> >>>>>> access to kernel memory via user copy functions.
> >>>>>>
> >>>>>> The masking is applied to __get_user, __put_user, raw_copy_from_user,
> >>>>>> raw_copy_to_user, clear_user, and the unsafe_* variants.
> >>>>>>
> >>>>>> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> >>>>>> ---
> >>>>>> arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
> >>>>>> 1 file changed, 32 insertions(+), 9 deletions(-)
> >>>>>>
> >>>>>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> >>>>>> index 36bba6720c26..ceee1d62ff9b 100644
> >>>>>> --- a/arch/riscv/include/asm/uaccess.h
> >>>>>> +++ b/arch/riscv/include/asm/uaccess.h
> >>>>>> @@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
> >>>>>> #define __typefits(x, type, not) \
> >>>>>> 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
> >>>>>>
> >>>>>> +/*
> >>>>>> + * Sanitize a uaccess pointer such that it cannot reach any kernel address.
> >>>>>> + *
> >>>>>> + * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
> >>>>>> + * User addresses have the MSB clear; kernel addresses have the MSB set.
> >>>>>> + * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
> >>>>>> + * fault, while valid user pointers remain unchanged.
> >>>>>> + */
> >>>>>> +#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
> >>>>>> +static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
> >>>>>> +{
> >>>>>> +	unsigned long val = (unsigned long)ptr;
> >>>>>> +
> >>>>>> +	val = (val << 1) >> 1;
> >>>>>> +	return (void __user *)val;      
> >>>>> This is only clearing b63 which is what we don't need here.      
> >>>> It is also entirely the wrong operation.
> >>>> A kernel address needs converting into an address that is guaranteed
> >>>> to fault - not a user address that might be valid.      
> >>> This is about speculative accesses and not actual accesses. Due to some
> >>> speculation it is possible that in speculative path a wrong address is
> >>> generated with MSB=1. This simply ensures that bit is cleared for agen
> >>> even in speculative path.    
> >> You said you were following what x86 did - this isn't what is does.
> >> Avoiding the conditional branch in access_ok() is actually a big win.
> >> That is true even without the issues with speculative accesses to kernel
> >> memory.
> >> The 'address masking' (badly named - it isn't just masking) is a replacement
> >> for access_ok(), it changes kernel addresses to invalid ones so that the
> >> access faults and the trap/fault fixup code detects the error.  
> > If you can guarantee that address 0 is never mapped into userspace
> > (not true for x86 for historic reasons) then I think you can convert
> > kernel addresses to zero - which will then fault.
> > This is simpler than using the base of the guard page (which is still
> > needed for sequential accesses).
> > Something like:
> > 	addr &= (addr >= guard_page) - 1;
> > will then work - but it needs (partially) coding in assembler to
> > guarantee that 'setae' (or equivalent) is used rather than a
> > conditional branch.
> >    
> 
> Maybe use:
> 
>     addr |= (long)addr >> 63
> 
> To map kernel addresses to -1?

That also requires that address 0 is never mapped into userspace.
The first access might be offset from the actual base address.
(It is too hard to check that code accesses the first member of a
structure first - and some obvious candidate bits of code don't.)

There are also issues on x86-64 (I think amd cpu) which mean that
just testing the high bit isn't good enough, the check has to use
the highest valid user address (ie one below the 'big address hole').
Linus added to code to patch the correct constant into the comparison
instruction in order to avoid a memory read because a different limit
is needed to 4 and 5 level page tables. 

Whether that applies to riscv is another matter, but if the hardware
actually uses a lower bit to select kernel addresses (perhaps in
parallel with validating that the top few bits are all the same)
then you do need to compare against the top user address. 

I suspect that if you don't do it now, at some point there'll be
an 'issue' that needs the correct limit address used.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
