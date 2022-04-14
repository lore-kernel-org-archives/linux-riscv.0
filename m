Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=khWANkHDSkRmCIx8s02qnwDs7zNiot3LDHzZcV3slzs=; b=sKPFi51RQ3h4KqK0lo0ePd1PWu
	Qi+cENmfdx0moTVlVx5A/D6uYxUVGJWvtYd9MIwqqdtvkX1JIsMnWd3rw6gY3eO3POpsRiQg8OM/P
	WkLpoUgaAANiwtSxt0Wup+cQazSKPWPvvuQ/sGUJYwjb/Yu7t8/k2s+FyvlybpI5JC2goreuY/4wz
	/ICmbxI3yl37g6S6ZzLy8WBT8skjGtbfpMreHq4nf96cfOnBUl+c22r/UtzVIf3/aHLxw+7rXCQPv
	cZJNe93qX6qyJsKDXECQ/X3GdhlsmBvk3XFZbBXOHqmVFueCu5WAWX68Ftx91aVd18gQOzhRQyqk4
	De3339yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neoTH-003Hy2-IT; Thu, 14 Apr 2022 01:40:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neoTC-003Hwt-OY
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 01:40:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id c23so3503697plo.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1GTkIm7HStAc9gISyIdz9zOgOj80mUvQQlfaws8tnP8=;
 b=zrIHDWNah59SopJx/pXT/znwLqBVjjm8ZR5vXA8K3E3FWIhSEfbP0LTyspbGwHYTVF
 Py3Us8QAOBoxkm7fiR7mDKLn9r96kOmjcmThavue5Os3Cf+A/1lXSot6lNI2WkPR1+zv
 WLpwC5hUI8uWTvslZeNFi2dElnURjicHNdluiU7mFcaFOwh5o18moHLfy0ZXGeU+y7EF
 jTe9vNiMRw/TjjO/ER5aSiIsgrO34wUn7sRLm1N5MQeOYad9SbPZQ8IA2spZhZw89Z5Z
 iLDQ5lszreHP/hj9hfHw8BhzHNXaAiAP2K0ouxwV0UZqvIdst6qD9RRqY2cSxCaqcBp3
 jwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1GTkIm7HStAc9gISyIdz9zOgOj80mUvQQlfaws8tnP8=;
 b=m0gOfZYtI33DAS7r0UlWAVRKpt3epPEacotH7i+YXg9K1uogV1m+CgUk4VfYD+8wpb
 KD4Z5VvDCEMymA/NjyWSD5XSkwkdmGJWA4bMAGM08Ahp2iYWdTp1wJpE6LGtPH1eGwfE
 paabnSYdusD1oGGUImptV/X5cCFloMjbSZlYCyu0MF/j1YS/Scby2hS5Hq15yr3rOIF4
 yn7w6mtzoalkYoDTpH246NqnssCb929fuQQAAKSrZxi0I0Y4aLQAYx7KYW/G4awlwVKr
 lYZ260wbDdkrTfxzl1e55RxGSJRfwrzcvZH2La9rJmLMn7t+VukzH89mOwE8GpnwNNnp
 wDMQ==
X-Gm-Message-State: AOAM533Db3WxEQbSQ6oT/IftR+5K2WLLDT+fX2K5LTTUiMYfNPxi7WLj
 bwsUZ+S4u5bE2SWNf0TmXHtf3A==
X-Google-Smtp-Source: ABdhPJzPpbeJLgJM0CyvcbCgUGx0PqKArxjGcoN8BWa16o+NJVMZdXfu6AFNf6Ey6eCq5yErlcywyQ==
X-Received: by 2002:a17:902:d4c3:b0:158:a79e:9bf with SMTP id
 o3-20020a170902d4c300b00158a79e09bfmr4457768plg.40.1649900422092; 
 Wed, 13 Apr 2022 18:40:22 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b0050591e66508sm328567pfj.220.2022.04.13.18.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 18:40:21 -0700 (PDT)
Date: Wed, 13 Apr 2022 18:40:21 -0700 (PDT)
X-Google-Original-Date: Wed, 13 Apr 2022 18:39:07 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add CONFIG_{NON,}PORTABLE
In-Reply-To: <CAK8P3a0gqTNX7zNneE6NX1aXvnO77oY2nYyGK4KbwEYdFS8F9Q@mail.gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-f3ab3915-9ccf-423a-9bf4-d49167b22f80@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_184027_063547_0DE3200B 
X-CRM114-Status: GOOD (  46.29  )
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

On Thu, 10 Mar 2022 10:59:42 PST (-0800), Arnd Bergmann wrote:
> On Thu, Mar 10, 2022 at 6:08 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> The RISC-V port has collected a handful of options that are
>> fundamentally non-portable.  To prevent users from shooting themselves
>> in the foot, hide them all behind a config entry that explicitly calls
>> out that non-portable binaries may be produced.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>> This came up in the context of the no-M patch:
>> https://lore.kernel.org/lkml/CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com/
>>
>> I'm not sure I strictly need both PORTABLE and NONPORTABLE, but it's the
>> only way I could come up with to force things like EFI.  I'll poke
>> around Kconfig a bit more, but I figured this is going to lead to a
>> discussion so it'd be better to just send this crusty version so we at
>> least have something concrete to talk about.
>>
>> I've only given this a smoke test (ie, defconfig looks OK).  I'll go
>> through all the configs if folks think this is the right way to go -- I
>> figure it's better to have the discussion on a more focused patch than
>> on that M patch, as this is really an orthogonal issue.
>>
>> I'm not really sure what the right option is here: I'm not selecting
>> things like errata and basic drivers, but I could buy the argument that
>> disabling those results in non-portable systems.  I am selecting EFI,
>> that might not be strictly required now but it's the direction we're
>> going so I figure we might as well start now.  I've also hidden 32BIT
>> behind this, I could see that going either way but my guess is that
>> users of 32-bit systems won't care about portable binaries.
>
> These are all things I would have suggested as well, sounds good.
>
>>  I'm also
>> not sure if this should be tied to something like EMBEDDED or EXPERT.
>
> CONFIG_EMBEDDED is weird, it's better to avoid interacting with
> it, because it tends to not do what one expects. Hiding it behind
> CONFIG_EXPERT would make sense, but it's also a rather strong
> guard, so it's probably better to leave it the way you have it.
>
>> My biggest worry with this is that users might get the feeling that
>> current kernels will be compatible with new hardware, that's just not
>> how RISC-V works.  I tried to write the help text indicating that, I'm
>> not sure I like how it reads so I'll almost certainly take another shot
>> at it (though suggestions are, of course, welcome).
>>
>> I'm also a bit worried that vendors might get the feeling we're not
>> going to support systems that need modifications to these portablity
>> requirements.  That's also not the case, as there's really no way for
>> vendors to make sure their systems continue to run portable kernels
>> aside from just releasing them publicly so we can test them.
>> ---
>>  arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 5adcbd9b5e88..de0916d7aca7 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -9,6 +9,7 @@ config 64BIT
>>
>>  config 32BIT
>>         bool
>> +       depends on NONPORTABLE
>
> This 'depends on is in the wrong place, you need to move it below
> ARCH_RV32I, or possibly rework that "Base ISA" choice statement
> into something else.
>
>>  config RISCV
>>         def_bool y
>> @@ -485,6 +486,7 @@ config STACKPROTECTOR_PER_TASK
>>
>>  config PHYS_RAM_BASE_FIXED
>>         bool "Explicitly specified physical RAM address"
>> +       depends on NONPORTABLE
>>         default n
>>
>>  config PHYS_RAM_BASE
>> @@ -498,7 +500,7 @@ config PHYS_RAM_BASE
>>
>>  config XIP_KERNEL
>>         bool "Kernel Execute-In-Place from ROM"
>> -       depends on MMU && SPARSEMEM
>> +       depends on MMU && SPARSEMEM && NONPORTABLE
>>         # This prevents XIP from being enabled by all{yes,mod}config, which
>>         # fail to build since XIP doesn't support large kernels.
>>         depends on !COMPILE_TEST
>> @@ -538,9 +540,31 @@ endmenu
>>
>>  config BUILTIN_DTB
>>         bool
>> -       depends on OF
>> +       depends on OF && NONPORTABLE
>>         default y if XIP_KERNEL
>>
>> +config NONPORTABLE
>> +       bool "Allow configurations that result in non-portable kernels"
>> +       help
>> +         RISC-V kernel binaries are compatibile between all known systems
>
> typo: compatible
>
>> +         whenever possible, but there are some use cases that can only be
>> +         satisfied by configurations that result in kernel binaries that are
>> +         not portable between systems.
>> +
>> +         Selecting N does not guarntee kernels will be portable to all knows
>
> typo: guarantee
>
>> +         systems.  Selecting any of the options guarded by NONPORTABLE will
>> +         result in kernel binaries that are unlikely to be portable between
>> +         systems.
>> +
>> +         If unsure, say N.
>> +
>> +config PORTABLE
>> +       bool
>> +       default !NONPORTABLE
>> +       select EFI
>> +       select OF
>> +       select MMU
>
> A nice trick I would use here is to make PORTABLE/NONPORTABLE
> into a 'choice' statement that defaults to PORTABLE. That way, both
> allnoconfig and allmodconfig/allyesconfig end up testing the portable case.
>
> Ideally both allnoconfig and allmodconfig would be able to boot the
> same (virtual) machine, but getting to that point likely requires addressing
> further issues.
>
> If someone can come up with a better naming system, the
> portable/nonportable choice could even be integrated into the
> "Base ISA" choice, giving the user a list of the possible targets,
> like:

That's a really nice trick to know.  We're a lot farther from this than 
making an allnoconfig build, at least some of that is the Kconfig.socs 
brokenness.  IMO that's sort of just its own problem, and while it 
should get fixed if I try to roll it up into this one we're going to get 
the simple thing stuck on a bigger thing.

> choice
>       prompt "System type"
>       default ARCH_RV64I
>
> config ARCH_RV64I
>        bool "Generic portable RV64GC system"
>        select 64BIT
>        select EFI
>        select OF
>        select MMU
>
> config ARCH_RV64I_NONPORTABLE
>         bool "Custom RV64I machine, nonportable"
>         select 64BIT
>         select MMU
>
> config ARCH_RV32I_NONPORTABLE
>         bool "Custom RV64I machine, nonportable"
>         select 64BIT
>         select MMU
>
> config ARCH_RV64_NOMMU
>         bool "Custom RV64I machine without MMU"
>         select 64BIT
>
> endchoice
>
> Not sure if that is more or less confusing than what you have
> here, just putting it out there as another way to handle the
> top-level platform selection.
>
>          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
