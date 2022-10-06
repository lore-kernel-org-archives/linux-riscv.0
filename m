Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3E3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SRtaVga8Z3JdpUD6G1nowIGLIxm/c72i5kEeGm0Ofd4=; b=lLbzPDzvG6OEel
	AhWtB8wGDbvkYa2z6aqpJ5hubGWlh62+7s3WTVepHpWd/Hlpujo+arv2b/VbstkthNO7zqJg29l5b
	/vybx20xBmRM2HvSu24USM1OkR9RlgPWFGL6PH2BwaV+RwvxUKzBfoIR7ZsPgYWa02Am3HLarFsJi
	5kTgrj1VWYyRtcvgRxImdwcx+qrAWyRfgiYU4b6CM/ymMs5LHX8/sP/LOBB0PVX912hmzv0iZ4Ykc
	PbjIT9dJ6bhK4O71qBilNF4K7CifVVCdTiJ7RgOzZNt8iXPxt3vOgMNaBbKaWAlLX2F0rWIQswBXL
	QvRCIVzs4n/9nd7ECblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUn9-004CSz-F1; Thu, 06 Oct 2022 17:36:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUn6-004CS9-SQ
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 17:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C1F761A35;
	Thu,  6 Oct 2022 17:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C33AC433C1;
	Thu,  6 Oct 2022 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665077771;
	bh=p7WWSAL6ZEAp08YxCy84XfVzYJ+eRQtdUq8MkjpUoHk=;
	h=From:To:Cc:Subject:Date:From;
	b=b9c5Uydrjv8pk3uGlZE3vwB+UQf/6haH4DdHHdZca9dUT+SlykCR9/SgHAz6IeIKR
	 Jqsk1o65vApJ1L7m/tMWyMaTQ6ndEUWTsyVlSnx4r5nGK9q3NU/FtV4V2BniQZVCja
	 AHyZP562lYHjcSGlL4QsLvDnCUS/ooxqeZsT9IVjGLvplhn3fyQjhdGCB7W1b4tXxj
	 bbci+Ym9N7TtS52f4Yyl36wJ3Q2wEku6l4RLumK9YHBFMnbChNGGIliZ+AqpdCxfuL
	 jmppVEh2hNQCZIqIePcNESF8DMwUs9YMtCw946iWeYq1GnYIJX6DHdA4u3Vkwa/VNs
	 xrIwV9v4kyT1A==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support detection
Date: Thu,  6 Oct 2022 18:35:19 +0100
Message-Id: <20221006173520.1785507-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_103613_037498_F57822D3 
X-CRM114-Status: GOOD (  20.58  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
This came up due to a report from Kevin @ kernel-ci, who had been
running a mixed configuration of GNU binutils and clang. Their compiler
was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.

Our current checks for extension support only cover the compiler, but it
appears to me that we need to check both the compiler & linker support
in case of "pot-luck" configurations that mix different versions of
LD,AS,CC etc.

Linker support does not seem possible to actually check, since the ISA
string is emitted into the object files - so I put in version checks for
that. The checks have gotten a bit ugly since 32 & 64 bit support need
to be checked independently but ahh well.

As I was going, I fell into the trap of there being duplicated checks
for CC support in both the Makefile and Kconfig, so as part of renaming
the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
symbol for Zihintpause appearing in .config.

I pushed out a version of this that specificly checked for assember
support for LKP to test & it looked /okay/ - but I did some more testing
today and realised that this is redudant & have since dropped the as
check.

I tested locally with a fair few different combinations, to try and
cover each of AS, LD, CC missing support for the extension.

The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
has:

> # Newer binutils versions default to ISA spec version 20191213 which moves some
> # instructions from the I extension to the Zicsr and Zifencei extensions.
> toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei

I'd like to also move that one to Kconfig rather than the Makefile so
that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
appear to be emitted into the object files it's not a fix and can be a
follow-on patch if my approach here is not entirely off-the-wall.

I am not 100% on the LD/LLD versions that I picked, I went off of a
`git branch -a --contains` of the first commits I found that with
mention of the extension. Please scream if I got it wrong, I'm not
overly familar with where to find this sort of info for the toolchains.

Thanks,
Conor.

Conor Dooley (2):
  riscv: fix detection of toolchain Zicbom support
  riscv: fix detection of toolchain Zihintpause support

 arch/riscv/Kconfig                      | 17 +++++++++++++----
 arch/riscv/Makefile                     |  6 ++----
 arch/riscv/include/asm/vdso/processor.h |  2 +-
 3 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
