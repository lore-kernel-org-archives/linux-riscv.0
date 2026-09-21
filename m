Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C6BC982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0ufZ67VuvyMtraJMe8SRr8XpsAAqbBTFLrVJJgMPkA=; b=Ymnp3sd4hidYt4
	EJdEdc8BU0wWcgFTPKv6Z2YIynwJQLv/ur+g96U7Wy1oW2yUbeHGfEvI8a0A7SzAGyrOWzYfuyJkK
	bUb37CWhkRAcyTNugXATsl/nFc5lnIU2gBH8kcp0kXDVzbVbZ5RLbLS1VB4zlA0Nlf45D9ns21MVb
	3m9DawUcHo0aLqAn7gYGamlIMvsx/4xExZoMSliLq3CILTdgEZ/7WGGCjdlOnYJtCgjESH2Z0mGSX
	3lLzhvk60jCqra6+k64/f8kasz676qPyrF3tL6kZmDXlpJ+DmKNJ7sr3ofm9e+qsmfkMRMXliLKVR
	DsZ/2iBza+5aA8da2FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8exG-00000002OB7-30PZ;
	Mon, 21 Sep 2026 14:25:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8exD-00000002O82-3M3W
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 14:25:13 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 28B013FBC1
	for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790000698;
	bh=QLEno9IoSGABXfyc+gs3/INLUq4rl6TSX3NFv/q902U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=oDEajCjkGYY4fCbMSvuLTjRrdp7FRGryYCfUwAluu3fpjdsKtmfRlo5zhVFmG6gsV
	 0zCSpYt9AwrDnW6TRTYaQmo7LLz/J92dYSPkY6+HkLoAsf4GoNGzuZz8cBkt8tNcJf
	 R692RG8iBMFgR+/4lpY9gUKdwnzptrGw3+p4yeGYDnLIbzzuNX1YCZJdU6h6wFlFvg
	 va9wapeJY/PJuv+EgZ/V4SzRBqLzRTpmyaFDtPUBpD/V5OOqkQLHrNtpmZJtn3k/xU
	 5ypPlyWx+BZ06dl1xijiNd3BFtfQBefOm+o26ZXTtYi0yeZlDnFuZMJ24QLthhFJ2n
	 f2CJ0o9hI/YZn1P4UR1Lwe5R3tgNv4wnNg4ibDjuUG5yhZoYiBxRhuJB9/cztnDyFS
	 39iDfcr17ui1qUQGfuQWAPTEXH2fenlDnkW331fU0hlgOMIOTmTC1ayJsMUyzpv/EI
	 SaUkaGdkUJ4ZVWi933ARRop9562/Z3uXRJlcBN7TmcyInhj2zHaPk6iKkibLqfavop
	 w0P1p7zaB2dg4YWsGBoTYFbVUW9HMCAtXFHRo7O+77hNBeXlYOE/ac4dTqL2fnojYD
	 NGZyVHqfg+EsDmPBwHlorz3HsKfz9U9SsKAhHAKISQeFZzYLVWrMfEFAucT/XoZJmG
	 rSXyWbChOjqFYnauwr9O1vf4=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so23166085e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 07:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000698; x=1790605498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLEno9IoSGABXfyc+gs3/INLUq4rl6TSX3NFv/q902U=;
        b=2KOGTdTWrNAbPPMINQh2MKH9JyeuNuqQ6bruZG+xr1WZL8bx6ALUwOi9Jcait08kgR
         vNdYLrrtRCOnt0onGUYhYgUwNQz0VpUKJKxGwca9aBpDfnhSaf4YeOcIqH1B3aWMNsDt
         PHMurM/qooAqzn5X42xRW+uEEGi1wIDpfNnP1ztLhRx8YbN28Gp9ydU/6oqew/SwBtQd
         4Wmsp3Ozxz5Nu2jnsLplhrvsCUMezyTZ5q4GSz+w7Ujq2egxFHoazZMNi4JaFF3Y3lEH
         uHTo7NGdpUaKd0fk2xKWyloMHeYx8ngzbeT25/kBTQBFXVy+hkyCza9n5IEAFdMSUGtz
         MBIg==
X-Forwarded-Encrypted: i=1; AKwUvBwkJKC6vmSg0ki5BrD3V+dtugYBOY8WsfBSFIP2aSQtOAyCq2vYVNroYDS1SkR4BN5S6VKHWBvQAuWx7g==@lists.infradead.org
X-Gm-Message-State: AFuF++lnHehswkd6qtjW7FYySbqkFqiUaSRx4xTBOynNqPgWgnSNU6I/
	Vuy4ONq+4kRLMEtsPoGqJ9PzTwXtA3k8YCa7SP7KFw1OfyehMkMnrQmz/TbFtCRMm6op1sQaY6O
	IkTUY0zbmTCJarO6opAljdLv2/ruEGIsdokboZokQTWWlnrJBL6k7BGEtfxqCuxINmNGE0HMOJ3
	j9POtBtnyNXQ==
X-Gm-Gg: AYBFou1WDu27j8rWI6g88LKItBMseFvieFZmg/rZ173YrKmgxwiPhrAOU1GZwJCU+rr
	7Jy16Wvdai5pzhi7nvK/8+oH8x1Nl/GsB0s7Y9HcoepFTt4rLJ0k+0/67XsicPbDk5BzhfYLU8Y
	5JOmsHLEBeQnC9NDGgqX/Lh3pqBfX0nGDyHq2V0PD/LqtU2bC26AqnxfPAutMM0OMeGr4m9+Wf9
	+a67F5Zq8ZCCkwZMHkeo9LHDILxAfgn0l0wJW261evcdSLI2YtKuapcwdIPZlKoNRf4VSAl9hgC
	HA+TeA021Z1j8hOqQ0eeH+wwcizfOu9BT4HfmNfXlmkDGZ6nHnuETnzL3/HpvosCWUvg/X9nsKV
	V0Y5oSI9Gf4CA6pEYcid3Jwsh8rpX4285g/PUdzsguurc+GRuZquIdZ/AE4x3JcAeV+SlVEjxgC
	3TW0XZg3XnQj+5l8/kMVhOO5E=
X-Received: by 2002:a05:600c:4f09:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49fc56b84c3mr149186495e9.9.1790000697394;
        Mon, 21 Sep 2026 07:24:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4f09:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49fc56b84c3mr149185895e9.9.1790000696811;
        Mon, 21 Sep 2026 07:24:56 -0700 (PDT)
Received: from ?IPV6:2a02:908:1242:30e0:aec3:c221:8373:654c? ([2a02:908:1242:30e0:aec3:c221:8373:654c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm622434405e9.4.2026.09.21.07.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:24:56 -0700 (PDT)
Message-ID: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Date: Mon, 21 Sep 2026 16:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
 Florian Weimer <fweimer@redhat.com>,
 Peter Bergner <bergner@oss.tenstorrent.com>,
 Zihong Yao <zihong.plct@isrc.iscas.ac.cn>, Mark Harris <mark.hsj@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_072512_042511_3CD727E0 
X-CRM114-Status: GOOD (  27.18  )
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

On 9/20/26 09:18, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
> RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
> mirroring the F/D/C/V pattern where each is reported via both hwcap
> and hwprobe.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> [Add B to hwprobe]
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> ---
> v8: No change.
> v7: No change.
> v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
>      _BITULL() style of commit 8da45c93dfa9.
> v5: Collected Reviewed-by from Conor Dooley.
> v4: No change.
> v3:
> - Indent the added hwprobe.rst entry to match the normalized style.
> - Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
>    macro-ization in commit 41337097f2823.
> v2:
> - Rebased to v7.1-rc2
> - Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
>    document it in hwprobe.rst, so userspace can probe B directly.
> ---
>   Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>   arch/riscv/include/asm/hwcap.h        | 1 +
>   arch/riscv/include/uapi/asm/hwcap.h   | 1 +
>   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>   arch/riscv/kernel/cpufeature.c        | 8 ++++++++
>   arch/riscv/kernel/sys_hwprobe.c       | 1 +
>   6 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index bb1e0cbab36f0..69a3fc0a29b71 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -423,3 +423,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>     * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
>       as defined in the RISC-V Profiles specification starting from commit
>       b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
> +    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
> +    presence of the Zba, Zbb, and Zbs sub-extensions.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f8db798b2654b..6a693210b2519 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -11,6 +11,7 @@
>   #include <uapi/asm/hwcap.h>
>   
>   #define RISCV_ISA_EXT_A		('a' - 'a')
> +#define RISCV_ISA_EXT_B		('b' - 'a')
>   #define RISCV_ISA_EXT_C		('c' - 'a')
>   #define RISCV_ISA_EXT_D		('d' - 'a')
>   #define RISCV_ISA_EXT_F		('f' - 'a')
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index c52bb7bbbabe9..96b7cf854e090 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -21,6 +21,7 @@
>   #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
>   #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
>   #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
> +#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
>   #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
>   
>   #endif /* _UAPI_ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index e6a394fbe7fce..9323feb7c3c81 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -122,6 +122,7 @@ struct riscv_hwprobe {
>   #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
>   #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
>   #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
> +#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
>   
>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>   
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 61d21f7148305..beb766420b5bc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -484,6 +484,12 @@ static const unsigned int riscv_c_exts[] = {
>   	RISCV_ISA_EXT_ZCD,
>   };
>   
> +static const unsigned int riscv_b_exts[] = {
> +	RISCV_ISA_EXT_ZBA,
> +	RISCV_ISA_EXT_ZBB,
> +	RISCV_ISA_EXT_ZBS,
> +};
> +
>   /*
>    * The canonical order of ISA extension names in the ISA string is defined in
>    * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
> @@ -532,6 +538,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>   	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),

Hello Guodong,

The RISC-V Unpriviledged ISA specification has this description of 
extension B:

"The B standard extension comprises instructions provided by the Zba, 
Zbb, and Zbs extensions."

__RISCV_ISA_EXT_SUPERSET would imply that something else but 
riscv_b_exts is in B. But such an extra seems not to exist.

So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
change may be needed to set extension B if riscv_b_exts is fulfilled.

Best regads

Heinrich

>   	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
>   					  riscv_ext_vector_float_validate),
>   	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
> @@ -1161,6 +1168,7 @@ void __init riscv_fill_hwcap(void)
>   	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
>   	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
>   	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
>   	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
>   
>   	if (!acpi_disabled) {
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 7818e1d32622d..c03c6e08dd4d0 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
>   		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
>   		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
>   		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
> +		EXT_KEY(isainfo->isa, B, pair->value, missing);
>   	}
>   
>   	/* Now turn off reporting features if any CPU is missing it. */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
