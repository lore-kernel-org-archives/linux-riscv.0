Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE4EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg2tnlSv+K3BPLEZgzRJvH6J6Et3rw5TVHOD6NcINRc=; b=UljCAgxOPHk4Vd
	6MO1DK1WrpgCZStSmzLEdxY5KocbaYL9xfoqtb2Qb1OoAdTjIA1OhdPVLA0QtDRV5pc9MX34gqK3u
	3+VhcYEYzPV20WuhXMYVC1xYDvmwejzwWpkDpLHH9aNq9BlG9KdqQKZWf9xvwJWnZlxTg9qq6ioMU
	VKOibR0pkqWmOeETStQe2YDPCALwI8iVP4scc/0ZrpXRSilxV5DTZkrUxyX6HZJpvAwDDlTb9luUY
	L3LBwgLMngV79w+jKpJ5zo1XjTgY4XONbxdDjArcHX5B1rh9sL2rLDpMpSe/ziGDFwMRNEA14vbmZ
	Xlgj43tZcIMw5nV9MoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUU7i-00Ay0m-0R;
	Fri, 11 Aug 2023 15:32:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUU7e-00AxzE-20;
	Fri, 11 Aug 2023 15:32:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2102E61044;
	Fri, 11 Aug 2023 15:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3E1C433C7;
	Fri, 11 Aug 2023 15:32:12 +0000 (UTC)
Date: Fri, 11 Aug 2023 16:32:10 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 18/36] arm64/gcs: Context switch GCS state for EL0
Message-ID: <ZNZUerbrJmzqZzJw@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-18-68cfa37f9069@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-arm64-gcs-v4-18-68cfa37f9069@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_083218_706608_9FDF0252 
X-CRM114-Status: GOOD (  17.77  )
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

On Mon, Aug 07, 2023 at 11:00:23PM +0100, Mark Brown wrote:
> @@ -271,12 +272,31 @@ static void flush_tagged_addr_state(void)
>  		clear_thread_flag(TIF_TAGGED_ADDR);
>  }
>  
> +#ifdef CONFIG_ARM64_GCS
> +
> +static void flush_gcs(void)
> +{
> +	if (system_supports_gcs()) {

Nitpick: use "if (system_supports_gcs()) return" when we have more than
a line in the conditional block (slightly more consistent with other
places).

> +		gcs_free(current);
> +		current->thread.gcs_el0_mode = 0;
> +		write_sysreg_s(0, SYS_GCSCRE0_EL1);
> +		write_sysreg_s(0, SYS_GCSPR_EL0);
> +	}
> +}

Do we need and isb() or there's one on this path? If it's only EL0
making use of this register, we should be fine with the ERET before
returning to user. Not sure whether the kernel uses this, GCSSTTR
doesn't need it.

> +static void gcs_thread_switch(struct task_struct *next)
> +{
> +	if (!system_supports_gcs())
> +		return;
> +
> +	gcs_preserve_current_state();
> +
> +	/*
> +	 * Ensure that GCS changes are observable by/from other PEs in
> +	 * case of migration.
> +	 */
> +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> +		gcsb_dsync();

What's this barrier for? The spec (at least the version I have) only
talks about accesses, nothing to do with the registers that we context
switch here.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
