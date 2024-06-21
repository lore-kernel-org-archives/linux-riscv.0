Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB8BC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpZFrRKtcrp8IlvowI8To/TnM25sDI2WjKTlYEdXIlM=; b=3vZumxefacGfdF
	u1qxmni5yBLZeDQUrGntwYFNfUr5FvNMloHKTHX4BoIighc+fW1pPPS9KhpM7/UVTiEE/Qi+z1S6K
	gGM8BErst76GhLhp71WDu+UltGcN6DjsDf94IRztF+irsbb8mPajQwmgbV5kUGmrQu0mIm93Z2M7J
	pxOBoKiF2Uq+b9VNGwCDjKUu9VOBZT0PN06zY+EN6o8NV2Iq8ywT9nhhNG551BZtGzoazPp6ON3K/
	HAeHRehdkv4SVdXQBRvfOL9rwIlaivS1dPTygrdumTVs81To3Y0u5mCXBL+YZy3R6FVFNZXk4o2d6
	hTloPvgFoBt0Ari2lJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiWk-0000000AA5T-3S3z;
	Fri, 21 Jun 2024 17:58:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiWi-0000000AA4q-0u7L
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 17:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6385D62B57;
	Fri, 21 Jun 2024 17:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F035C4AF07;
	Fri, 21 Jun 2024 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718992699;
	bh=FHCBOkmJKRXejruoqMXNQNRLqnkS19ln5GOhpLntUOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZwcYW0vdtdGiwivQzAapn+QuTm1F5qT9YogaDVOkQPvAOHFGHo/TD1yXTOIhQxED
	 9slb9Mq0ZwpuYHMLk/F/tEMI8Sl9UiAmZZRzjP4RRj7476xWi6bLJKx1uBwAD/apxj
	 pna10eP8Wl4mSDvfqLOZPl422ANzIrBJmCp/erieV9zDcSQeQmrogL6QAMO+oqfvqe
	 0C6DMu84ZP9VHVWuQEVZW6dZlQ1l41Va3CMSUZJhdFvPgP3HwOblS+0OdZVGC9K3Ev
	 36qeFf3WbMJO5kfvyK4NOp/Xr8BH5qVnqMNyP6GQORj+XR/iVWpU3G8s11oGcQHdKr
	 bPWgAeak4uyBQ==
Date: Fri, 21 Jun 2024 10:58:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
Message-ID: <20240621175816.GD2081@sol.localdomain>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <ZnDmRK0ZtKzmWN5S@ghost>
 <ZnDsdzv4o/Xz9kWm@ghost>
 <e6f7a061-50f0-4a6a-a09b-468502703c20@rivosinc.com>
 <ZnSptpobfqjik3RM@ghost>
 <20240621-reveler-underfed-37600a9f16d5@wendy>
 <ZnW130PqW56CnZT8@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnW130PqW56CnZT8@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_105820_408948_B15C1CF3 
X-CRM114-Status: GOOD (  22.75  )
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

On Fri, Jun 21, 2024 at 10:18:23AM -0700, Charlie Jenkins wrote:
> > Additionally, what are we doing in the kernel if we detect that
> > misaligned stuff isn't supported? Are we going to mandate that kernel
> > code is aligned only, disable in-kernel vector or some other mechanism
> > to make sure that things like crypto code don't have/introduce code
> > that'll not run on these systems?
> 
> UNSUPPORTED will still be set by the quick probe so it would be possible
> for the kernel/userspace to avoid running misaligned vector when it's
> unsupported. Any kernel methods would probably want to always run
> aligned vector unless misaligned support was determined to be FAST
> anyway, I am doubtful that code will have different optimizations for
> FAST, SLOW, and UNSUPPORTED but it is possible. 
> 
> I would prefer consistency between scalar and vector misaligned support,
> but this is not a deal breaker for this patch. I am not convinced it is
> the best choice, but I am okay with leaving this option in the kernel.
> 

Note that most of the vector crypto code (in arch/riscv/crypto/) assumes that
vector misaligned accesses are supported.  Many of the RISC-V vector crypto
instructions require using SEW=32 or SEW=64, and as a result, loads and stores
of data can be misaligned unless the code changes the SEW to 8 and back again,
which would be inefficient and add extra complexity.  I don't anticipate
workarounds for CPUs that couldn't be bothered to support misaligned accesses
being added.  So what we'll probably have to do is just disable the vector
crypto algorithms if the CPU doesn't support misaligned accesses...

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
