Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C535C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 06:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF2C6208B6
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 06:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="laug0fk6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF2C6208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V7frrPLRSEHxYmiU8zOISp4CYwb97yzDCINbudC5Gjw=; b=laug0fk6J83y1aPzd9wnWGgkq
	2Zm6mIAbthD96CpVLJVnS5zC+eHFDN6hWWpgRXl8XMbTEC0jm44MTlm4f95Yf7/3YVbO7kHo8kR5z
	6aY1iZbNPVc43gaFn9LJ/vPucXu6z3vDqRsgo6yZsa8YpRYxmZrehf0LEtTGHIfDNFd5cnMLe3xhv
	x9ck4EnjLaZr2Q15GQlYGSV4f78zV1ey6QtzL2LHVazxX7uuwyv6LBvnxzeXLspeyps6sXg7ZnIBF
	bvg3LuMslB9l4q3yLSrOVf0ZTha5ZoFFAefIZzVwnMb7UcwaFFOBfrwrVdGo1Y1n+urtWgnFikbOx
	1dek0oHSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM4AE-0006O6-5V; Sat, 26 Sep 2020 06:58:34 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM4AB-0006NU-Ji
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 06:58:32 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D73068B02; Sat, 26 Sep 2020 08:58:29 +0200 (CEST)
Date: Sat, 26 Sep 2020 08:58:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: remove set_fs for riscv v2
Message-ID: <20200926065829.GA3954@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907055825.1917151-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_025831_770845_4B543B76 
X-CRM114-Status: GOOD (  18.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Can we get this series picked up either in Al's base.set_fs tree, or
a branch in the riscv tree?

On Mon, Sep 07, 2020 at 07:58:17AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series converts riscv to the new set_fs less world and is on top of this
> branch:
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=base.set_fs
> 
> The first four patches are general improvements and enablement for all nommu
> ports, and might make sense to merge through the above base branch.
> 
> Changes since v1:
>  - implement __get_user_fn and __put_user_fn for the UACCESS_MEMCPY case
>    and remove the small constant size optimizations in raw_copy_from_user
>    and raw_copy_to_user
>  - reshuffle the patch order a little
> 
> Diffstat
>  arch/riscv/Kconfig                   |    2 
>  arch/riscv/include/asm/thread_info.h |    6 -
>  arch/riscv/include/asm/uaccess.h     |  177 +++++++++++++++++------------------
>  arch/riscv/kernel/process.c          |    1 
>  arch/riscv/lib/Makefile              |    2 
>  include/asm-generic/uaccess.h        |  109 +++++++++++++--------
>  include/linux/uaccess.h              |    4 
>  7 files changed, 166 insertions(+), 135 deletions(-)
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
