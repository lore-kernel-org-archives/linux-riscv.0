Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85E4C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s86dVUtGlYTJzmqNVFX4uutJV9beIVxDLmyeB4fJg9I=; b=PSPM36zpIioRx/
	spMSXA1kuMrAsg064kiF/yQAlslCvnvRPbfJOWA2OZ02Ed1Z4+Nncp53T1Ke3w3ni4CMcJUNDpSpZ
	RuZigIUwJJNVedk0kMJ5iTkR4bLeMTPUi6SgXiApSOTsI9BnLE5PQ8IQu56D3lPLiduzfMvPFaL+n
	leBIen4GWVjykyUBAOzyHLLg+V7JAByN8drxdLavvkkXKYpZmW9uxfuL1q95+iQr8T8vHV6PC/TXN
	0YbLOcKx2MBr36vRz7hqgea5dUmCUevBgQopLXOsM0BOG3LoqVIZrM9NgfWbmBgYMDTpzJWpuMxzv
	JnzbQraHL8OSDcqf9ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQkz-0000000G9Ng-1XgA;
	Fri, 23 Aug 2024 09:38:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQjY-0000000G92i-2RVH;
	Fri, 23 Aug 2024 09:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AED7C60F59;
	Fri, 23 Aug 2024 09:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2810C32786;
	Fri, 23 Aug 2024 09:37:21 +0000 (UTC)
Date: Fri, 23 Aug 2024 10:37:19 +0100
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
Subject: Re: [PATCH v11 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <ZshYTyNbveD7WMyJ@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_023728_775882_E06DD3CA 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Aug 22, 2024 at 02:15:28AM +0100, Mark Brown wrote:
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

Do we actually need to store the gcspr value after the cap token has
been pushed or just the value of the interrupted context? If we at some
point get a sigaltshadowstack() syscall, the saved GCS wouldn't point to
the new stack but rather the original one. Unwinders should be able to
get the actual GCSPR_EL0 register, no need for the sigcontext to point
to the new shadow stack.

Also in gcs_signal_entry() in the previous patch, we seem to subtract 16
rather than 8.

I admit I haven't checked the past discussions in this area, so maybe
I'm missing something.

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

So in preserve_gcs_context(), we subtract 8 from the gcspr_el0 value.
Where is it added back?

What I find confusing is that both restore_gcs_context() and
gcs_restore_signal() seem to touch current->thread.gcspr_el0 and the
sysreg. Which one takes priority? I should probably check the branch out
to see the end result.

> @@ -977,6 +1079,13 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
>  			return err;
>  	}
>  
> +	if (add_all || task_gcs_el0_enabled(current)) {
> +		err = sigframe_alloc(user, &user->gcs_offset,
> +				     sizeof(struct gcs_context));
> +		if (err)
> +			return err;
> +	}

I'm still not entirely convinced of this conditional saving and the
interaction with unwinders. In a previous thread you mentioned that we
need to keep the GCSPR_EL0 sysreg value up to date even after disabling
GCS for a thread as not to confuse the unwinders. We could get a signal
delivered together with a sigreturn without any context switch. Do we
lose any state?

It might help if you describe the scenario, maybe even adding a comment
in the code, otherwise I'm sure we'll forget in a few months time.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
