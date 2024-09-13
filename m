Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A8FFA375E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54eDrChxIeR5gT79ATwUIkHO1y8qrK2d0PAp5c1wHes=; b=qM1QZwjTqKsgZ7
	z8gqsBjUqlirNTIywhzwkQ7bASrQyw9Fa3jBmT74KO5fmcrzmvJbTtiDsDyg4YwCMrV1VMr+q9/p1
	XJUNtDV6N6SJZz/ZCLqncthd21XBgFochGeEx1N0bOfz+PAmTW6s1ZanAMJS5o12aqR5P7PIBlgjr
	n2xM9RzthNgEx9uBOa4aTDL+c8oB5eKUhVJqlyNT6USiKeHwXmlWkwLfX5nuCjkWXYudMLn4HNptY
	DUDr9pYODtxWlcPAa5+ptphHgXKrOGsdogJLM26DkPuBzhi7h/exOv9J9WrWFjhnCY3zFiiA/JR6P
	tZPL7VoSJwRtoO3PhQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sp8Zn-0000000GTdv-3V1q;
	Fri, 13 Sep 2024 15:51:16 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sp8Zk-0000000GTdF-0PDW
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 15:51:13 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-277df202ca9so1291143fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726242670; x=1726847470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ehs9yLbkVlOBEgkAu8IxC2ecxN3bEC7UNanNZJEoFLs=;
        b=b6znDyN+OCEL4QLUvyYZHmWQIVMueQ6NqMacPU2Htbhr/TfFSFe1ybdTavkecutb2v
         NAHywYbxGiOGtd0Gki+UWtqRNdssPrqwr4fgYmDXjl3txDkF0Uqqw53LBUcPKV0ZWSkr
         BcK0Z9i0ojjYoDNoUbMQ/JYL6lD5908h73PLFFtv6kFOLBN5FYTthppnG5w0vOMm6o5G
         mZxlyfPjkC98xBjVC2j2d1gvvZpsDOvUqWJw+OImTwKfyR0kl8XelL/+eWMkn+92n9fS
         ReSUfoST/oCNoyA9UPkgG2q7macMf9skf87gdcIzNFp1UbIItqaf65fZ0v7ilPoGYSZF
         8lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726242670; x=1726847470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehs9yLbkVlOBEgkAu8IxC2ecxN3bEC7UNanNZJEoFLs=;
        b=s3RtH6i7W2PvwrcGMCCdI/OggR1PisErXrFmtj/YHrSoOaxoyxG774VIIolYb4IqlE
         Jfvv0xJTit0UIvZxq/Cp1FlX1P+enYaF1oSg40XJbxhXUqBWl7AiYC+cHvuhtJEMaTNB
         W5j7diBP/fJYr9Ku7BN5VTaoQQ6Uszs4GMS9+FCthLp8+FWhuSqOw3+wNaOwSrCRIpq7
         IRgMpp4AyI2COmWVVvwZP4GOXtzg+dcjJ4U8SmXPRX9YDrHG4gBIPcG+pS9j9p25YKRK
         SCO/MWSu1O7ZzKIWswY9lwWpb/8zIH9ZUhomGM+NQC2uLJQ6FG/17kxsfkthkbJQoStK
         T5bA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Kr62a6+Dh7i5+HjrSXIVKQdyxkLTpDqrpq9qHAfhJj1c1KeHyNhAHkkrt4WF0s6uX5sc16dUnE0Wlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuEOQg2oFPyiEgZFbAwA+37+JwSS/EQ67tvr8rPX2NRxucizJX
	drX9qIkp35mI0m1i5+BvfYN/frzHdiAkOh8IG0twF28yOVPOIGrP
X-Google-Smtp-Source: AGHT+IGwspwIdcxizms74BUEV11s0x25xQw3otEtykkXT6P5qLAwtjFU5Aef8TBprXa84EXBrlG8AA==
X-Received: by 2002:a05:6870:df92:b0:27c:475c:ab2c with SMTP id 586e51a60fabf-27c475cad93mr3175704fac.43.1726242670341;
        Fri, 13 Sep 2024 08:51:10 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-27ba40b0bb0sm3632948fac.41.2024.09.13.08.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 08:51:09 -0700 (PDT)
Message-ID: <5cc36aa7-e064-42b3-b52e-fb471d99d338@gmail.com>
Date: Fri, 13 Sep 2024 10:51:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/30] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
 palmer@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-2-debug@rivosinc.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240912231650.3740732-2-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_085112_177835_04C82E42 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, osalvador@suse.de, brauner@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/12/24 18:16, Deepak Gupta wrote:

> From: Mark Brown <broonie@kernel.org>
>
> Since multiple architectures have support for shadow stacks and we need to
> select support for this feature in several places in the generic code
> provide a generic config option that the architectures can select.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/x86/Kconfig   | 1 +
>  fs/proc/task_mmu.c | 2 +-
>  include/linux/mm.h | 2 +-
>  mm/Kconfig         | 6 ++++++
>  4 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 007bab9f2a0e..320e1f411163 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1957,6 +1957,7 @@ config X86_USER_SHADOW_STACK
>  	depends on AS_WRUSS
>  	depends on X86_64
>  	select ARCH_USES_HIGH_VMA_FLAGS
> +	select ARCH_HAS_USER_SHADOW_STACK
>  	select X86_CET
>  	help
>  	  Shadow stack protection is a hardware feature that detects function
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 5f171ad7b436..0ea49725f524 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -984,7 +984,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
>  		[ilog2(VM_UFFD_MINOR)]	= "ui",
>  #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
> -#ifdef CONFIG_X86_USER_SHADOW_STACK
> +#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
>  		[ilog2(VM_SHADOW_STACK)] = "ss",
>  #endif
>  #ifdef CONFIG_64BIT
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 147073601716..e39796ea17db 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -346,7 +346,7 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>  #endif /* CONFIG_ARCH_HAS_PKEYS */
>  
> -#ifdef CONFIG_X86_USER_SHADOW_STACK
> +#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
>  /*
>   * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
>   * support core mm.
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b72e7d040f78..3167be663bca 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1263,6 +1263,12 @@ config IOMMU_MM_DATA
>  config EXECMEM
>  	bool
>  
> +config ARCH_HAS_USER_SHADOW_STACK
> +	bool
> +	help
> +	  The architecture has hardware support for userspace shadow call
> +          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
> +
>  source "mm/damon/Kconfig"


Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>


>  
>  endmenu


Thanks, Carlos


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
