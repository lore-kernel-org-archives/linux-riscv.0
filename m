Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF0CCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbFlOKKOQ7T6BBmVt0b4GTUU5/rDwgCLfwCdsX+t+j0=; b=V21K9emUJVspXq
	igvgKQHQ6mfN7SY12uaEaujHHJh7k1odE2VW6RaIR8XBKp0jGkUIKt8KCstYV1vupO1cxk47p5Q1Q
	twAJydM0JVgrRGjM7/FSOpEWo/F8CQ5K9BuF6z+qf5dn5JVQKKvTGseoLxjkam5aoMUKLh4CmpsGV
	Sz+qSglPbdGsZE61Ui2GMBDnwss1Bp21hs0igZci5P45TiGbC76Hu8m+9mK65U1VY6AwupQ5yuIo5
	dWa2EPgtII4bCNYuDiKcDl9CPEBhF+iXivKxP0uyKukmLATTrwrBriIAK2LYwx4i0kiz7TFK0jhzt
	CtHGSLCtnsqV1dm6ebBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjPZ-00000007cK6-2tD5;
	Thu, 26 Sep 2024 07:59:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjPX-00000007cJ7-0no3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 07:59:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so5982015e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 00:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727337576; x=1727942376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpCiGEBlNu0mNZ7okeDi8cYacva/g1Cbr0GdHobTz6g=;
        b=DMR3+PIaXeGA9o/hzlQW1gB1WJSvPmD89dt3TZvVgdTW50rMd1V12fb79P7XdCXiIl
         J5xUUI3qErILgsz8RCqKfAmP+ot4f2F+u1vPS6Wrq22FIqN0OPJQ2wIIK9z0IOojxJQ5
         MWc1Pjg35p8Ym4uQmqKoE6AEe4Hb/JmEiJf5GoEEoAy2z60ZGefuPo3PPrxG3Pi6Th1S
         oL3boLhKGJEmdvCz6U640FpAInRN/MkKK7NuwJxHceSB5S2WB9W0pV9+uZejhjQOmJnd
         b+N+S+FUnLHzU4n4PasPlt9eiJocSieE90Qes4VNBHYIFn1bO5rOdh/HGYwjSeomsXvt
         yz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727337576; x=1727942376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpCiGEBlNu0mNZ7okeDi8cYacva/g1Cbr0GdHobTz6g=;
        b=SLAXFXV7KOrMEzpkn4oUkZ/WriPV/SmxuPKaROmX2eLSOovGHAchO+fzqA0Ot4LNzp
         GONlnyvx6Fipb5F1XkxT74cpF4zU98MthjAADM39j8i7i0UatblbwAAJPyk/3ESCK8z7
         qd9/VWWLp/8xhe0NUOKLYQiKP+vVIHs0a9Jxu6IIwDH+Wfkscy7aU2TO4sP8tnXO0Qab
         zCnn+terpvTe7bxt3C59FPPanvSth23FzY4terYxR+f+xtpAlVzo5c2K57K50Qs4qXKQ
         76teTLq4C3L5eAINazZQMsVH2WRCrjKyz5CsOgHd85JbGdfi6HvHa8+nNmhZ3kRQBdiA
         Te5g==
X-Forwarded-Encrypted: i=1; AJvYcCX0kAQzdg7ZeDR/lC3VErsv5le7VpxujDY/kFvc4fv6KYcej6Wxem2tK0QUfxG+kZSYy5+rBD7qce9HEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/k4V5D+itqolqYRxMsbJnP7jjShdGOougmSoKPCEmYOWb0p3R
	hhw2TxdjmwYAoSgqu2cMbxFFLTt2si4nv4aWDI9dB9JRcxlFQoWfrU0BmJo/pbY=
X-Google-Smtp-Source: AGHT+IH7ivAeF8lcHIJrAIXadm6iyognSZRY/aTKpYZz3gkdQWtorWwQDRTmTAf88fh/VevbkacKBg==
X-Received: by 2002:adf:f64f:0:b0:37c:cbca:fd7c with SMTP id ffacd0b85a97d-37ccbcafe16mr2698906f8f.41.1727337576104;
        Thu, 26 Sep 2024 00:59:36 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd21129e6sm179018f8f.47.2024.09.26.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:59:35 -0700 (PDT)
Date: Thu, 26 Sep 2024 09:59:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH v2 1/3] riscv: Add csr_read/write_hi_lo support
Message-ID: <20240926-b96b7164b51b0be0c732235b@orel>
References: <20240926065422.226518-1-nick.hu@sifive.com>
 <20240926065422.226518-2-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926065422.226518-2-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_005939_260483_CC0D843D 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 26, 2024 at 02:54:16PM GMT, Nick Hu wrote:
> In RV32, we may have the need to read both low 32 bit and high 32 bit of
> the CSR. Therefore adding the csr_read_hi_lo() and csr_write_hi_lo() to
> support such case.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..54198284eb22 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -501,6 +501,17 @@
>  	__v;							\
>  })
>  
> +#if __riscv_xlen < 64
> +#define csr_read_hi_lo(csr)					\
> +({								\
> +	u32 hi = csr_read(csr##H);				\
> +	u32 lo = csr_read(csr);					\
> +	lo | ((u64)hi << 32);					\
> +})
> +#else
> +#define csr_read_hi_lo	csr_read
> +#endif
> +
>  #define csr_write(csr, val)					\
>  ({								\
>  	unsigned long __v = (unsigned long)(val);		\
> @@ -509,6 +520,17 @@
>  			      : "memory");			\
>  })
>  
> +#if __riscv_xlen < 64
> +#define csr_write_hi_lo(csr, val)				\
> +({								\
> +	u64 _v = (u64)(val);					\
> +	csr_write(csr##H, (_v) >> 32);				\
> +	csr_write(csr, (_v));					\
> +})
> +#else
> +#define csr_write_hi_lo	csr_write
> +#endif
> +
>  #define csr_read_set(csr, val)					\
>  ({								\
>  	unsigned long __v = (unsigned long)(val);		\
> -- 
> 2.34.1
>

I know I suggested this, but I'm having second thoughts. The nice thing
about the

 csr_write(CSR, ...);
 if (__riscv_xlen < 64)
    csr_write(CSRH, ...);

pattern is that it matches the spec. With this helper we'll have

 csr_write_hi_lo(CSR, ...);

for both rv32 and rv64. That looks odd for rv64 and hides the hi register
access for rv32.

We could avoid the oddness of the helper's name for rv64 if we instead
added csr_write32 and csr_write64 which do the right things, but that
still hides the hi register access for rv32. Hiding the hi register
access is probably fine, though, since we can be pretty certain that
the spec will rarely, if ever, deviate from naming high registers with
the H suffix and/or not keep the upper bits compatible.

In summary, I think I'm in favor of just dropping this patch, keeping
the noisy, but explicit, pattern. Or, if the consensus is to add
helpers, then I'd rather have all csr_<op>32/64 helpers. Then, code
would match the spec by choosing the right helper based on the width
of the CSR being accessed, when the CSR has an explicit width, or still
use the current helpers for xlen-wide CSRs.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
