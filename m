Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009FCCD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TUmGZoGY7iNApXrp6Lf6W/7h8+xUnsiK8QYrlgC1EE=; b=lXgWvhTwK9uBYi
	4WgcNUjsudENafCZzU8SpuoKx05reeqn2qeAto324am6n5C2EglVQp6MTa1JWjY57r+AD4fR7dpbt
	v4+eN2Ai/FXwn0+yhKdaulRqhoS1Z2YndJXN7Kv+qj1wF82funu/TbKz6dxJ0ytQzgE2aImDpQced
	DIzqSFZV60l9em349Sk0LOG10a6crvH5VS6lerB3QBkvFUaWZKtESWZx9f9ysKfo7Ispe9MyotgHb
	GcDUjQEB6Al/gDH0IWYuxQEWL/uPUbdhu1b99+IJXGXOzHVjz1l5o/nR+bj8IDXCdtIipgjzTxuoz
	4VyNZhZCnCXm4bTyoOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZ4n-0000000BF3N-1YcF;
	Sun, 03 May 2026 15:49:49 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZ4l-0000000BF2p-2auB
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 15:49:48 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 79A9541084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777823385; bh=eUBtAkliWo7i/sWVQgdPYh5z/4C4V+lwPevehSBP+nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XzNZnuWOaLrDGZPmdknv8VRbuHLT3VllHLzEnVWBPAk9UORi8sVvmJ3b+pFgJdn36
	 reK7NjyFWnX5GRYo6Pf9lBFBdSXzzrl6flyBP/5xMWWUo1/yLlJqRYulIV6jiB53ue
	 Cw4H3KQkuTw4QZbOVm1KMrjRDvVoSW60ZZdMpUlC8esU8JfT1+QzjA4BrsaiyRutHI
	 rOwAFZp44GoZifu/HtcWATteUeQU7VhxEOVxD0+lq5F93AkLt0FyGAwHz4xVMCGwKz
	 +2ZODrVjLQXSHcB/mFL6C0vNIVR4Q36uoKTaD4wSWn/m2GnpmiNRaPXcLrmtDgajUc
	 RNPkAbo0iteYw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 79A9541084;
	Sun,  3 May 2026 15:49:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre
 Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Date: Sun, 03 May 2026 09:49:41 -0600
Message-ID: <87lde0bii2.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_084947_678959_41437E55 
X-CRM114-Status: GOOD (  21.02  )
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This is basically the same patch series I sent during the merge
> window, rebased on the top of post 7.1-rc1 docs-next branch.
> It is tested both with and without O=DOCS.
>
> It contains just one extra trivial patch adding a missing SPDX
> header, and, on v4, I dropped two patches touching MAINTAINERS,
> as those aren't needed anymore.
>
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
>
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
>
> The output is a per-subsystem sorted (*) series of links shown as a
> list like this:
>
>     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
>     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
>     - Arm/Tesla Fsd Soc Support
>     ...
>     - Xfs Filesystem
>
> Please notice that the series is doing one logical change per patch.
> I could have merged some changes altogether, but I opted doing it
> in small steps to help reviews. If you prefer, feel free to merge
> maintainers_include changes on merge.
>
> There is one interesting side effect of this series: there is no
> need to add rst files containing profiles inside a TOC tree: Just
> creating the file anywhere inside Documentation and adding a P entry
> is enough. Adding them to a TOC won't hurt.

One thing I kind of dislike about these magic mechanisms is that we end
up with a single, essentially unsorted list of stuff that readers have
to go digging their way through.  It would be nice if we could somehow
apply a bit of structure; as the number of these handbooks grows, our
readers would appreciate it.

Oh well, one can always hope.  Meanwhile, this seems useful, I've
applied it.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
