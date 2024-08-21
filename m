Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC19C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXEq5bZLPW1G3rXGTXxF4epMQF4q/MKnm4YJXiB05ZA=; b=VKpM55ZlCBb74K
	BGsib6EXYNFuQ7+4auHHma2GRAfeG/+z+yAtsy5OCE1ky7bn03o3LzWagVLrhB1mCvossyfAosClJ
	oPYZ1BpyWs93W/y3MgVtw+jTPqk83dGZfEPuoQjmqXUdXC181xr3cZZfxSknPNoM40ukg8ku3vdwX
	I4VyFu8OKFM50/HThXHrLhcfkgMc28nrZo+IrD6P3K0Bvf4VZByQhiVXhsSjRCI43rLcYeRwn+AYc
	OflMod3LkMA6rq2T1TC/tf657F4ZzE5+GnqysKqs4A/LaCcxpV/2L/9l9sEZbAvo+gqQeejxRzwB1
	tWfQRMIF2uUpSCpxw80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp9U-00000009vOE-12Ay;
	Wed, 21 Aug 2024 17:29:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp8j-00000009vBV-3mxl;
	Wed, 21 Aug 2024 17:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDADC610AA;
	Wed, 21 Aug 2024 17:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439DCC4AF09;
	Wed, 21 Aug 2024 17:28:51 +0000 (UTC)
Date: Wed, 21 Aug 2024 18:28:49 +0100
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
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <ZsYj0YYMuX1YRBZT@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_102858_095642_44C09D4E 
X-CRM114-Status: GOOD (  21.00  )
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
> @@ -860,6 +892,50 @@ static int restore_sigframe(struct pt_regs *regs,
>  	return err;
>  }
>  
> +#ifdef CONFIG_ARM64_GCS
> +static int gcs_restore_signal(void)
> +{
> +	u64 gcspr_el0, cap;

Nitpick: use 'unsigned long __user *gcspr_el0' as in the
gcs_signal_entry(). It's more consistent and probably less casting.

> +	int ret;
> +
> +	if (!system_supports_gcs())
> +		return 0;
> +
> +	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
> +		return 0;
> +
> +	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
> +
> +	/*
> +	 * GCSPR_EL0 should be pointing at a capped GCS, read the cap...
> +	 */
> +	gcsb_dsync();
> +	ret = copy_from_user(&cap, (__user void*)gcspr_el0, sizeof(cap));
> +	if (ret)
> +		return -EFAULT;

Can the user change GCSPR_EL0 to a non-shadow-stack region, fake the
cap before sigreturn? copy_from_user() cannot check it's a GCS page.
Does it actually matter?

> @@ -1130,7 +1209,50 @@ static int get_sigframe(struct rt_sigframe_user_layout *user,
>  	return 0;
>  }
>  
> -static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
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

Doesn't the second put_user_gcs() override the previous ret?

> +
> +	gcsb_dsync();

Wondering if we need the barrier both for entry and restore. If the
restore happens on another CPU, we have the barriers in the context
switch code already. If it's only the kernel writing the caps with
GCSSTTR on setting up the stack and checking it on return, a single
barrier is sufficient (can be this one). If the user can write something
on the stack or maybe doing a sigreturn without fully unwinding the
stack, we may need both. Either way, it would help to add some comments
on these barriers.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
