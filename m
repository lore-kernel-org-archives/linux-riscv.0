Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55217C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywwqPdbWCxcLkYOAkD/JcNLsrNROXWpBFU0p1Eg+Azo=; b=v/Q2mHVCwOLeag
	k6SmPJuf2yxJGDgLP6Wh5vmihXzDeBc9lE+opLAx0IHHgtCrT/eo2FvncjdAtkKbxNHbkjKpVwg66
	UuUPujZ9AJXkyGKl8+CyAJr/TKjLLcJMQCjT0mWHkZIqLLWLgdAi57LriewHR9wP6K2x7N8Dm+N2E
	xBNdWNw/nVZpR1+u6JqT8F029mf88m2JfP4AQDukWob3mAl1uENThCE0/ilFc9zn1pzNcaCRzmyF4
	LEPbv7QQWBagRKeVFYeFpTQrQ4jcZt6hw37dTYGPhzePEhZeC7BaOkA7+oXKscFwd4U1LXsO2Ddi5
	i5FaY9Cg5S53XgXs3BQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWSPs-00000003yy4-2f40;
	Tue, 01 Jul 2025 04:16:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWSPo-00000003yxg-46Qy
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 04:16:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7494999de5cso4081247b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 21:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1751343375; x=1751948175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ih9T4CCmskKJGlCypNtvtt9gxqtXmA+YvXo79VcNoMA=;
        b=kT2i/ADEBC1tvcTN4hO/QIqhPhm9CAX8S/KaNDYgENHR7rJhPnEXgkOMo7hPt1DB2b
         EtZD1Qza2+SLjlPMDFCYVNXxWUZAZOM2HCM3UhG+5UpqEzWFO6Cw71KDjwIyU/YuPMbH
         7S3+zDEbWd0Y6U0ZvrPMmEo8x35DimBd5bflzy8UWyDyt1thrPraBGFzyOykjalEKD5j
         4EydJX52TzDRo2rOQ3DXqYXIiznrQ5c7Pd7xBUIimTPAkeC7EJgvlHQA3a2f02TYweYx
         fN9pcwBRcGZWW025U39+ar8eCYLFoksejwmAliu8lrOQtYXVR2LuZGXRt3Q4TIGotAKf
         aIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751343375; x=1751948175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih9T4CCmskKJGlCypNtvtt9gxqtXmA+YvXo79VcNoMA=;
        b=vO9bUnBm2pj0TQzapQcf/Fxym3yIHwFeBFszuPsJX/Z/65xsMQrrmQCBoO/s3CH15D
         aIINW30TP2cWSvgyk7fcJXHz8Rw4X3yPqCFxwMAqF0Pl0C5+nkzo5+FwfNOPU1IaGfQ8
         /sVepfLKp7BY/l42i+SNX148O7zh0mr1me3BxM7OsHMRbKGeIvlLlF3oqtLdQH3FPdtV
         mJhEoMOoHYRxtIrRAagRH6BNG0J4rfjz0ASSvkV5iqTPh5f4QXm/HBSMP6NvWw2TZqeH
         fS6LgDG/aUANw1Bqh88dhTdG59ywx3u6JRPK3yv9og6v71SLz2BKKOCz2BkFE/51PPZd
         WmhQ==
X-Gm-Message-State: AOJu0YykmitO+3g9pbKgR8Cu4bYl+bU4CT7lS/O7P33GA+EAOZvEBobb
	Kkpo1FtwkBL8EgI/mncGvubf4qwpFNLM+cma+u9qim676bHP3cLj5Hyrsf4UGLCR2lI=
X-Gm-Gg: ASbGncvQqgY+S5wUVqO/Pswd5WcvrpRcVGReSGW3KQIrJ980hpeaPGjRXHdCPN6AZw5
	ZY4Joif9es9Bzg8nEsLAwL9yNRKvmxeiTev082+anRAuzcY1yJMgbD9egOyN7Ilu6OUkHt7P26s
	HAG0pkCF7v5xR7568J9YSPmmVtDv+0dLu24Ovk9dc+ItiGcgiObJscMrj9p1QcNEY9tN19YGdyp
	GxSg/3kM+LEL9mrmJGh6Aa+YwltvgFvIg5FXeSxFbnakJ0dME1trCNu4Mqjgz3SYU9ayEDGwy3E
	rRVxbLdrKQvmGAFKQcwVnyOBigIuno5HqdrkmqANHPSM+SvfNUpsrq7WRNXX2HCf9iAqcUv5aSY
	zCsLFJLvMSP+F1Zm6mzAAD/+OeTwI
X-Google-Smtp-Source: AGHT+IHXJXpgKPECdLF+1KJMcXzz2DyFCD8l8YmHdLjDAtAzJXuF/Z6q4FSlcfieQOxR026JITE3ag==
X-Received: by 2002:a05:6a21:392:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-220a169ca84mr19671016637.25.1751343375502;
        Mon, 30 Jun 2025 21:16:15 -0700 (PDT)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm10652356b3a.70.2025.06.30.21.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 21:16:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 21:16:11 -0700
From: Olof Johansson <olof@lixom.net>
To: Jingwei Wang <wangjingwei@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>, Yixun Lan <dlan@gentoo.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Tsukasa OI <research_trasio@irq.a4lg.com>, stable@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4] riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot
Message-ID: <aGNhC3mtpT8x_Z6V@chonkvm.lixom.net>
References: <20250627172814.66367-1-wangjingwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627172814.66367-1-wangjingwei@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_211617_383350_F6A87342 
X-CRM114-Status: GOOD (  20.86  )
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

On Sat, Jun 28, 2025 at 01:27:42AM +0800, Jingwei Wang wrote:
> The value for some hwprobe keys, like MISALIGNED_VECTOR_PERF, is
> determined by an asynchronous kthread. This kthread can finish after
> the hwprobe vDSO data is populated, creating a race condition where
> userspace can read stale values.
> 
> A completion-based framework is introduced to synchronize the async
> probes with the vDSO population. The init_hwprobe_vdso_data()
> function is deferred to `late_initcall` and now blocks until all
> probes signal completion.
> 
> Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> ---
> Changes in v4:
> 	- Reworked the synchronization mechanism based on feedback from Palmer
>     	and Alexandre.
> 	- Instead of a post-hoc refresh, this version introduces a robust
> 	completion-based framework using an atomic counter to ensure async
> 	probes are finished before populating the vDSO.
> 	- Moved the vdso data initialization to a late_initcall to avoid
> 	impacting boot time.
> 
> Changes in v3:
> 	- Retained existing blank line.
> 
> Changes in v2:
> 	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
> 	- Updated commit message to provide a high-level summary.
> 	- Added Fixes tag for commit e7c9d66e313b.
> 
> v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u
> 
>  arch/riscv/include/asm/hwprobe.h           |  8 +++++++-
>  arch/riscv/kernel/sys_hwprobe.c            | 20 +++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |  9 +++++++--
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 7fe0a379474ae2c6..87af186d92e75ddb 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -40,5 +40,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
>  
>  	return pair->value == other_pair->value;
>  }
> -
> +#ifdef CONFIG_MMU
> +void riscv_hwprobe_register_async_probe(void);
> +void riscv_hwprobe_complete_async_probe(void);
> +#else
> +inline void riscv_hwprobe_register_async_probe(void) {}
> +inline void riscv_hwprobe_complete_async_probe(void) {}

These need to be:

static inline void riscv_hwprobe_register_async_probe(void) {}
static inline void riscv_hwprobe_complete_async_probe(void) {}

Or else you get an global instantiation of them in every file that includes
them, and compilation errors about duplicate symbols, as seen by
nommu_virt_defconfig:

riscv64-linux-gnu-ld: arch/riscv/kernel/process.o: in function `riscv_hwprobe_register_async_probe':
process.c:(.text+0x170): multiple definition of `riscv_hwprobe_register_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x312): first defined here
riscv64-linux-gnu-ld: arch/riscv/kernel/process.o: in function `riscv_hwprobe_complete_async_probe':
process.c:(.text+0x17c): multiple definition of `riscv_hwprobe_complete_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x31e): first defined here
riscv64-linux-gnu-ld: arch/riscv/kernel/ptrace.o: in function `riscv_hwprobe_register_async_probe':
ptrace.c:(.text+0x714): multiple definition of `riscv_hwprobe_register_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x312): first defined here



-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
