Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF9C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oksYkPtSvCHUF7KWlo5TGHJPfm4JJ2oAoo5Hn/M6jac=; b=RRs4brZkTgLm3+
	x43FGyZGxOVKNoApCWDRqxP7RRY4gspajdeRTEqnBNAPmnF8f/HFOpt71U2hJgZwEjed+dPS/BPad
	g/4m9YOi35u+MfKIvho+m5eKjdzEAn96yPevtiNhQ5oZs66Mxfd5azBHjKg7qws/EcanIf9l6PkVf
	n+M1Rp67RA0RC/MTiFSTYNrdlvCQIL7+6z+jGXdOCuPsfHve1SPRI6IJcboH3Vyyc2N0bKkzvSfLj
	ichrTUWeWm7e+uH6XwgYS0t7X51gsi0gVCaWujQk/X2gZHxlwCkHb+1r4V0KfPYaE0dkXtNhIJzSE
	Drjo9at0iFoLNkvgBlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAG3-0000000DUZ3-3YpK;
	Thu, 22 Aug 2024 16:01:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh9z4-0000000DNzX-43if;
	Thu, 22 Aug 2024 15:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8685FA40531;
	Thu, 22 Aug 2024 15:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAD5C32782;
	Thu, 22 Aug 2024 15:44:14 +0000 (UTC)
Date: Thu, 22 Aug 2024 16:44:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 18/39] arm64/traps: Handle GCS exceptions
Message-ID: <ZsdczGTaMgZnEaDy@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-18-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-18-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_084423_092389_ECC991B7 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Aug 22, 2024 at 02:15:21AM +0100, Mark Brown wrote:
> +static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
> +{
> +	enter_from_user_mode(regs);
> +	local_daif_restore(DAIF_PROCCTX);
> +	do_el0_gcs(regs, esr);
> +	exit_to_user_mode(regs);
> +}
> +
>  static void noinstr el0_inv(struct pt_regs *regs, unsigned long esr)
>  {
>  	enter_from_user_mode(regs);
> @@ -766,6 +786,9 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
>  	case ESR_ELx_EC_MOPS:
>  		el0_mops(regs, esr);
>  		break;
> +	case ESR_ELx_EC_GCS:
> +		el0_gcs(regs, esr);
> +		break;
>  	case ESR_ELx_EC_BREAKPT_LOW:
>  	case ESR_ELx_EC_SOFTSTP_LOW:
>  	case ESR_ELx_EC_WATCHPT_LOW:
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 9e22683aa921..d410dcc12ed8 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -500,6 +500,16 @@ void do_el1_bti(struct pt_regs *regs, unsigned long esr)
>  	die("Oops - BTI", regs, esr);
>  }
>  
> +void do_el0_gcs(struct pt_regs *regs, unsigned long esr)
> +{
> +	force_signal_inject(SIGSEGV, SEGV_CPERR, regs->pc, 0);
> +}

Just double checking: a GCSPOPM (for example, it can be a RET) from a
non-GCS page would generate a classic permission fault with ISS2.GCS set
rather than a GCS exception. That's my reading from the Arm ARM
pseudocode, the text isn't clear to me.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
