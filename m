Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936B5C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:30:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86EA611AD
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86EA611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H9nd9q0s3cYjrMcGaggAsvuU3Khiqts++PH/f+d6ENI=; b=fx0SMWXkAidjJjXY/zX9/7Rd1
	eu0ifgAf/oQtiNNWAktEz+UkERLrlfg9oHD1IDp4RxNw6eXedrTiWJ7e8hfYVVeEKJdXk2yTwZo9p
	KYQUrvAD/JNEMHsR4zceS8U3oY1elGewYokGOWGhaUxv5RapbIttlLtcHhDHa8JQQyKhHO4BK99+U
	3eJ32FXPRQJKqBHr2NPWMhl4QShe/pSFkHwVpfP1dltw4oo0AAUquH28OcSvGhN7W3y2eICx3FwaV
	osAVICheowFQ46MqzdXKt6RA/VFQTlTAAV4FYK21uhwizD/3atvQL0heDrT1U9yr9mHiSMKkfB245
	yP2YLXcNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljO8q-004OgK-KX; Wed, 19 May 2021 15:29:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljO8Z-004OcN-I0
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 15:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=N5oDKef5Tw90YKktAChc3BuhuB4OG2LUMjwkINxvuoQ=; b=WjV+MAwMJCL+GGmECGzQul75s8
 jeSHqS0OvUZVlEw2qqgIofshiTgLiNDl3VFf1oOk1JQOsdqZxrnbbUBp/BsXUsgVtPDLUO5vxfdz1
 q7VJabcViEAssL3tEQkS2ODHEJ1VYaWhQ9EEcV4NgNeJx7yH6tMHqPpll+A4NoGjgPEz/amRwxWkS
 KpWCHQW4qvQ0DjILQhgXrCRXflpTJ4ZWF8sPRJjMINmPplgi6J9qVb8rMpHpVeeB8ogiLQBxPwz56
 1tjiUl93aZLsDsKffmFtk0+PLLskx6J4zX0yrr78P7NyPKw4iBLIvEGi8L+VxfRLZ3mBwnhXmKKl7
 5JJipVzg==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ljO8S-00Facf-8c
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 15:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=N5oDKef5Tw90YKktAChc3BuhuB4OG2LUMj
 wkINxvuoQ=; b=YaaX28Xs1QIo9I7RDkJMf4Wnm4I8OnNxzmn+1pnaxtorpKG6HQ
 KY0P0+zkGb7G+cdGQaeRi2ofJ9uUulqi/X9v9otymK+Yko6/hf3Ol6t2gD368Iap
 p5UsGbsbVeBU7hd5MqhhOwgrkw6HxLXVRfESoVULOZ7bTGAZYdtjUoEj4=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3iNO+LqVgf7MDAQ--.1274S2; 
 Wed, 19 May 2021 23:29:02 +0800 (CST)
Date: Wed, 19 May 2021 23:23:41 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Fix W+X mappings at boot
Message-ID: <20210519232341.782bab6c@xhacker>
In-Reply-To: <35618c9a-acae-bc4f-e403-d06c0476166c@ghiti.fr>
References: <20210516170038.7de9c866@xhacker>
 <35618c9a-acae-bc4f-e403-d06c0476166c@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3iNO+LqVgf7MDAQ--.1274S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr1UKFWfJw13Jr1kAw4fZrb_yoW7XFWDpF
 W5JwnxCrW8tw1xGr9Fkry5Zr1jqr1UA3W3tr17AF1rZF1UGw1jqr18Jr4xWFyq93ykZFn3
 tryqv3yUKw4qyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_082924_977672_20D0A150 
X-CRM114-Status: GOOD (  26.54  )
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


On Tue, 18 May 2021 17:26:53 +0200
Alex Ghiti <alex@ghiti.fr> wrote:

> Hi Jisheng,

Hi Alex,

> 
> On 16/05/2021 11:00, Jisheng Zhang wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > When the kernel mapping was moved the last 2GB of the address space,
> > (__va(PFN_PHYS(max_low_pfn))) is much smaller than the .data section
> > start address, the last set_memory_nx() in protect_kernel_text_data()
> > will fail, thus the .data section is still mapped as W+X. This results
> > in below W+X mapping waring at boot. Fix it by passing the correct
> > .data section page num to the set_memory_nx().
> > 
> > [    0.396516] ------------[ cut here ]------------
> > [    0.396889] riscv/mm: Found insecure W+X mapping at address (____ptrval____)/0xffffffff80c00000
> > [    0.398347] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/ptdump.c:258 note_page+0x244/0x24a
> > [    0.398964] Modules linked in:
> > [    0.399459] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1+ #14
> > [    0.400003] Hardware name: riscv-virtio,qemu (DT)
> > [    0.400591] epc : note_page+0x244/0x24a
> > [    0.401368]  ra : note_page+0x244/0x24a
> > [    0.401772] epc : ffffffff80007c86 ra : ffffffff80007c86 sp : ffffffe000e7bc30
> > [    0.402304]  gp : ffffffff80caae88 tp : ffffffe000e70000 t0 : ffffffff80cb80cf
> > [    0.402800]  t1 : ffffffff80cb80c0 t2 : 0000000000000000 s0 : ffffffe000e7bc80
> > [    0.403310]  s1 : ffffffe000e7bde8 a0 : 0000000000000053 a1 : ffffffff80c83ff0
> > [    0.403805]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : 6c7e7a5137233100
> > [    0.404298]  a5 : 6c7e7a5137233100 a6 : 0000000000000030 a7 : ffffffffffffffff
> > [    0.404849]  s2 : ffffffff80e00000 s3 : 0000000040000000 s4 : 0000000000000000
> > [    0.405393]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffe000e7bd48
> > [    0.405935]  s8 : ffffffff81000000 s9 : ffffffffc0000000 s10: ffffffe000e7bd48
> > [    0.406476]  s11: 0000000000001000 t3 : 0000000000000072 t4 : ffffffffffffffff
> > [    0.407016]  t5 : 0000000000000002 t6 : ffffffe000e7b978
> > [    0.407435] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> > [    0.408052] Call Trace:
> > [    0.408343] [<ffffffff80007c86>] note_page+0x244/0x24a
> > [    0.408855] [<ffffffff8010c5a6>] ptdump_hole+0x14/0x1e
> > [    0.409263] [<ffffffff800f65c6>] walk_pgd_range+0x2a0/0x376
> > [    0.409690] [<ffffffff800f6828>] walk_page_range_novma+0x4e/0x6e
> > [    0.410146] [<ffffffff8010c5f8>] ptdump_walk_pgd+0x48/0x78
> > [    0.410570] [<ffffffff80007d66>] ptdump_check_wx+0xb4/0xf8
> > [    0.410990] [<ffffffff80006738>] mark_rodata_ro+0x26/0x2e
> > [    0.411407] [<ffffffff8031961e>] kernel_init+0x44/0x108
> > [    0.411814] [<ffffffff80002312>] ret_from_exception+0x0/0xc
> > [    0.412309] ---[ end trace 7ec3459f2547ea83 ]---
> > [    0.413141] Checked W+X mappings: failed, 512 W+X pages found
> > 
> > Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/mm/init.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 4faf8bd157ea..4c4c92ce0bb8 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -746,14 +746,18 @@ void __init protect_kernel_text_data(void)
> >   	unsigned long init_data_start = (unsigned long)__init_data_begin;
> >   	unsigned long rodata_start = (unsigned long)__start_rodata;
> >   	unsigned long data_start = (unsigned long)_data;
> > -	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> > +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> > +	unsigned long end_va = kernel_virt_addr + load_sz;
> > +#else
> > +	unsigned long end_va = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> > +#endif
> >   
> >   	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
> >   	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
> >   	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
> >   	/* rodata section is marked readonly in mark_rodata_ro */
> >   	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> > -	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> > +	set_memory_nx(data_start, (end_va - data_start) >> PAGE_SHIFT);
> >   }
> >   
> >   void mark_rodata_ro(void)
> >   
> 
> Thank you for taking the time to fix this, I had read a report here 
> https://github.com/starfive-tech/linux/issues/17 but had no time yet to 

I didn't know this github repo, in fact I don't have a beaglev board ;)
From the log, this is the same issue as I saw on Qemu.

> track this down.
> 
> Your fix seems good to me, but it intrigued me to see that for 32b 
> kernels, the whole linear mapping is mapped as executable and then here, 
> we remove this attribute. So I came up with a patch to map the kernel 
> correctly once at first time and avoid fixing this mapping afterwards. I 

Your solution looks better.

> added you in cc of this patch, any comment is welcome.
> 

I'm reading your patch. Will comment it soon.

Thanks



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
