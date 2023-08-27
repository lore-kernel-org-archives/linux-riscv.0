Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28250C6FA8F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 02:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dkUgRnn/8P5JlgDNHw/jAHD+r2ZTKK7ZYFoC1VmpZ8A=; b=0ZS+qqaiPG/XicYYoNuTkQiOxd
	wASIQC6oxszyK1+NW9N8p0BmZ52v1Il6ZJgFmevMsNDkHn3yscdtlamPpL+unr6qAaI0iHGAzGC1N
	M37wysnUeT05YPJbjEwLwKWSmC99HbauAloRAHZWjl9GOnMYjhNKgaATDmHllmsHnD9XxKOhLjpvD
	PT9ObS9xpw6daVp8bfUxDjQUnSv3SWn3fiNK9zqcmjw5CTf8s0H9/LY6oov8EblZtzaqBTu709TvN
	L9UFXC2inrHhM4vzaTs2sWQF/BcBApYGjx1NN/zsf0vlKjmnRyB0R9FxzrwZG+wpJfyL5UZ+tEJtR
	W+s4Mmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa55C-007OMU-1J;
	Sun, 27 Aug 2023 02:00:54 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa559-007OLU-0z
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 02:00:53 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34baeb01942so7812325ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 19:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1693101649; x=1693706449;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlSuJKsHYnZJEVs8d+DkMrax8UWM8PJfpxzbSZhob4c=;
        b=SILQ0dy7yyODpbhPwIqg7gLpES7ddixyQwG5eJ3f/eCB4h58PirgfUl+PxkrwZF0of
         vQ/tzOjFcbOecqd8KchPhcJA3h2t96i5XuYbOnRStyI7wqGDNOfV5SfUu4Ya+wahQyok
         87ckMQB2pmHMUSx78/XuW/En7xot7HfP0EQhotd6pK/GWz8v+g9Wif7Y7L5YDeUfaWJd
         Syr26qTcui5k4V3CghKN2Ltu/llJKpiAyFc/z3dMfiKkQ4iO0VN2OoqUM5PGdGZlpOkr
         gz4ueUt681q5TIMkRS7VsHL8ZN3V0hMRUTnc6AqDiz9ybf6g4OpbcIKKfDA7/rLi9HKu
         DxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693101649; x=1693706449;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlSuJKsHYnZJEVs8d+DkMrax8UWM8PJfpxzbSZhob4c=;
        b=NWxiAJa2Falo3yw2fYJCSg82IBo5TYxo+zr/vREHyOuyoukJ2GfkvkfjBZQj2BmYYj
         ndvQEGI76v/886jKGGlYLsgV4NJNDWdjF7hgoGSBZBufCswv87TpHzj3d+Okier9a0ul
         FDjrWEk3SirdZt7NHBsQGrJ7Yft+lN4AoTrTtvkCvPc+9TwWbmWgfMgqn+991fDbI2ZM
         DaiS6TBy91zT3AkssbMRo0nNJMaWI8vLlOydU4+9O8zj2lMhgNgK5D86LJ5EFXzZi2Yw
         Ihoc8UkT+EBIkGlAwDGnoT5EcPfMJaFGgvbv2W0fUZgE6TtgbeooVguOtvz85+ZqtfgB
         yDBQ==
X-Gm-Message-State: AOJu0YzrCWJhElqbvQSQb5SqlC5wpWBOs5tawb+SgExcIMmcZkCITyya
	F3L5Mpd4fHDF2J7RznrOGWVTMg==
X-Google-Smtp-Source: AGHT+IG+vwM3D2XyZX5lR9mOoky02Ai+tLY9YcXHIjFwhPcdLHYppT+84YH7Ap2mNkHSRwfULseVhQ==
X-Received: by 2002:a05:6e02:1d96:b0:345:f28f:cc26 with SMTP id h22-20020a056e021d9600b00345f28fcc26mr15749614ila.24.1693101649219;
        Sat, 26 Aug 2023 19:00:49 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc930d4517sm4472599pln.42.2023.08.26.19.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 19:00:47 -0700 (PDT)
Date: Sat, 26 Aug 2023 19:00:47 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Aug 2023 19:00:43 PDT (-0700)
Subject: Re: [PATCH 1/5] riscv: Checksum header
In-Reply-To: <20230827-turf-parched-b965bc697882@spud>
CC: charlie@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_190051_589297_00E3054E 
X-CRM114-Status: GOOD (  26.02  )
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

On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
>> Provide checksum algorithms that have been designed to leverage riscv
>> instructions such as rotate. In 64-bit, can take advantage of the larger
>> register to avoid some overflow checking.
>> 
>> Add configuration for Zba extension and add march for Zba and Zbb.
>> 
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> ---
>>  arch/riscv/Kconfig                | 23 +++++++++++
>>  arch/riscv/Makefile               |  2 +
>>  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 111 insertions(+)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 4c07b9189c86..8d7e475ca28d 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>>  
>>  	  If you don't know what to do here, say Y.
>>  
>> +config TOOLCHAIN_HAS_ZBA
>> +	bool
>> +	default y
>> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
>> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>> +	depends on AS_HAS_OPTION_ARCH
>> +
>> +config RISCV_ISA_ZBA
>> +	bool "Zba extension support for bit manipulation instructions"
>> +	depends on TOOLCHAIN_HAS_ZBA
>> +	depends on MMU
>> +	depends on RISCV_ALTERNATIVE
>> +	default y
>> +	help
>> +	   Adds support to dynamically detect the presence of the ZBA
>> +	   extension (basic bit manipulation) and enable its usage.
>> +
>> +	   The Zba extension provides instructions to accelerate a number
>> +	   of bit-specific address creation operations.
>> +
>> +	   If you don't know what to do here, say Y.
>> +
>>  config TOOLCHAIN_HAS_ZBB
>>  	bool
>>  	default y
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 6ec6d52a4180..51fa3f67fc9a 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>>  riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
>> +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
>> +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
>
> AFAICT, this is going to break immediately on any system that enables
> RISCV_ISA_ZBA (which will happen by default) but does not support the
> extension. You made the option depend on RISCV_ALTERNATIVE, but I do
> not see any use of alternatives in the code to actually perform the
> dynamic detection of Zba.

I guess we kind of have an ambiguity here: for stuff like C we just 
unconditionally use the instructions, but for the rest we probe first.  
We should probably have three states for each extension: disabled, 
dynamically detected, and assumed.

> Note that for fd & v, we add it to riscv-march-y, but then immediately
> remove it again before passing to the compiler, only allow them in
> AFLAGS:
> 	# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> 	# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
> 	KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>
> What am I missing?

FD and V both have state that can be saved lazily, so we can't let 
arbitrary code use them.  The extensions formally known as B don't add 
state, so they are safe to flip on in arbitrary places (aside from the 
issues you pointed out above).

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
