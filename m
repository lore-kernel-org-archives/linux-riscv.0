Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3422C32792
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 17:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGfyYUjlX8r9KOGibFd6N44MPhSLjIaUAsWlxOlSYls=; b=izEsfK5crDM2/2
	SYoKFDVm6CtkUhFRLQUnJ68mvgCfxbjRWu9fpwjAcL60N+fJR06ANf+cVHpltD/VaRlVyj5iw551e
	KL9WGiwC2kEoIA9ufNO77R1n60MISGkqGPbasOGT1NL1vyw08U7eWR8Ts3k50q9dsDfT0BdqGqURP
	5UjhKImMgBltigiRLdQMwg55NVKemK9E5+krYZGJnqt12QTQM1pwYoepSxGier/B2KXflDmHFaz2y
	C2h2SojRg5vsCt6etRy/qEtOQIQQw0reWrtSti+UUmy70qRYMr6baMy9k8XzD+E88H1oiXe5sMM53
	RE0PQ2IZe+GF2/5GjE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQuKH-00Es5L-I0; Wed, 24 Aug 2022 17:38:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQuKE-00Es19-Qk
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 17:38:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oQuK8-0004fc-7E; Wed, 24 Aug 2022 19:37:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>, panqinglin2020@iscas.ac.cn
Subject: Re: [PATCH v4 1/4] mm: modify pte format for Svnapot
Date: Wed, 24 Aug 2022 19:37:51 +0200
Message-ID: <2836902.KlZ2vcFHjT@diego>
In-Reply-To: <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn> <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_103758_939105_D846591B 
X-CRM114-Status: GOOD (  22.19  )
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

Hi,

Am Montag, 22. August 2022, 17:34:10 CEST schrieb panqinglin2020@iscas.ac.cn:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This commit adds two erratas to enable/disable svnapot support, patches code
> dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT
> compile option is set. It will influence the behavior of has_svnapot
> function and pte_pfn function. All code dependent on svnapot should make
> sure that has_svnapot return true firstly.
> 
> Also, this commit modifies PTE definition for Svnapot, and creates some
> functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> PTE. Until now, only 64KB napot size is supported in draft spec, so some
> macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..c43708ae7f38 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,6 +432,13 @@ config FPU
>  
>  	  If you don't know what to do here, say Y.
>  
> +config SVNAPOT

as Connor already wrote, please make this RISCV_ISA_SVNAPOT,
and maybe also move it upwards a bit so that we get some sorting going
for all the extensions :-) .


> +	bool "Svnapot support"
> +	default n
> +	help
> +	  Select if your CPU supports Svnapot and you want to enable it when
> +	  kernel is booting.


please make this a bit more verbose, something like:

  Add support to dynamically detect the presence of the SVNAPOT
  ISA-extension (Supervisor-mode: NAPOT Translation Contiguity)
  and enable its usage.

[plus add a paragraph explaining what SVNAPOT helps with]


>  endmenu # "Platform type"
>  
>  menu "Kernel features"
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 19a771085781..f22723174cd9 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -22,7 +22,8 @@
>  
>  #define	CPUFEATURE_SVPBMT 0
>  #define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> +#define	CPUFEATURE_SVNAPOT 2
> +#define	CPUFEATURE_NUMBER 3
>  
>  #ifdef __ASSEMBLY__
>  
> @@ -142,6 +143,27 @@ asm volatile(ALTERNATIVE_2(						\
>  	    "r"((unsigned long)(_start) + (_size))			\
>  	: "a0")
>  
> +#define ALT_SVNAPOT(_val)						\
> +asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,				\
> +		CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
> +		: "=r"(_val) :)
> +
> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
> +asm(ALTERNATIVE("and %0, %1, %2\n\t"					\
> +		"srli %0, %0, %3\n\t"					\
> +		"nop\n\tnop\n\tnop",					\

using the new-ish __nops macro might make this a tad nicer to read, see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/include/asm/errata_list.h#n122

> +		"srli t3, %1, %4\n\t"					\
> +		"and %0, %1, %2\n\t"					\
> +		"srli %0, %0, %3\n\t"					\
> +		"sub  t4, %0, t3\n\t"					\
> +		"and  %0, %0, t4",					\
> +		0, CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
> +		: "+r"(_val)						\
> +		: "r"(_val),						\
> +		  "r"(_pfn_mask),					\
> +		  "i"(_pfn_shift),					\
> +		  "i"(_napot_shift))
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..e4c7ce5a7e1a 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,7 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
> +	RISCV_ISA_EXT_SVNAPOT,

that list is only a kernel-internal list, so we can probably keep some
sorting for extensions.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
