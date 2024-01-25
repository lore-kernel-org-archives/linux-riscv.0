Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6769C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfnCdCdSd8Ssm9dLHPp4WkH8L/nhTF6lhRmQAopL5EQ=; b=V5et/Tg55N2K9UGTs461Ii/pN3
	ZB384PE9E1K0WAByVEa53A5oKvpW+I0qN39Mh5oVesJa5v6FtXiUSI4uruNz8Zcr3PbVHNB6IjTJ0
	FDDNXTyMp//y17fRB4/E99bCk8spZoda5rVlPE4DnUFXgd7HQQfeuMy6O2kM61lZchh2bY7xZsOpY
	LBIICOmsJu6V2VFAf3NOImOy51FQzgxOmkVM3Op6lBCY+OwFUVz5/9xz4C2UqaVPa5dkCmhhn8BeW
	n4wQZ7RNC9RZce19NBzGP1bZAAagJpnwoog2XNHSve8WpZ0tidvWObLGT6hxRZUK4/vunKL2HZm1D
	idbwYZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3vu-00000001E8H-3KpV;
	Thu, 25 Jan 2024 17:54:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3vr-00000001E71-3r4U
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:54:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d893950211so3579315ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706205269; x=1706810069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nicyzemtTRD4VSL2aIrfR13izgwrVMBCjiaMcBIu4g=;
        b=txkMLVIraSn/MH1w5DZiUN/sJeo9/SjxQHptD6OswXS8qcOMMwZ+S0LvMEe5o2VTUe
         aYtUkyBW1dHQW4CBQi/ylFQzHXI7Dbc1E25YtH9LM46jwKj60G4OJBlznAwYZ+YWr79y
         uYj6080jAI0hgShloP+HiNsyEDUBkBb3O3HvNDeXCsB34yFI7kZyujggXXdnqOzU69kZ
         RBbCfTIuKuFrbgughwpwRIr6L3/OSuy7FhAR2oJD6QrQDx6kUx4e6Oc8fZX81QgitURG
         ZTjPf0q5c3D6AaWSpW7+2+U6QaIRsopQ4WmmUiLfSjeVPXw5FlWow2CN5eXOD2Fbkbwn
         5nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706205269; x=1706810069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nicyzemtTRD4VSL2aIrfR13izgwrVMBCjiaMcBIu4g=;
        b=kcanJ8EhgPi3dvWuyyYQR/P7dPtReoAxyNlND4kMehpy7J9MWIxlADAY9FLpN+6idD
         VE70lhKx87CrpUEF5EK2ogr2vYLU0PtyEjFzLtRdBksu0y/zmeiYTk4RCXO2jD9zzo8h
         Al9+t7FUzAkNsQje3tTMlm5zUcIlDj21+6YR1+pyndBVIblek0lWS3lBRfDyAdKYzsuP
         SlmnzpnnX5HtUl7E3y/ALtqqCIu+/d+nbk8ZeOyxI3hgn+ngVSGV3AW9zYeWCs49inA8
         lp9vGjRFAV6LmEsDlICf/UpBxbp4qvgHpQEogRfEuGV0iFDpkQf7I4M7p4efWJ2+Rscy
         2EQw==
X-Gm-Message-State: AOJu0YzzUz3qj8EsUgC0juqbBdQCcnX5xAY5Budyri1eMUnmxTA4o0LG
	LftraBvwwF9Z0RhJP2pz09DNKvsWHfNMW8OCc/Om29MZKVd9nL9FHcQ7H+LW7Iw=
X-Google-Smtp-Source: AGHT+IHocjbJl+xR8mMLXKtkqWJu/nhVxybtwo7TBdSkwNgtnoPBjFJ6RTaIl5x14FjrIbULLsROeg==
X-Received: by 2002:a17:903:124c:b0:1d7:eb1:a053 with SMTP id u12-20020a170903124c00b001d70eb1a053mr104655plh.18.1706205269113;
        Thu, 25 Jan 2024 09:54:29 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id u24-20020a170902a61800b001d74343a53dsm7538299plq.81.2024.01.25.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:54:28 -0800 (PST)
Date: Thu, 25 Jan 2024 09:54:24 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Jones <ajones@ventanamicro.com>, paul.walmsley@sifive.com,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, cleger@rivosinc.com,
	Atish Patra <atishp@atishpatra.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	"Eric W. Biederman" <ebiederm@xmission.com>, shuah@kernel.org,
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>,
	samitolvanen@google.com, Evan Green <evan@rivosinc.com>,
	xiao.w.wang@intel.com, Anup Patel <apatel@ventanamicro.com>,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>, shikemeng@huaweicloud.com,
	david@redhat.com, Charlie Jenkins <charlie@rivosinc.com>,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>, Greg Ungerer <gerg@kernel.org>,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, Catalin Marinas <catalin.marinas@arm.com>,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 02/28] riscv: envcfg save and restore on trap
 entry/exit
Message-ID: <ZbKgUNR+Em55Moaw@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-3-debug@rivosinc.com>
 <23d023c0-27cf-44fa-be0a-000d1534ef86@app.fastmail.com>
 <ZbKVutBWoelt33GM@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbKVutBWoelt33GM@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_095432_011163_FC3AD56E 
X-CRM114-Status: GOOD (  15.15  )
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

On Thu, Jan 25, 2024 at 09:09:14AM -0800, Deepak Gupta wrote:
>On Thu, Jan 25, 2024 at 02:19:29AM -0500, Stefan O'Rear wrote:
>>On Thu, Jan 25, 2024, at 1:21 AM, debug@rivosinc.com wrote:
>>>From: Deepak Gupta <debug@rivosinc.com>
>>>
>>>envcfg CSR defines enabling bits for cache management instructions and soon
>>>will control enabling for control flow integrity and pointer masking features.
>>>
>>>Control flow integrity enabling for forward cfi and backward cfi is controlled
>>>via envcfg and thus need to be enabled on per thread basis.
>>>
>>>This patch creates a place holder for envcfg CSR in `thread_info` and adds
>>>logic to save and restore on trap entry and exits.
>>
>>Should only be "restore"?  I don't see saving.
>
>It's always saved in `thread_info` and user mode can't change it.
>So no point saving it.

Also I'll fix the commit message. I think that's what you were pointing out.

>
>>
>>>
>>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>>---
>>> arch/riscv/include/asm/thread_info.h | 1 +
>>> arch/riscv/kernel/asm-offsets.c      | 1 +
>>> arch/riscv/kernel/entry.S            | 4 ++++
>>> 3 files changed, 6 insertions(+)
>>>
>>>diff --git a/arch/riscv/include/asm/thread_info.h
>>>b/arch/riscv/include/asm/thread_info.h
>>>index 574779900bfb..320bc899a63b 100644
>>>--- a/arch/riscv/include/asm/thread_info.h
>>>+++ b/arch/riscv/include/asm/thread_info.h
>>>@@ -57,6 +57,7 @@ struct thread_info {
>>> 	long			user_sp;	/* User stack pointer */
>>> 	int			cpu;
>>> 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>>>+	unsigned long envcfg;
>>> #ifdef CONFIG_SHADOW_CALL_STACK
>>> 	void			*scs_base;
>>> 	void			*scs_sp;
>>>diff --git a/arch/riscv/kernel/asm-offsets.c
>>>b/arch/riscv/kernel/asm-offsets.c
>>>index a03129f40c46..cdd8f095c30c 100644
>>>--- a/arch/riscv/kernel/asm-offsets.c
>>>+++ b/arch/riscv/kernel/asm-offsets.c
>>>@@ -39,6 +39,7 @@ void asm_offsets(void)
>>> 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>> 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>>> 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>>>+	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
>>> #ifdef CONFIG_SHADOW_CALL_STACK
>>> 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>>> #endif
>>>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>>index 54ca4564a926..63c3855ba80d 100644
>>>--- a/arch/riscv/kernel/entry.S
>>>+++ b/arch/riscv/kernel/entry.S
>>>@@ -129,6 +129,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>>> 	addi s0, sp, PT_SIZE_ON_STACK
>>> 	REG_S s0, TASK_TI_KERNEL_SP(tp)
>>>
>>>+	/* restore envcfg bits for current thread */
>>>+	REG_L s0, TASK_TI_ENVCFG(tp)
>>>+	csrw CSR_ENVCFG, s0
>>>+
>>
>>This is redundant if we're repeatedly processing interrupts or exceptions
>>within a single task.  We should only be writing envcfg when switching
>>between tasks or as part of the prctl.
>>
>>We need to use an ALTERNATIVE for this since the oldest supported hardware
>>does not have envcfg csrs.
>
>Yeah fixing that in next series. Thanks
>
>>
>>-s
>>
>>> 	/* Save the kernel shadow call stack pointer */
>>> 	scs_save_current
>>>
>>>--
>>>2.43.0
>>>
>>>
>>>_______________________________________________
>>>linux-riscv mailing list
>>>linux-riscv@lists.infradead.org
>>>http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
