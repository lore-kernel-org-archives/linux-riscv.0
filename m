Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D9C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+ShjUrPo4UiE3tG/IOXMo9afVGaL0ogO/9FxmEuFKk=; b=SPbh/4nWfh2AsSEDqpRPR+vwq5
	+KJDcQC3jVAPi41+Z6MGGWsTGB/yictYhR8fFHj/Weihq/q6jiyJ6Xp9VclwuMFnadCMLXMAnymTm
	DWAzyh4NrAFuaFtGGXrXBZ80ITvx5Wyzw5FoAa/JNcMF/DRUH3/EtxlV2g1Om+5N32qgvkWuzvj9N
	f4JqvExAGx+x66IyrfxpmyMJpyHH3YVSkOcRI4JHXip8blXIu/4cGNPlbYOC2MP8mT1QmAwRDp2La
	q8Tg173yLrPTr98Y0raj8perNQJ2Emx9eLX99OT5TgT3481tKcS+fOL8apR0htHTIlyXPa4nLGapV
	N8e7xznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s590b-00000002SUW-1Ndl;
	Thu, 09 May 2024 19:00:49 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s590W-00000002SRq-1wy4
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 19:00:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f4178aec15so1147971b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715281242; x=1715886042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suVrTFWe4Q9EJfAXikAfGsbIG5FwHp88I8wjDmo5qhw=;
        b=03FwDViIyoS6iWEX+2k0LdgglKaCGGgK4aolw5uDDF3hHTG42nQDvcJVFPhuH9Yzvu
         3r2yLsgkyC2JMW0sb61J4WsrGhbpqPHeGikxRcvZNhLmB64S4khQP3pNeoH2Le/nDbAJ
         y+jTKAKOkFxsiUtNkebSYiYb2TVL8DoOJ2lWrL3au2fwpTc3pZjT39L6fJQq8UQMlngH
         YTZhQ5GdKGDgQgqI/gzC+VezMalTgvqT0N+wwXSltpyGPnMIM+CXO0nmMlxYVEGskFHf
         s1izN8K2B/UhB8SHIFLzaErNRPK9zZG2I9Q8xJ7cMXV+Ok20fH176f5wyKxgyjJW7uTm
         g7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715281242; x=1715886042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suVrTFWe4Q9EJfAXikAfGsbIG5FwHp88I8wjDmo5qhw=;
        b=tnUUle7Lzkj2s72cNVA8vu/tpq+dGBgTapdAW/M43r+MmVPag0R8jIThkVv8eTP/Kl
         DW3mw7q4SN2GEKNOHcFigg5IXb0C58xIzHG+uij8HmAOQ6ldTNm1antsCyZ8OlhNM5+k
         LQXBcFioufFBtbPKBFOtGG15b9r9NmRPAPf9j6C8ybC+7aZfb5OWtovLsx0jd4HuMICK
         I9XGuk4s+dBnY58JpV4eD0NBe0K7pv71ONaIhMEBB7I93uuNOXeu8sRhS9SrT2wHU3Ni
         OByf6qe8meYKZvwFJqSsY838mD4+qwK4AE3VuigZt33Z4N50lhSfwi8eOJZRGLrBXcD/
         8sEA==
X-Forwarded-Encrypted: i=1; AJvYcCU5jbXZbPb+buRmwqPJLlg5KELteWtO6SkaCaMlI3spqWVx3Neuh/6owUCRkhuJalAY9sqCcR1nbi/sWYJ/4HH6GVx+s9Lq9BCgiPeNWbGi
X-Gm-Message-State: AOJu0YyM/jq9YVyPNdgkAFOSlzT9+wHW/9LrsztGH5xC55BKCiIsNT7V
	/HtT6ERxjFHg5kgug7tU7wK6+V0R+vd54oCehG7RImYB1RvKPA6ffGnfusEW7R4=
X-Google-Smtp-Source: AGHT+IHE3J/hwAQsHqywRim+p5Loya/dtj3SbYe2Ez8JQSaJRUzBly/edfRtpEMzoFQPu7m0vRKdfQ==
X-Received: by 2002:a05:6300:8002:b0:1af:62a6:e2 with SMTP id adf61e73a8af0-1afde1fb753mr598976637.56.1715281241943;
        Thu, 09 May 2024 12:00:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6654asm1626451b3a.43.2024.05.09.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:00:41 -0700 (PDT)
Date: Thu, 9 May 2024 12:00:36 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
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
Message-ID: <Zj0dVJ20D05ELAoH@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-2-debug@rivosinc.com>
 <ZjwUhvLBv13qi77a@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjwUhvLBv13qi77a@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_120044_600663_4B5CA96F 
X-CRM114-Status: GOOD (  18.73  )
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

On Wed, May 08, 2024 at 05:10:46PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:34:49PM -0700, Deepak Gupta wrote:
>> envcfg CSR defines enabling bits for cache management instructions and
>> soon will control enabling for control flow integrity and pointer
>> masking features.
>>
>> Control flow integrity enabling for forward cfi and backward cfi are
>> controlled via envcfg and thus need to be enabled on per thread basis.
>>
>> This patch creates a place holder for envcfg CSR in `thread_info` and
>> adds logic to save and restore on task switching.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
>>  arch/riscv/include/asm/thread_info.h |  1 +
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
>> index 7efdb0584d47..2d9a00a30394 100644
>> --- a/arch/riscv/include/asm/switch_to.h
>> +++ b/arch/riscv/include/asm/switch_to.h
>> @@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
>>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>>  #endif
>>
>> +static inline void __switch_to_envcfg(struct task_struct *next)
>> +{
>> +	register unsigned long envcfg = next->thread_info.envcfg;
>
>This doesn't need the register storage class.
>

yeah. will fix it. thanks.

>> +
>> +	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
>> +							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
>> +							  :: "r" (envcfg) : "memory");
>> +}
>> +
>
>Something like:
>
>static inline void __switch_to_envcfg(struct task_struct *next)
>{
>	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>		csr_write(CSR_ENVCFG, next->thread_info.envcfg);
>}
>
>would be easier to read, but the alternative you have written doesn't
>have the jump that riscv_has_extension_unlikely has so what you have
>will be more performant.

Yeah looked at codegen of `riscv_has_extension_unlikely` and I didn't like un-necessary jumps,
specially in switch_to path. All I want is a CSR write. So used alternative to patch nop with
CSR write.

>
>Does envcfg need to be save/restored always or just with
>CONFIG_RISCV_USER_CFI?

There is no save (no read of CSR). Only restore (writes to CSR).

There are pointer masking patches from Samuel Holland where senvcfg needs to be context
switched on per task basis.
https://lore.kernel.org/lkml/20240319215915.832127-1-samuel.holland@sifive.com/T/

Given that this CSR controls user execution environment and is per task basis, I thought its
better to not wrap it under CONFIG_RISCV_USER_CFI and rather make it dependend on
RISCV_ISA_EXT_XLINUXENVCFG. If any of the extensions which require senvcfg, then simply
restore this CSR on per task basis.

>
>- Charlie
>
>>  extern struct task_struct *__switch_to(struct task_struct *,
>>  				       struct task_struct *);
>>
>> @@ -80,6 +89,7 @@ do {							\
>>  		__switch_to_fpu(__prev, __next);	\
>>  	if (has_vector())					\
>>  		__switch_to_vector(__prev, __next);	\
>> +	__switch_to_envcfg(__next);				\
>>  	((last) = __switch_to(__prev, __next));		\
>>  } while (0)
>>
>> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> index 5d473343634b..a503bdc2f6dd 100644
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> @@ -56,6 +56,7 @@ struct thread_info {
>>  	long			user_sp;	/* User stack pointer */
>>  	int			cpu;
>>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>> +	unsigned long envcfg;
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>  	void			*scs_base;
>>  	void			*scs_sp;
>> --
>> 2.43.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
