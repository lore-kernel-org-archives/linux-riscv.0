Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED72E7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suNLjcjFi/kl3nQnCFcaABc1pp9SZ8vzPoKUZNLJC3E=; b=I3VDEMhUDrC/iA
	jWcFqpVSvii1qsCPaet7E7Rpt4JFTmudW/XCT22MFfSniiBX9+ERu59s/Ob9y2Ku5NrNcMb3mqaaG
	7zx3BOMKOi5A029gtF/NJW2UYzIPXCTDIR3XkcNuJreirORECVouN44DZFakOp5XKldwody9CUZlp
	WLhXOzhOFySwkNIxbTTzDLkXBWndksywzNaHphhBw2PYdcAjcf60Xmheo+wAfMUZPzcAVAFaqkahx
	t0+kPgvLCM+q6JZsgzUCfpp842LjWXsejO1+OKES4ovih8wKICjM/4sccfKo0NZkItexkZLwaXjdt
	3QwwjKl138YHcMvhTVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5cw-0000000C7Ao-0XDT;
	Tue, 24 Dec 2024 14:11:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5cl-0000000C78G-3eza
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 14:11:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436202dd730so37499755e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1735049462; x=1735654262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ViAaHDfqtDUMOh9G0e8qGHHMcW3uUilbo944MA3AP3U=;
        b=QWLjvzKEjTmkP4DoGSiZWyU/aKUW3HIW3Vc8Dv5UWPol9pXFzwMWAKq1d0POwxu2t+
         MpeBrnXohpusapK1zXGyaTk5Rk+Go8HOQThUWH5WrRroKH4mfuB2syp+SlV5r00hFJci
         EYPwToGcBAr/pJie2ObOQnARQvMycoXCF/gATF/IgEUIM1vT9hydYQPcn4+m8DPjLQIY
         4YJwHZI8wskpRlKSzuXb/EjzDj4hJyzQ7qQQFmeCFEtGxzCEYHPWSNAhEaL67QopuUKL
         P3tLgokeUx0zRJu53iyhPz3Z3+YC5E+r9D+am+I1YTKKUsiZAspdbl8luT/k0NyR48pn
         Rl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735049462; x=1735654262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViAaHDfqtDUMOh9G0e8qGHHMcW3uUilbo944MA3AP3U=;
        b=cAp+raFpYcC0hUARx6M23uILEqjmNTnudyHYKZLJSiy9IZAyKMl7/IQyF0Y8Wn8Z6X
         B5Uby4VJvsoU01MqkKfpjQDJC5x+oFYNJdY1MeRA5LpTon/6/I+RoEygB7uwKSlyFB9q
         XFYpg2Q0Qjd7AIpOlb5lUv7qsGJ0D/CpX0zg+Aj2vQtLy70/1wOhVGzEJc0GbcAM7+Ay
         Lve3tIRSPq8iyapwQfqldxt0HLFozWtSpHKMVPVo9Teap8/8V7rR8i2S4MBQcnVJBAsr
         UTTLSRW5W535DNFigWyxqWxcLaVsjVk778XP/cpfz2vLz1ECoEf0ghA87FS5V24dpP2G
         6f0w==
X-Forwarded-Encrypted: i=1; AJvYcCVrkbkFBjdKR5vfO1YesxIIKGvm1xorHBeZtq2RSvH/gqcV1xMOj0I9Bcak1rIpDcwvjyVwXRz7RjaBfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxECeTJqNz3pTDUt6jnoVI5aATlr64YzLDcGy2hbOXSriMjO8FK
	UWmt3jR9jsu7TaYOIh7muhH+bSd9BFd2VPt8su80oQgcd20bokQXSuuM+JWWMRw=
X-Gm-Gg: ASbGncuzLAri2Y9q8dN18K1xNLA7MsT9BNz6A5kGXRi7/Px6TvP3B+5MF5hNMDM6eoG
	6dYJZndjsCeESR20sNVmrqUBvWwMGshxFqzpZqdIZv9zp+Qly09Ogj8VGgQ2fkBW84LEhkyzFBZ
	EBG7dXA9+YxtnXObzkgKX8dXjJvcfCjsfa1i9R5iXIa0MZfgmWdd1ltKpzuRWGb7C5JWqdoSBfE
	Y+Fr8NcsyaFLRyEYuKi6eaXSt7ecNHwozV65so5AzxazjUI0+gOuKDOExfoSFeDs13yg07Netz4
	e77+cLLBzw==
X-Google-Smtp-Source: AGHT+IFD7IEqQtg5jazeaXSGBIdcTIYpuSNzb+zjUUzWagcNsWemagQXPL4cwk29Lvtnmbu78aZkhg==
X-Received: by 2002:a05:600c:4688:b0:435:b064:7dce with SMTP id 5b1f17b1804b1-4366864618emr149329895e9.18.1735049461737;
        Tue, 24 Dec 2024 06:11:01 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a353sm168826375e9.42.2024.12.24.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:11:01 -0800 (PST)
Date: Tue, 24 Dec 2024 15:11:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, charlie@rivosinc.com, samuel.holland@sifive.com, 
	cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: Enable cbo.clean/flush in usermode
Message-ID: <20241224-2148923339996d2eed033b7e@orel>
References: <20241224123946.97486-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241224123946.97486-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_061103_919516_2E794AC8 
X-CRM114-Status: GOOD (  20.99  )
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

On Tue, Dec 24, 2024 at 08:39:46PM +0800, Yunhui Cui wrote:
> Enabling cbo.clean and cbo.flush in user mode makes it more
> convenient to manage the cache state and achieve better performance.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..60d180b98f52 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -30,6 +30,7 @@
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>  
>  static bool any_cpu_has_zicboz;
> +static bool any_cpu_has_zicbom;
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
>  		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
>  		return -EINVAL;
>  	}
> +
> +	any_cpu_has_zicbom = true;
>  	return 0;
>  }
>  
> @@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
>  		current->thread.envcfg |= ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
>  		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
> +
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
> +		current->thread.envcfg |= ENVCFG_CBCFE;
> +	else if (any_cpu_has_zicbom)
> +		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.39.2
>

This looks good, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

but, as a separate patch, we should also provide hwprobe support like
zicboz has, i.e. add ZICBOM to the IMA ext0 key and add a key for the
zicbom block size. And then, as another patch, add a test_zicbom()
function to tools/testing/selftests/riscv/hwprobe/cbo.c.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
