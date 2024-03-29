Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008ACC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zapFyAeM/SNZe0afyeJ3VZyP07BnqsVoLayS30iLHuQ=; b=4GfLLMmWonmZpH
	tAoN/i+Kblq0VIRhSRoHxE+xTPp0DZqPxAdxRagzZ+gPaKO2fwm7bS2XcxwUPsMBvwr6XlMdFLczY
	9HN99Peqcn1CQZGSyYW5PXVTPC4N5fzGOiZCeMTnxcmuAMu7+vrCYH1T0JKso9Ii/sYebUuawwss0
	G3d9uTqtcAnRuemz5D5Vl0O+5XOmUGL+OyM9U5iBPVfv5fo1yg5CUricOVZsBN0/St4ABP7kEV670
	4TL4z4OFSEqGwPLabYNhaM88fzSMSjdVS9w+g4XCouZC+XUdNV3NJunbDPFEUBgnGKP+jXiSYyauf
	9zAT6MtQzUD7Vid58sGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4V3-0000000GsZb-2FPA;
	Fri, 29 Mar 2024 05:09:57 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4V1-0000000GsYy-0HtT
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 05:09:56 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 5C406200405;
	Fri, 29 Mar 2024 01:09:53 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 29 Mar 2024 01:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1711688993; x=1711696193; bh=W43fkf1B1Z
	n+9lZ0QAk0C2vy62l6S5S5PZF98K77Zsk=; b=D57deTiv3kPkh4S6TPaHl6y8IE
	aPyCnh9jL6Dgq2l+DIeKhmF6dkO220TK1L/d6RwblDCqSC6mwWHzhmyZuvr7YYSV
	AzrlX3gJiw/RzCUfZ+5HmZJmJXTocl7CDZGOq4taeeAz/Z8ezaM7BaSpQPB/rZ48
	QFTAvfSNCu+7M3lb3xiLCreORf5pYJj+INeP3Ve7AyoIPJ00BeScF6bLLEUcAXSv
	KtnWDWuUAH7OvfCi1Jj8CpYSvgT6oZq3uWPv0jMpYMSFBDAv9ntlr6DNzU5lq1iK
	VWZCITz09tR3meh2AOo22um/Z1qVALwF0/bp0ebWh8Hwt74NKQPnHls1F75w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711688993; x=1711696193; bh=W43fkf1B1Zn+9lZ0QAk0C2vy62l6
	S5S5PZF98K77Zsk=; b=kT6itmYsvmUrBvvLfQ90WiLhRKO9jxWWamxe3s0xK+gi
	6GjQkDKFP1VZz5Qg4Q3jTx2CQRBVnOG6VAZkIQxCKaWszeDBtuNjqiDSTBblpCOT
	JuG02yuZLF4cviYSAoTepicLm84FIk60LDxDG/70wXWajQSKxtHm56lcY7VxRpCL
	vtk5gFfJQZuaJ13892YpIxnR9gKuatf4yu41gFynsNfgh/VSc3uNKTNUs5KjUber
	cbZ+6vYyqkojqbNr5ioQs6vJbUT/orWH/OYVQMQ/Wkz+nBmKaN6ByO4pxcVeu5Gk
	MxhBih0FnRnPQnh+IYHvDfFZoCOhE8FIDTMaoexCsA==
X-ME-Sender: <xms:H00GZiC3y24blutqVbB1nPQOZUOFDBADZjL1n_Zs149TKomcottpFg>
    <xme:H00GZsjUuQyktY6jWsKFzkLjQSjIMhTLo3wvwNBL_uDsjt_1HtTPMen-FGPlKDdRR
    jSNwfEUT4LxxK1seg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvtddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufht
    vghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepjeeuheegtdeuteeghfehjeejiefghfeifeejheduvdeugedt
    hfehvefggefgkedtnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhorhgvrghrsehf
    rghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:H00GZlmhC_Aocy8qEFLrD4w_Cl1v2mXkSpGHYcHjBkP7nDfETWUP7Q>
    <xmx:H00GZgwV2djlQID5Qq1MKuSTlmbJ2ptQYueMnUB8zxY73OxrINXPQg>
    <xmx:H00GZnSCqmgO2FccKUlAHXyMANl2-u57LL-mXUGGAkPwQV1HwroiDw>
    <xmx:H00GZrZfpB0cZBPfxY1CCaerXnoz9ELicCzcCEztw9H_bUBH4eVlLw>
    <xmx:IU0GZjsI5g3AcRvLbXq-P5jhx4dBnaTcAe8dNBjjo3glr05OEaCODiE-M9k>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1D6E11700093; Fri, 29 Mar 2024 01:09:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <e7b0aea6-c03b-4e8b-872a-8f0299ed6467@app.fastmail.com>
In-Reply-To: <20240329044459.3990638-5-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
 <20240329044459.3990638-5-debug@rivosinc.com>
Date: Fri, 29 Mar 2024 01:08:12 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: debug <debug@rivosinc.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Rick P Edgecombe" <rick.p.edgecombe@intel.com>,
 "Mark Brown" <broonie@kernel.org>, "Szabolcs Nagy" <Szabolcs.Nagy@arm.com>,
 "kito.cheng@sifive.com" <kito.cheng@sifive.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
 "Atish Patra" <atishp@atishpatra.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Samuel Holland" <samuel.holland@sifive.com>, palmer@sifive.com,
 "Conor Dooley" <conor@kernel.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: "Jonathan Corbet" <corbet@lwn.net>, tech-j-ext@lists.risc-v.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 oleg@redhat.com, "Andrew Morton" <akpm@linux-foundation.org>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Liam.Howlett@oracle.com,
 vbabka@suse.cz, lstoakes@gmail.com, shuah@kernel.org,
 "Christian Brauner" <brauner@kernel.org>,
 "Andy Chiu" <andy.chiu@sifive.com>, jerry.shih@sifive.com,
 hankuan.chen@sifive.com, greentime.hu@sifive.com,
 "Evan Green" <evan@rivosinc.com>, "Xiao Wang" <xiao.w.wang@intel.com>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, "Samuel Ortiz" <sameo@rivosinc.com>,
 shikemeng@huaweicloud.com, willy@infradead.org,
 "Vincent Chen" <vincent.chen@sifive.com>, guoren <guoren@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, songshuaishuai@tinylab.org,
 "Greg Ungerer" <gerg@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 "Baoquan He" <bhe@redhat.com>,
 "Sia Jee Heng" <jeeheng.sia@starfivetech.com>,
 "Yangyu Chen" <cyy@cyyself.name>, maskray@google.com,
 ancientmodern4@gmail.com, mathis.salmen@matsal.de,
 "yunhui cui" <cuiyunhui@bytedance.com>, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il,
 "Alejandro Colomar" <alx@kernel.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, revest@chromium.org,
 josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de,
 omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com
Subject: Re: [PATCH v2 04/27] riscv: zicfiss/zicfilp enumeration
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_220955_462445_93004E90 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2024, at 12:44 AM, Deepak Gupta wrote:
> Adds description in dt-bindings (extensions.yaml)
>
> This patch adds support for detecting zicfiss and zicfilp. zicfiss and zicfilp
> stands for unprivleged integer spec extension for shadow stack and branch
> tracking on indirect branches, respectively.
>
> This patch looks for zicfiss and zicfilp in device tree and accordinlgy lights
> up bit in cpu feature bitmap. Furthermore this patch adds detection utility
> functions to return whether shadow stack or landing pads are supported by
> cpu.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 10 ++++++++++
>  arch/riscv/include/asm/cpufeature.h                 | 13 +++++++++++++
>  arch/riscv/include/asm/hwcap.h                      |  2 ++
>  arch/riscv/include/asm/processor.h                  |  1 +
>  arch/riscv/kernel/cpufeature.c                      |  2 ++
>  5 files changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
> b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..f8d78bf7400b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -317,6 +317,16 @@ properties:
>              The standard Zicboz extension for cache-block zeroing as 
> ratified
>              in commit 3dd606f ("Create cmobase-v1.0.pdf") of 
> riscv-CMOs.
> 
> +        - const: zicfilp
> +          description:
> +            The standard Zicfilp extension for enforcing forward edge 
> control-flow
> +            integrity as ratified in commit 0036ff2 of riscv-cfi.
> +
> +        - const: zicfiss
> +          description:
> +            The standard Zicfiss extension for enforcing backward edge 
> control-flow
> +            integrity as ratified in commit 0036ff2 of riscv-cfi.
> +

Neither of these extensions is currently ratified (the public review
period started 15 hours ago) and the git hashes are unlikely to be
correct for the ratified version.

-s

>          - const: zicntr
>            description:
>              The standard Zicntr extension for base counters and 
> timers, as
> diff --git a/arch/riscv/include/asm/cpufeature.h 
> b/arch/riscv/include/asm/cpufeature.h
> index 0bd11862b760..f0fb8d8ae273 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -8,6 +8,7 @@
> 
>  #include <linux/bitmap.h>
>  #include <linux/jump_label.h>
> +#include <linux/smp.h>
>  #include <asm/hwcap.h>
>  #include <asm/alternative-macros.h>
>  #include <asm/errno.h>
> @@ -137,4 +138,16 @@ static __always_inline bool 
> riscv_cpu_has_extension_unlikely(int cpu, const unsi
> 
>  DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
> 
> +static inline bool cpu_supports_shadow_stack(void)
> +{
> +	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> +		    riscv_cpu_has_extension_unlikely(smp_processor_id(), 
> RISCV_ISA_EXT_ZICFISS));
> +}
> +
> +static inline bool cpu_supports_indirect_br_lp_instr(void)
> +{
> +	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> +		    riscv_cpu_has_extension_unlikely(smp_processor_id(), 
> RISCV_ISA_EXT_ZICFILP));
> +}
> +
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h 
> b/arch/riscv/include/asm/hwcap.h
> index 1f2d2599c655..74b6c727f545 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,8 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_ZICFILP	74
> +#define RISCV_ISA_EXT_ZICFISS	75
> 
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> 
> diff --git a/arch/riscv/include/asm/processor.h 
> b/arch/riscv/include/asm/processor.h
> index a8509cc31ab2..6c5b3d928b12 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -13,6 +13,7 @@
>  #include <vdso/processor.h>
> 
>  #include <asm/ptrace.h>
> +#include <asm/hwcap.h>
> 
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> diff --git a/arch/riscv/kernel/cpufeature.c 
> b/arch/riscv/kernel/cpufeature.c
> index 79a5a35fab96..d052cad5b82f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -263,6 +263,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, 
> riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, 
> riscv_xlinuxenvcfg_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, 
> riscv_xlinuxenvcfg_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, 
> riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.43.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
