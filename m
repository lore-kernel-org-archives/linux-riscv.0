Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D14C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svMhF7eebIj9TTkSk9xkUXEmxPsS0GenqkUEedODyd0=; b=yRs22tT0cDhjSW
	MSoITih3XyUliyDXE1E22YmvYrSVxtGc3o7eg566pO1UCWstHszPWE3juv4zjj2QVRp00WquCSVQh
	fHR7+i6f9sqhfhj+bLWKFDQbiqXCj1hMDKFxV5ILglUEBLr8ONdf7Y31KtZZulvgsdgWM5ZNQXvYz
	aa+v1aYBJvvTeRjn7Wg+TNTCjmiSXboVwN2MceeyuGy4lyU+uk14yjFewTJI89FL28yk1p/CJ0GMb
	fgLW+rvWWZuHmnBzD1ytDXHPW1lx+s5p8DrCg8f8dX7hVZbNJj4ORivneGtPAlgjcGFg2Dab5PNM2
	on/yWqODfmyD1uKnLw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpKe-00000009xBD-3LBU;
	Wed, 21 Aug 2024 17:41:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpJt-00000009wxV-2a7e;
	Wed, 21 Aug 2024 17:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8847A41DB2;
	Wed, 21 Aug 2024 17:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67B2C32781;
	Wed, 21 Aug 2024 17:40:22 +0000 (UTC)
Date: Wed, 21 Aug 2024 18:40:20 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 24/40] arm64/signal: Expose GCS state in signal frames
Message-ID: <ZsYmhHHmqSu7wWWW@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_104029_806436_F8D595A7 
X-CRM114-Status: GOOD (  19.28  )
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

On Thu, Aug 01, 2024 at 01:06:51PM +0100, Mark Brown wrote:
> @@ -636,6 +639,81 @@ extern int restore_zt_context(struct user_ctxs *user);
>  
>  #endif /* ! CONFIG_ARM64_SME */
>  
> +#ifdef CONFIG_ARM64_GCS
> +
> +static int preserve_gcs_context(struct gcs_context __user *ctx)
> +{
> +	int err = 0;
> +	u64 gcspr;
> +
> +	/*
> +	 * We will add a cap token to the frame, include it in the
> +	 * GCSPR_EL0 we report to support stack switching via
> +	 * sigreturn.
> +	 */
> +	gcs_preserve_current_state();
> +	gcspr = current->thread.gcspr_el0 - 8;

We discussed briefly offline. Not a problem in this patch but
gcs_preserve_current_state() only saves it conditionally on GCS being
enabled for the task. However, you mentioned that the register is always
available to the user, so I'd rather change the preserving function to
save it unconditionally.

> +
> +	__put_user_error(GCS_MAGIC, &ctx->head.magic, err);
> +	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
> +	__put_user_error(gcspr, &ctx->gcspr, err);
> +	__put_user_error(0, &ctx->reserved, err);
> +	__put_user_error(current->thread.gcs_el0_mode,
> +			 &ctx->features_enabled, err);
> +
> +	return err;
> +}
> +
> +static int restore_gcs_context(struct user_ctxs *user)
> +{
> +	u64 gcspr, enabled;
> +	int err = 0;
> +
> +	if (user->gcs_size != sizeof(*user->gcs))
> +		return -EINVAL;
> +
> +	__get_user_error(gcspr, &user->gcs->gcspr, err);
> +	__get_user_error(enabled, &user->gcs->features_enabled, err);
> +	if (err)
> +		return err;
> +
> +	/* Don't allow unknown modes */
> +	if (enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> +		return -EINVAL;
> +
> +	err = gcs_check_locked(current, enabled);
> +	if (err != 0)
> +		return err;
> +
> +	/* Don't allow enabling */
> +	if (!task_gcs_el0_enabled(current) &&
> +	    (enabled & PR_SHADOW_STACK_ENABLE))
> +		return -EINVAL;

We don't allow enabling and that's fine but we don't restore gcspr
either with this early return.

> +
> +	/* If we are disabling disable everything */
> +	if (!(enabled & PR_SHADOW_STACK_ENABLE))
> +		enabled = 0;
> +
> +	current->thread.gcs_el0_mode = enabled;
> +
> +	/*
> +	 * We let userspace set GCSPR_EL0 to anything here, we will
> +	 * validate later in gcs_restore_signal().
> +	 */
> +	current->thread.gcspr_el0 = gcspr;
> +	write_sysreg_s(current->thread.gcspr_el0, SYS_GCSPR_EL0);

I think you should move this further up unconditionally.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
