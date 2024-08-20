Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AD4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2oJrdyxKTF7EjLHdGLhXzvHe6/RG25hTGsBwPoDAxQ=; b=3qgFwOzpSxK/6e
	M/ce1nFD58EHGKKAapK0RFrYUnBYFPupSx1LtArPCgvqa0UX6oVBa1nepE6rPQG6QCPwMwzSyV8Xg
	rEpIJkDkkH6BMuseNweuJTBuArPepDD2jrAlPqamHCF3e0+PuK52hqBaFOamxGgAY1A7pDK034NBv
	J1hTqtYBovy/QivwypS6ZhUi4BqJ1ugzvE0Cw0HVkOe/C0B6JiFK9sKEWtIcFg1hr1ahd04Me4Oae
	pSf3JvFespyr2FuiU7/DxsVkV039uB1MV/SpdRlcX/XahR5601dXZBy8iak55/YW9HURXRLZhby71
	rGABfo5J1zp7yb/hOpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgSLJ-000000067EV-345U;
	Tue, 20 Aug 2024 17:08:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgSKb-00000006763-0GHE;
	Tue, 20 Aug 2024 17:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1875CE0AE7;
	Tue, 20 Aug 2024 17:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B55C4AF13;
	Tue, 20 Aug 2024 17:07:31 +0000 (UTC)
Date: Tue, 20 Aug 2024 18:07:29 +0100
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
Message-ID: <ZsTNUYCMKgkrdRiS@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-19-699e2bd2190b@kernel.org>
 <ZsMwhdmE_Ai9BbM9@arm.com>
 <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f6fd3ec-2481-4507-af0e-3cbbb7406b54@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_100741_471383_37A56E12 
X-CRM114-Status: GOOD (  29.79  )
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

On Mon, Aug 19, 2024 at 04:44:42PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2024 at 12:46:13PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 01, 2024 at 01:06:46PM +0100, Mark Brown wrote:
> > > +	/*
> > > +	 * Ensure that GCS changes are observable by/from other PEs in
> > > +	 * case of migration.
> > > +	 */
> > > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > > +		gcsb_dsync();
[...]
> > What's the GCSB DSYNC supposed to do here? The Arm ARM talks about
> > ordering between GCS memory effects and other memory effects. I haven't
> > looked at the memory model in detail yet (D11.9.1) but AFAICT it has
> > nothing to do with the system registers. We'll need this barrier when
> > ordering is needed between explicit or implicit (e.g. BL) GCS accesses
> > and the explicit classic memory accesses. Paging comes to mind, so maybe
> > flush_dcache_page() would need this barrier. ptrace() is another case if
> > the memory accessed is a GCS page. I can see you added it in other
> > places, I'll have a look as I go through the rest. But I don't think one
> > is needed here.
> 
> It's not particuarly for the system registers, is there's so that
> anything else that looks at the task's GCS sees the current state.

Ah, so that's the to ensure that any writes on the CPU to the GCS stack
would be observable if the task appears on a different CPU (together
with the additional classic ordering/spinlocks used for the run queues).
Maybe update the comment to say "GCS memory effects" instead of "GCS
changes". I read the latter as GCS sysreg changes. Something like below
would make it clearer:

	/*
	 * Ensure that GCS memory effects of the 'prev' thread are
	 * ordered before other memory accesses with release semantics
	 * (or preceded by a DMB) on the current PE. In addition, any
	 * memory accesses with acquire semantics (or succeeded by a
	 * DMB) are ordered before GCS memory effects of the 'next'
	 * thread. This will ensure that the GCS memory effects are
	 * visible to other PEs in case of migration.
	 */

Feel free to rephrase as you see fit.

> I'm pretty confident this excessive, the goal was to err on the side
> of correctness and then relax later.

I think we are missing some. Paging should be ok as we have a pte change
and TLBI and IIRC the same rules as for standard memory accesses apply.
ptrace() memory accesses may need something though I'm fine with
considering this a best effort (we can't guarantee anyway if any
accesses are on different CPUs). I haven't got to the signal handling
patch yet.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
