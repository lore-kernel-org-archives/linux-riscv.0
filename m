Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E61C8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIKyq4oBCZEuv7Jc4uz3xvmXgxKWbHg7oFRpjCQLh14=; b=Vl4LbzEv7YLXmy
	Sm5fIzm7RLCwHJivNsu4kt7i0Q5bRvIT3+KieEgma9HoJ6/LlNC0HMduWIiJeY7+YYYt4RslYp3Lf
	qPVvT9WBR3HOFWrycvJPHrU6kNMEw1Tv2m9tBu1GCgArCxkzMmKHqHBxgqcfxbLj/22fn/EppaZh9
	RlkdtBx/1ExyvsDsjFzk7LGInbYsXx66H8D2T2jn+eoO7wGCPLhLeZ27QaQdKECcvTolmtMk4x8lh
	UwfcQUrbcAx3mgaJv4ySVft4CfoxAXKU1sGgwiSINiigG7r9S+UCZOm8f93jigoRrmcK5dWezyMdG
	gSc3B8xy4f0GB1hCaKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfGN-00000009rZv-1zYc;
	Mon, 25 Aug 2025 22:02:03 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfFB-00000009rEA-01re
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 22:00:50 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-88432ccff13so138539339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756159248; x=1756764048; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiVDkXUW8QsODDHYKXFfmWVkagmLaXHPGpOZ6qs2i4o=;
        b=X3UY8yfiejo0GUwpNP0hHuM+tB3AULT/DE7jtCA/4xinXVMhKSMYOgbS8tMxfkSEtz
         mpzjaEmTUMeo2r0uu9spSj9lOkZOX2G7IdKxoF0S+Oqg3nWQIE0fMLBp3q0v37YN3I9U
         0n5BP0KiVe3Uri7g/FixrlAZq0hcDnT3vuvw0lofCtxFVo8x28aTqjk7EOinRhZuB615
         7eE7SBpmanpkPWyQrSKCnSRK18b89yEZOggf9PvieCKOmDcmF74XJPpMA/8RmYO3uIMO
         qAe5J8QdCIGrNbdMXwBrh/KeaRFGg3/l1y9jzyRxG6qvR9fyIWaTt+A6AOIRjG/k+bn3
         5Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756159248; x=1756764048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiVDkXUW8QsODDHYKXFfmWVkagmLaXHPGpOZ6qs2i4o=;
        b=Xun2eFwm/Ied+qQYmXo97yizq/TgwMobbRibFz82jw0O94PzC5C7l6vLsERh6RpSUx
         Bus4qZrcnI31TuOxx3ZU5HHbA+gE12XeYj1kOqwziY3owfGUSp1euBePVwbuirA1PD7L
         IMxrlyzmBi9R/kZX7CqE8S878ie7etMoaSfynMZNmJcRcrv+c7BNHzpmyDIi2TjaMx+R
         EHf7+Vi77gggcHG9t5PFoqYG+hvytsulGc5nuOpcnyG1aCQFpQTpsInJE11QTm4nJnsx
         517dmprn9+JSIv4gijvPabwZ3SZVFan1OMNINtKMeNZcuomUzEazWZiouuGY34sKCwx2
         HEgw==
X-Gm-Message-State: AOJu0YyFAdKYVOX8dCEsQkXbYWSp9jg5j0oQgbsOAFwLcM8PeUHhSoW4
	lezDKu6up2DJm2eclnMSgyqDs5FB/mZxuEbvFpDUr4uYYrcS6wsNzv1jQNt63jd0Y58=
X-Gm-Gg: ASbGncsH5MAJcU3AijgrMb/DJ/+lt1MKS5IJoSTxQysXCJANFjiSwJ7QdR1WWltOqm6
	Bcr4PEYEWHoRWin4h4YZxPGsg2gQg+n55KRjGTMnyOqIq3ku6ZRG5gocKIybQ+rNpwLJtif1+tH
	LA0Vyg/wwYiFymCSFQIj+W2+3GrjFgNF9HfGwo9zlyIokpgjrQbZexc55Ii+Iv81g2f9DljUFqp
	TJnPiYwOrZMeVlAZIIz4Es+pA51wmIoxGMpPc6TmvKgA9pJec0CAi8C/RdKTPMA9/ZqhpvkqVVF
	FD9S0dgYqUP+3WttxbAHVO5pc7rkM5F8cESBISTfpIA41ZaxI2S6zLFJRjDGKerpXaGZi6ftrDy
	pZZ9CenuIeB5txE03MOPm1RhE
X-Google-Smtp-Source: AGHT+IHX28DMSSPMLxK/FjDdiARxytI0aiirj9tNtvxTAO0M8uU8rZimtPAVg0Ozw52aJauf0igeug==
X-Received: by 2002:a05:6e02:18ce:b0:3eb:3fa8:5cec with SMTP id e9e14a558f8ab-3eb3fa85ef1mr101396115ab.15.1756159247746;
        Mon, 25 Aug 2025 15:00:47 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4e457cc9sm57331655ab.34.2025.08.25.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 15:00:46 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:00:45 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: offtkp <parisoplop@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org
Subject: Re: [PATCH v3 RESEND] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Message-ID: <20250825-6d7eedc4459b72ceb07ce782@orel>
References: <20250814221646.32140-1-parisoplop@gmail.com>
 <20250825170258.24068-1-parisoplop@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825170258.24068-1-parisoplop@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_150049_054047_33871B98 
X-CRM114-Status: GOOD (  41.39  )
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

On Mon, Aug 25, 2025 at 08:02:21PM +0300, offtkp wrote:
> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> bit in the resulting bitmask means the extension is not available or the
> kernel is not recent enough to support the bit. Currently, there's no
> way to differentiate between the two.
> 
> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> which returns a bitmask of all the queryable extensions supported by the
> kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> fallback extension detection method when the bit they want to query is
> not available in the kernel they are running on.
> 
> Signed-off-by: offtkp <parisoplop@gmail.com>
> ---
> Changes in v3:
> - remove the 59 magic number and create the mask as a define
> 
> Conversation from v2 to show motivation for this patch as a whole:
> 
> > And do you have a real usecase in
> > mind? I mean which project would benefit from this?
> Yes, I want this feature for an x86-on-RISC-V userspace emulator
> called felix86. We do runtime extension detection for our JIT.
> Currently, for any extension that defines instructions we use the SIGILL
> method previously described, because there's no way to tell with just
> a hwprobe call whether a 0 bit means extension not present or kernel
> too old. But we can't do this for all extensions, some don't define
> instructions.
> 
> The end goal would be being able to detect an extension using hwprobe,
> and if it's not detectable, notifying the user that we can't detect it and
> they can mark it as enabled in the emulator's config file.

As I pointed out on v2, I don't think this patch helps. When the kernel
is unaware of the extension, then we still know nothing about its
availability. This is only helpful when the kernel is aware of an
extension, but, in those cases, the current hwprobe can be trusted, so
we don't need this.

The problem is there's no good way to detect extensions that the kernel
is unaware of, which means the kernel needs to blindly expose what's in
the DT/ACPI somehow.

Thanks,
drew

> 
> 
> 
>  Documentation/arch/riscv/hwprobe.rst  |  5 ++++-
>  arch/riscv/include/asm/hwprobe.h      | 29 ++++++++++++++++++++++++++-
>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
>  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
>  4 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 2aa9be272d5d..6d77def0a46e 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -360,4 +360,7 @@ The following keys are defined:
>  
>      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> -	Instruction Extensions Specification.
> \ No newline at end of file
> +	Instruction Extensions Specification.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> \ No newline at end of file
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 7fe0a379474a..a06eeec11e2c 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,34 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 13
> +#define RISCV_HWPROBE_MAX_KEY 14
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE	(RISCV_HWPROBE_IMA_FD | \
> +	RISCV_HWPROBE_IMA_C | RISCV_HWPROBE_IMA_V | RISCV_HWPROBE_EXT_ZBA | \
> +	RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS | RISCV_HWPROBE_EXT_ZICBOZ | \
> +	RISCV_HWPROBE_EXT_ZBC | RISCV_HWPROBE_EXT_ZBKB | RISCV_HWPROBE_EXT_ZBKC | \
> +	RISCV_HWPROBE_EXT_ZBKX | RISCV_HWPROBE_EXT_ZKND | RISCV_HWPROBE_EXT_ZKNE | \
> +	RISCV_HWPROBE_EXT_ZKNH | RISCV_HWPROBE_EXT_ZKSED | \
> +	RISCV_HWPROBE_EXT_ZKSH | RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_EXT_ZVBB | \
> +	RISCV_HWPROBE_EXT_ZVBC | RISCV_HWPROBE_EXT_ZVKB | RISCV_HWPROBE_EXT_ZVKG | \
> +	RISCV_HWPROBE_EXT_ZVKNED | RISCV_HWPROBE_EXT_ZVKNHA | \
> +	RISCV_HWPROBE_EXT_ZVKNHB | RISCV_HWPROBE_EXT_ZVKSED | \
> +	RISCV_HWPROBE_EXT_ZVKSH | RISCV_HWPROBE_EXT_ZVKT | \
> +	RISCV_HWPROBE_EXT_ZFH | RISCV_HWPROBE_EXT_ZFHMIN | \
> +	RISCV_HWPROBE_EXT_ZIHINTNTL | RISCV_HWPROBE_EXT_ZVFH | \
> +	RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZFA | \
> +	RISCV_HWPROBE_EXT_ZTSO | RISCV_HWPROBE_EXT_ZACAS | \
> +	RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIHINTPAUSE | \
> +	RISCV_HWPROBE_EXT_ZVE32X | RISCV_HWPROBE_EXT_ZVE32F | \
> +	RISCV_HWPROBE_EXT_ZVE64X | RISCV_HWPROBE_EXT_ZVE64F | \
> +	RISCV_HWPROBE_EXT_ZVE64D | RISCV_HWPROBE_EXT_ZIMOP | \
> +	RISCV_HWPROBE_EXT_ZCA | RISCV_HWPROBE_EXT_ZCB | RISCV_HWPROBE_EXT_ZCD | \
> +	RISCV_HWPROBE_EXT_ZCF | RISCV_HWPROBE_EXT_ZCMOP | \
> +	RISCV_HWPROBE_EXT_ZAWRS | RISCV_HWPROBE_EXT_SUPM | \
> +	RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM | \
> +	RISCV_HWPROBE_EXT_ZFBFMIN | RISCV_HWPROBE_EXT_ZVFBFMIN | \
> +	RISCV_HWPROBE_EXT_ZVFBFWMA | RISCV_HWPROBE_EXT_ZICBOM | \
> +	RISCV_HWPROBE_EXT_ZAAMO | RISCV_HWPROBE_EXT_ZALRSC | \
> +	RISCV_HWPROBE_EXT_ZABHA)
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index aaf6ad970499..a3b92df4dc05 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
>  #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
>  #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
>  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 0b170e18a2be..40e7fa5f85f3 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
>  		break;
>  
> +	case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> +		pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
