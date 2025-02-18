Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3E3C021A9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 04:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5GjNCfh00XWUeLiTpjK8o2mDrzksIiSnilTMeQ1T7Y=; b=JOtKcdYm8EAZU7
	RtB9h2wkzvfYNAeyyGaiQpQvOVGnPnR0VFgiC8zpfEASMRzZCHjhNHivhGiq+OsHXYekQZUY+imxn
	5UBAksSkxDyxFLLH1Klvd7d/MVWqemigkQfC5jTFfeQ8X0v5Ht2c7aiGxuFePWZcwau4HHyDH3RNX
	HzQ2gnoI774rXRWEhOHPM6b2WeTxKYZ/DQ3B8BYe2eteJPxurssnhInEvJDsEUFdpsIzwUA72hWyK
	jAlqo4qyUOswoSgHaPTOecQxOVTpk3++2PPDSTJHHMnqGsEK9PcRy1vOckMRODCbZ+qA0xPT+0/6x
	CB3ZNNDlW+zrCoGRfZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFDz-00000006krd-03gT;
	Tue, 18 Feb 2025 04:28:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkF6v-00000006jvZ-2xfR
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 04:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E347FA41D24;
	Tue, 18 Feb 2025 04:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4619DC4CEE2;
	Tue, 18 Feb 2025 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1739852488;
	bh=Y1WjWrYTI9mRHUBKbBcEKfoQLokHCNSELxid2QG5Cfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T1GPH2K9XHsElMReQc3f1esMMdNpUNC1G/+/KFFdRGdxzbdGY2Xrg72Sr2h0Z+UwC
	 6dLWVcuON2eB98DbKqWD5RiAdmf2HfZfcEaSgGuF3VP51kOPG4UhmBFlmlLmlmi+hl
	 v8Ix512h63FgzcNXc36TiQJP66GdEJFdjTUkMaGA=
Date: Mon, 17 Feb 2025 20:21:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linux Memory Management List
 <linux-mm@kvack.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 "T.J. Mercier" <tjmercier@google.com>, linux-riscv@lists.infradead.org
Subject: Re: mm/workingset.c:621 workingset_update_node() warn: unsigned
 '_x' is never less than zero.
Message-Id: <20250217202127.cf92afe2c0a89d5865e1811b@linux-foundation.org>
In-Reply-To: <202502160323.ZLUfooA0-lkp@intel.com>
References: <202502160323.ZLUfooA0-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_202129_822275_CEA8B3BF 
X-CRM114-Status: GOOD (  10.23  )
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

On Sun, 16 Feb 2025 03:56:06 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7ff71e6d923969d933e1ba7e0db857782d36cd19
> commit: 4715c6a753dccd15fd3a8928168f57e349205bd4 mm: cleanup WORKINGSET_NODES in workingset
> date:   9 months ago
> config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250216/202502160323.ZLUfooA0-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502160323.ZLUfooA0-lkp@intel.com/
> 
> New smatch warnings:
> mm/workingset.c:621 workingset_update_node() warn: unsigned '_x' is never less than zero.
> mm/workingset.c:746 shadow_lru_isolate() warn: unsigned '_x' is never less than zero.
> 
> Old smatch warnings:
> include/linux/mm.h:1306 virt_to_head_page() warn: unsigned '_x' is never less than zero.
> 
> vim +/_x +621 mm/workingset.c
> 
>    617	
>    618	void workingset_update_node(struct xa_node *node)
>    619	{
>    620		struct address_space *mapping;
>  > 621		struct page *page = virt_to_page(node);

We're seeing several reports like this.  It looks like the RISC-V
virt_to_page() (actualy __pa) implementation needs some attention.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
