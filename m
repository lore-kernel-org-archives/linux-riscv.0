Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE25F8E4A4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 03:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCTJuZ4Fm23DWrdmmvM02WAVfnKqtJOKYaXPVnwdObs=; b=wPFjzBbm42PI1U
	LcUG2ERSNjpJeT3YcZFyRPomGkYYbU7ZTp2HSQ9pDsNs5VW7KPDirvVKOl6IUSTWfmZtFCUy1wdBF
	ongjPu58Qg77axIIVou2LgyHqu/fLuQ/Vi6q9+tDShG2Umk7Cswy9lv6++X1kRCmcM1nL4ZvxliwA
	lq7LIuJ1YB05LUmsil3EKDiO1ysPXaVaev6CanwwvMjnXnchynF0ECI4dKn6NObE/pU1IxRNmuS+C
	+UFpeazXnuIvAX7Kb1xb/Hjh/xDJmREh4lVFPIm3wVt3RMYYIMlfONh27lJ1J/oFrPMNS4bTlcKuz
	ZTKtqxWR7r/bKW58CI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZtV-00000003NMf-29TK;
	Fri, 17 Apr 2026 03:29:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZtU-00000003NMX-2nvU
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 03:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F4DE6012A;
	Fri, 17 Apr 2026 03:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D1EC19425;
	Fri, 17 Apr 2026 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776396563;
	bh=QMIbPVDPg3r2vcf7x8TXu0U64Ddj9Tpjm4r1WvLJOUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+cisOJLq4EVy4e9aPrA2hrNaCSo8yN93X1E+jMkUPpmo8yNnNTNQW+eMjnKdTNTi
	 odAd1gL31IJvstLBxC8NpelrX633Um5QuPcyMLgcXPz5CaN+3nq/Kih0UqdydXAJeg
	 Qxr6SOKtNegkXXZmuD0thp7UBK8a+BMcpLA3WQVNmeZ331h8oZpEuAKyzVbVe5j0LQ
	 Skh0qr7qYW2l/wNI5IWpoXf7avrHGSNomiLAxDlCVafVvVyExS/6Lr4Z/dgQBZCVqA
	 2JGlTTIBHnSEcBwE7nUk+iPle+O23k/F1LGFpOqW5rW5NsU14KT/dfypS/cq4+SdtF
	 3TvaVi5dH3r5w==
Date: Thu, 16 Apr 2026 20:29:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, yury.norov@gmail.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux@rasmusvillemoes.dk, arnd@arndb.de,
	cp0613@linux.alibaba.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arch/riscv: Add bitrev.h file to support rev8 and
 brev8
Message-ID: <20260417032917.GA4041922@ax162>
References: <20260415093827.2776328-1-ruanjinjie@huawei.com>
 <20260415093827.2776328-3-ruanjinjie@huawei.com>
 <20260416231441.GA12905@ax162>
 <aeF5Q2XauRKBDssy@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeF5Q2XauRKBDssy@yury>
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

On Thu, Apr 16, 2026 at 08:34:28PM -0400, Yury Norov wrote:
> On Thu, Apr 16, 2026 at 04:14:41PM -0700, Nathan Chancellor wrote:
> > Yury, are you intending to send this series to Linus in the 7.1 merge
> > window?
> 
> No, I'm already done with this merge window. This is the material for
> the next one, if ever.
> 
> Just as said, I added this one for testing. I am so far have no feedback
> from robots. But your report is enough to drop it.

The lore.kernel.org link came from KernelCI but it does not look like
they do bisecting to identify the commit and notify the authors. It was
just sent to the linux-next mailing list.

> > If not, it shouldn't be in -next at this point.
> 
> What for do we need -next, if not for early testing?

It is just for the two weeks of the merge window to ensure the tree
actually stabilizes. This is how it has always been.

  https://lore.kernel.org/linux-next/aeDrt2FkMD6ZWaVS@sirena.org.uk/
  https://lore.kernel.org/linux-next/ad9r3jEtJJNv0IiA@sirena.org.uk/

I think Mark meant to say 7.2 but still. Not trying to sound like a cop
or anything but the more problems there are in the tree, the harder it
is to triage new failures and perform additional testing.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
