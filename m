Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3739C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 20:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A50610CB
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 20:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A50610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uUwvghA0r1n9cg9Yj+bS7xvt4hM3wjEjWrWlWI1naaw=; b=DwVxUmICgMoybsDFDhpH4ueyUy
	JRKiNMdsGdycCC8Oa+0vyLIm27QYgHsqQ5rLuWm5xpXMY+Kgfkl1ZOIxZfr8FjlftElDKKjWq/7sm
	fl3rz9mqJFvdDs1akjd2zrHQK5RkGpBSgFiGtR/sz7JZ9VB903jEOsAhORZOCtndOZWJ2k3MQeIHT
	dpm3IdW5zEJi/GtpYR6NgXd3c7RJGNlqd/NonuGB3cL10hmnRALNXAr33GDtcrC9VFZetgy9iQsop
	wMvdCPZ+77D4Xvni9yhDPF92ZPVFmkmCce4kE9+5YpZ4qM0K8w/3USNBQ2aoen7SfP40mSy2ZY1w1
	sxpRAxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln5io-008Jy1-TT; Sat, 29 May 2021 20:38:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln5im-008JxA-7A
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 20:38:13 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso6499306pjb.0
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nQPaH6kG3QdNq74eFLfWexfThSN9M42Oh4SfpVk0D5w=;
 b=z12bCbaCCIRQzFvYHBxDX/v9qdOUnb/7vT5APuXzjhv4lG0djahQIat7KpNPsA4Ser
 VYef58Fz/wA+ZZLeDL5IkNQjHzxc8l2LodFogwyxkcJIIhuqwS0ArSknATNV2AOafeQJ
 kND9u7AjL0duPYXDBpDJuqq5Fn0xWM32IJX/nZ3NLa9e3tKQTwXrUELNPL5wrx/Yg59i
 WFjnUPVHDvd64ogXBMmqTb/x4E7Xf2ve0ioxzlZuuiefqMt8Cwtll0683ItFq18B1vCv
 lQKlG3LK0z68dvHPtnracZdmcgVDyf1sJQTeEQhIllq9vuagFu4IFZfKNY803IfGtq0F
 TEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nQPaH6kG3QdNq74eFLfWexfThSN9M42Oh4SfpVk0D5w=;
 b=CBUu4OuT7E8Qf9W9OSbEaMfCZw7AUFb0Niwhbfo+eIoNq4k14VaDdazhvvDRxz3UpY
 WsNsLT56+DGGsUiC6vp9Kr2JA1I2KCoJmq5t3UiGVOiPTDUvQR2f8HyS3BlCnI/nz8u1
 anBYeuiFLWuNTISvA4Z4E3RZN57tLbea8w+kfkiA/h1oVQwVeVQT6KpG90CHrdN6u7NK
 dPTRXG/e30OoPzAdOn09paB8UXBEQY3HsoFiO9PSgisRfNi6A+G888wMRC5C/cJ2Fa5D
 5Y6zPkpvS98UPaK2qm07z/N5GfSDp8XyTM0oOojkPF2IpluxbOqx9Q+uxPy2NpXsr3t9
 Ba4g==
X-Gm-Message-State: AOAM533vjiItIF+S9x1ulQ3jTzbdEt5Axhg3KxFMrYEew2BmU9Ao2mqN
 9zr+yMxq2K0SxltNPc29EXtd5A==
X-Google-Smtp-Source: ABdhPJy6geY+bi8Bvls5E8KipeNwzpNfnsWtzza2LxPLK6EPXXwvXA3vRRl/H6at+2dY6ZOJNJ+/WQ==
X-Received: by 2002:a17:90a:d496:: with SMTP id
 s22mr11215477pju.146.1622320691420; 
 Sat, 29 May 2021 13:38:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f5sm7017567pjp.37.2021.05.29.13.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 13:38:10 -0700 (PDT)
Date: Sat, 29 May 2021 13:38:10 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 13:37:33 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Fix W+X mappings at boot
In-Reply-To: <20210520173859.7441aed8@xhacker.debian>
CC: drew@beagleboard.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang3@mail.ustc.edu.cn,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tekkamanninja@gmail.com,
 emil.renner.berthing@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Jisheng.Zhang@synaptics.com
Message-ID: <mhng-e8b40095-7ee6-47eb-aeb7-bffa216d855a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_133812_287058_6494BF7A 
X-CRM114-Status: GOOD (  35.93  )
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

On Thu, 20 May 2021 02:38:59 PDT (-0700), Jisheng.Zhang@synaptics.com wrote:
> On Wed, 19 May 2021 21:55:40 -0700
> Drew Fustini <drew@beagleboard.org> wrote:
>
>>
>>
>> On Sun, May 16, 2021 at 05:00:38PM +0800, Jisheng Zhang wrote:
>> > From: Jisheng Zhang <jszhang@kernel.org>
>> >
>> > When the kernel mapping was moved the last 2GB of the address space,
>> > (__va(PFN_PHYS(max_low_pfn))) is much smaller than the .data section
>> > start address, the last set_memory_nx() in protect_kernel_text_data()
>> > will fail, thus the .data section is still mapped as W+X. This results
>> > in below W+X mapping waring at boot. Fix it by passing the correct
>> > .data section page num to the set_memory_nx().
>> >
>> > [    0.396516] ------------[ cut here ]------------
>> > [    0.396889] riscv/mm: Found insecure W+X mapping at address (____ptrval____)/0xffffffff80c00000
>> > [    0.398347] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/ptdump.c:258 note_page+0x244/0x24a
>> > [    0.398964] Modules linked in:
>> > [    0.399459] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1+ #14
>> > [    0.400003] Hardware name: riscv-virtio,qemu (DT)
>> > [    0.400591] epc : note_page+0x244/0x24a
>> > [    0.401368]  ra : note_page+0x244/0x24a
>> > [    0.401772] epc : ffffffff80007c86 ra : ffffffff80007c86 sp : ffffffe000e7bc30
>> > [    0.402304]  gp : ffffffff80caae88 tp : ffffffe000e70000 t0 : ffffffff80cb80cf
>> > [    0.402800]  t1 : ffffffff80cb80c0 t2 : 0000000000000000 s0 : ffffffe000e7bc80
>> > [    0.403310]  s1 : ffffffe000e7bde8 a0 : 0000000000000053 a1 : ffffffff80c83ff0
>> > [    0.403805]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : 6c7e7a5137233100
>> > [    0.404298]  a5 : 6c7e7a5137233100 a6 : 0000000000000030 a7 : ffffffffffffffff
>> > [    0.404849]  s2 : ffffffff80e00000 s3 : 0000000040000000 s4 : 0000000000000000
>> > [    0.405393]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffe000e7bd48
>> > [    0.405935]  s8 : ffffffff81000000 s9 : ffffffffc0000000 s10: ffffffe000e7bd48
>> > [    0.406476]  s11: 0000000000001000 t3 : 0000000000000072 t4 : ffffffffffffffff
>> > [    0.407016]  t5 : 0000000000000002 t6 : ffffffe000e7b978
>> > [    0.407435] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
>> > [    0.408052] Call Trace:
>> > [    0.408343] [<ffffffff80007c86>] note_page+0x244/0x24a
>> > [    0.408855] [<ffffffff8010c5a6>] ptdump_hole+0x14/0x1e
>> > [    0.409263] [<ffffffff800f65c6>] walk_pgd_range+0x2a0/0x376
>> > [    0.409690] [<ffffffff800f6828>] walk_page_range_novma+0x4e/0x6e
>> > [    0.410146] [<ffffffff8010c5f8>] ptdump_walk_pgd+0x48/0x78
>> > [    0.410570] [<ffffffff80007d66>] ptdump_check_wx+0xb4/0xf8
>> > [    0.410990] [<ffffffff80006738>] mark_rodata_ro+0x26/0x2e
>> > [    0.411407] [<ffffffff8031961e>] kernel_init+0x44/0x108
>> > [    0.411814] [<ffffffff80002312>] ret_from_exception+0x0/0xc
>> > [    0.412309] ---[ end trace 7ec3459f2547ea83 ]---
>> > [    0.413141] Checked W+X mappings: failed, 512 W+X pages found
>> >
>> > Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > ---
>> >  arch/riscv/mm/init.c | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> > index 4faf8bd157ea..4c4c92ce0bb8 100644
>> > --- a/arch/riscv/mm/init.c
>> > +++ b/arch/riscv/mm/init.c
>> > @@ -746,14 +746,18 @@ void __init protect_kernel_text_data(void)
>> >       unsigned long init_data_start = (unsigned long)__init_data_begin;
>> >       unsigned long rodata_start = (unsigned long)__start_rodata;
>> >       unsigned long data_start = (unsigned long)_data;
>> > -     unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
>> > +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>> > +     unsigned long end_va = kernel_virt_addr + load_sz;
>> > +#else
>> > +     unsigned long end_va = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
>> > +#endif
>> >
>> >       set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
>> >       set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
>> >       set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
>> >       /* rodata section is marked readonly in mark_rodata_ro */
>> >       set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>> > -     set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
>> > +     set_memory_nx(data_start, (end_va - data_start) >> PAGE_SHIFT);
>> >  }
>> >
>> >  void mark_rodata_ro(void)
>> > --
>> > 2.31.0
>> >
>
>
>
>> I know there is a new thread now with a different approach but I wanted
>> to say that this did fix that warning on the BeagleV Starlight beta
>> prototype board [1] with the StarFive JH7100 SoC [2]. I am using Emil's
>> starlight branch [3] which is a set of StarFive patches on top of
>> 5.13-rc2. Emil included this W+X mapping patch [4]. It does fix the
>> warning on boot for me and the bootlog [5] shows:
>>
>>   [    2.302598] Checked W+X mappings: passed, no W+X pages found
>>
>> Thus if useful, here is my TB:
>>
>> Tested-by: Drew Fustini <drew@beagleboard.org>
>>
>
> Thank you. Alex's solution is better. It ensures there's no W+X mapping
> from the beginning. So far, riscv's STRICT_KERNEL_RWX method is to create
> W+X mapping from the beginning but remove W or X attribute at the end of kernel
> booting. Alex's solution changes STRICT_KERNEL_RWX method, one effective side
> of it is fixing this W+X mapping. I'm not sure whether Alex's patch should
> be merged in this cycle or next window since rc1 is released.
>
> Two choice to fix:
> Merge this small fix for linux-5.13 and bring Alex's patch for linux-next

I'm going to do this.  That way we keep can fix the bug now.  I've put 
this on a branch that I've merged into fixes, it looks like Alex is 
going to send a v3 so I'll wait on that.

Thanks!

>
> Or
>
> Use Alex's patch directly.
>
>
> I would leave the decision to riscv maintainers.
>
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
