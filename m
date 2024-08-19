Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92394C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx9sgHHLHwntXLqWOu0UrZQ1DVzRoIWSMqqQlu6+mP0=; b=Gv4guRt5Fueigf
	r+pg77bmumsUEIUqmkinQ6VYNPPRAx0LqlNvQGjXflZOOJeQo/ZF4wAksZce1KatRO1xfOQv0DC74
	eKbEyS+QLgYGfvMzqL6iOPdW86ACxuc0pD+V8JvszrM+P+I6KidA2gMBUHX/8kS2meybdj6/CbZs8
	/Dbvzd8plvYwagybMuzoKreNqCu7UFoFiDnNZtpBbR8P34EkhUz1ZL0kXBr751elOwW59MmIvGuO4
	9tD0sN0auXbEDfYByrL8WCcqtPycNgaEH1CyFmZX6Z3oXmKis+ogcz0jIdX8Q5/jPV+2wRgW1tKYQ
	5qbNMTW/FHsDm5OysYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0qo-00000001GsA-03gv;
	Mon, 19 Aug 2024 11:47:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0q5-00000001GiB-2aTG;
	Mon, 19 Aug 2024 11:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0420660B9C;
	Mon, 19 Aug 2024 11:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF1DC32782;
	Mon, 19 Aug 2024 11:46:15 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:46:13 +0100
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
Subject: Re: [PATCH v10 19/40] arm64/gcs: Context switch GCS state for EL0
Message-ID: <ZsMwhdmE_Ai9BbM9@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_044621_736525_E9C746CD 
X-CRM114-Status: GOOD (  20.05  )
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

On Thu, Aug 01, 2024 at 01:06:46PM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 4ae31b7af6c3..5f00cb0da9c3 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
[...]
> +static void gcs_thread_switch(struct task_struct *next)
> +{
> +	if (!system_supports_gcs())
> +		return;
> +
> +	gcs_preserve_current_state();
> +
> +	gcs_set_el0_mode(next);
> +	write_sysreg_s(next->thread.gcspr_el0, SYS_GCSPR_EL0);
> +
> +	/*
> +	 * Ensure that GCS changes are observable by/from other PEs in
> +	 * case of migration.
> +	 */
> +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> +		gcsb_dsync();

Could we do the sysreg writing under this 'if' block? If no app is using
GCS (which would be the case for a while), it looks like unnecessary
sysreg accesses.

What's the GCSB DSYNC supposed to do here? The Arm ARM talks about
ordering between GCS memory effects and other memory effects. I haven't
looked at the memory model in detail yet (D11.9.1) but AFAICT it has
nothing to do with the system registers. We'll need this barrier when
ordering is needed between explicit or implicit (e.g. BL) GCS accesses
and the explicit classic memory accesses. Paging comes to mind, so maybe
flush_dcache_page() would need this barrier. ptrace() is another case if
the memory accessed is a GCS page. I can see you added it in other
places, I'll have a look as I go through the rest. But I don't think one
is needed here.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
