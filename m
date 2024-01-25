Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D156C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W+m1F9P+i9qmAtSiF1dhktQHP+aAqr0lUZwGojiW4A=; b=DY3fLCyTOK5dkBa3j8kyO8lNzw
	RkJ4ry8CB5NwOZWny/lt4x5x1uyvIvqYC94nu2OXgcWIhsiBccfo+Plw9m/xAqxo0ocKT4qLB2jPL
	x9QMxAmszoLiNDiOyZ+izK1z6r4SJ6Vvi9TYJR0zB5xJmJi4gvwSckOd2C1cprgvWamci6rzUa+sK
	Chz7W3818W1mml/UIoLvj5Hn6MYiHIY7jxvv2LIbjcjP9E4kMsc8rKUbRaxXzgx3QTbmEaxoYC0/1
	b8N+zvCBnfwIAg1f4Iu8Gt+72oPydXqk6Z7nNoTl7YpULojPt9+uksosgMpQtvinlihtNVEbXcgfi
	a3xHghDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3ED-000000014dL-1qZy;
	Thu, 25 Jan 2024 17:09:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3E9-000000014ak-09ll
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:09:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6dd853c1f80so688705b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706202560; x=1706807360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EemHHEVJxCejDW2IGmWybsIfYtaSynaTSK4azEaq/DU=;
        b=YyGBFQBCsanbS47VMJo38zEvPjWR7tNyELqqfDBEkWfnkvM0921ltHrnJjig/vt1zs
         ijv0aMbfv5BN0y/7xGhaCeuz5Na/tdQOSVQijfnLOYmIpJugxqoiw39t9ZrXKWN6zOd8
         Zi7gMaUK+Ya0BqMZm735RPNui0p+6D94Kr9JyStAuapbV86QCZoET7m/JexzdNuO2yPN
         /Jjcjz0ihDW89xSOPMtrXrHUb9c5p+W5sFIsRfym9ZcnMqR+DZ9aoJM1n5Obhjw30IG5
         wlbf8JoC0Zhcda90B6OMk6f9KV6uoWAUW/JXbRwBl22xNtWX1siNQM00446ftg9nsuOf
         bHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202560; x=1706807360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EemHHEVJxCejDW2IGmWybsIfYtaSynaTSK4azEaq/DU=;
        b=a+3m+4+f3MAkbZnKzkSFYcJpWqcC5kHHomleH1zx5Kh8qxoti05FfUlpKpNbJ4CPP5
         O83jVV0KJ/tdbx1Kcie4RQBKbPESJ3hvow6Yk5G9UUz7toKCSW1YRl0iXHcA9zmsSSEo
         5FpBwGg62bcr5eONbH5qichoR9vbuMLhpLCpyqaOkaqNV9nAqWPV+UXJw3vcLIliJWX3
         IB0teelXyJIDBELT6YkfpiyEt5/4ZTt/ZC/Ft7St0X1YzU0uSECdjtRXxO/cO/F5eYml
         2WhekJC0Nt3JUXb1Ef449Yw5lQJ8HdLp3yuzuRrjlyYUAcmz49JAEskhnjx0awVDyGCe
         n9Bg==
X-Gm-Message-State: AOJu0Yz3B1O25gL8KnDJYiXmVwTZbhTuKPjJbUwZqb803qikph2CiUXP
	3FFfnoEhyAndIk3sFe4AcGMbv764p/LgNswNMM38C5/IuUYUvZjT+z4gYW36Keg=
X-Google-Smtp-Source: AGHT+IG/zy1hPfIMx5+FBiFJ5BLS8zAqpVXvwWyHDpqTcM52HEkGIjepOlIdme6VNMNiF/zcKBKxqQ==
X-Received: by 2002:a05:6a00:b4f:b0:6db:ac96:f530 with SMTP id p15-20020a056a000b4f00b006dbac96f530mr221939pfo.24.1706202559878;
        Thu, 25 Jan 2024 09:09:19 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w128-20020a626286000000b006dde0724247sm180477pfb.149.2024.01.25.09.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:09:19 -0800 (PST)
Date: Thu, 25 Jan 2024 09:09:14 -0800
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
Message-ID: <ZbKVutBWoelt33GM@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-3-debug@rivosinc.com>
 <23d023c0-27cf-44fa-be0a-000d1534ef86@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23d023c0-27cf-44fa-be0a-000d1534ef86@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_090921_141609_6CAAC2B1 
X-CRM114-Status: GOOD (  19.54  )
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

On Thu, Jan 25, 2024 at 02:19:29AM -0500, Stefan O'Rear wrote:
>On Thu, Jan 25, 2024, at 1:21 AM, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> envcfg CSR defines enabling bits for cache management instructions and soon
>> will control enabling for control flow integrity and pointer masking features.
>>
>> Control flow integrity enabling for forward cfi and backward cfi is controlled
>> via envcfg and thus need to be enabled on per thread basis.
>>
>> This patch creates a place holder for envcfg CSR in `thread_info` and adds
>> logic to save and restore on trap entry and exits.
>
>Should only be "restore"?  I don't see saving.

It's always saved in `thread_info` and user mode can't change it.
So no point saving it.

>
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/thread_info.h | 1 +
>>  arch/riscv/kernel/asm-offsets.c      | 1 +
>>  arch/riscv/kernel/entry.S            | 4 ++++
>>  3 files changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/thread_info.h
>> b/arch/riscv/include/asm/thread_info.h
>> index 574779900bfb..320bc899a63b 100644
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> @@ -57,6 +57,7 @@ struct thread_info {
>>  	long			user_sp;	/* User stack pointer */
>>  	int			cpu;
>>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>> +	unsigned long envcfg;
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>  	void			*scs_base;
>>  	void			*scs_sp;
>> diff --git a/arch/riscv/kernel/asm-offsets.c
>> b/arch/riscv/kernel/asm-offsets.c
>> index a03129f40c46..cdd8f095c30c 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -39,6 +39,7 @@ void asm_offsets(void)
>>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>> +	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>  	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>>  #endif
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 54ca4564a926..63c3855ba80d 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -129,6 +129,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>>  	addi s0, sp, PT_SIZE_ON_STACK
>>  	REG_S s0, TASK_TI_KERNEL_SP(tp)
>>
>> +	/* restore envcfg bits for current thread */
>> +	REG_L s0, TASK_TI_ENVCFG(tp)
>> +	csrw CSR_ENVCFG, s0
>> +
>
>This is redundant if we're repeatedly processing interrupts or exceptions
>within a single task.  We should only be writing envcfg when switching
>between tasks or as part of the prctl.
>
>We need to use an ALTERNATIVE for this since the oldest supported hardware
>does not have envcfg csrs.

Yeah fixing that in next series. Thanks

>
>-s
>
>>  	/* Save the kernel shadow call stack pointer */
>>  	scs_save_current
>>
>> --
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
