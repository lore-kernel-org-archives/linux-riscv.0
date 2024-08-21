Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E68FC52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bH/e0ZGtbiA6Sj6qIqx517G7yzLkyQfVm+91bHzPhG0=; b=oysXwt9B5BME/G
	049XPnKvejWQW6XHLkl0Y9hS+hAHetxdkiSEteILekShxTalfGhkgvhbm3FrHar/1UyulAN9m1sUi
	tdnbA5TPYl1AP5gdByIyly/4MMH2IKk74nzJ+GRE7/fUgzPahXfadBX4UwenWPtzj96qRplK56bCP
	QL2cUztp/GsB+pr0z3PLcDXsv9qLRlohoDUBD4Ut2GgKM/go5GQ7y7HS2RhJZOX21SBei4kOtFXAK
	ePzgz3NLnGWp+yakUhtK95804D9o+QmvmC2N8Bb00OmNYPBzGWM76Aj6OQP1BxY+Hsah40HZ2lDF8
	G/kYHb5o2xu8xpuxyiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgks4-0000000904p-0Q7U;
	Wed, 21 Aug 2024 12:55:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkrK-00000008zus-2adG;
	Wed, 21 Aug 2024 12:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD48F60F82;
	Wed, 21 Aug 2024 12:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F86C32782;
	Wed, 21 Aug 2024 12:54:35 +0000 (UTC)
Date: Wed, 21 Aug 2024 13:54:33 +0100
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
Subject: Re: [PATCH v10 21/40] arm64/gcs: Implement shadow stack prctl()
 interface
Message-ID: <ZsXjiTlfLE61-jJC@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-21-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-21-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_055442_719374_053BC9E7 
X-CRM114-Status: GOOD (  15.84  )
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

On Thu, Aug 01, 2024 at 01:06:48PM +0100, Mark Brown wrote:
> Implement the architecture neutral prtctl() interface for setting the

s/prtctl/prctl/

> +int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
> +{
> +	unsigned long gcs, size;
> +	int ret;
> +
> +	if (!system_supports_gcs())
> +		return -EINVAL;
> +
> +	if (is_compat_thread(task_thread_info(task)))
> +		return -EINVAL;
> +
> +	/* Reject unknown flags */
> +	if (arg & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> +		return -EINVAL;
> +
> +	ret = gcs_check_locked(task, arg);
> +	if (ret != 0)
> +		return ret;
> +
> +	/* If we are enabling GCS then make sure we have a stack */
> +	if (arg & PR_SHADOW_STACK_ENABLE) {
> +		if (!task_gcs_el0_enabled(task)) {
> +			/* Do not allow GCS to be reenabled */
> +			if (task->thread.gcs_base)
> +				return -EINVAL;
> +
> +			if (task != current)
> +				return -EBUSY;
> +
> +			size = gcs_size(0);
> +			gcs = alloc_gcs(0, size);
> +			if (!gcs)
> +				return -ENOMEM;
> +
> +			task->thread.gcspr_el0 = gcs + size - sizeof(u64);
> +			task->thread.gcs_base = gcs;
> +			task->thread.gcs_size = size;
> +			if (task == current)
> +				write_sysreg_s(task->thread.gcspr_el0,
> +					       SYS_GCSPR_EL0);
> +
> +		}
> +	}

Nitpick: use a single 'if' instead of nesting (unless subsequent patches
add more to the first block).

Otherwise it looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
