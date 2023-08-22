Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC102EE49A3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DtCssKc/2BmnGuRz0NPq0ayNijQI8qLFMrzA98rWyk=; b=N7LockKVrOmclR
	T86HirluUtiCaIQ5XLTGbrUeJ7gz1dEnFFqqrCHlxeJC1eNvUw5jhb9XfKx5j1YaSD96XKWnRtpjV
	w1AFtHmLGS5gdHplpdcLgzdiYT8cPnAcu3/jCWke3sOCkjBRNyP8ALNTui/ZZMHeDEOlWE8hhwsjM
	fqvMh/ww3pHJaqobdlYMiHZd96NxXUUVY6qVLWR6XtOhG32m6etd2mGhzok/e0o2V3Ca1fIe6Ay2a
	sbMGGuogD9rXMUnRpLW3aPelPdcMTWofNgZQMfUoY+hkfQLaaBD+RKMq0RqjASUgkRI3VEOQ2y5tB
	1zt5XMi87keZx6isosHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYULS-00GVZC-0D;
	Tue, 22 Aug 2023 16:35:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYULO-00GVYN-1k;
	Tue, 22 Aug 2023 16:35:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0920160689;
	Tue, 22 Aug 2023 16:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2203DC433C9;
	Tue, 22 Aug 2023 16:34:47 +0000 (UTC)
Date: Tue, 22 Aug 2023 17:34:38 +0100
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
Message-ID: <ZOTjnmwwZ+iMsi6Y@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-18-68cfa37f9069@kernel.org>
 <ZNZUerbrJmzqZzJw@arm.com>
 <28a61b5f-db65-427e-8e92-60dd61549da5@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28a61b5f-db65-427e-8e92-60dd61549da5@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_093502_668773_DD3C9775 
X-CRM114-Status: GOOD (  30.68  )
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

On Wed, Aug 16, 2023 at 07:15:53PM +0100, Mark Brown wrote:
> On Fri, Aug 11, 2023 at 04:32:10PM +0100, Catalin Marinas wrote:
> > On Mon, Aug 07, 2023 at 11:00:23PM +0100, Mark Brown wrote:
> 
> > > +		gcs_free(current);
> > > +		current->thread.gcs_el0_mode = 0;
> > > +		write_sysreg_s(0, SYS_GCSCRE0_EL1);
> > > +		write_sysreg_s(0, SYS_GCSPR_EL0);
> > > +	}
> > > +}
> 
> > Do we need and isb() or there's one on this path? If it's only EL0
> > making use of this register, we should be fine with the ERET before
> > returning to user. Not sure whether the kernel uses this, GCSSTTR
> > doesn't need it.
> 
> They're only used by EL0, at EL1 we do read GCSPR for signal handling
> but AIUI that shouldn't be any more of an issue than it is for the
> TPIDRs which we don't have a barrier for.  It's possible I'm
> misunderstanding though.

We should be alright without since we'll eventually have an ERET to EL0.

> > > +	/*
> > > +	 * Ensure that GCS changes are observable by/from other PEs in
> > > +	 * case of migration.
> > > +	 */
> > > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > > +		gcsb_dsync();
> 
> > What's this barrier for? The spec (at least the version I have) only
> > talks about accesses, nothing to do with the registers that we context
> > switch here.
> 
> Right, it's for the GCS memory rather than the registers.  I'm fairly
> sure it's excessive but but was erring on the side of caution until I
> have convinced myself that the interactions between GCS barriers and
> regular barriers were doing the right thing, until we have physical
> implementations to contend with I'd guess the practical impact will be
> minimal.

Well, I'd say either we are clear about why it's (not) needed or we ask
the architects to clarify the spec. I haven't checked your latest
series but in principle I don't like adding barriers just because we are
not sure they are needed (and I don't think having hardware eventually
changes this).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
