Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF77EC433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:07:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7EB619FB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7EB619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VFrnfYjbnML0nWyopfheAMjecI8OlK5CKNmrNZzKdLM=; b=NcISeOvYIWpDCpKFpeQjlFvkf
	TT/2k85ttW3/l3RNFSk4I22K+mFCIb5dMGBFG55oCvntrgZotf+NqUsneY5H2tsUXoLwdNx70LkEM
	Uiq1s/5pBCb9aSIdkcl5ExulLYCabpasdyOPoaCI8ka4mS30KQY/rTe5Ba/s6JS8amgc9jdRJ/Au2
	AGz5hk/ZwWuy+/LTPiRL5jnkdfDsY+koqcATG3QoWErse1MMg2dxtrXYsArCGaOVkvlrXEhhQHPOJ
	M9LAczKB1hJIs94E8s5GZBhkSdWJWVx9mnNSnDfbwh4WasteLedDiqeiG9WYdg+d4AodwV7Fup19n
	e9crIgMHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPmBF-003Zfh-1y; Fri, 26 Mar 2021 13:07:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPmB9-003Zes-Jw
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 13:07:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D771619FE;
 Fri, 26 Mar 2021 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616764025;
 bh=x/GK+JD94YsfoYZeLWzsM1EmTyqcxHwM2Vqefncnveg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2/avi/Dh7YzODTB0l8GLVG6HWTEO6Td7nimdFSaE8m2IP4Ww7V1d9XRlcZ+5srHU
 SSoFTb2WWt6KcygqmfmLm6M0dATs/gg5rTnRWBEcd+FOlegCq4ZcIJ20I3Qt+EUCVz
 +vrJwVPPFjY3al3MqmtVk5M775jZ3vmOJgeeJgtilzBGNhD6LjAKuTLP5vxhsmH9tS
 odXnB4EFjgTiKzmU2lM4+lhu7T4J3ggqPCeOJR5716JhyMVWNJY/POQV/Mfhn9zCkU
 rSBSPj9wTF2uNhp9YmAorCP66xMgPflfBKmp3RGWuxa0zUpXR2OGu544Trl/MghCl9
 oLUmbJkBNvL0g==
Date: Fri, 26 Mar 2021 06:07:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 0/3] Fix CONFIG_FUNCTION_TRACER with clang
Message-ID: <20210326130702.3yaz2vqwejnfnlq4@MSI.localdomain>
References: <20210325223807.2423265-1-nathan@kernel.org>
 <CA+icZUWgxmrtM=oj-aJi1KXxZx0YUZDiUPK42MjHvqS96aazYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+icZUWgxmrtM=oj-aJi1KXxZx0YUZDiUPK42MjHvqS96aazYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_130707_864562_E61578A5 
X-CRM114-Status: GOOD (  24.76  )
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

On Fri, Mar 26, 2021 at 09:37:55AM +0100, Sedat Dilek wrote:
> On Thu, Mar 25, 2021 at 11:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi all,
> >
> > This series fixes function tracing with clang.
> >
> > Patch 1 adjusts the mcount regex in scripts/recordmcount.pl to handle
> > the presence of PLT relocations, which happen with clang. Without this,
> > the mcount_loc section will not be created properly.
> >
> > Patch 2 adds a workaround for clang less than 13.0.0 in relation to the
> > mcount symbol name, which was "mcount" rather than "_mcount". This was
> > written as a separate patch so that it can be reverted when the minimum
> > clang version is bumped to clang 13.0.0.
> >
> > Patch 3 avoids a build error when -fpatchable-function-entry is not
> > available, which is the case with clang less than 13.0.0. This will make
> > dynamic ftrace unavailable but all of the other function tracing should
> > work due to the prescence of the previous patch.
> >
> > I am hoping this series can go in as fixes for 5.12, due to patch 3, but
> > if not, they can always be backported (patches 1 and 2 are already
> > marked for stable).
> >
> > This series has been build tested with gcc-8 through gcc-10 and clang-11
> > through clang-13 with defconfig and nommu_virt_defconfig plus
> > CONFIG_FTRACE=y and CONFIG_FUNCTION_TRACER=y then boot tested under
> > QEMU.
> >
> > Cheers,
> > Nathan
> >
> > Nathan Chancellor (3):
> >   scripts/recordmcount.pl: Fix RISC-V regex for clang
> >   riscv: Workaround mcount name prior to clang-13
> >   riscv: Select HAVE_DYNAMIC_FTRACE when -fpatchable-function-entry is
> >     available
> >
> 
> Does this only fixes stuff for clang + riscv?

Yes.

> If so, please put a label "riscv" also in the cover-letter.

Sure, my apologies for not doing that in the first place, I must have
been in a rush with the cover letter.

In my defense, I think the titles of my commit messages and the diffstat
below make that obvious without the tag :)

Cheers,
Nathan

> - Sedat -
> 
> >  arch/riscv/Kconfig              |  2 +-
> >  arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
> >  arch/riscv/kernel/mcount.S      | 10 +++++-----
> >  scripts/recordmcount.pl         |  2 +-
> >  4 files changed, 19 insertions(+), 9 deletions(-)
> >
> > --
> > 2.31.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
