Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031D4C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 14:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C1820652
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 14:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSu0HV3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C1820652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PS5LkSPTgxKZA/MfwNKU8apQK89mTxXl1EeiKc0RKI=; b=gSu0HV3Q+sTf2L
	aBVGltYjcew8ejswtQ3Lf5Rn7vxcOsEbImsYac/9NGnYNguVW8OHCgu3qF/1QYPANf+BSymerQtUJ
	DbLcRhejrhreLY58nL8K+pl/OSJ+NpYmHkRiNPb3EAYNv4eXx2rJ99NcIunJXzRD96YiMhaLaiVAV
	EeZ+xrR2Z33HBzm4QJ2hAEISZO1n6DK88ovK91eLMRihOAxIaFi8B+uQpQJ2uZCJTeo3iwUH3Bibz
	t1wHGpYlcyN3J+TCXCtqBrv892gRn682FKUJ+Mw9OZMiGH0U9F44FBAwsFZ7IsOTlQ5l07zWf5tGW
	3bcGNZlyhSiVPHyLxajQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g84Z6-0006dg-9c; Thu, 04 Oct 2018 14:25:20 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g84Yx-0005Ry-Po
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 14:25:18 +0000
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
 by ATCSQR.andestech.com with ESMTP id w94E8s5h059278
 for <linux-riscv@lists.infradead.org>; Thu, 4 Oct 2018 22:08:54 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w94E6k36057260;
 Thu, 4 Oct 2018 22:06:48 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 4 Oct 2018
 13:30:42 +0800
Date: Thu, 4 Oct 2018 13:30:42 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v7 0/5] riscv: Add support to no-FPU systems
Message-ID: <20181004053042.GA31734@andestech.com>
References: <1535332075-5727-1-git-send-email-alankao@andestech.com>
 <mhng-e6132f52-a57b-482e-8fed-03e3b6f0ee93@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e6132f52-a57b-482e-8fed-03e3b6f0ee93@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w94E6k36057260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_072512_129342_DADAC603 
X-CRM114-Status: GOOD (  14.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, Andrew Waterman <andrew@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, greentime@andestech.com, zong@andestech.com,
 Darius Rad <darius@bluespec.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, albert@sifive.com,
 linux-riscv@lists.infradead.org, nickhu@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004053042.iD2oRCRdWcc5NLOvbJ59x_8ntqvel1lpUiUuNzddByI@z>

On Thu, Sep 06, 2018 at 02:45:04AM -0700, Palmer Dabbelt wrote:
> On Sun, 26 Aug 2018 18:07:50 PDT (-0700), alankao@andestech.com wrote:
> >This patchset adds an option, CONFIG_FPU, to enable/disable floating-
> >point procedures.
> >
> >Kernel's new behavior will be as follows:
> >
> >* with CONFIG_FPU=y
> >  All FPU codes are reserved.  If no FPU is found during booting, a
> >  global flag will be set, and those functions will be bypassed with
> >  condition check to that flag.
> >
> >* with CONFIG_FPU=n
> >  No floating-point instructions in kernel and all related settings
> >  are excluded.
> >
> >Changes in v7:
> > - Remove "fd" attribute from KBUILD_CFLAGS.
> >
> >Changes in v6 (PATCH 0005 only):
> > - Make the flag checking neater.
> >
> >Changes in v5:
> > - Invert the polarity of checking flag from no_fpu to has_fpu.
> >
> >Changes in v4:
> > - Append a new patch to detect existence of FPU and followups.
> > - Add SPDX header to newly created fpu.S.
> > - Fix a build error, sorry for that.
> > - Fix wording, style, etc.
> >
> >Changes in v3:
> > - Refactor the whole patch into independent ones.
> >
> >Changes in v2:
> > - Various code cleanups and style fixes.
> >
> >
> >Alan Kao (5):
> >  Extract FPU context operations from entry.S
> >  Refactor FPU code in signal setup/return procedures
> >  Cleanup ISA string setting
> >  Allow to disable FPU support
> >  Auto-detect whether a FPU exists
> >
> > arch/riscv/Kconfig                 |   9 +++
> > arch/riscv/Makefile                |  19 +++---
> > arch/riscv/include/asm/switch_to.h |  12 +++-
> > arch/riscv/kernel/Makefile         |   1 +
> > arch/riscv/kernel/cpufeature.c     |   8 +++
> > arch/riscv/kernel/entry.S          |  87 -----------------------
> > arch/riscv/kernel/fpu.S            | 106 +++++++++++++++++++++++++++++
> > arch/riscv/kernel/process.c        |   6 +-
> > arch/riscv/kernel/signal.c         |  75 ++++++++++++--------
> > 9 files changed, 196 insertions(+), 127 deletions(-)
> > create mode 100644 arch/riscv/kernel/fpu.S
> 
> Thanks!  I'll add this to our for-next branch.

Any updates?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
