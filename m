Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E333C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI/c7o67WY+ZFXrEGmT7IFZXTpKd+Rz57Etq34RE6oM=; b=VujWbDX4tvufm5
	s27EElYuW3+6OrzD2bBb0TT0fj9nka4BVQVE36EFZlHEwOKgx7AgZsqCpMmBOse/PiZsk7F4jxVRQ
	uQXLP2iEvLZMLES10LNkAKzyIsJsn49JvAXzXU8mjps4vFZcwSyDt2Ih+v/utyaRYT4PwWfDhQYZ5
	1kLzEvZaIbXSazEUf0Ir5rZpBT0OulkZ8BZgzIpcxyg8a4WXLrTN9BKWgG0fumT71JfwML1uUHJTF
	wj23rAGpur85P4qIiZPiywmHg+GSXS+YRxzGjaGse6OKxxZrNcDpurplYm1f9kgJ3s49NrxGzwpZc
	yfTDEQHQS7xTbSr/jx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwiq-007kQ6-BQ; Tue, 29 Nov 2022 09:16:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwij-007kLP-Vf
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 09:16:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id l7so10613708pfl.7
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 01:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yJmwcOQ387zKVa0Jq5k3pS210BhZ0Kyy/A8X+VZVII=;
        b=GTWBn0Mel9C397bepjhvp3/FGFpPq6Up/cRO3LdaTC+eJ89CfbLqomz03A5gubuY7H
         x2x9rRWTrhBWKO4Byh8o4Kyikf70Dtsa1zT7bz9mLBRX/zwCLt+iCm+Edtsij84mtWl2
         xUYneA1qj3iCPYGRjK7XSdDlgnw4bJfz7Nq1r4VVMM+6jDW86Dm2ffKIJs4V/SAWuPSH
         UmSgWjbZHp249BQPQ9TloZiTu+uPwYEH1qEj761Us3fpc+wvHdT16euLfBL7LH/oj5Yk
         RoL6hL+aDk+veGSFxsUizDwNQsOXhJgZS1WI+Lch6pMmAq1XHazsXAiH/LbLRwF8fH8W
         JeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yJmwcOQ387zKVa0Jq5k3pS210BhZ0Kyy/A8X+VZVII=;
        b=d/P1mupMANlW/GqKgfM4SUdGf9UlEOKPUWhX20NF4sWTuCar/kNzyFibMMkU3gCbdJ
         IvRM6lMVIQ07xrytE/3Omiar+tYSz4c/4juwSYfbsNqcEYxWhzg0eMaXvwGf6jkMKgeo
         lfqqdAL3ENnLIAWp0puFOsmcMj7bbiMxF5QxzjqOw6oU+sdIviCgXg3j5pVs9Pz1EAx9
         x2/XyhAOCJeV60fsfqa/ap/Ezy8gn4fcpXVOElQY3JKOVl+Ow/A3qdCZi5/4aYQfBjH4
         57bBQKMAIHnIqYpOlrckhgCYA2Li2XuvtEwYYP0W7+zFU012uZJHxl9+mzOjgCQFyxyq
         ruMQ==
X-Gm-Message-State: ANoB5pnP4nocq1bMkoEfwjZVMabsr5gTS/QSyC148/CAV43AN37T4Tzv
	s5deZyyqPXW3LEWy6enUpy2I03W248xXCzdMJFVY8Q==
X-Google-Smtp-Source: AA0mqf4AdlkfotGmTcZawdCq1T67fKkSdh+zCxB3a1WwyhWMATAXZqergNC7lO5vTz1mulfHrqs8tCsbIKiY+jG7RsM=
X-Received: by 2002:a65:4688:0:b0:477:7aee:a464 with SMTP id
 h8-20020a654688000000b004777aeea464mr35225443pgr.595.1669713362873; Tue, 29
 Nov 2022 01:16:02 -0800 (PST)
MIME-Version: 1.0
References: <mhng-028a3e75-6cd0-4775-ac68-3e0eb70c91ae@palmer-ri-x1c9> <d79d85c2-8457-9b0e-6460-089cf91dd425@sholland.org>
In-Reply-To: <d79d85c2-8457-9b0e-6460-089cf91dd425@sholland.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 29 Nov 2022 01:15:50 -0800
Message-ID: <CAHBxVyEPvxm2KqCedkDTduVRq2mFCwuWE-NL9WO0_a7=+Y7upw@mail.gmail.com>
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_011606_269019_8C60AA23 
X-CRM114-Status: GOOD (  54.51  )
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

On Mon, Nov 28, 2022 at 10:55 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 11/29/22 00:19, Palmer Dabbelt wrote:
> > On Mon, 28 Nov 2022 21:04:48 PST (-0800), samuel@sholland.org wrote:
> >> On 11/28/22 14:11, Atish Kumar Patra wrote:
> >>> On Mon, Nov 28, 2022 at 7:34 AM Jisheng Zhang <jszhang@kernel.org>
> >>> wrote:
> >>>>
> >>>> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
> >>>> parse.") adds an image header which "is based on ARM64 boot image
> >>>> header and provides an opportunity to combine both ARM64 & RISC-V
> >>>> image headers in future.". At that time, arm64's default text_offset
> >>>> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
> >>>> the swapper page tables" as commit cfa7ede20f13 ("arm64: set
> >>>> TEXT_OFFSET
> >>>> to 0x0 in preparation for removing it entirely") pointed out, but
> >>>> riscv doesn't need the space, so use 0 as the default text_offset.
> >>>>
> >>>> Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
> >>>> with u-boot booti cmd:
> >>>> [    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
> >>>> ...
> >>>> [    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
> >>>> As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
> >>>> linux.
> >>>>
> >>>> After this patch, the 64MB DDR is fully usable by linux
> >>>> [    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]
> >>>>
> >>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >>>> ---
> >>>>  arch/riscv/kernel/head.S | 12 +-----------
> >>>>  1 file changed, 1 insertion(+), 11 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> >>>> index b865046e4dbb..ef95943f7a70 100644
> >>>> --- a/arch/riscv/kernel/head.S
> >>>> +++ b/arch/riscv/kernel/head.S
> >>>> @@ -38,18 +38,8 @@ ENTRY(_start)
> >>>>         .word 0
> >>>>  #endif
> >>>>         .balign 8
> >>>> -#ifdef CONFIG_RISCV_M_MODE
> >>>> -       /* Image load offset (0MB) from start of RAM for M-mode */
> >>>> +       /* Image load offset (0MB) from start of RAM */
> >>>>         .dword 0
> >>>> -#else
> >>>> -#if __riscv_xlen == 64
> >>>> -       /* Image load offset(2MB) from start of RAM */
> >>>> -       .dword 0x200000
> >>>> -#else
> >>>> -       /* Image load offset(4MB) from start of RAM */
> >>>> -       .dword 0x400000
> >>>> -#endif
> >>>> -#endif
> >>>
> >>> NACK.
> >>> RV64 needs to boot at a 2MB aligned address and RV32 needs to boot at
> >>> a 4MB aligned address.
> >>> The firmware is assumed to live at the start of DRAM for Linux running
> >>> in S-mode.
> >>
> >> What needs to happen so we can stop making this assumption? If the SBI
> >> implementation wants to reserve memory, it should use the devicetree to
> >> do so. OpenSBI already does this.
> >
> > IMO we've really screwed up the boot flow on RISC-V.  Having Linux
> > reserve space for the firmware is just all backwards, Linux can't know
> > how much memory the firmware needs (which manifests under large hart
> > counts in OpenSBI, for example).  Unfortunately there's no specification
> > that defines these platform-level details, so we're stuck depending on
> > unspecified behavior like this.
> >
> > I think we could fix this by either making Linux's early boot relocation
> > code work sanely (fix whatever bugs are there, document what can't be
> > fixed, and then add some sort of Image flag to tell firmware the kernel
> > can be relocated) or relying on relocatable firmware, but both of those
> > come with some costs ...
>
> It sounds like Alexandre's patch[1] lets us use memory below this
> offset, so we don't have to relocate the kernel to the beginning of RAM.
> In fact, we could even increase the offset if we are concerned about the
> kernel link address conflicting with the SBI implementation.
>
> [1]:
> https://patchwork.kernel.org/project/linux-riscv/patch/20221122084141.1849421-1-alexghiti@rivosinc.com/
>
> >> Throwing away 2 MiB of RAM is quite wasteful considering we have
> >> multiple SoCs (D1s, BL808) that are limited to 64 MiB of in-package RAM.
> >
> > ... and I'd argue that users on systems don't want to pay those costs.
>
> What does fixing the early relocation code cost? Just longer boot time?
> If the bootloader takes care of avoiding reserved-memory regions, and
> Linux can run from wherever it gets loaded, that would be ideal to me.
>
> > In fact, I'd argue that systems like that don't want resident firmware
> > at all.
>
> I would much rather pay 256 KiB for resident firmware than reimplement
> all of the power management and PMU logic in Linux. It's not as bad as
> losing 2 MiB when I know most of that is unused.
>

There are also debug triggers, AP-TEE which are SBI extensions.
In addition to that we have steal time accounting (STA) SBI extension
in virtualization
use cases as well.

Note: The PMU requirement will probably no longer be if supervisor
counter delegation
extension is approved. But it will take some time for hardware to
actually implement that.

> > So let's just add a CONFIG_SBI=n, and then just use direct drivers for
> > everything.  If the firmware doesn't need to be resident then it's
> > pretty straight-forward to support these 0 offsets, so we can just add
> > that as another Kconfig.  Sure this will trip up firmware that depends
> > on these fixed reservations, but saying "the resident firmware fits in 0
> > superpages" is just as much of a platform-specific dependency as saying
> > "the resident firmware fits in 1 superpage".  If firmware can't handle
> > this field in the Image format then we're going to end up with breakages
> > at some point, it might as well be now.
> >
> > If these systems don't have all the ISA bits necessary to avoid M-mode
> > entirely then we can just implement a tiny M-mode stub in Linux that
> > gets left around during early boot and then shims stuff to S-mode.
> > That'll be a bit of a headache and with some extensions it can be
> > avoided, the standard stuff won't allow for that until the latest round
> > of specs is done but if it's possible via whatever custom extensions are
> > in these things then that's probably the way to go.
>
> I don't think Linux has a choice here, when started in S-mode. And
> neither does the bootloader parsing the Image, because it most likely
> runs in S-mode as well.
>
> And when started in M-mode, we already don't use SBI.
>
> Regards,
> Samuel
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
