Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0A2CDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTWqNQWLm7RLzXDk8+3mEJ89ofCPle1w6E1oqc3mvYM=; b=iFiA+qaWHjKdWL
	GmGFU4MTQowfvYru3bhu6eYl0OEi5vaiixb8Uz/deJcQMAjO94F/4RJdfawV7tj+Ctf55zn48iam7
	58P/mDrgyYP84ChGmLLJEynI5CXfRNyX9R2b29reynFq5EG4/e6buuKqlkP2clW8JqAL3DeJ7/8or
	DOWFFRSWAZ2skrmqVnLRnmgydrE4D4l8Xl3QfNA/F7SdZ+FlYQYZCw6Ix6sA2buCZlMCHvtgJ0yFz
	xqkvbch/n/bSqiY8ORny182SJjXVaA0TVSfH4CRAsaJ00imHjnB33eMtwqIt1jehd/8czpFRQDIj9
	CIjcEQ1JmsJEx/jLBI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoA6-00000009dFt-42TD;
	Thu, 25 Jun 2026 17:46:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoA5-00000009dCf-0H4n
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:46:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 241DE601D9;
	Thu, 25 Jun 2026 17:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E491F000E9;
	Thu, 25 Jun 2026 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782409607;
	bh=w23cGRwX5IS5ZlV/pHDg+qB9kyiLmObqHEcTd7CFGvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RSxNHB+I/jJ6qw68tDzeZ0HpNAd3bQ2HvGV3wH3O/18mgX+h/UtaOFhRITFT2osRC
	 bKNk25wjyIN9oA8t2OKZNunclmHovblhWWyNGeQ5r2bS1kaQ6A5b+FJDVYvH2nw1B8
	 WyLqeK5FbAakQaS9Btzgy5N63fGNOfKQyqeqLF7fWHY67Vo2UNgkHsWVHymAXwqqFB
	 TZZLUv+0sNz7RsuhoIwBBK3CNQIjyAd96R+8uC/EFUBZxCnAipbXNhXPH2vp3pMfpH
	 O4348o0IDW9aPKaBpoRfWe/hFsspmm5o7wksXQ3kRB2Bm+JhJv3xJGxSP83mJTZ61I
	 3fB30qhuvsirw==
Date: Thu, 25 Jun 2026 11:46:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
    Lufei Zheng <lufei.zheng@spacemit.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] riscv: Raise default NR_CPUS for 64BIT to 256
In-Reply-To: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
Message-ID: <825bb878-b5d8-7bdd-c5fe-744fc7f8e05c@kernel.org>
References: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
MIME-Version: 1.0
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

On Thu, 25 Jun 2026, Vivian Wang wrote:

> SpacemiT has already produced a 80-core RVA23 RISC-V server [1], and
> going further back, the dual-socket SG2042-based Sophgo Pisces has 128
> cores (although that had some issues achieving mainline support).
> Therefore, an NR_CPUS of 64 is not enough.
> 
> Raise default NR_CPUS to 256 for 64BIT (when !RISCV_SBI_V01, since very
> old firmware can't support more than 64 cores). The number was picked as
> a power of two that is at least double the known max. I believe this
> should be the right balance between not wasting too much memory and not
> having to touch this too often.
> 
> Ubuntu has already been shipping NR_CPUS=512 for riscv64. We have also
> been testing NR_CPUS=256 internally at ISCAS and found negligible
> performance impact and no ill effects.
> 
> Reported-by: Lufei Zheng <lufei.zheng@spacemit.com>
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1140651 # [1]
> Suggested-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
