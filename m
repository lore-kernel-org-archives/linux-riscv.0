Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA4C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 00:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B16860FDC
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 00:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B16860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=W5geKp+FzpHiaLFXCILvfHlYGxnDfuJiWF/qrxSJu80=; b=qLLhNYF1DIrEIGAcEWW3KWEEL3
	ZOUEOnVfj56t5nX2HNfbwbQ6Gvc+95JqEyWgAuQce30RWf7dULLfDlJjV6h1inGnvsZhsTufC3057
	BGPdW4S1SE0v/mjtDl8YEOLVHu2uB4q6lyfMP/Bnavg8cfLUobN91JzBTwjjIRvJJ+/NmaAIQgwdm
	UYZziaDCMbOswS2eSFHdEUPcZuaZV7+Zf1oArWwKnk3ysbpl/SPbO8lsBwVE40h0M91j08QXEwe1f
	mp+OM9i9DCJ1BdimDzujp75ymJASowJWm6H8ZsuETJJ3v+aPr1CV4x2yxgEntQJ+08bCZAm7Btd6q
	CA9An10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdvk-0019Md-Ir; Fri, 08 Oct 2021 00:40:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdvh-0019M6-N0
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 00:40:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso7727705pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CiJdBQLxWVV52n6YDRHOz0BpzyfN8Kd3tB41suXFSBk=;
 b=WT2eany3SCBNcar+N4ql4I+fGUoIsWuPTI6TXJKJ+ppRlYj5rpN4G1UUSa94Ez8dL4
 mZ3CrbRYJvNmOnGq9PB//pmZCWHOXkw/2NvuXqRmppiioU6/v5YvjgoGGzs1Ki54o+td
 +jsb7MMU9hwrz0FTbdRYYLfnqmJF5/k4hXqJobEKmvoo2h2aCDBmf0q5wGQ5Z9I6cGeA
 7CHdH0bcTO/Fla1MavXJijo18EqsIptWMtJ5vqmL8nG8IUv+adpa77R0kkbXaGZj+AiF
 3slaLnBRys3+DkUIAHqV5CmqXu8/PshB3DwhoSwDF4dwujFOmVPahFQ2eaQlToHS8dE5
 j8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CiJdBQLxWVV52n6YDRHOz0BpzyfN8Kd3tB41suXFSBk=;
 b=kQCWgfkqJKMZP2hWyv32wlEYKgDFwO4YfEHxkx0DXDx3emXpru9IkEiww4Vf7cmSce
 UoLi9mnFRfpPf1O3C1mRuHCqj65YEhgNTFSfJ0zuP0QjDUU5kCAr8DROPBTiAlAgAGgL
 g2pW2LU39Fdbh0mF5vSAUU9j2szRfj9GZgMhw4LACuWTXB7t7Lr6hsbG1H1omgWI9JUY
 SZXBjdc5HA3s11fQP3KYe0wp3/6C7XEFKnwK6x5EDjziJuF345VLib8bNN/UxzFsESxd
 RO9PpLomcJAoQbjKnC3DYQBdWYBQwOCC12e44saSk3InwykoYUMUe3XUbHO6/CVwcBV0
 H5JA==
X-Gm-Message-State: AOAM533iD6Goq+PXd9ku+SQaOUAlaWcnZ4/2DmJCpLi5ZuVuqC3gpbNh
 qJ81f1FHN6mSA/qjvz2CsQngnhXSmbR6iQ==
X-Google-Smtp-Source: ABdhPJycovvqtyRMvee5ON0mJKq/edruYWJVRTzYNc8JAVMsB4fbhKy68Hpl7eBFaEy7LPECJU/8rA==
X-Received: by 2002:a17:90b:1a84:: with SMTP id
 ng4mr8432175pjb.80.1633653601744; 
 Thu, 07 Oct 2021 17:40:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z11sm9727350pjn.12.2021.10.07.17.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 17:40:01 -0700 (PDT)
Date: Thu, 07 Oct 2021 17:40:01 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Oct 2021 17:37:13 PDT (-0700)
Subject: Re: [PATCH] riscv: Flush current cpu icache before other cpus
In-Reply-To: <20210918160221.111902-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-24d30083-a545-447b-a54c-d0bbb5d67c7a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_174005_873319_F900108B 
X-CRM114-Status: GOOD (  22.68  )
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

On Sat, 18 Sep 2021 09:02:21 PDT (-0700), alex@ghiti.fr wrote:
> On SiFive Unmatched, I recently fell onto the following BUG when booting:
>
> [    0.000000] ftrace: allocating 36610 entries in 144 pages
> [    0.000000] Oops - illegal instruction [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.1+ #5
> [    0.000000] Hardware name: SiFive HiFive Unmatched A00 (DT)
> [    0.000000] epc : riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000]  ra : __sbi_rfence_v02+0xc8/0x10a
> [    0.000000] epc : ffffffff80007240 ra : ffffffff80009964 sp : ffffffff81803e10
> [    0.000000]  gp : ffffffff81a1ea70 tp : ffffffff8180f500 t0 : ffffffe07fe30000
> [    0.000000]  t1 : 0000000000000004 t2 : 0000000000000000 s0 : ffffffff81803e60
> [    0.000000]  s1 : 0000000000000000 a0 : ffffffff81a22238 a1 : ffffffff81803e10
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : ffffffff8000989c a7 : 0000000052464e43
> [    0.000000]  s2 : ffffffff81a220c8 s3 : 0000000000000000 s4 : 0000000000000000
> [    0.000000]  s5 : 0000000000000000 s6 : 0000000200000100 s7 : 0000000000000001
> [    0.000000]  s8 : ffffffe07fe04040 s9 : ffffffff81a22c80 s10: 0000000000001000
> [    0.000000]  s11: 0000000000000004 t3 : 0000000000000001 t4 : 0000000000000008
> [    0.000000]  t5 : ffffffcf04000808 t6 : ffffffe3ffddf188
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000002
> [    0.000000] [<ffffffff80007240>] riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000] [<ffffffff80009474>] sbi_remote_fence_i+0x1e/0x26
> [    0.000000] [<ffffffff8000b8f4>] flush_icache_all+0x12/0x1a
> [    0.000000] [<ffffffff8000666c>] patch_text_nosync+0x26/0x32
> [    0.000000] [<ffffffff8000884e>] ftrace_init_nop+0x52/0x8c
> [    0.000000] [<ffffffff800f051e>] ftrace_process_locs.isra.0+0x29c/0x360
> [    0.000000] [<ffffffff80a0e3c6>] ftrace_init+0x80/0x130
> [    0.000000] [<ffffffff80a00f8c>] start_kernel+0x5c4/0x8f6
> [    0.000000] ---[ end trace f67eb9af4d8d492b ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>
> While ftrace is looping over a list of addresses to patch, it always failed
> when patching the same function: riscv_cpuid_to_hartid_mask. Looking at the
> backtrace, the illegal instruction is encountered in this same function.
> However, patch_text_nosync, after patching the instructions, calls
> flush_icache_range. But looking at what happens in this function:
>
> flush_icache_range -> flush_icache_all
>                    -> sbi_remote_fence_i
>                    -> __sbi_rfence_v02
>                    -> riscv_cpuid_to_hartid_mask
>
> The icache and dcache of the current cpu are never synchronized between the
> patching of riscv_cpuid_to_hartid_mask and calling this same function.
>
> So fix this by flushing the current cpu's icache before asking for the other
> cpus to do the same.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/mm/cacheflush.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 094118663285..89f81067e09e 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -16,6 +16,8 @@ static void ipi_remote_fence_i(void *info)
>
>  void flush_icache_all(void)
>  {
> +	local_flush_icache_all();
> +
>  	if (IS_ENABLED(CONFIG_RISCV_SBI))
>  		sbi_remote_fence_i(NULL);
>  	else

Thanks, this is on fixes (with the tags for stable)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
