Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40416C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 15:27:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B795A61184
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 15:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B795A61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nov+zpZnPwO7pYQWyTzoZWNu4W4kYhpoq1yCd3JYpnw=; b=m2qv4awpVHA4tLG1pHIRd4baK
	ICsZGrGmJIt4inoka/wfIbVe8pH/YbB8NsPRCV+JCR8ii8Y8wkGBkrjldNkc9CwHRc9R2ZoxG/E3L
	fsY7+mK/RecRTRxMFA0AcfGau0Y78qxIwdS9WIAyR6yrq4hmHTnlXaFBD1FJJ2huCmGEaz8CXqCav
	+/XhIsM5uEHKvXu0cpDvHzocZsksTc6YOa0eY6YbgrFVmwCZOv5cruBH645jAuHf5Py7y9jG+sexf
	CbYU9LRTQZin+4uxz0lX6izXbiTveoo1vkXwDU1zqxWqoQHvGWQADOsO/1Zc5/t39pZqlNry2BXFL
	cWP5FbGfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1ch-001BEY-2P; Tue, 18 May 2021 15:27:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1cd-001BDy-Ln
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 15:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=rC/5YtNYSaXpZ+qkbyEYihxUsNdKgYrar+DKVOgk5vs=; b=PLwdpPU4CtxEYdHkt+RYQ3rmyW
 yNjJn+kXbCF9mJQLvCseHMUN6rEhe2lglUkPgdKTLFTyEWQ0yv7kt09iHNEIwYEx5NVx+9zG7ZH4f
 U4CTZ+H8TSdSVZD80eq09TWPU6coUHiGMuKEgji1bMIgRXSPOZMSeLjGWD/etiMRRtEZeIpBnby3a
 AblSxrIxI4mGQPaeCgCEsGlSvAzOYun9ztrRWfu9rdhe9LvXDlgFvOjO8zvojcfpPQt7K6IVrH3Xe
 1Gp/vS49SOJjIZgSIa29EaHHH3TdJ79e3nNLGBh+f5UvyoQN8FuAuhFz++lCJU8D+QDwOE4rYCGMf
 jP9udy6Q==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1ca-00Elbu-5K
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 15:27:02 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CB2CC100005;
 Tue, 18 May 2021 15:26:53 +0000 (UTC)
Subject: Re: [PATCH] riscv: mm: Fix W+X mappings at boot
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210516170038.7de9c866@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <35618c9a-acae-bc4f-e403-d06c0476166c@ghiti.fr>
Date: Tue, 18 May 2021 17:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516170038.7de9c866@xhacker>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_082700_516470_8DB3E804 
X-CRM114-Status: GOOD (  22.84  )
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

Hi Jisheng,

On 16/05/2021 11:00, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> When the kernel mapping was moved the last 2GB of the address space,
> (__va(PFN_PHYS(max_low_pfn))) is much smaller than the .data section
> start address, the last set_memory_nx() in protect_kernel_text_data()
> will fail, thus the .data section is still mapped as W+X. This results
> in below W+X mapping waring at boot. Fix it by passing the correct
> .data section page num to the set_memory_nx().
> 
> [    0.396516] ------------[ cut here ]------------
> [    0.396889] riscv/mm: Found insecure W+X mapping at address (____ptrval____)/0xffffffff80c00000
> [    0.398347] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/ptdump.c:258 note_page+0x244/0x24a
> [    0.398964] Modules linked in:
> [    0.399459] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1+ #14
> [    0.400003] Hardware name: riscv-virtio,qemu (DT)
> [    0.400591] epc : note_page+0x244/0x24a
> [    0.401368]  ra : note_page+0x244/0x24a
> [    0.401772] epc : ffffffff80007c86 ra : ffffffff80007c86 sp : ffffffe000e7bc30
> [    0.402304]  gp : ffffffff80caae88 tp : ffffffe000e70000 t0 : ffffffff80cb80cf
> [    0.402800]  t1 : ffffffff80cb80c0 t2 : 0000000000000000 s0 : ffffffe000e7bc80
> [    0.403310]  s1 : ffffffe000e7bde8 a0 : 0000000000000053 a1 : ffffffff80c83ff0
> [    0.403805]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : 6c7e7a5137233100
> [    0.404298]  a5 : 6c7e7a5137233100 a6 : 0000000000000030 a7 : ffffffffffffffff
> [    0.404849]  s2 : ffffffff80e00000 s3 : 0000000040000000 s4 : 0000000000000000
> [    0.405393]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffe000e7bd48
> [    0.405935]  s8 : ffffffff81000000 s9 : ffffffffc0000000 s10: ffffffe000e7bd48
> [    0.406476]  s11: 0000000000001000 t3 : 0000000000000072 t4 : ffffffffffffffff
> [    0.407016]  t5 : 0000000000000002 t6 : ffffffe000e7b978
> [    0.407435] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.408052] Call Trace:
> [    0.408343] [<ffffffff80007c86>] note_page+0x244/0x24a
> [    0.408855] [<ffffffff8010c5a6>] ptdump_hole+0x14/0x1e
> [    0.409263] [<ffffffff800f65c6>] walk_pgd_range+0x2a0/0x376
> [    0.409690] [<ffffffff800f6828>] walk_page_range_novma+0x4e/0x6e
> [    0.410146] [<ffffffff8010c5f8>] ptdump_walk_pgd+0x48/0x78
> [    0.410570] [<ffffffff80007d66>] ptdump_check_wx+0xb4/0xf8
> [    0.410990] [<ffffffff80006738>] mark_rodata_ro+0x26/0x2e
> [    0.411407] [<ffffffff8031961e>] kernel_init+0x44/0x108
> [    0.411814] [<ffffffff80002312>] ret_from_exception+0x0/0xc
> [    0.412309] ---[ end trace 7ec3459f2547ea83 ]---
> [    0.413141] Checked W+X mappings: failed, 512 W+X pages found
> 
> Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4faf8bd157ea..4c4c92ce0bb8 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -746,14 +746,18 @@ void __init protect_kernel_text_data(void)
>   	unsigned long init_data_start = (unsigned long)__init_data_begin;
>   	unsigned long rodata_start = (unsigned long)__start_rodata;
>   	unsigned long data_start = (unsigned long)_data;
> -	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> +	unsigned long end_va = kernel_virt_addr + load_sz;
> +#else
> +	unsigned long end_va = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> +#endif
>   
>   	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
>   	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
>   	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
>   	/* rodata section is marked readonly in mark_rodata_ro */
>   	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> -	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> +	set_memory_nx(data_start, (end_va - data_start) >> PAGE_SHIFT);
>   }
>   
>   void mark_rodata_ro(void)
> 

Thank you for taking the time to fix this, I had read a report here 
https://github.com/starfive-tech/linux/issues/17 but had no time yet to 
track this down.

Your fix seems good to me, but it intrigued me to see that for 32b 
kernels, the whole linear mapping is mapped as executable and then here, 
we remove this attribute. So I came up with a patch to map the kernel 
correctly once at first time and avoid fixing this mapping afterwards. I 
added you in cc of this patch, any comment is welcome.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
