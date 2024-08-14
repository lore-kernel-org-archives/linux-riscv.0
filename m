Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3E1C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPPFxqzOUOhfhYx+yS0QBEeaVeA9gessIEwOK2wy6SE=; b=uwEhjxMiz/Dxz7
	xEGcpe5+zzCpWLybpHR73ppTePsOEC2XWMeqWO9XlHbzxPQ3i81YaFAgRbzp7EVkLonwKySyiDMJF
	zXo0Gp9XJg1/3ZtLOaQH2oiNXtmKoD+vdKbpl7pLja+TvVv4wpeISRFrUODTKsOUSzW8Yifvy8DkG
	Vsv5utJBEtWcG7dXJ3AYbjCU2x1VCbHb/aa5RyFRbxNtGl9+brnvb9x1t0HjQwku9ENuwsgINv17L
	+BiVd8dcpZEHX2QfVziUKSgToYnToeI0mkUDsEQATDGFej9qVA6EjZLU3OIdy77wk1p1U7i30ONCW
	AY8CaEBPJWu/aNs6mhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFMb-00000007N71-2l15;
	Wed, 14 Aug 2024 14:52:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFLt-00000007Msu-0KEk;
	Wed, 14 Aug 2024 14:51:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4071DA7;
	Wed, 14 Aug 2024 07:52:14 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6CB73F58B;
	Wed, 14 Aug 2024 07:51:44 -0700 (PDT)
Date: Wed, 14 Aug 2024 15:51:42 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075153_244552_9255477A 
X-CRM114-Status: GOOD (  29.87  )
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

On Thu, Aug 01, 2024 at 01:06:50PM +0100, Mark Brown wrote:
> When invoking a signal handler we use the GCS configuration and stack
> for the current thread.
> 
> Since we implement signal return by calling the signal handler with a
> return address set up pointing to a trampoline in the vDSO we need to
> also configure any active GCS for this by pushing a frame for the
> trampoline onto the GCS.  If we do not do this then signal return will
> generate a GCS protection fault.
> 
> In order to guard against attempts to bypass GCS protections via signal
> return we only allow returning with GCSPR_EL0 pointing to an address
> where it was previously preempted by a signal.  We do this by pushing a
> cap onto the GCS, this takes the form of an architectural GCS cap token
> with the top bit set and token type of 0 which we add on signal entry
> and validate and pop off on signal return.  The combination of the top
> bit being set and the token type mean that this can't be interpreted as
> a valid token or address.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/gcs.h |   1 +
>  arch/arm64/kernel/signal.c   | 134 +++++++++++++++++++++++++++++++++++++++++--
>  arch/arm64/mm/gcs.c          |   1 +
>  3 files changed, 131 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c

[...]

> +#ifdef CONFIG_ARM64_GCS
> +
> +static int gcs_signal_entry(__sigrestore_t sigtramp, struct ksignal *ksig)
> +{
> +	unsigned long __user *gcspr_el0;
> +	int ret = 0;
> +
> +	if (!system_supports_gcs())
> +		return 0;
> +
> +	if (!task_gcs_el0_enabled(current))
> +		return 0;
> +
> +	/*
> +	 * We are entering a signal handler, current register state is
> +	 * active.
> +	 */
> +	gcspr_el0 = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
> +
> +	/*
> +	 * Push a cap and the GCS entry for the trampoline onto the GCS.
> +	 */
> +	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
> +	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
> +	if (ret != 0)
> +		return ret;

What happens if we went wrong here, or if the signal we are delivering
was caused by a GCS overrun or bad GCSPR_EL0 in the first place?

It feels like a program has no way to rescue itself from excessive
recursion in some thread.  Is there something equivalent to
sigaltstack()?

Or is the shadow stack always supposed to be big enough to cope with
recursion that exhausts the main stack and alternate signal stack (and
if so, how is this ensured)?

> +
> +	gcsb_dsync();
> +
> +	gcspr_el0 -= 2;
> +	write_sysreg_s((unsigned long)gcspr_el0, SYS_GCSPR_EL0);
> +
> +	return 0;
> +}

[...]

Cheers
---Dave

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
