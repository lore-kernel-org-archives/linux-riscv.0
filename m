Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC6C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 00:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Av9GTKe+pcE7CakrLeLmeQoXqCXwkScHriMV7gtH92c=; b=Xf1g0QECAcArtK
	BoZ7GPZ6gBOCwl9Kl5N92mXjgVK0eZHY+F9rvWAV0DWPJoXCSkWGX1GMe37wFpJ1zbn1vEZC7MrpB
	gWzArXPa4JVRhUSTJto1tVOxZiIGfZy4YvPdCPe3CREaHRuB/MHGzLNtMhPzw0ZG5VWQP8p6E/nNp
	XB0bXTv2yptccx11Uan85qNB4Gt+N9EPsaba+zf0voKu1cMwdhFTuW+eFyt3eM/smmOJqnczf4syK
	oihFoL2uF4AHs0gIvt9rIruKH9kBwvAW6Nigs9H0xI75I9LQHGneYNIRRK/17tA0a3f4nRp8Fj1/a
	w5C/xzszMR5GXe9FAnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rNC-0000000HMfX-2JLz;
	Thu, 09 May 2024 00:10:58 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rN8-0000000HMcP-1upl
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 00:10:56 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5b21e393debso185897eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715213450; x=1715818250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZqIlWMGzBPFcGrSBngkQrJzMqDGPG9IZxXHGwlwCwA=;
        b=1QqnMMMxkVOOVg1NGwdeHyL/wvEcTTIkIJo27VgBIeHPbR5YFn9tPoQX+i/9NWvIfI
         jA3a3NfkLa8FMCL29v58iCie7b/4UhfTxntqp9rszzjGKqWDty8o9FVmxiiWy2hOlMHM
         zWbIH2H3DgsT8UZMFnAIgXwHo6BM9i+OXIzeMY/QhqdzBMl9cJeYYEHFrpxHfqoCAAKN
         X/aviqPw8ghnCD5As8/pOluU4BuxYFJGLDyVrZCRntre+22vJXqogR7uaK04n5vIvdq6
         fpzdi5sLCOLVtfDBP5HtMc+ToMzg/hzO5Y5hIHAA+xQ26xDbnrtX/o7cDTIq2D+SplSN
         gEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213450; x=1715818250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZqIlWMGzBPFcGrSBngkQrJzMqDGPG9IZxXHGwlwCwA=;
        b=wOSGWaWo0ENp0p/HWlUeHeW6eQwzjZgKT2W8ukKr5HNPcP/DPaQ9dRgyc0BAglW0JF
         sgw8p8wHLEg864xZST4MUsoTV0hrtqTW+koQ41LJ9KCPYHbPocwjPXy5IvDdyz8Exi3F
         2oLVwSyB8mOWasYwk+dnOSd5MLhZOMw2NS0PkQ6xj7zx+hcmUXw8QwsWVSA4psiB1FTd
         fUZjO/DWhua5Q7opFyCRVuXcEvlFj/k4iX/ggYLBSn+NKDgEgffAFkCjyiJbtpoywYhx
         E8mGcXiTHhvGr0k8Q+JvFEFdI/CpcpCMBdSYpsiSyvdeLC7EVHqddp44w2KOIaW0aNuz
         ZJfg==
X-Forwarded-Encrypted: i=1; AJvYcCWh3nL7bua8w/5sYeRpH/tq8M11Aui/m2p4F+MiQNtJOHDIuC64R+nOB7Yt2BxAJGGr0r19j+AQ1wYw5CnusmpqTNrTBkxXzn2a/RwDujrj
X-Gm-Message-State: AOJu0Yy9ZA8fZwaXFtdZfipWEPzHxUJBlBl5bM/j6mT7BxkrbYBP+SLa
	+8BVh84P0jI0Vm99thlTDwI6kmmBXvv1XXzWqajylV9xi5uymQ69WcNrpen7rh8=
X-Google-Smtp-Source: AGHT+IGf3JRzZDV8fYaLM87bNAbWYV5rWVExMXqYWMFb1yCMw/X1461/R98MMrR2NY4Y0ojK0sDDKw==
X-Received: by 2002:a05:6358:785:b0:18d:9114:eb1e with SMTP id e5c5f4694b2df-192d3778875mr506366755d.22.1715213450408;
        Wed, 08 May 2024 17:10:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4144:6911:574f:fec1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f727dsm81409a12.72.2024.05.08.17.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 17:10:49 -0700 (PDT)
Date: Wed, 8 May 2024 17:10:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 01/29] riscv: envcfg save and restore on task switching
Message-ID: <ZjwUhvLBv13qi77a@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-2-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-2-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_171054_583935_69D66383 
X-CRM114-Status: GOOD (  21.24  )
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

On Wed, Apr 03, 2024 at 04:34:49PM -0700, Deepak Gupta wrote:
> envcfg CSR defines enabling bits for cache management instructions and
> soon will control enabling for control flow integrity and pointer
> masking features.
> 
> Control flow integrity enabling for forward cfi and backward cfi are
> controlled via envcfg and thus need to be enabled on per thread basis.
> 
> This patch creates a place holder for envcfg CSR in `thread_info` and
> adds logic to save and restore on task switching.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
>  arch/riscv/include/asm/thread_info.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7efdb0584d47..2d9a00a30394 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>  
> +static inline void __switch_to_envcfg(struct task_struct *next)
> +{
> +	register unsigned long envcfg = next->thread_info.envcfg;

This doesn't need the register storage class.

> +
> +	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
> +							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
> +							  :: "r" (envcfg) : "memory");
> +}
> +

Something like:

static inline void __switch_to_envcfg(struct task_struct *next)
{
	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
		csr_write(CSR_ENVCFG, next->thread_info.envcfg);
}

would be easier to read, but the alternative you have written doesn't
have the jump that riscv_has_extension_unlikely has so what you have
will be more performant.

Does envcfg need to be save/restored always or just with
CONFIG_RISCV_USER_CFI?

- Charlie

>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> @@ -80,6 +89,7 @@ do {							\
>  		__switch_to_fpu(__prev, __next);	\
>  	if (has_vector())					\
>  		__switch_to_vector(__prev, __next);	\
> +	__switch_to_envcfg(__next);				\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
>  
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 5d473343634b..a503bdc2f6dd 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -56,6 +56,7 @@ struct thread_info {
>  	long			user_sp;	/* User stack pointer */
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
> +	unsigned long envcfg;
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
