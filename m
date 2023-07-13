Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F6C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4Hcvx+wEy6StpTSQwKvmke2ElSgQOrEWUZueqcgJvQ=; b=FXvmXzf6XGZtbB
	g5Du7dWORbXynOM7/piuSpxNXZE1fsrGh13psZ5E28MUuuTRYBMJ59anGzvddX8ZJWcumaTIVHDYv
	okp6F4bYwEhKk0knwZPYviY4RC7Jkevn1vyxMX4xOgCu0ikvzHGM0W8kPw/PJNXICQrZFTjyc4st6
	4p8yUaOsreuqfnCwewOzNtb3BkWPZYlyqm5Qa7UYiphPMEZpZsKHaWPz9OVmAsIsDnSlNuu11wjq6
	5verUZiYuUZV6GUWZTeYTsp+dG9XsJpbXv+2hfnU/gzhG6BiNttsdHJLyUby1kBWDWu2g5YLtA302
	5OyNhQw7MX7iZDIsYrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzUP-003wJx-0k;
	Thu, 13 Jul 2023 16:48:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzUM-003wI4-0w
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 16:48:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0591461ADA;
	Thu, 13 Jul 2023 16:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F01C433C7;
	Thu, 13 Jul 2023 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689266900;
	bh=DPwNcuh9KkUQlmqzzGGGOppA/jwWRghgdrat4nI/cgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlBOHpWdEX6AXZwl3+jQ/7IZB/pyvF5EP/VSH1BmJ0sdNgDhpmVsqNcYM/zxJZPBr
	 +1/BP6B68sb2bFy1zMwvT9LtDTqQ92xcxUokb0bPzTuH7xtk2NkUxEuth4dLPEfKvF
	 cEkgQDh1tjyUC52mKPv3K1lxdJ9sN5RK1HX5B5zFLp5wFaScnm0KM8bVg3LVV1usDn
	 FwV8F5cHoqS54LhCGNZy2n+LxY1I77TCqzLrXK3IiK/yLbtAmVfCBkuulytQvxG05h
	 n3i8leEvkXS+7VHZFtR621BQmLkqE97W+jMw4+G82seF4VImPovrRTLr1DmD+KbD6o
	 ruGXpUdX2+9mQ==
Date: Fri, 14 Jul 2023 00:36:49 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, heiko@sntech.de, charlie@rivosinc.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <ZLAoIWX+qqWvucWz@xhacker>
References: <20230712-postal-affiliate-0d61a209897f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712-postal-affiliate-0d61a209897f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_094822_435487_D9D2069B 
X-CRM114-Status: GOOD (  29.64  )
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

On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The last merge window contained both V support and the deprecation of
> the riscv,isa DT property, with the V implementation reading riscv,isa
> to determine the presence of the V extension.  At the time that was the
> only way to do it, but there's a lot of ambiguity around V in ISA
> strings.  In particular, there is a lot of firmware in the wild that
> uses "v" in the riscv,isa DT property to communicate support for the
> 0.7.1 version of the Vector specification implemented by T-Head CPU
> cores.

Add Guo

Hi Conor, Palmer,

FWICT, new T-HEAD's riscv cores such as C908 support standard RVV-1.0,
this patch looks like a big hammer for T-HEAD. I do understand why
this patch is provided, but can we mitigate the situation by carefully
review the DTs? Per my understanding, dts is also part of linux kernel.

Thanks

> 
> Rather than forcing use of the newly added interface that has strict
> meanings for extensions to detect the presence of vector support, as
> that would penalise those who have behaved, only ignore v in riscv,isa
> on CPUs that report T-Head's vendor ID.
> 
> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - Use my version of the patch that touches hwcap and isainfo uniformly
> - Don't penalise those who behaved
> ---
>  arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..05362715e1b7 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -21,6 +21,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/patch.h>
>  #include <asm/processor.h>
> +#include <asm/sbi.h>
>  #include <asm/vector.h>
>  
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> @@ -334,6 +335,27 @@ void __init riscv_fill_hwcap(void)
>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
>  
> +		/*
> +		 * "V" in ISA strings is ambiguous in practice: it should mean
> +		 * just the standard V-1.0 but vendors aren't well behaved.
> +		 * Many vendors with T-Head CPU cores which implement the 0.7.1
> +		 * version of the vector specification put "v" into their DTs
> +		 * and no T-Head CPU cores with the standard version of vector
> +		 * are in circulation yet.
> +		 * Platforms with T-Head CPU cores that support the standard
> +		 * version of vector must provide the explicit V property,
> +		 * which is well defined.
> +		 */
> +		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID) {
> +			if (of_property_match_string(node, "riscv,isa-extensions", "v") >= 0) {
> +				this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> +				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +			} else {
> +				this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> +				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +			}
> +		}
> +
>  		/*
>  		 * All "okay" hart should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't
> -- 
> 2.39.2
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
