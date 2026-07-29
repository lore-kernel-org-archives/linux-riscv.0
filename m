Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16AEC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O78mherC8MqR99kOzrynD9kxqJPoBOUYz8PXFbx3pBs=; b=2345Sv41u5+e7A
	KHfUei37uCc6wjm52DPf6CzVAUTIOAn89vHPGYUwEu46BSkwTFnU4qsqxEpV1sUsVx6Emw8gaxN4P
	od+qHEGlYfrEaR/EmhVd8MErC7FtwSdAWi3+Ovq4NoUoxpMDyRJtmX/wywMrXYS0y19wl17lDH16J
	xMdvPgVpGJrRP+xIERouBz1BZYv/EMDSqry2lP1lHhOl388Dsf10ghCQwui0nJcmJ4cBPKZsWVsqO
	wAI7uh9Mmsz2PRKTLorTFPSnw4unw1s3DTcjffEFPk3rNjJpJt/STkCO8doOhByrCWDD1Bppe1z5b
	uo3SiOrgzEdE8bQP9jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDqf-000000097qP-36sa;
	Wed, 29 Jul 2026 23:38:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDqe-000000097qI-1lWK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:38:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73690600AB;
	Wed, 29 Jul 2026 23:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE6F1F000E9;
	Wed, 29 Jul 2026 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785368283;
	bh=u9xcOYyj5phmRJPzaEv/I8lm138Rc/A4GM8k/KGPVS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=in4Vov9fnMLV1zpT0G6oI9H+ZAlcLjUTRer6Cnx9eF6jXe6KjRD20mn993P+DkzWT
	 Nnoo+16+WLw0tdA05Q1dmg/DtZQFp2jNV+2fO2ODHEnaIwHoTbosjia6iCG5465+zU
	 +AR7NIqep2m4Ro6alkB0hUHxxi+TXd2AHbA8YoDtZy9qZYz6OKQbvQuJzEjww1gB/l
	 DdsDYPkZYzY70/ZopVBucmKIenpCqD2PY/oR1E4NSbTwrMbcQKWbpnSu2M1dZKyqUt
	 E9irVXFvEvYpqEo4wtKrhXwxPL141ZVKoKK7VhWLnfRohAm601xl0nkZHtdGc13uTi
	 us/kxRvMLCU4Q==
Date: Wed, 29 Jul 2026 17:37:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Fix out-of-bounds page-table walk during
 memory hot-remove
In-Reply-To: <20260729012132.24882-1-kmehltretter@gmail.com>
Message-ID: <76fb929e-6289-cb5d-7dc0-c3bb17c759d2@kernel.org>
References: <20260729012132.24882-1-kmehltretter@gmail.com>
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

On Wed, 29 Jul 2026, Karl Mehltretter wrote:

> remove_pud_mapping() and remove_p4d_mapping() obtain a child table base
> with pud_offset(p4dp, 0) and p4d_offset(pgd, 0), then add the index for
> addr.
> 
> RISC-V folds page-table levels at runtime. When a level is folded, its
> offset helper returns the parent entry itself, but the index can still be
> nonzero. Adding it walks past the parent table. Sv48 folds P4D, while Sv39
> folds both P4D and PUD, so memory hot-remove can descend into unrelated
> memory and pass an invalid page to __free_pages(). This can trigger:
> 
>   kernel BUG at include/linux/mm.h:1810!
>   VM_BUG_ON_PAGE(page_ref_count(page) == 0)
>   arch_remove_memory+0x1e/0x5c
>   try_remove_memory+0x15e/0x200
>   remove_memory+0x24/0x3c
> 
> Only add the index when the corresponding page-table level is enabled,
> matching p4d_offset() and pud_offset().
> 
> Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
