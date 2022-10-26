Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TMZiqZM7qKG4j/ETB7Z69gZCwZXCuhEYcirc9Ien6f8=; b=Lt4wPS8qImagOF5OuZEvquoom8
	TzMB21PSe0Xrq1k2NbkdIogOEPUozewOxYRkA0B64kLVhzHe6ZsDLtjbs6r7gD35/eebmvai5S8c9
	3IIm/q0dyIsqg6sVg9qtX7d55tmlEODYOQ0ul/ZOIk8dlDroAl5XtOgwfIc/RpxeZyKkztKJbZMRO
	JagoW3Eyv3QnORt8p8sGeNitPSSqP1XSIvn+AydTtYTYrRLWFeRpuaDnp5P/IrREMkSvnqr57iR3a
	OTVTfjBYYriZpad1nzX4jAck4CoHflPBk+BoCB1qztsVndtLgFxN9Q99MNAv5IMsBih21BB5ytQNL
	a8ipP63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongwX-009b4M-43; Wed, 26 Oct 2022 13:59:41 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongwE-009ayj-C9
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 13:59:24 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-12c8312131fso20096697fac.4
        for <linux-riscv@lists.infradead.org>; Wed, 26 Oct 2022 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfyR/Tx2YrJr2+0GB3rE6Edzxc43nhhgdPrci6LuUC8=;
        b=OeK5wNwoI4T5cOsTsmcmKGTzgcZlDwB2Rix/EhxBM6a8aXl0LDKzBpQUABkroSWrLs
         4KPkmc254SQjjvrC2eDjozz8YRA4l1mTUsLEJOZJWderh7CRxXUYCW8drlIyVsYiFLmP
         s0SydLN163TzJ7HLUMfCP2K2zTOrZWvsIpHryDmJZtUk6tpPyD4PdKk8qw5UwWna9gne
         YJig/uUnXCHuSORavizX03+xqBhcXWYIRTiuW/w6QdtIjzS1Cb8KCCez5StuQknPT93Y
         JbOAjqtLLFAZzHnlJQHjECNBsRXkh0BHUdBaG7OkGnvaNRBfLw+aGwjVBFQWcvGzZjun
         3oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfyR/Tx2YrJr2+0GB3rE6Edzxc43nhhgdPrci6LuUC8=;
        b=kRuVXP1Ve6fZC0QhJwqsi4VRLlYYWRUXuNdOOGRvdtG91e6gquFhpD99F1/5AqrMpd
         7VSDVmj8BP08ONcKmvhvxJNQy3juczWOMJUawWeuhTx6475EtFZRGHSFhLJcakYQHt8j
         Is8DC6aGbptbGknKblkK/mIXGkherbpsR28gyMrKxXRvVJIIYw+rk8H7nLus630ZT+x6
         nSY+ISYE89LkUw5ys5X6KM2NvY5LU1jDuyeAW66rWi/hwl9McwHO3Ebtn7RSq9Am0H3c
         3qHwe1rjQM0gTgDfxrt208g9EKHEhI4o0v6WF2nUYoVgQuGtJkcTY8YTopX9IkgKVPqj
         +KBw==
X-Gm-Message-State: ACrzQf2gzm30MKgwJbjciNh1+BkYZcqZ/hN1YINSs73xeF2l1bxiLxue
	9jYWJIOaxzj3MTsoiOUTpBdyiV9dCpSg2w==
X-Google-Smtp-Source: AMsMyM6Rntwur5E6cD3lENn4JxTAtCUFkswVbmCP+HOzy4XWlAgzvLZK0nze43VSxgq7FOsd71DbAw==
X-Received: by 2002:a17:90a:c78a:b0:212:e56b:2b17 with SMTP id gn10-20020a17090ac78a00b00212e56b2b17mr4399137pjb.51.1666792749850;
        Wed, 26 Oct 2022 06:59:09 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id om2-20020a17090b3a8200b0020d3662cc77sm1148299pjb.48.2022.10.26.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:59:09 -0700 (PDT)
Date: Wed, 26 Oct 2022 06:59:09 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Oct 2022 06:59:05 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
In-Reply-To: <Yz56K2W/6ttN1SLT@xhacker>
CC: samuel@sholland.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
  anup@brainfault.org, Atish Patra <atishp@rivosinc.com>, daolu@rivosinc.com, guoren@kernel.org,
  heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-9854c795-768e-4db5-a167-0cc80561cd7e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_065922_444052_CB78D2A2 
X-CRM114-Status: GOOD (  30.05  )
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

On Wed, 05 Oct 2022 23:48:11 PDT (-0700), jszhang@kernel.org wrote:
> On Thu, Sep 22, 2022 at 01:09:58AM -0500, Samuel Holland wrote:
>> commit 8eb060e10185 ("arch/riscv: add Zihintpause support") broke
>> building with CONFIG_CC_OPTIMIZE_FOR_SIZE enabled (gcc 11.1.0):
>>
>>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>> In file included from <command-line>:
>> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
>> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0 probably does not match constraints
>>   285 | #define asm_volatile_goto(x...) asm goto(x)
>>       |                                 ^~~
>> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>>    41 |         asm_volatile_goto(
>>       |         ^~~~~~~~~~~~~~~~~
>> ././include/linux/compiler_types.h:285:33: error: impossible constraint in 'asm'
>>   285 | #define asm_volatile_goto(x...) asm goto(x)
>>       |                                 ^~~
>> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>>    41 |         asm_volatile_goto(
>>       |         ^~~~~~~~~~~~~~~~~
>> make[1]: *** [scripts/Makefile.build:249: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
>> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
>>
>> Having a static branch in cpu_relax() is problematic because that
>> function is widely inlined, including in some quite complex functions
>> like in the VDSO. A quick measurement shows this static branch is
>> responsible by itself for around 40% of the jump table.
>>
>> Drop the static branch, which ends up being the same number of
>> instructions anyway. If Zihintpause is supported, we trade the nop from
>> the static branch for a div. If Zihintpause is unsupported, we trade the
>> jump from the static branch for (what gets interpreted as) a nop.
>
> Hi Samuel,
>
> I'm not sure whether it's correct to remove static branch usage from
> cpu_relax, but your report inspired my patch of constifying arguments
> of arch_static_branch() and arch_static_branch_jump() [1]. Could you
> please also test it?
>
> Thanks very much
>
> [1]https://lore.kernel.org/linux-riscv/20221006064028.548-1-jszhang@kernel.org/T/#u

Thanks.  IMO that's the better short-term fix, as that sorts out the 
build errors without dropping the div routine and we need the div 
routine to avoid regression on the old SiFive cores (like the one in the 
PolarFire SOC).  We can make a few improvements, though:

* If folks are worried about the performance of the static branch then 
  we can convert this over to an alternative.  It should be safe to 
  default to pause as it aliases a fence, it's just not as good at 
  slowing down the core.
* We can just drop the Zihintpause detection entirely and go with 
  .4byte/.insn to encode the pause.  That's essentially what we've dove 
  with the T-Head Zicbom stuff, but not sure it's worth it here because 
  Zihintpause is new.

>
>>
>> Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  arch/riscv/include/asm/hwcap.h          |  3 ---
>>  arch/riscv/include/asm/vdso/processor.h | 25 ++++++++++---------------
>>  2 files changed, 10 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 6f59ec64175e..b21d46e68386 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -68,7 +68,6 @@ enum riscv_isa_ext_id {
>>   */
>>  enum riscv_isa_ext_key {
>>  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
>> -	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>>  	RISCV_ISA_EXT_KEY_MAX,
>>  };
>>
>> @@ -88,8 +87,6 @@ static __always_inline int riscv_isa_ext2key(int num)
>>  		return RISCV_ISA_EXT_KEY_FPU;
>>  	case RISCV_ISA_EXT_d:
>>  		return RISCV_ISA_EXT_KEY_FPU;
>> -	case RISCV_ISA_EXT_ZIHINTPAUSE:
>> -		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
>> index 1e4f8b4aef79..789bdb8211a2 100644
>> --- a/arch/riscv/include/asm/vdso/processor.h
>> +++ b/arch/riscv/include/asm/vdso/processor.h
>> @@ -4,30 +4,25 @@
>>
>>  #ifndef __ASSEMBLY__
>>
>> -#include <linux/jump_label.h>
>>  #include <asm/barrier.h>
>> -#include <asm/hwcap.h>
>>
>>  static inline void cpu_relax(void)
>>  {
>> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
>>  #ifdef __riscv_muldiv
>> -		int dummy;
>> -		/* In lieu of a halt instruction, induce a long-latency stall. */
>> -		__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>> +	int dummy;
>> +	/* In lieu of a halt instruction, induce a long-latency stall. */
>> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>>  #endif
>> -	} else {
>> -		/*
>> -		 * Reduce instruction retirement.
>> -		 * This assumes the PC changes.
>> -		 */
>> +	/*
>> +	 * Reduce instruction retirement.
>> +	 * This assumes the PC changes.
>> +	 */
>>  #ifdef __riscv_zihintpause
>> -		__asm__ __volatile__ ("pause");
>> +	__asm__ __volatile__ ("pause");
>>  #else
>> -		/* Encoding of the pause instruction */
>> -		__asm__ __volatile__ (".4byte 0x100000F");
>> +	/* Encoding of the pause instruction */
>> +	__asm__ __volatile__ (".4byte 0x100000F");
>>  #endif
>> -	}
>>  	barrier();
>>  }
>>
>> --
>> 2.35.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
