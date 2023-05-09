Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27785C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIeZbG3q4/OedGYylz88CvMepGch+1SdFlK0lDFOtMY=; b=pX76oDTc0k6XZP
	5PCbpATMUPM6HGNVJybGOor4R1cHqzWW0Ai8t9MVSU//U4OloxcylIkZ3mueGn3t3WoYhqPHN6ZRb
	5br7XDk9YtjpJvnq3LuzSH2vrgrvnqdvSKxITV/6YP37QjeWtAlQNP3N2Y/LyvHdrcYqrPxN4a0Er
	FkPhXWsXGtj4wFovtiCvtZtdjX1uBImR0vvYSn7+gX3d8PUM5kTzc4f1rR/6jHELTlgclv9IZs/gT
	CiRQIsxdZ3l2YXNfeFZ13F7S/1ITWPb6Z8Jjp2I+rtcGKZJYEG1SeX5E2lR2S0qFI+9awsGR/cDWQ
	aq6RqumF9TvWT3cOGzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLAB-0035Lr-04;
	Tue, 09 May 2023 11:05:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLA8-0035LJ-2Q;
	Tue, 09 May 2023 11:05:46 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pwLA1-0003Ee-Pp; Tue, 09 May 2023 13:05:37 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Chiu <andy.chiu@sifive.com>
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 Andrew Bresticker <abrestic@rivosinc.com>
Subject:  Re: [PATCH -next v19 03/24] riscv: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_V
Date: Tue, 09 May 2023 13:05:36 +0200
Message-ID: <2172277.NgBsaNRSFp@diego>
In-Reply-To: <20230509103033.11285-4-andy.chiu@sifive.com>
References:  <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-4-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_040544_788355_DD317857 
X-CRM114-Status: GOOD (  26.38  )
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

Am Dienstag, 9. Mai 2023, 12:30:12 CEST schrieb Andy Chiu:
> Probing kernel support for Vector extension is available now.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  Documentation/riscv/hwprobe.rst       | 10 ++++++++++
>  arch/riscv/include/asm/hwprobe.h      |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
>  arch/riscv/kernel/sys_riscv.c         |  9 +++++++++
>  4 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 9f0dd62dcb5d..b8755e180fbf 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -53,6 +53,9 @@ The following keys are defined:
>        programs (it may still be executed in userspace via a
>        kernel-controlled mechanism such as the vDSO).
>  
> +  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: Support for Vector extension, as
> +    defined by verion 1.0 of the RISC-V Vector extension.

	^^ version [missing the S]

> +
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
>    that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
>    base system behavior.
> @@ -64,6 +67,13 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>      by version 2.2 of the RISC-V ISA manual.
>  
> +* :c:macro:`RISCV_HWPROBE_KEY_V_EXT_0`: A bitmask containing the extensions
> +   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: base
> +   system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_V`: The V extension is supported, as defined by
> +    version 1.0 of the RISC-V Vector extension manual.
> +

this seems to be doubling the RISCV_HWPROBE_BASE_BEHAVIOR_V state without
adding additional information? Both essentially tell the system that
V extension "defined by verion 1.0 of the RISC-V Vector extension" is supported.

I don't question that we'll probably need a key for deeper vector-
specifics but I guess I'd the commit message should definitly explain
why there is a duplication here.


>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 78936f4ff513..39df8604fea1 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,6 +8,6 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 5
> +#define RISCV_HWPROBE_MAX_KEY 6
>  
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 8d745a4ad8a2..93a7fd3fd341 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -22,6 +22,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_MIMPID	2
>  #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
>  #define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
> +#define		RISCV_HWPROBE_BASE_BEHAVIOR_V	(1 << 1)
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
> @@ -32,6 +33,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
> +#define RISCV_HWPROBE_KEY_V_EXT_0	6
> +#define		RISCV_HWPROBE_V			(1 << 0)
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  #endif
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..6280a7f778b3 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,6 +10,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
>  #include <asm/sbi.h>
> +#include <asm/vector.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
> @@ -161,6 +162,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  	 */
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>  		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_V;

Doesn't this also need a
	if (has_vector())


Heiko

>  		break;
>  
>  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> @@ -173,6 +175,13 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  
>  		break;
>  
> +	case RISCV_HWPROBE_KEY_V_EXT_0:
> +		pair->value = 0;
> +		if (has_vector())
> +			pair->value |= RISCV_HWPROBE_V;
> +
> +		break;
> +
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
>  		pair->value = hwprobe_misaligned(cpus);
>  		break;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
