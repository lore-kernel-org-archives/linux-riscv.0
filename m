Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAE8C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPT0fxqIOXuqkmjvukVyg9N9eoZWtzRNRrpyJQDnaSI=; b=aU1E9ex32/+7Dx
	ky8RhUmimwu0EEg0GebJfAnT4U7xNqEHmEWrVf/2FiVeCsz28eVYmnuEesFAbZW+Gl4Vp+kT9T95B
	ILBebTN7rslg7kIl+8UB6f8lNmOey30H+rQt6BNpy1RZAPSRspLMI42PhQ/29EoCVa47F1l3jJOUX
	6sE5p176AryFI2mrmQX+ofO5zIb7uR7JCWnzC9yZDYp0hKHf9APUSu/RKVFh52B7OS6sjWZ29iNp5
	LlcTf9TsXcCDXAiQEC8+hvCT1Znh48Nn0SPiHkyZLz0EW1DMkpAi9SOU9dUvXvksQfVCDt3cMCwW9
	D1F+g9G4xnrohDEgZQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEFj-005PZm-1Y;
	Mon, 04 Dec 2023 19:05:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEFc-005PYF-1l
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 19:05:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04dba2781so20493695ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701716703; x=1702321503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WnV955wezI/faXxHbJEEhr+rw1fOAIjutAuKojl0JeQ=;
        b=b/fZQDsFtcsvufuU8kYHl48ymwm9EIPhbDVQzwo3Rxxjq2HSO2s5UQyG8swEkIS83v
         FGXihOItey31Hy1IcwfK/s04pysFd8BdgZMUlEzFuAhgwRWWbuP/zoa+azGtt8/hDMlB
         CRKr3fLD5CEE2ByDbS8cMbxk3Jp/aUeMV9FI2skvJ/2lcY3sIONzFISD8VxbvfLkulvl
         zNWlSbziiJlkqNTIK8aUwR2cf7+INNgFmHdxeAMkt5MUF343CBAUZk00ArF8zOSo7+6M
         wYKK3v//UKxOl2iRIfQe91ZCOlgNHjR44f7lLZc4dNI2pEAWYNhdxa+vN7x9pik5XXpw
         lfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716703; x=1702321503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnV955wezI/faXxHbJEEhr+rw1fOAIjutAuKojl0JeQ=;
        b=MYghdnyzULPU+NgPI3yjMgfDiyJ54+Y+S44Erpn9fNYZiG3QMY+mdbaxZF6DebOmkS
         zdKUHE2F5+u9PcQX5UwauNLpijx+eRi8mjfh85f3p/uqA8eUGTdrpAS8Ww144ZuXPKeO
         R4tkI9Mu5whEUfSxofYffbKP0n0RhF9YPaviquh4ZoDp+NT0SvuvJX5lnqs5CwVQxqUW
         wmZCbACVPE5h75sOM21MeRDxCVty9dnh03pyCQt6efEMcBAaK3CQf2zuQCqUD/8whw9g
         AowObZ1a12zqkYAIVydvowikNkelQhU0wfSsePppgRYJrjIlhXBa8Bl68nJL3Rz6VWC2
         pkNA==
X-Gm-Message-State: AOJu0YyOFSSH2xMZQH8gLl1exrOoDXGTDlGDwwFaHOY6G0Nuds0sapR7
	m53PAMD6oJRdSpSB9kxWzxPSAg==
X-Google-Smtp-Source: AGHT+IH4DZanW/KNwa0uyD6pEUJfokz8iC0zod8aStQj4slf472OadpXT3yEwARfScyGLpgOau04BA==
X-Received: by 2002:a17:902:dac7:b0:1d0:7d83:fdd9 with SMTP id q7-20020a170902dac700b001d07d83fdd9mr2350350plx.122.1701716703131;
        Mon, 04 Dec 2023 11:05:03 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id y21-20020a170902ed5500b001d04c097d32sm7188363plb.270.2023.12.04.11.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:05:02 -0800 (PST)
Date: Mon, 4 Dec 2023 11:05:00 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Use asm-generic for {read,write}{bwlq} and
 their relaxed variant
Message-ID: <ZW4i3MqVRg21RmRV@ghost>
References: <20231202133813.4003-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202133813.4003-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_110507_509900_E1BF8062 
X-CRM114-Status: GOOD (  25.00  )
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

On Sat, Dec 02, 2023 at 09:38:13PM +0800, Jisheng Zhang wrote:
> The asm-generic implementation is functionally identical to the riscv
> version. At the same time, the readl{q}_relaxed is replaced with the
> raw version for nommu building.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> Since v1:
>  - fix nommu build
> 
>  arch/riscv/include/asm/mmio.h  | 62 +---------------------------------
>  arch/riscv/include/asm/timex.h |  6 ++--
>  2 files changed, 4 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
> index 4c58ee7f95ec..a491590593ca 100644
> --- a/arch/riscv/include/asm/mmio.h
> +++ b/arch/riscv/include/asm/mmio.h
> @@ -80,54 +80,7 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
>  #endif
>  
>  /*
> - * Unordered I/O memory access primitives.  These are even more relaxed than
> - * the relaxed versions, as they don't even order accesses between successive
> - * operations to the I/O regions.
> - */
> -#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
> -#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> -#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
> -
> -#define writeb_cpu(v, c)	((void)__raw_writeb((v), (c)))
> -#define writew_cpu(v, c)	((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
> -#define writel_cpu(v, c)	((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
> -
> -#ifdef CONFIG_64BIT
> -#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
> -#define writeq_cpu(v, c)	((void)__raw_writeq((__force u64)cpu_to_le64(v), (c)))
> -#endif
> -
> -/*
> - * Relaxed I/O memory access primitives. These follow the Device memory
> - * ordering rules but do not guarantee any ordering relative to Normal memory
> - * accesses.  These are defined to order the indicated access (either a read or
> - * write) with all other I/O memory accesses to the same peripheral. Since the
> - * platform specification defines that all I/O regions are strongly ordered on
> - * channel 0, no explicit fences are required to enforce this ordering.
> - */
> -/* FIXME: These are now the same as asm-generic */
> -#define __io_rbr()		do {} while (0)
> -#define __io_rar()		do {} while (0)
> -#define __io_rbw()		do {} while (0)
> -#define __io_raw()		do {} while (0)
> -
> -#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
> -#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
> -#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
> -
> -#define writeb_relaxed(v, c)	({ __io_rbw(); writeb_cpu((v), (c)); __io_raw(); })
> -#define writew_relaxed(v, c)	({ __io_rbw(); writew_cpu((v), (c)); __io_raw(); })
> -#define writel_relaxed(v, c)	({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
> -
> -#ifdef CONFIG_64BIT
> -#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
> -#define writeq_relaxed(v, c)	({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
> -#endif
> -
> -/*
> - * I/O memory access primitives.  Reads are ordered relative to any following
> - * Normal memory read and delay() loop.  Writes are ordered relative to any
> - * prior Normal memory write.  The memory barriers here are necessary as RISC-V
> + * I/O barriers. The memory barriers here are necessary as RISC-V
>   * doesn't define any ordering between the memory space and the I/O space.
>   */
>  #define __io_br()	do {} while (0)
> @@ -135,17 +88,4 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
>  #define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
>  #define __io_aw()	mmiowb_set_pending()
>  
> -#define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
> -#define readw(c)	({ u16 __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
> -#define readl(c)	({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
> -
> -#define writeb(v, c)	({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
> -#define writew(v, c)	({ __io_bw(); writew_cpu((v), (c)); __io_aw(); })
> -#define writel(v, c)	({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
> -
> -#ifdef CONFIG_64BIT
> -#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
> -#define writeq(v, c)	({ __io_bw(); writeq_cpu((v), (c)); __io_aw(); })
> -#endif
> -
>  #endif /* _ASM_RISCV_MMIO_H */
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a06697846e69..9ff9f398f61a 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -17,18 +17,18 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> -	return readq_relaxed(clint_time_val);
> +	return __raw_readq(clint_time_val);
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val));
> +	return __raw_readl(((u32 *)clint_time_val));
>  }
>  #define get_cycles get_cycles
>  
>  static inline u32 get_cycles_hi(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> +	return __raw_readl(((u32 *)clint_time_val) + 1);
>  }
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
