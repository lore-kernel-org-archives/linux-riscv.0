Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3214CC0219D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 23:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP7pHxfTSlD92dsmRy9bmoi4V+F7uPzl00K+76BEC4M=; b=ttL5IdnG8cEL7lzTC1nF3zOkjo
	x/ct7uF0i2Ax5GTcpW4sVlZJV0XlxDLI0bcp+KN8SKTX9wyXm3VC9sKm1pzn6wWeV5/srIYyE+TXF
	yrlKEfekwcCubWCScJAeaQvEYfzkO4Da7/g+OHgfMh/6HHaN21yo/c4soLi4iS8ip5HCZcHMzQMhn
	nHEEUXrQEV66PeNVWk4K0BUR9CxwujdfpjTeDh3eX+q3bcYJnne6s7IYTW3GvRfPOrcl7Qv4YwgJa
	RSoxV+8wj/oJa/gV1xIgG1yyoCoYblvZHr91+4Byfof9hO4mOXWfQzmMg1KKC2iEqcoClS5hlNH3Z
	vQ0ObxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXj9-0000000BVX4-2RoB;
	Fri, 07 Feb 2025 23:25:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXj5-0000000BVV3-3Gac
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 23:25:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f50895565so18830685ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 15:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738970735; x=1739575535; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NNlAmhG4r3/Civ4C+1dYrzk4uNPcGHra0U2geeoELN8=;
        b=q5M+CtAb0u9SnGOaBFnmN1JbSgfuHnQ/hRjRP9BGTSRcCOHfM8JBdNedeKKb/2htf5
         Tp8lk5bJpOi87jmACo2fFsad69IdaeQ6oFxYmyoUrObwou6/kro1SS7ec6ImvmUZI3MR
         eTd1qwmZYDeSyBZefIFOcrLTlasz12mgX4N9Ub3sDIe/PwoD4ySscvz7GTmKOXLF3oBT
         YcWbdz6iEwnx0AxNXBGfl67bWo9ohN8b+MzAmjmhx7/dxBbdAk7BaFfEKNqz7jSS7p9d
         6tcVmz+c8+JS5OybbTQgA+Q1YZ4C4WgaphieXGXFhGO4gPFdIagZubknyBlfKX8B9J3y
         tf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738970735; x=1739575535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNlAmhG4r3/Civ4C+1dYrzk4uNPcGHra0U2geeoELN8=;
        b=xAhzntdZcEap9xSjBPak++FApyF3/GILSTpflVBn8P3lME9qbR7MmIh68OK68Sq6Pp
         Wth2LkjZgqqITMF3cH+TA67pZhZqzzDuRqDZrnIZmIwnfnzRO3n0uREHZcH3Nwo4ZRyR
         xF4HFXIHRXONaeW6kG9G4r62ihb/X3CDzL6h9pBUwxUfnq8DSBJXfprvbaCcY/5lyA9l
         B1T0c2qJoJ660D+FEiFZfug7u8LZMO+PggJSeuPIMeSEYifYWeX7YYCXmj1ILNKvafk0
         932xxR/izOyp6C7tUtsCeAah12aijtiBtgRh+aK23cjXZpag81ViA5AMPfvLTfJ+0sGH
         ZJkA==
X-Forwarded-Encrypted: i=1; AJvYcCXThP3KV8oJJWHKff0KfTHvqY1E2YqkbXPkE5hDnefCxQ67yAZwjWPyQpH69iJRcCKc6Hijel17fl9LQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2SQMkIPwe99udk5Owr7V3eQKISuVDuQGgNI5ujV7v1RSBYTE+
	CsHKdvfpIIj0vh6KKwXlriUF0A0/i0o9151xa9D2OkcLMpNgNhbtLSpuzpTzJdI=
X-Gm-Gg: ASbGncsCuD1W6oVhTpKRlClPQsAZ/yqHthj83BTvfUGPkp9NBfvd1J5dRCYfixDTQJE
	/YSbPJDQvLp7znoVgjAIQVUlnWnO0RzckHykRlvlrWfhZBX9ujRwSA5YG52QtC6RCkBKuVCuKdM
	vCwxHEIeSOT8ZOC0fOcCli/Xeu6nyIcfH7AbGCOgysVOr9ZljdVtRVO8Sf+us3Vl9E8ZvEIZi/7
	R0VN2JRBjrRvrzjPclMqbCHqpdJnBchuf6S6t5yiKhcf7Krbgkpc63qAGBQ8BrFgIV4gg5BKO+o
	PLyq8f/8feGrMih3yx6puD8wig==
X-Google-Smtp-Source: AGHT+IE4XMWCRo3zMaE+9a8gR9bTeN800JXvztmc6v9Xr7sz0lD3zlNhQ59QeV7lPxe5ncZAuS2TtQ==
X-Received: by 2002:a17:902:c942:b0:216:4c88:d939 with SMTP id d9443c01a7336-21f4e746803mr74840445ad.38.1738970735073;
        Fri, 07 Feb 2025 15:25:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683db30sm36005905ad.138.2025.02.07.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:25:34 -0800 (PST)
Date: Fri, 7 Feb 2025 15:25:31 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 03/26] riscv: zicfiss / zicfilp enumeration
Message-ID: <Z6aWa+gt/WafPxbu@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-3-b37a49c5205c@rivosinc.com>
 <782ef14c-e7c4-435e-adc6-9559ce3cc06d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <782ef14c-e7c4-435e-adc6-9559ce3cc06d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_152535_830990_89BC8A26 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 02:50:29PM +0100, Cl=E9ment L=E9ger wrote:
>
>
>On 05/02/2025 02:21, Deepak Gupta wrote:
>> This patch adds support for detecting zicfiss and zicfilp. zicfiss and
>> zicfilp stands for unprivleged integer spec extension for shadow stack
>> and branch tracking on indirect branches, respectively.
>>
>> This patch looks for zicfiss and zicfilp in device tree and accordinlgy
>> lights up bit in cpu feature bitmap. Furthermore this patch adds detecti=
on
>> utility functions to return whether shadow stack or landing pads are
>> supported by cpu.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
>>  arch/riscv/include/asm/hwcap.h      |  2 ++
>>  arch/riscv/include/asm/processor.h  |  1 +
>>  arch/riscv/kernel/cpufeature.c      |  2 ++
>>  4 files changed, 18 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/as=
m/cpufeature.h
>> index 569140d6e639..69007b8100ca 100644
>> --- a/arch/riscv/include/asm/cpufeature.h
>> +++ b/arch/riscv/include/asm/cpufeature.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/kconfig.h>
>>  #include <linux/percpu-defs.h>
>>  #include <linux/threads.h>
>> +#include <linux/smp.h>
>>  #include <asm/hwcap.h>
>>  #include <asm/cpufeature-macros.h>
>>
>> @@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension=
_unlikely(int cpu, const unsi
>>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>>  }
>>
>> +static inline bool cpu_supports_shadow_stack(void)
>> +{
>> +	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
>> +		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZI=
CFISS));
>> +}
>> +
>> +static inline bool cpu_supports_indirect_br_lp_instr(void)
>> +{
>> +	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
>> +		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZI=
CFILP));
>> +}
>> +
>>  #endif
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwc=
ap.h
>> index 869da082252a..2dc4232bdb3e 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -100,6 +100,8 @@
>>  #define RISCV_ISA_EXT_ZICCRSE		91
>>  #define RISCV_ISA_EXT_SVADE		92
>>  #define RISCV_ISA_EXT_SVADU		93
>> +#define RISCV_ISA_EXT_ZICFILP		94
>> +#define RISCV_ISA_EXT_ZICFISS		95
>>
>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm=
/processor.h
>> index 5f56eb9d114a..e3aba3336e63 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -13,6 +13,7 @@
>>  #include <vdso/processor.h>
>>
>>  #include <asm/ptrace.h>
>> +#include <asm/hwcap.h>
>>
>>  #define arch_get_mmap_end(addr, len, flags)			\
>>  ({								\
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatu=
re.c
>> index c6ba750536c3..e72de12e5b99 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -333,6 +333,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_=
xlinuxenvcfg_exts,
>>  					  riscv_ext_zicboz_validate),
>>  	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>> +	__RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxe=
nvcfg_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxe=
nvcfg_exts),
>
>Hey Deepak,
>
>I think these definitions can benefit from using a validation callback:
>
>static int riscv_cfi_validate(const struct riscv_isa_ext_data *data,
>				  const unsigned long *isa_bitmap)
>{
>	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI)
>		return -EINVAL;
>		=

>	return 0;
>}

Yes this is a good idea.
I'll add that.

>
>__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP,
>riscv_xlinuxenvcfg_exts, riscv_cfi_validate),
>__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS,
>riscv_xlinuxenvcfg_exts, riscv_cfi_validate),
>
>That way, ZICFISS/ZICFILP wont be enable if the kernel does not have
>builtin support for them. Additionally, this solve a bug you have with
>your hwprobe patch (19/26) that exposes ZICFILP/ZICFISS unconditionally
>(ie, even if the kernel does not have CONFIG_RISCV_USER_CFI).
>

Yes good catch.

>BTW, patch 23/26 introduce CONFIG_RISCV_USER_CFI but it is used in that
>patch.
>Thanks,
>
>Cl=E9ment
>
>>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
