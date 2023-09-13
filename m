Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB396EE0202
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DTarOOJ7iFD2P51tiu+UR1Of1zO1TCbG4I7q0LXC5eE=; b=shVeqUzV3wsMBxCLXmA9dzNR0I
	Ul59Y5+/y2KTqq+mJoa8EJx2aRDn5T56XM/wGvDElqdjw2shPgtQ9+o8DJofYOyi88uFcX7C/fjjD
	cCWORelspVknBjHpGLOw9QIvzcXDUoJ3b0qlG8mrDKal4Z8/kuGakOoqZIQLwMhQkmLQdYZfenPhW
	mezMi5FqjfkIJUtRLaj73DJNqV9IZkGGdqwwA6srG+QvO9c/oJIuwdlQe41lGngQDWuISaTXQZqxl
	2Gb697FOXbrt2cz8Bg2hVZqU41RGWBlRJQHYbnSvoiMiVYd+zlddCGB8ixn67M5I4SEdZt3sxsfCW
	FZW+ogQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgV0O-006ZVD-1E;
	Wed, 13 Sep 2023 18:54:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgV0K-006ZSm-2S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 18:54:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fb46f38f9so108223b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694631263; x=1695236063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeNR7qwQLkJOVuge8P10O3vzgVEpbjfLDo4ctIHKwbU=;
        b=XZZ1kMMIgGBzihaj9IwQgnEHF03bAJEu4a4p1H2NWDL+jbR+H8zu9qWC5g4pM1xb0i
         JAUma+rJ2Lv+FcxCaQbM5LvyKI7WwpO0mi4rh1WldYn6zhgKH+xj8+saReEsNQ1+15fu
         TSSw8Pgf+VctmB9D/6HA4YcSpy8cJHzZA9mM2OH6QbPUrT35P6S7PsAHP5vVVc4sHV67
         WtV6RB7+7oh9YQ8GTEiBK6qbNypglozO5pAI+I88e77Uzx7YI3YyW7aFitYo1WhTdbnY
         uWHy7S6x9P4bLXZqpMpBYENi4sspER6OLfoY0ioJx32+x9MIqeLI1YAydyj3l3wfLUz6
         LxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694631263; x=1695236063;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeNR7qwQLkJOVuge8P10O3vzgVEpbjfLDo4ctIHKwbU=;
        b=KZDItat7J45hj75SOp/GDfqv2E5GwI/xAZVcNimjqRV+rl9bFfMOP55dlzC2jWPjdP
         DKnU8KWaTuEMx7GICtg0rBuPp8nE1FwHYSG56mUPkmb87nIoOWY6cdcvkGnPdf6zHmTu
         PJSsnEs0Y+Vh6wA49eEB8TECT6M3VV1kfz1f2rQ5iWaJ8RnFXqB6dLi8BKnPrIbjGDAI
         pFNkb7j7UEZrCgPv0dSAMgGloK+ZlSjXKaY1VdsLqA6ZiwaxEofmeXfOQpAteAQpRtRm
         28aIfBenqvcP3h27N3kFEWfY04SVRehCP8+Le36MSE+MRw3Mq08PYzIAa9vwqAu1bedi
         nPxg==
X-Gm-Message-State: AOJu0YwLNOYzji1hVLNOKOSv7GX0sJ+jVdAsx3IX9glT+UlNV30zWyI0
	IaNipDckK2M4+J57lGkvZ17m+Q==
X-Google-Smtp-Source: AGHT+IHWJanL/mhSZzKNrnjgZ9a4L8x4QH7mCct+onuawdEUp8h+RhW5cHMtW3sNV708kZgryFVaZg==
X-Received: by 2002:a05:6a21:329c:b0:12e:98a3:77b7 with SMTP id yt28-20020a056a21329c00b0012e98a377b7mr3872648pzb.59.1694631262697;
        Wed, 13 Sep 2023 11:54:22 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001a6d4ea7301sm10765184plg.251.2023.09.13.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 11:54:21 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:54:21 -0700 (PDT)
X-Google-Original-Date: Wed, 13 Sep 2023 11:54:19 PDT (-0700)
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce ERRATA_THEAD_QSPINLOCK
In-Reply-To: <ae320af5-6cca-4689-aa66-9d0193713d40@app.fastmail.com>
CC: guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
  boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org,
  rdunlap@infradead.org, Catalin Marinas <catalin.marinas@arm.com>,
  Conor Dooley <conor.dooley@microchip.com>, xiaoguang.xing@sophgo.com, Bjorn Topel <bjorn@rivosinc.com>,
  alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
  jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
  virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: sorear@fastmail.com
Message-ID: <mhng-ee184bd2-7666-402d-b0df-d484ed6d8236@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_115425_023880_88D2A53E 
X-CRM114-Status: GOOD (  31.49  )
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

On Sun, 06 Aug 2023 22:23:34 PDT (-0700), sorear@fastmail.com wrote:
> On Wed, Aug 2, 2023, at 12:46 PM, guoren@kernel.org wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> According to qspinlock requirements, RISC-V gives out a weak LR/SC
>> forward progress guarantee which does not satisfy qspinlock. But
>> many vendors could produce stronger forward guarantee LR/SC to
>> ensure the xchg_tail could be finished in time on any kind of
>> hart. T-HEAD is the vendor which implements strong forward
>> guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
>> with errata help.
>>
>> T-HEAD early version of processors has the merge buffer delay
>> problem, so we need ERRATA_WRITEONCE to support qspinlock.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> ---
>>  arch/riscv/Kconfig.errata              | 13 +++++++++++++
>>  arch/riscv/errata/thead/errata.c       | 24 ++++++++++++++++++++++++
>>  arch/riscv/include/asm/errata_list.h   | 20 ++++++++++++++++++++
>>  arch/riscv/include/asm/vendorid_list.h |  3 ++-
>>  arch/riscv/kernel/cpufeature.c         |  3 ++-
>>  5 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> index 4745a5c57e7c..eb43677b13cc 100644
>> --- a/arch/riscv/Kconfig.errata
>> +++ b/arch/riscv/Kconfig.errata
>> @@ -96,4 +96,17 @@ config ERRATA_THEAD_WRITE_ONCE
>>
>>  	  If you don't know what to do here, say "Y".
>>
>> +config ERRATA_THEAD_QSPINLOCK
>> +	bool "Apply T-Head queued spinlock errata"
>> +	depends on ERRATA_THEAD
>> +	default y
>> +	help
>> +	  The T-HEAD C9xx processors implement strong fwd guarantee LR/SC to
>> +	  match the xchg_tail requirement of qspinlock.
>> +
>> +	  This will apply the QSPINLOCK errata to handle the non-standard
>> +	  behavior via using qspinlock instead of ticket_lock.
>> +
>> +	  If you don't know what to do here, say "Y".
>
> If this is to be applied, I would like to see a detailed explanation somewhere,
> preferably with citations, of:
>
> (a) The memory model requirements for qspinlock
> (b) Why, with arguments, RISC-V does not architecturally meet (a)
> (c) Why, with arguments, T-HEAD C9xx meets (a)
> (d) Why at least one other architecture which defines ARCH_USE_QUEUED_SPINLOCKS
>     meets (a)

I agree.

Just having a magic fence that makes qspinlocks stop livelocking on some 
processors is going to lead to a mess -- I'd argue this means those 
processors just don't provide the forward progress guarantee, but we'd 
really need something written down about what this new custom 
instruction aliasing as a fence does.

> As far as I can tell, the RISC-V guarantees concerning constrained LR/SC loops
> (livelock freedom but no starvation freedom) are exactly the same as those in
> Armv8 (as of 0487F.c) for equivalent loops, and xchg_tail compiles to a
> constrained LR/SC loop with guaranteed eventual success (with -O1).  Clearly you
> disagree; I would like to see your perspective.

It sounds to me like this processor might be quite broken: if it's 
permanently holding stores in a buffer we're going to have more issues 
than just qspinlock, pretty much anything concurrent is going to have 
issues -- and that's not just in the kernel, there's concurrent 
userspace code as well.

> -s
>
>> +
>>  endmenu # "CPU errata selection"
>> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
>> index 881729746d2e..d560dc45c0e7 100644
>> --- a/arch/riscv/errata/thead/errata.c
>> +++ b/arch/riscv/errata/thead/errata.c
>> @@ -86,6 +86,27 @@ static bool errata_probe_write_once(unsigned int stage,
>>  	return false;
>>  }
>>
>> +static bool errata_probe_qspinlock(unsigned int stage,
>> +				   unsigned long arch_id, unsigned long impid)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_QSPINLOCK))
>> +		return false;
>> +
>> +	/*
>> +	 * The queued_spinlock torture would get in livelock without
>> +	 * ERRATA_THEAD_WRITE_ONCE fixup for the early versions of T-HEAD
>> +	 * processors.
>> +	 */
>> +	if (arch_id == 0 && impid == 0 &&
>> +	    !IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
>> +		return false;
>> +
>> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>  static u32 thead_errata_probe(unsigned int stage,
>>  			      unsigned long archid, unsigned long impid)
>>  {
>> @@ -103,6 +124,9 @@ static u32 thead_errata_probe(unsigned int stage,
>>  	if (errata_probe_write_once(stage, archid, impid))
>>  		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
>>
>> +	if (errata_probe_qspinlock(stage, archid, impid))
>> +		cpu_req_errata |= BIT(ERRATA_THEAD_QSPINLOCK);
>> +
>>  	return cpu_req_errata;
>>  }
>>
>> diff --git a/arch/riscv/include/asm/errata_list.h
>> b/arch/riscv/include/asm/errata_list.h
>> index fbb2b8d39321..a696d18d1b0d 100644
>> --- a/arch/riscv/include/asm/errata_list.h
>> +++ b/arch/riscv/include/asm/errata_list.h
>> @@ -141,6 +141,26 @@ asm volatile(ALTERNATIVE(						\
>>  	: "=r" (__ovl) :						\
>>  	: "memory")
>>
>> +static __always_inline bool
>> +riscv_has_errata_thead_qspinlock(void)
>> +{
>> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
>> +		asm_volatile_goto(
>> +		ALTERNATIVE(
>> +		"j	%l[l_no]", "nop",
>> +		THEAD_VENDOR_ID,
>> +		ERRATA_THEAD_QSPINLOCK,
>> +		CONFIG_ERRATA_THEAD_QSPINLOCK)
>> +		: : : : l_no);
>> +	} else {
>> +		goto l_no;
>> +	}
>> +
>> +	return true;
>> +l_no:
>> +	return false;
>> +}
>> +
>>  #endif /* __ASSEMBLY__ */
>>
>>  #endif
>> diff --git a/arch/riscv/include/asm/vendorid_list.h
>> b/arch/riscv/include/asm/vendorid_list.h
>> index 73078cfe4029..1f1d03877f5f 100644
>> --- a/arch/riscv/include/asm/vendorid_list.h
>> +++ b/arch/riscv/include/asm/vendorid_list.h
>> @@ -19,7 +19,8 @@
>>  #define	ERRATA_THEAD_CMO 1
>>  #define	ERRATA_THEAD_PMU 2
>>  #define	ERRATA_THEAD_WRITE_ONCE 3
>> -#define	ERRATA_THEAD_NUMBER 4
>> +#define	ERRATA_THEAD_QSPINLOCK 4
>> +#define	ERRATA_THEAD_NUMBER 5
>>  #endif
>>
>>  #endif
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index f8dbbe1bbd34..d9694fe40a9a 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -342,7 +342,8 @@ void __init riscv_fill_hwcap(void)
>>  		 * spinlock value, the only way is to change from queued_spinlock to
>>  		 * ticket_spinlock, but can not be vice.
>>  		 */
>> -		if (!force_qspinlock) {
>> +		if (!force_qspinlock &&
>> +		    !riscv_has_errata_thead_qspinlock()) {
>>  			set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);
>>  		}
>>  #endif
>> --
>> 2.36.1
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
