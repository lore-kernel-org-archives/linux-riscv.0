Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB39C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oyqn5+W3aF7o8xZNSnTkhkndrfjdPnnNdMu/AaeZgtc=; b=bb5MoBBKNZh8OERoHF74Yh+Rsx
	GD+eX1wdv5Udg/fEKdFldkN/Ga3X3n9UuR05PTo3gmhXAAyi2h+Qq96yh58XpTbIGuo+3ULlU8Pf1
	GIyHJFozNZ113D0bi+hYmaNVIa6ZPGUAQ7AYmrIJ02QE5QHzxYLCl7OAvChm1JMGlwv1VC41BJT8r
	lu3RutHyHCfKRb3mPzGeAjpl3tfVLcVy6tr18YQpNn4KyQWgT2010X9DvmqYjxziFDQe4v90gDSd+
	YthE9YlS09t0v6oQ2RBRaGhrcEudHfbfyUu7vGIVISAAl7BosjJXw21cns8+OVM7CDhA8Z4J7sZm0
	GFqwHQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4R9-00000001Ky2-3R6Z;
	Thu, 25 Jan 2024 18:26:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4Qk-00000001KmU-1guc
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:26:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ddc5faeb7fso1240252b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706207184; x=1706811984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyuZ0gVdBuvlPmtjlhSz8uJtD77t/nVDJ3cBvemqEj0=;
        b=0HSmSfyrl6Evo4JBOiIPOo98sWM3JTeBqZAPj/58yc0gCAa0GCFHTW8VI6jIXJi5TO
         YYaJ2TRE08aaEft2dQ2SulCWIalv7fbROyY2AKyQ30qS4zyPDKIRZntHdDqUyxBOWWcT
         1F/Lr39Ako4DzNbBWcSp82DUzD7g0DCuMw+FcFfcjrVY+t9COcXAM+D0zNbrzvMX4fzw
         7t4ZsGHpN8TfXvOXTAPOavf8AIKomZXwOxGGut5W1YzAkTF5SZUwaOx4cMJb2Gi2PbiE
         23PuPse2RvFPJ+/61XY0T+DWuBisT06GANybrfFZY+jyu1b1gOv+vayFnpVwKgCkhnnB
         YdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706207184; x=1706811984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyuZ0gVdBuvlPmtjlhSz8uJtD77t/nVDJ3cBvemqEj0=;
        b=uRvpbofkOVIi9mlxR4olg5DkUH10JJoX19HsJ/OdjU7vkTHzfZC/oNqPpR+VOkiwmh
         ULPebcoUeCopsQQj7TI6liAVlsDAStAlhTb9vozx9bcFJjIodO75MI9VQmUJ8SPFrdLy
         Hoh0/0p5ytIoyPGoEo0yXg859j/2R8vEKMjWCfFrJ41Ed64addJxRVUw6s58M6fW30jc
         sC/DVPSl1LEZhAizkRhnNpDPh0ENsqqMWhTsWahE3o4T7SVPeuGQ+DbWBxZ7o36kjuiG
         63ML3fnwebd/4V2gj3Bbej4iF5oKsZ1+7yJ5MHNo75OSS9IuKHq/8ywYR11Wky3Q3TXK
         9n5w==
X-Gm-Message-State: AOJu0YzyFyafTYL83KHaIW8EnyB5PQOoZ6e06OYGwyerj5PaSNFPIs+J
	kJXqpKhdyKXpMun0HeU1oDsMNz62TYtYp4N+gdpv3EsJjRX80tNdn7fkpBTA+qM=
X-Google-Smtp-Source: AGHT+IFBV2oC78chsLzac9k77DXS5/WbnhoEAPatEDRZ6lhNeqqRGgEsUCPUu1zeHuG1e8R3Jwt8hg==
X-Received: by 2002:a05:6a20:1453:b0:199:ad49:ea79 with SMTP id a19-20020a056a20145300b00199ad49ea79mr78878pzi.63.1706207184482;
        Thu, 25 Jan 2024 10:26:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j38-20020a635526000000b005cf7c4bb938sm13685563pgb.94.2024.01.25.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:26:24 -0800 (PST)
Date: Thu, 25 Jan 2024 10:26:19 -0800
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
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 05/28] riscv: zicfiss/zicfilp enumeration
Message-ID: <ZbKny7ZAG5FWHwwF@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-6-debug@rivosinc.com>
 <20240125-unscathed-coeditor-31f04e811489@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125-unscathed-coeditor-31f04e811489@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_102626_575532_91B6BC43 
X-CRM114-Status: GOOD (  22.16  )
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

On Thu, Jan 25, 2024 at 05:59:24PM +0000, Conor Dooley wrote:
>Yo,
>
>Series is RFC, so not gonna review it in depth, just wanted to comment
>on this particular patch.
>
>On Wed, Jan 24, 2024 at 10:21:30PM -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> This patch adds support for detecting zicfiss and zicfilp. zicfiss and zicfilp
>> stands for unprivleged integer spec extension for shadow stack and branch
>> tracking on indirect branches, respectively.
>>
>> This patch looks for zicfiss and zicfilp in device tree and accordinlgy lights
>> up bit in cpu feature bitmap. Furthermore this patch adds detection utility
>> functions to return whether shadow stack or landing pads are supported by
>> cpu.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/cpufeature.h | 18 ++++++++++++++++++
>>  arch/riscv/include/asm/hwcap.h      |  2 ++
>>  arch/riscv/include/asm/processor.h  |  1 +
>>  arch/riscv/kernel/cpufeature.c      |  2 ++
>>  4 files changed, 23 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>> index a418c3112cd6..216190731c55 100644
>> --- a/arch/riscv/include/asm/cpufeature.h
>> +++ b/arch/riscv/include/asm/cpufeature.h
>> @@ -133,4 +133,22 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
>>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>>  }
>>
>> +static inline bool cpu_supports_shadow_stack(void)
>> +{
>> +#ifdef CONFIG_RISCV_USER_CFI
>
>In passing, I don't see any reason for not using IS_ENABLED() here.

No reason. I should probably do that. More readable.
Thanks.

>
>> +	return riscv_isa_extension_available(NULL, ZICFISS);
>> +#else
>> +	return false;
>> +#endif
>> +}
>> +
>> +static inline bool cpu_supports_indirect_br_lp_instr(void)
>> +{
>> +#ifdef CONFIG_RISCV_USER_CFI
>> +	return riscv_isa_extension_available(NULL, ZICFILP);
>> +#else
>> +	return false;
>> +#endif
>> +}
>> +
>>  #endif
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 06d30526ef3b..918165cfb4fa 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -57,6 +57,8 @@
>>  #define RISCV_ISA_EXT_ZIHPM		42
>>  #define RISCV_ISA_EXT_SMSTATEEN		43
>>  #define RISCV_ISA_EXT_ZICOND		44
>> +#define RISCV_ISA_EXT_ZICFISS	45
>> +#define RISCV_ISA_EXT_ZICFILP	46
>>
>>  #define RISCV_ISA_EXT_MAX		64
>>
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> index f19f861cda54..ee2f51787ff8 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -13,6 +13,7 @@
>>  #include <vdso/processor.h>
>>
>>  #include <asm/ptrace.h>
>> +#include <asm/hwcap.h>
>>
>>  #ifdef CONFIG_64BIT
>>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 98623393fd1f..16624bc9a46b 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -185,6 +185,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>> +	__RISCV_ISA_EXT_DATA(zicfiss, RISCV_ISA_EXT_ZICFISS),
>> +	__RISCV_ISA_EXT_DATA(zicfilp, RISCV_ISA_EXT_ZICFILP),
>
>Anything you add to this array, you need to document in a dt-binding.

You mean Documentation/devicetree/bindings/riscv/extensions.yaml
(or possibly any other yaml if needed?)

>Also, you added these in the wrong place. There's a massive comment
>before the array describing the order entries must be in, please take a
>look.

I see the comment.
In my defense, looks like I missed it when I was rebasing.

Will fix it.

>
>Thanks,
>Conor.
>
>
>>  };
>>
>>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
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
