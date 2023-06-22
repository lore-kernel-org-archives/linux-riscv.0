Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9590EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 21:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pwYi9sGJBV6n/VdXQ6NzXxTANVe7J9KMFEUaYlDnEE=; b=3mGftgE6j+aZvl
	mM+n7PWrrUvv0a7agssUhMJVi6RYJ+3v3rdUYofKRrp/CNqhy6dW2/lVSYALVGMg9rnMJh7qct/bH
	JBmKgj+WnQ4uUQdWYU7R2Uk7d9/++KvU1f1tj0cyN/TgiJUQZBVxQW3g6MwqO74qaHbpGYAbZmbyl
	y6YNU22rlbbI2Q95lv1ekgG179/kyCNawfg+rYsdLL2YbMOJATQsLH1+gQ+JYZtWqlH8HPue45Prm
	1ZTlHamwGG8YWQZAD8Rp5LEVABZdqQR9cVFttBhG90uO5d0ybhgu5mpa5xFNRCVGeoerBWZ+BJ6Mg
	D/3RXN/xSBMLH8xMBihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSFF-001uJa-04;
	Thu, 22 Jun 2023 21:53:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSFC-001uGU-07
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 21:53:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAB0A61917;
	Thu, 22 Jun 2023 21:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5D7C433C0;
	Thu, 22 Jun 2023 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687470810;
	bh=PJGfxTyAnCqu8Vna68rQ2voA4n9bS/jsrshp8nOUR3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2Y6v8fxX47hw/xJfyeIYjRJzAWpg8aRRtbtReWBMPAgcH9AfSyoIsdC7/mZGL2eX
	 e0+EZzJOrFT4sygyF0qGhmEKCrOUa6w73xYFv6j8L/2hBJ5qwKfEPu6CqbArm0/VU0
	 dD2y/4hj2fhuO3cGQiFQNfRHww0m43HysUddCGxJy4smBIuqFKNMWCdI3HfIkicAYA
	 cFOgxJU9LLNLfHnpqlY3KMIWoftnhwzzzSRFUxEVcsrTs26WY/ijGDjN4vFQixpkVn
	 XJy5AFHSUd3UqWfbGzcClQwAAoxRgXpeBFVI/v+Yv0+O48ThhxXoaR4cA9sgspSXPR
	 CPDbi17v2qfdg==
Date: Thu, 22 Jun 2023 21:53:27 +0000
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: bjorn@kernel.org, ndesaulniers@google.com,
	Conor Dooley <conor@kernel.org>, jszhang@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230622215327.GA1135447@dev-arch.thelio-3990X>
References: <87wmzwn1po.fsf@all.your.base.are.belong.to.us>
 <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_145334_196794_D18C7753 
X-CRM114-Status: GOOD (  31.00  )
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

On Wed, Jun 21, 2023 at 11:19:31AM -0700, Palmer Dabbelt wrote:
> On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
> > Conor Dooley <conor@kernel.org> writes:
> > 
> > [...]
> > 
> > > > So I'm no longer actually sure there's a hang, just something
> > > > slow.  That's even more of a grey area, but I think it's sane to
> > > > call a 1-hour link time a regression -- unless it's expected
> > > > that this is just very slow to link?
> > > 
> > > I dunno, if it was only a thing for allyesconfig, then whatever - but
> > > it's gonna significantly increase build times for any large kernels if LLD
> > > is this much slower than LD. Regression in my book.
> > > 
> > > I'm gonna go and experiment with mixed toolchain builds, I'll report
> > > back..
> > 
> > I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
> > HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:
> > 
> >   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
> >   |     --toolchain=llvm-16 --runtime docker --directory . -k \
> >   |     allyesconfig
> > 
> > Took forever, but passed after 2.5h.
> 
> Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just
> checking top sometimes), it's at 1.5h but even that seems quite long.
> 
> I guess this is sort of up to the LLVM folks: if it's expected that DCE
> takes a very long time to link then I'm not opposed to allowing it, but if
> this is probably a bug in LLD then it seems best to turn it off until we
> sort things out over there.
> 
> I think maybe Nick or Nathan is the best bet to know?

I can confirm a regression with allyesconfig but not allmodconfig using
LLVM 16.0.6 on my 80-core Ampere Altra system.

allmodconfig: 8m 4s
allmodconfig + CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=n: 7m 4s
allyesconfig: 1h 58m 30s
allyesconfig + CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=n: 12m 41s

I am sure there is something that ld.lld can do better, given GNU ld
does not have any problems as earlier established, so that should
definitely be explored further. I see Nick already had a response about
writing up a report (I wrote most of this before that email so I am
still sending this one).

However, allyesconfig is pretty special and not really indicative of a
"real world" kernel build in my opinion (which will either be a fully
modular kernel to allow use on a wide range of hardware or a monolithic
kernel with just the drivers needed for a specific platform, which will
be much smaller than allyesconfig); it has given us problems with large
kernels before on other architectures.

CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is already marked with 'depends on
EXPERT' and its help text mentions its perils, so it does not seem
unreasonable to me to add an additional dependency on !COMPILE_TEST so
that allmodconfig and allyesconfig cannot flip this on, something like
the following perhaps?

diff --git a/init/Kconfig b/init/Kconfig
index 32c24950c4ce..25434cbd2a6e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1388,7 +1388,7 @@ config HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 config LD_DEAD_CODE_DATA_ELIMINATION
 	bool "Dead code and data elimination (EXPERIMENTAL)"
 	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
-	depends on EXPERT
+	depends on EXPERT && !COMPILE_TEST
 	depends on $(cc-option,-ffunction-sections -fdata-sections)
 	depends on $(ld-option,--gc-sections)
 	help

If applying that dependency to all architectures is too much, the
selection in arch/riscv/Kconfig could be gated on the same condition.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
