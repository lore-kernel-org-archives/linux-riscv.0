Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99BBC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vem713hC3cgMyR9DA6TmjpzoQ4EmODwSPbwuhyYQmNk=; b=cp5NO+B2Yw0ui4
	WdwAlT00ctuAg35xmt6mx25ArbZBknUfme2UJjpm2N7ifYFpu4I2Sg5P+ojyON1/zwSnHWkepbGkw
	/pqOxc74npxAddldH4CipdHgv/Gu9VOAXjSW7PE0+xB26GKVF+7mX3IPouvp/2oBE7Z2HXyDY5mI+
	FcfzvXFW574so71p6Vh6piV09r/5JT8a+fqMlqp/u2ns7tuEhxIMo/ynrMPsz06i6qdeG3iwn4wiE
	gOtVlrWdjDCqJn9miWjmPSSmnuCsgaMf6MUSVmRtVT5J+numJcCCbj+J+Cp4HzpUpBn+opZReZ3bx
	lSF+GLao/qx1I+tAnfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshdu-00CTWi-3q; Wed, 09 Nov 2022 09:45:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshdr-00CTW9-BK
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 09:45:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id f27so45188995eje.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 01:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7BBB8xDOLrGj/n4axVE8aotQ6PZ5hPRMhS37GmQebc=;
        b=F3rkkRm3j93Q8U75DVkZplGIZM1Qb4y4/V9UgyDd6ptsi2lOEtjbMQ28O9BVGB+9Kh
         xMJOU6odQp9x90Uj9rqWswE2TWmdc/roHyEBMNTWBhqPpKPwHDuth/1v3U8vYwqt24II
         4gYJVrCZ0qnJRbWBb3RKXT3H3/ewZkBUSV80505yz4cZQKi0GzFN52vW8+772lnoGgXk
         AFzOdDmK0ksZwUDH+gZsWDdapGtdqbMRao5VXnqHsJsedca35SWwhmKKNigQIHXcuDns
         7mVEpvPvMsjCufsPz9xKshKpiNsVxml8Tz6tXH2787XbQCh8poI4koFVYwDLXh2o1Ldy
         wr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7BBB8xDOLrGj/n4axVE8aotQ6PZ5hPRMhS37GmQebc=;
        b=iWYIFSEikKbJyW2skKZE/OzZyQw0xJ/7TWVGuZ+jTrNMykVxsE9bC1ymNFk20FwlN6
         CN49/STp0AdgkF6XCvquwv1y5NILCilUsoshsPNdE3WhP+RPpLaMv5QLk8RY4DGRHXpK
         Cwqyy8MAbmCabGL2pWsIVCuOztK5hPuxjPlYm5zNiM2zMLquQhhRpk3amVYnniO/Kb7+
         9nBJI3Q7b4SyKGkpMaaIskP7z98ezzYCFyF05T5oVh3zmOZSAaahT47CFivR42SPHH10
         4etPo6NTXE4A0DpOCwbkIzesm4ioSL/l9mt3+TGwWWW8itKTqphkXrhMHrA+QkSrawJo
         QuOA==
X-Gm-Message-State: ACrzQf2rKQnr8po9XDUJnfta2stiwsD+5Y3//zz9Qq5R8HY36xpO1y9H
	fEUfD/2aFsjPOWaH+QozF4+cKA==
X-Google-Smtp-Source: AMsMyM67nR588kSiTkXHLgYbNV6kCB/3fTnqmrT3/NO+XYHDzfWGjLpLtL5jjixuBm7zx7+6Xr3Tfg==
X-Received: by 2002:a17:907:1c10:b0:791:a716:5089 with SMTP id nc16-20020a1709071c1000b00791a7165089mr56502644ejc.672.1667987105057;
        Wed, 09 Nov 2022 01:45:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id i28-20020a1709067a5c00b007add62dafbasm5712541ejo.157.2022.11.09.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 01:45:04 -0800 (PST)
Date: Wed, 9 Nov 2022 10:45:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V2] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <20221109094503.he4ihaow7axjseuj@kamzik>
References: <20221109054056.3618089-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109054056.3618089-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_014507_437482_05352623 
X-CRM114-Status: GOOD (  31.78  )
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

On Wed, Nov 09, 2022 at 12:40:56AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> After use_asid_allocator is enabled, the userspace application will
> crash by stale TLB entries. Because only using cpumask_clear_cpu without
> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> Then set_mm_asid would cause the user space application to get a stale
> value by stale TLB entry, but set_mm_noasid is okay.
> 
> Here is the symptom of the bug:
> unhandled signal 11 code 0x1 (coredump)
>    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
>    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> (gdb) i r s0
> s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> (gdb) x /2x 0x3fd6d92490
> 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> The core dump file shows that register s0 is wrong, but the value in
> memory is correct. Because 'ld s0, -148(s0)' used a stale mapping entry
> in TLB and got a wrong result from an incorrect physical address.
> 
> When the task ran on CPU0, which loaded/speculative-loaded the value of
> address(0x3fd6d92490), then the first version of the mapping entry was
> PTWed into CPU0's TLB.
> When the task switched from CPU0 to CPU1 (No local_tlb_flush_all here by
> asid), it happened to write a value on the address (0x3fd6d92490). It
> caused do_page_fault -> wp_page_copy -> ptep_clear_flush ->
> ptep_get_and_clear & flush_tlb_page.
> The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need TLB
> flush, but CPU0 had cleared the CPU0's mm_cpumask in the previous
> switch_mm. So we only flushed the CPU1 TLB and set the second version
> mapping of the PTE. When the task switched from CPU1 to CPU0 again, CPU0
> still used a stale TLB mapping entry which contained a wrong target
> physical address. It raised a bug when the task happened to read that
> value.
> 
> The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
> which could prevent losing pieces of stuff during TLB flush.
> 
> Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes in v2:
>  - Fixup nommu compile problem (Thx Conor, Also Reported-by: kernel
>    test robot <lkp@intel.com>)
>  - Keep cpumask_clear_cpu for noasid
> ---
>  arch/riscv/mm/context.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..f58e4b211595 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -317,7 +317,11 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	 */
>  	cpu = smp_processor_id();
>  
> -	cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +#ifdef CONFIG_MMU
> +	if (!static_branch_unlikely(&use_asid_allocator))
> +#endif

That's not very pretty. Can't we just do the following, instead?

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..ace419761e31 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -16,10 +16,11 @@
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>

-#ifdef CONFIG_MMU

 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);

+#ifdef CONFIG_MMU
+
 static unsigned long asid_bits;
 static unsigned long num_asids;
 static unsigned long asid_mask;


Thanks,
drew

> +		cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +
>  	cpumask_set_cpu(cpu, mm_cpumask(next));
>  
>  	set_mm(next, cpu);
> -- 
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
