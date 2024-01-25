Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7764AC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0A+c6Nr8f7Nwv+VFZwe9HonuC7FHQWPG1/53iEBDW8=; b=Uat8eqX1WKPfIoWLrsMII2MWFA
	wFbHTvF6Oa8A4EzCDs4fU59RARJmlXWWDw+Ca9WydEH2SMp/ltn/mcV3qM8sG1DqnUFkUzdS0t2KG
	nKJsAy1o6QmqHZWbgFIVEFr5aRyTAHITRvf/McdAR2jQHYLiuZ+jmtuY6+/VTPuXppCqBVneOGkqk
	0NEQQevazxkCeRqU2a+Z1MNuvR9NaTivRVeQiQnB5F1qL7IyOaHZcvhUxj+Tm81i2TeW7h+aLV/II
	p0jKB3BfcyyNfzjMx6HmUfl7a4ygtaIgg0MR/4AZtd1GsJb7HpWFmrYqFnH9iaV3AFQQv38kxTvx3
	Sx0LSHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4DC-00000001HFM-3mXb;
	Thu, 25 Jan 2024 18:12:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4D9-00000001HEO-2J6r
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:12:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d70a986c4aso33510555ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 10:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706206341; x=1706811141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOQ7PY5RMwdW49c44PeUD39W3uvEolKYcNoKx9tZHuc=;
        b=DdPmhtZ2MOcTSwPUfKdFfsRfX5hfY0HSSXzFY0sJzNmB+FIf35y+OhbGxmu1VTAsPd
         AIEiowOrMx6RK5G2Xf5g+4SMDZmuMFC00YytxbZQ1aerBd6wIwtzs+nRVf1OCbCNZ3pj
         TAci68qo6OrPlj8nU2ehEv8G0O6gqpC0d0Wp9k15dK0qrsul02GaDzdfpI/SPNwlGNTh
         gQ3neir95l79WS6lN0RfVNbUsEVGy9aT8qJikDSXRpguWjRVlpiRn5jmtye0cSYVYm/Z
         FWWDl65wVX2ZMGEOe9EccD0TjuQJIKm+kN/FDtx2qqOv8lIr+tdXFehMNFUb/nF+IvEU
         WoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206341; x=1706811141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOQ7PY5RMwdW49c44PeUD39W3uvEolKYcNoKx9tZHuc=;
        b=UPQzXGc1AffXIxa4bTA3DhB9GsorBUCtgiVuejD3zrKO0lJa6QKGBonaJyB2BwOVBu
         Sfe9KPqJMUcx7BVYt30Ekjus1DmGnOBS+X13xo6uIjQYyQTmgO1JSTRTc2zmArwQVFKz
         6ip7DyNLUhIxGLqFW0z6eReCK3dzKjPCOurFQM02Nt+mSGf3ChPKUjiPYFAXxMk0xsG9
         Yefe/Kr8Fzm//AB1NbVP+LYHYmAXSBL1oHga24ueFw6dBVLjI5ATewIRvRl3MARL3cXN
         eSBOEtiuOaiXxtnoPB5cf9/wt1c2Ofu2GFYAfU7WP8LWhhY2LNWByDpYRKazOqoGAdg9
         fa6A==
X-Gm-Message-State: AOJu0YyXfFdWLWVtWfHdAoXthuhio3LZCHgI37eSLw11GKDizBWivim+
	/dlwo7KzGcG+S1ua+JisGPs3ENawQsnIVeuOdGqegLSNwYpWL7gWQ9c2Nt68Q44=
X-Google-Smtp-Source: AGHT+IGPUyyPX5hM1Yrkm5iskfPCqBeEPRsk5d1X3OtxSMKWSiBaRZNyP6s8gkZ7PqF+fErCTpo4Gg==
X-Received: by 2002:a17:902:b284:b0:1d4:2d8d:3536 with SMTP id u4-20020a170902b28400b001d42d8d3536mr91755plr.71.1706206340832;
        Thu, 25 Jan 2024 10:12:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jy13-20020a17090342cd00b001d720fa139fsm10390442plb.70.2024.01.25.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:12:20 -0800 (PST)
Date: Thu, 25 Jan 2024 10:12:16 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 24/28] riscv: select config for shadow stack and
 landing pad instr support
Message-ID: <ZbKkgNX7xfU5KO8X@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-25-debug@rivosinc.com>
 <20240125-snitch-boogieman-5b4a0b142e61@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125-snitch-boogieman-5b4a0b142e61@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_101223_827822_A22E3A6C 
X-CRM114-Status: GOOD (  17.92  )
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

On Thu, Jan 25, 2024 at 06:04:26PM +0000, Conor Dooley wrote:
>On Wed, Jan 24, 2024 at 10:21:49PM -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> This patch selects config shadow stack support and landing pad instr
>> support. Shadow stack support and landing instr support is hidden behind
>> `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up path
>> to enumerate CPU support and if cpu support exists, kernel will support
>> cpu assisted user mode cfi.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/Kconfig | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 9d386e9edc45..437b2f9abf3e 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -163,6 +163,7 @@ config RISCV
>>  	select SYSCTL_EXCEPTION_TRACE
>>  	select THREAD_INFO_IN_TASK
>>  	select TRACE_IRQFLAGS_SUPPORT
>> +	select RISCV_USER_CFI
>
>This select makes no sense to me, it will unconditionally enable
>RISCV_USER_CFI. I don't think that that is your intent, since you have a
>detailed option below that allows the user to turn it on or off.
>
>If you remove it, the commit message will need to change too FYI.
>

Selecting this config puts support in Kernel so that it can run tasks who wants
to enable hardware assisted control flow integrity for themselves. But apps still
always need to optin using `prctls`. Those prctls are stubs and return EINVAL when
this config is not selected. Not selecting this config means, kernel will not support
enabling this feature for user mode.

I'll edit commit message to better reflect this.

>Thanks,
>Conor.
>
>>  	select UACCESS_MEMCPY if !MMU
>>  	select ZONE_DMA32 if 64BIT
>>
>> @@ -182,6 +183,20 @@ config HAVE_SHADOW_CALL_STACK
>>  	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>>  	depends on $(ld-option,--no-relax-gp)
>>
>> +config RISCV_USER_CFI
>> +	bool "riscv userspace control flow integrity"
>> +	help
>> +	  Provides CPU assisted control flow integrity to userspace tasks.
>> +	  Control flow integrity is provided by implementing shadow stack for
>> +	  backward edge and indirect branch tracking for forward edge in program.
>> +	  Shadow stack protection is a hardware feature that detects function
>> +	  return address corruption. This helps mitigate ROP attacks.
>> +	  Indirect branch tracking enforces that all indirect branches must land
>> +	  on a landing pad instruction else CPU will fault. This mitigates against
>> +	  JOP / COP attacks. Applications must be enabled to use it, and old user-
>> +	  space does not get protection "for free".
>> +	  default y
>> +
>>  config ARCH_MMAP_RND_BITS_MIN
>>  	default 18 if 64BIT
>>  	default 8
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
