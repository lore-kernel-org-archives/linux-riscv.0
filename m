Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58901C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 01:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZKgJRLQRyR9Wwi0FN5YeJpXFC03ZZorT2JnlkZzhY48=; b=zZ8Hhu/Bg1Fwbkz+40dAL/hPAc
	2dkz+DwCMSy6sZjKK2k9enMssumj9hHpkI9oUffFvhGmgn3uFjCQIfs3/uHkbTgbyPV0EN57GK08m
	hNJrzhFXxBBBl16SVGXPcxQwlpjLKlBLhuHxTd0nfDqIBKmd+brJdTXIA9Z5cLVzfSieoGwIhuO8A
	F3taTyjpIVaD++gBfQwF8Ekz9wzQV4KuC9AXXHRsJA2F6OUJeCX24CXyO7U8fMogoqBEO5qZlKep5
	I6ZhWd1wKqts66Cvg6xgAdGKPqgFgsUdM8qYdbMUSyLhVPSaCD1rC2O+3WN9/FzeQ2jrtGVMNjUPS
	IHbZ06bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMghH-00C9nI-NL; Wed, 23 Feb 2022 01:44:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMgg7-00C99b-Qz
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 01:42:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c9so5343929pll.0
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 17:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sgQ4pvXgGqOVO+N8moxatmc5jwRe/+fI7Xu5f8+JqZo=;
 b=KgXpJPPMQwH9w8gozOo+zTZ1a384KP+JFjDoioBZIi6s8smONJs4TyFo+kGbejpfJD
 AnUvVpcCwYJXDkegOkRKwenDm9Bcy1n1aQgGolNklkCPtpDxRjodlPh8ROfIoqqQGWgw
 wc1Z3UQMXWImfkfneDskrMp1PLZpvMb2xrw9QAWiCjPSyKH5ztHVZbroTQ6dmTqG6Lc2
 A4xkJ+LfVum26Hb76lucaasDCRzDWvpeo7LmSfqxJdE8LUVUlFGq9YldMUlujQM5YwMQ
 6E9ukyeoRGTs5m/d/477F+RzD75Ilmmnh/nact1JsbYH8PJzUdJ7E9F83aVz2wOyHISi
 mxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sgQ4pvXgGqOVO+N8moxatmc5jwRe/+fI7Xu5f8+JqZo=;
 b=xgbgFGtk4iJzg9fakQOuHYDCld19ojzWCyuHRwLEKWANXMlC9w7xOf6ykk9j+GzxU4
 5jds387jXg8GsBr0b6fouh7sbdUiXEOMxSxHFPjxduLCDNOvwJBHDVM8CUXAVYcXG8Ho
 cqMNPxdpqe6UyvdHy1fv2ZOTTr7nKC4YJ3TbETeTz+f1HzV5e0z0JcyrM+B0PDcD5Nv0
 R8hZeByVUDqIZkVph9X9+8kFPYE5OI5mSdLX5HHyLMMozLKWvS8BzEYryzH0IseKWXhd
 j3TzzKg42MeZouBOkOxgEXRRvQYoXxbfRx9Btbuz7nY02GHs9noRJZmPzntrrr2/lhQm
 jp9g==
X-Gm-Message-State: AOAM530mLBQ3USmJgwLkP5Llgdlo6YWjQazfkdCHYS3AF0of99GqUxaQ
 CK1UgfrWnTIasuCPVR/ZEm+qxA==
X-Google-Smtp-Source: ABdhPJxkNmlCxKcZY6Nd/iFQ4JtJcxqvcyi1rl2zS5ckqmSSgYGC4lT0zZsv8apBv/K5LTxvkvT3FA==
X-Received: by 2002:a17:90b:197:b0:1bc:5037:7c52 with SMTP id
 t23-20020a17090b019700b001bc50377c52mr6928726pjs.174.1645580570678; 
 Tue, 22 Feb 2022 17:42:50 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id o125sm17941244pfb.116.2022.02.22.17.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:50 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:50 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:31:01 PST (-0800)
Subject: Re: [PATCH V5 12/21] riscv: compat: syscall: Add entry.S
 implementation
In-Reply-To: <20220201150545.1512822-13-guoren@kernel.org>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org,
 Greg KH <gregkh@linuxfoundation.org>, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, 
 wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 x86@kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-27e65ada-d969-45b9-aa94-e69469cdf095@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_174251_900503_7321F6B8 
X-CRM114-Status: GOOD (  18.64  )
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

On Tue, 01 Feb 2022 07:05:36 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement the entry of compat_sys_call_table[] in asm. Ref to
> riscv-privileged spec 4.1.1 Supervisor Status Register (sstatus):
>
>  BIT[32:33] = UXL[1:0]:
>  - 1:32
>  - 2:64
>  - 3:128
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/include/asm/csr.h |  7 +++++++
>  arch/riscv/kernel/entry.S    | 18 ++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index ae711692eec9..eed96fa62d66 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -36,6 +36,13 @@
>  #define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
>  #endif
>
> +#ifdef CONFIG_COMPAT
> +#define SR_UXL		_AC(0x300000000, UL) /* XLEN mask for U-mode */
> +#define SR_UXL_32	_AC(0x100000000, UL) /* XLEN = 32 for U-mode */
> +#define SR_UXL_64	_AC(0x200000000, UL) /* XLEN = 64 for U-mode */
> +#define SR_UXL_SHIFT	32
> +#endif
> +
>  /* SATP flags */
>  #ifndef CONFIG_64BIT
>  #define SATP_PPN	_AC(0x003FFFFF, UL)
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ed29e9c8f660..1951743f09b3 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -207,13 +207,27 @@ check_syscall_nr:
>  	 * Syscall number held in a7.
>  	 * If syscall number is above allowed value, redirect to ni_syscall.
>  	 */
> -	bgeu a7, t0, 1f
> +	bgeu a7, t0, 3f
> +#ifdef CONFIG_COMPAT
> +	REG_L s0, PT_STATUS(sp)
> +	srli s0, s0, SR_UXL_SHIFT
> +	andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
> +	li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
> +	sub t0, s0, t0
> +	bnez t0, 1f
> +
> +	/* Call compat_syscall */
> +	la s0, compat_sys_call_table
> +	j 2f
> +1:
> +#endif
>  	/* Call syscall */
>  	la s0, sys_call_table
> +2:
>  	slli t0, a7, RISCV_LGPTR
>  	add s0, s0, t0
>  	REG_L s0, 0(s0)
> -1:
> +3:
>  	jalr s0
>
>  ret_from_syscall:

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
