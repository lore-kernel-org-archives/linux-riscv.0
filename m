Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C390C25B5F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHI+vICPy2Hkw199vITrTAO0H2jgpmOsL5CcDCFbYEk=; b=LwgcMTGAzT6kS5
	RvizhZSRKNyrs3LN5EsWiHx4zYXIoRJAf6Zt2+xiQNOXFD5bPWc9AZfY0yJ/WGD/SMZENUKQ79bhI
	jAyyav42CCoEdUmP0SLXPXJKeJyIZyJExBdXDStPgqcC02RVFWRLibSazxfHFTF+Hd6frxtjLmMIl
	A7Ki5d+SAM+ZAVYXsnxNcUfMIV+BMN9wtTQmQWH/Luy+01RW34GEiJP9MxF0dQs22zXAS8NXlqADp
	xF7rw5MS0dvDC6vzpnHTB1mSCmGjjC+2lrAdUmpeNlA7a4xmk1CI14E8K7LMTT13ljq0Ld5eqhxL3
	n20+NNNl+oEreMM7dIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ZgB-00000006nLU-0RoA;
	Fri, 10 May 2024 23:29:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Zg7-00000006nKV-0sQX
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 23:29:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1503738a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 16:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715383766; x=1715988566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Vz2Ea5vDvTd7NZaHdWli7Zi0tzSRPfvayQLC9Zmwn4=;
        b=FyT6O//F1H7QSoIFiNlU8dFdn9sJRGnXBRN9eGRoiDe9FFfWjvZ5TpR91Z+ZxKlZwg
         zEfGhw/7xP5hGohGAhSeS/HUyRQWpN6VTose1TRdtk9dNlxlvLsuwC2tKSPbtaNNgNZA
         JhfZCl2aNix4rBob9iKCJV+nL2y2jULm6RVvvRQOa3V2Uv5Yt8Ikx/4J5pEuKMJ9FcBt
         hBdDxsZDOCCy/s9WTFvXhAYfDa0EiEB1WoGpLGm515TlrKlS1pTiNJAoGCdOurZvjNrh
         Mn/AsbY/jlFo8LrMKQ9UbkQ0XjrktB8QkJU207b+PtV3fO8ivJgmuftofzGJ1kPywGvg
         Ol2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715383766; x=1715988566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Vz2Ea5vDvTd7NZaHdWli7Zi0tzSRPfvayQLC9Zmwn4=;
        b=k7vv6Xu3USrKFb1lT49BC4SbdnqFqQPKk1w8YH4uF8zR2Y+0JVptG4ARCTI7RAk09v
         HA9ctKwalL/8ohzLU+2JPdNOzUYCSqQ3oHNUJlPQpjueai8LQehe/ErFQS64wRMDbvCI
         Epv32jCX2y0MWLrQOtC3urqZl5N2W5FI+KhjaAKV4xO35KggGcOAkykeGfDjxbxf0N0T
         qbwCq24K3o/CsD5W6R4WDfv2z33dYZGx8Qr8ZGa9xtMCDNe+IdSgDATOCPLI23mWroxN
         bsS3lLLapyIvKzjjn6G+9P3xMMlqudN1nW5WH3klkUx3gg+VQwk4LxrOcaIL1U4hC/+I
         0pWg==
X-Forwarded-Encrypted: i=1; AJvYcCWFs54UK4/oIq2cMH1MRKd6gmBRIxsklah8XU4fVdlGHkZTMRXIr2wM3TfkZxoi2UlYpPrKaioy/fZbtFlUgIdmMOu4kmfVXHAYrGvkR3uA
X-Gm-Message-State: AOJu0Yw4j6yUKtnTG1O8TqwzqcBqauP7u6o6NzyhqFC2I1nr1rSdbFBY
	6MvNFGfeVIfWn/W/PpQqirq8t3cQInQFytF8kbN/WwrknnNJkcusvUce01tfN5g=
X-Google-Smtp-Source: AGHT+IFtRGEgJNgaXpQi4rnaLmSdVV1xvKctjw8cDKjjnX0+o8uhHRNsHVhKbF+1oYccjQdTEuSLLg==
X-Received: by 2002:a05:6a20:96d5:b0:1af:5d8b:87f3 with SMTP id adf61e73a8af0-1afde0d5537mr4236824637.23.1715383765853;
        Fri, 10 May 2024 16:29:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67158c3b4sm3755016a91.45.2024.05.10.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 16:29:25 -0700 (PDT)
Date: Fri, 10 May 2024 16:29:19 -0700
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
Subject: Re: [PATCH v3 17/29] prctl: arch-agnostic prctl for indirect branch
 tracking
Message-ID: <Zj6tzxWFj4H+250p@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-18-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-18-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_162927_261442_C6B37D41 
X-CRM114-Status: GOOD (  22.13  )
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

On Wed, Apr 03, 2024 at 04:35:05PM -0700, Deepak Gupta wrote:
> Three architectures (x86, aarch64, riscv) have support for indirect branch
> tracking feature in a very similar fashion. On a very high level, indirect
> branch tracking is a CPU feature where CPU tracks branches which uses
> memory operand to perform control transfer in program. As part of this
> tracking on indirect branches, CPU goes in a state where it expects a
> landing pad instr on target and if not found then CPU raises some fault
> (architecture dependent)
> 
> x86 landing pad instr - `ENDBRANCH`
> aarch64 landing pad instr - `BTI`
> riscv landing instr - `lpad`
> 
> Given that three major arches have support for indirect branch tracking,
> This patch makes `prctl` for indirect branch tracking arch agnostic.
> 
> To allow userspace to enable this feature for itself, following prtcls are
> defined:
>  - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
>    branch tracking.
>  - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
>    tracking.
>    Following status options are allowed
>        - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>          thread.
>        - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>          thread.
>  - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>    tracking for user thread.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
>  kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 3c66ed8f46d8..b7a8212a068e 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -328,4 +328,31 @@ struct prctl_mm_map {
>   */
>  #define PR_LOCK_SHADOW_STACK_STATUS      73
>  
> +/*
> + * Get the current indirect branch tracking configuration for the current
> + * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
> + */
> +#define PR_GET_INDIR_BR_LP_STATUS      74
> +
> +/*
> + * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
> + * enable cpu feature for user thread, to track all indirect branches and ensure
> + * they land on arch defined landing pad instruction.
> + * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
> + * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
> + * riscv - If enabled, an indirect branch must land on `lpad` instruction.
> + * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
> + * branches will no more be tracked by cpu to land on arch defined landing pad
> + * instruction.
> + */
> +#define PR_SET_INDIR_BR_LP_STATUS      75
> +# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
> +
> +/*
> + * Prevent further changes to the specified indirect branch tracking
> + * configuration.  All bits may be locked via this call, including
> + * undefined bits.
> + */
> +#define PR_LOCK_INDIR_BR_LP_STATUS      76
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 242e9f147791..c770060c3f06 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2330,6 +2330,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>  	return -EINVAL;
>  }
>  
> +int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return -EINVAL;
> +}
> +
> +int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return -EINVAL;
> +}
> +
> +int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return -EINVAL;
> +}
> +

These weak references each cause a warning:

kernel/sys.c:2333:12: warning: no previous prototype for 'arch_get_indir_br_lp_status' [-Wmissing-prototypes]
 2333 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/sys.c:2338:12: warning: no previous prototype for 'arch_set_indir_br_lp_status' [-Wmissing-prototypes]
 2338 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/sys.c:2343:12: warning: no previous prototype for 'arch_lock_indir_br_lp_status' [-Wmissing-prototypes]
 2343 | int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)

Can the definitions be added to include/linux/mm.h alongside the
*_shadow_stack_status() definitions?

- Charlie

>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>  
>  #ifdef CONFIG_ANON_VMA_NAME
> @@ -2787,6 +2802,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  			return -EINVAL;
>  		error = arch_lock_shadow_stack_status(me, arg2);
>  		break;
> +	case PR_GET_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
> +		break;
> +	case PR_SET_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_set_indir_br_lp_status(me, (unsigned long __user *) arg2);
> +		break;
> +	case PR_LOCK_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_lock_indir_br_lp_status(me, (unsigned long __user *) arg2);
> +		break;
>  	default:
>  		error = -EINVAL;
>  		break;
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
