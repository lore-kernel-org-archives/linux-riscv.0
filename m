Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA700C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4lpIr2hTl5WY7Gex5tS9+/Nq9TZXS7CmICPZKez/gs=; b=TchGFCMjsII/Hj
	8WR/w9s7f6G2BVZ5nyHLBdpQLme5lM/lCgwUuyClZnsyNDwkcB7pacSo1BV9l+7+yC6rWBYfmtwYm
	sM14h+5pvVdyPr8jp5xqemYDcR0x2na2PnBi4yontVrl3Cp4wHiPPgOmVXBRwsdlDTXrE7n0kx9XW
	9CGViR6nwBSZmQrOwB2HD4aQF2LdEtCKgdREhD2joD/Uu7/95risyWVeENm9fGrNion0ew3VoC3O9
	bWDHk0N6m+EfYKYjoYRxQcRSsGXHhRkAiNJ0x14JcrpfL5phplDwV+8ycA+WCwqTRC3vj+fCrmMra
	tcbEy4bfQOofD1btGMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpb1-00000009zC4-1sRP;
	Wed, 21 Aug 2024 17:58:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpaG-00000009z1T-3e6P;
	Wed, 21 Aug 2024 17:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1188D610E7;
	Wed, 21 Aug 2024 17:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F22C32781;
	Wed, 21 Aug 2024 17:57:18 +0000 (UTC)
Date: Wed, 21 Aug 2024 18:57:16 +0100
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
Subject: Re: [PATCH v10 25/40] arm64/ptrace: Expose GCS via ptrace and core
 files
Message-ID: <ZsYqfJ3V_-ljqlwq@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-25-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-25-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_105725_061564_F2C5E85E 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, Aug 01, 2024 at 01:06:52PM +0100, Mark Brown wrote:
> @@ -1440,6 +1441,51 @@ static int tagged_addr_ctrl_set(struct task_struct *target, const struct
>  }
>  #endif
>  
> +#ifdef CONFIG_ARM64_GCS
> +static int gcs_get(struct task_struct *target,
> +		   const struct user_regset *regset,
> +		   struct membuf to)
> +{
> +	struct user_gcs user_gcs;
> +
> +	if (target == current)
> +		gcs_preserve_current_state();
> +
> +	user_gcs.features_enabled = target->thread.gcs_el0_mode;
> +	user_gcs.features_locked = target->thread.gcs_el0_locked;
> +	user_gcs.gcspr_el0 = target->thread.gcspr_el0;

If it's not the current thread, I guess the task was interrupted,
scheduled out (potentially on another CPU) and its GCSPR_EL0 saved.

> +
> +	return membuf_write(&to, &user_gcs, sizeof(user_gcs));
> +}
> +
> +static int gcs_set(struct task_struct *target, const struct
> +		   user_regset *regset, unsigned int pos,
> +		   unsigned int count, const void *kbuf, const
> +		   void __user *ubuf)
> +{
> +	int ret;
> +	struct user_gcs user_gcs;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_gcs, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	if (user_gcs.features_enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> +		return -EINVAL;
> +
> +	/* Do not allow enable via ptrace */
> +	if ((user_gcs.features_enabled & PR_SHADOW_STACK_ENABLE) &&
> +	    !(target->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
> +		return -EBUSY;
> +
> +	target->thread.gcs_el0_mode = user_gcs.features_enabled;
> +	target->thread.gcs_el0_locked = user_gcs.features_locked;
> +	target->thread.gcspr_el0 = user_gcs.gcspr_el0;

As in the previous thread, I thought we need to restore GCSPR_EL0
unconditionally.

I don't particularly like that this register becomes some scrap one that
threads can use regardless of GCS. Not sure we have a simple solution.
We could track three states: GCS never enabled, GCS enabled and GCS
disabled after being enabled. It's probably not worth it.

On ptrace() access to the shadow stack, we rely on the barrier in the
context switch code if stopping a thread. If other threads are running
on other CPUs, it's racy anyway even for normal accesses, so I don't
think we need to do anything more for ptrace.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
