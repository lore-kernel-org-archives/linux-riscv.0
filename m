Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79215CD1288
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTIGfz5hhS2W72pSSurpsxx0Jj31Y6K95rK7o9oZE8o=; b=0eWGgydN7Pea9G
	g5L3SIUWnuAX4eepazcsO8xMDUk9p/ggpUG4dFkWJRlc0h5ABfupfBWPMy+8irCShRt2n6PInDbi5
	7xYo0A4FEhJGTuFMoI3NCMkCsNCsxxUPMJ6LW+Za96KVU8K/oG/iUHa+jKvDQcYaOO559hUqXPBjM
	QlSprUxFgh8n+ovO2DfY5q/q7A0+IqbkH3v7f/+knVxoVlud0pIfKIJNBf2NedzmRqV6nAxFOTyVn
	WBBsxQzWjYKqPtclTL043GZ/klEAZQbLarObuijM11qMB2f8EzyLc9GwlOfwcixsZsR1AWAzzhAI3
	Tp6R9paHKLYCu0SZXWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqVoO-00000003FZY-2a4P;
	Sat, 30 Mar 2024 10:19:44 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqVoK-00000003FYj-21HO
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 10:19:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V6Ctj1f98z4f3kp4
	for <linux-riscv@lists.infradead.org>; Sat, 30 Mar 2024 18:19:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 594351A0232
	for <linux-riscv@lists.infradead.org>; Sat, 30 Mar 2024 18:19:29 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgCXug0s5wdmXWTTIg--.19989S2;
	Sat, 30 Mar 2024 18:19:25 +0800 (CST)
Message-ID: <95e1978f-341c-4de5-a665-e057fe97a060@huaweicloud.com>
Date: Sat, 30 Mar 2024 18:19:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Stefan O'Rear <sorear@fastmail.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Manu Bretelle <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <20240329-linguini-uncured-380cb4cff61c@wendy>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20240329-linguini-uncured-380cb4cff61c@wendy>
X-CM-TRANSID: Syh0CgCXug0s5wdmXWTTIg--.19989S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4UGFW5XF4UXrWDGFW5GFg_yoWrtF4DpF
	WfKF1xKFn7Jw1fZ393Xw18Wr1093Z7Kw43GrykG34Fy343ur1xGw1qy3ZrXFyDZrn3Gr1a
	v390gF1q93WUCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_031940_910899_B0C1564E 
X-CRM114-Status: GOOD (  33.40  )
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

Thanks for the clarification, looks good.

On 2024/3/29 19:23, Conor Dooley wrote:
> On Thu, Mar 28, 2024 at 10:07:23PM +0000, Conor Dooley wrote:
> 
>> As I said on IRC to you earlier, I think the Kconfig options here are in
>> need of a bit of a spring cleaning - they should be modified to explain
>> their individual purposes, be that enabling optimisations in the kernel
>> or being required for userspace. I'll try to send a patch for that if
>> I remember tomorrow.
> 
> Something like this:
> 
> -- >8 --
> commit 5125504beaedd669b082bf74b02003a77360670f
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Fri Mar 29 11:13:22 2024 +0000
> 
>      RISC-V: clarify what some RISCV_ISA* config options do
>      
>      During some discussion on IRC yesterday and on Pu's bpf patch [1]
>      I noticed that these RISCV_ISA* Kconfig options are not really clear
>      about their implications. Many of these options have no impact on what
>      userspace is allowed to do, for example an application can use Zbb
>      regardless of whether or not the kernel does. Change the help text to
>      try and clarify whether or not an option affects just the kernel, or
>      also userspace. None of these options actually control whether or not an
>      extension is detected dynamically as that's done regardless of Kconfig
>      options, so drop any text that implies the option is required for
>      dynamic detection, rewording them as "do x when y is detected".
>      
>      Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>      ---
>      I did this based on top of Samuel's changes dropping the MMU
>      requurements just in case, but I don't think there's a conflict:
>      https://lore.kernel.org/linux-riscv/20240227003630.3634533-4-samuel.holland@sifive.com/
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8a777f59402..f327a8ac648f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -501,8 +501,8 @@ config RISCV_ISA_SVNAPOT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension when it is detected by
> +	  the kernel at boot.
>   
>   	  The Svnapot extension is used to mark contiguous PTEs as a range
>   	  of contiguous virtual-to-physical translations for a naturally
> @@ -520,9 +520,9 @@ config RISCV_ISA_SVPBMT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) when it is detected by the kernel at
> +	   boot.
>   
>   	   The memory type for a page contains a combination of attributes
>   	   that indicate the cacheability, idempotency, and ordering
> @@ -541,14 +541,15 @@ config TOOLCHAIN_HAS_V
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>   	depends on TOOLCHAIN_HAS_V
>   	depends on FPU
>   	select DYNAMIC_SIGFRAME
>   	default y
>   	help
>   	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> @@ -606,8 +607,8 @@ config RISCV_ISA_ZBB
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>   
>   	   The Zbb extension provides instructions to accelerate a number
>   	   of bit-specific operations (count bit population, sign extending,
> @@ -623,9 +624,9 @@ config RISCV_ISA_ZICBOM
>   	select RISCV_DMA_NONCOHERENT
>   	select DMA_DIRECT_REMAP
>   	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>   
>   	   The Zicbom extension can be used to handle for example
>   	   non-coherent DMA support on devices that need it.
> @@ -684,7 +685,8 @@ config FPU
>   	default y
>   	help
>   	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
