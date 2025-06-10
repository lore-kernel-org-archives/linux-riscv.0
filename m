Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346FAC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2kzGL3B0ajKPylGFv0XMdVokD33dRqrUrt/dRDjYYY=; b=01Mhgmxh0vRS0O
	cF0YKgDvuL/4VviNJzAof323mYY4cu+7Nx4v6keFS53+GwJXg0n/fxPRSaWZQeF65X+q4JRL2obYz
	joF31XGm1J06p++rsDf/INnSM4d48cXANpDmyxb2myhYXkTj4p3edzTd+fj/Gy86+R6gITNUoE45I
	oNVZfc7lFp2tY1E/GbrDaadkwVQyyNDZg0Z7REKdigt2tVlitu6lNaskUANvU+jgIYQHTDfSLT53w
	yKJlN3UofxvbbCGif3F82SzADIhdGwZDVG67LBlejZ73lKLGnoi10q9Y0RncC/Z+q29O7/g53qPVz
	MEYmtfHW+SwFM3JdxOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lk-00000008Fej-227J;
	Tue, 10 Jun 2025 22:48:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP41F-00000007qI4-2WUm;
	Tue, 10 Jun 2025 18:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 238B4A51404;
	Tue, 10 Jun 2025 18:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B537C4CEED;
	Tue, 10 Jun 2025 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749581299;
	bh=fW4WUlLPzTcOGUmKEUJPh5AreVUZepIXG7py1Yrxjzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2rR2VQ8Oq9Cmc6H9eooraC/6WL6LWGn/CyQscdSYoBnxrd6j556t8Yr4T5TQT33Y
	 KjAddPGzxn/a1xZsEPhM/wtGddhOqKWPsMgUketQdpHVnfaf6YaA4v61Gwh2iKlc4q
	 XkImdNQGb8y/Dgab6Udgq58Wxqco3rHtvNJ/qMnxwy9JcEIqHgZDQeAJCWUxC+A3oV
	 OL2cGfo+A5I1Vic3XRH5dNQh8oPwI4lU72wrwqRIvmCAJJGgAq2b9hXkSx0B0RmSDD
	 yJDpesZCL8iTxUJpJJvTqXeUEjtLqkz9iTejv45bhW3iFAmqRSy59HNfkPBVXi01hH
	 mICO2Doj48fpw==
Date: Tue, 10 Jun 2025 11:47:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250610184755.GC1649@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_114821_775238_30051C4E 
X-CRM114-Status: GOOD (  24.65  )
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

On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> 
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
> 
> As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
> 
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
> 
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.
> 
> Changed in v2:
>    - Fixed build warning on architectures without any optimized CRC code
>    - Fixed build warning in sparc/crc32.h by removing pr_fmt
>    - Moved fallback definitions of crc32*_arch back into arch files
>    - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
>      so that they're not removed until they're no longer being selected
>    - Slightly improved some commit messages
>    - Rebased onto other pending lib/crc changes
> 
> Eric Biggers (12):
>   lib/crc: move files into lib/crc/
>   lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
>   lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
>   lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
>   lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
>   lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
>   lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
>   lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
>   lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
>   lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
>   lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
>   lib/crc: remove ARCH_HAS_* kconfig symbols

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
