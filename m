Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA2DC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uv+n5KMt/JCuXJ8YTjaMgsgurUb4Qcs694JmlgEreQ0=; b=21vdusFyAAEhgA
	fpWUua863OUqGfgN5YB0Y1p9XIjYwKN1g0TYomjY1b8WxZY1RT9FePmZgkj4X+l8ym6ki3gm3kd72
	4kB2u/s6v8n07O+lwi5g42Xz0xwRA3+MjOZuq9hytCE75+ydw20Q1MptUY8PJ5zIxR/qDm4qZ+n9b
	m8O+tpaaRMPdFJgd5mxHC1qZ1ugbWBqCGvpNJgAs1GbtjhrCQiUw037bE0raHKCkdMpLzquNz8NG0
	RUc3ODOishfyg1jceNgs2HLR02lhi9TDgPr+FpVon34INKvzzCR3K+mCxvsgiV2rchVsCMetltGM6
	IcqtyNl9bho/W5QB9xdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA0N-00000008tXV-2O9A;
	Wed, 29 Jul 2026 19:31:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA0M-00000008tXO-3Gze
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:31:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2414B43D11;
	Wed, 29 Jul 2026 19:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576151F000E9;
	Wed, 29 Jul 2026 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785353510;
	bh=KRg2cJitlohLdvtZRNP1kQ5PcKE3jaMDfptdu/E84dU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=BatAszgHFRvKI4T+XBd69pDfxldCOMhFxi5Me3LbZKEflqsbTkwH2PxZDT8rpGi3c
	 WshppbCjn9Id7m080JM7vQA01JZzYEU8m3SQ8+zpwy39hTgs8rpIThw/nHZqQvkeOW
	 aDFToGlbunDpP8ADvNWeNFfhlIXBMrIOk3QD5Vy6GmtHrdLwR7eejnBd0UW8N7FZoX
	 k4327s87rzgMvsqaV0NYHw26YDlHmB0hIy9/zwBCXDy6TGwtO4gGlvNx8Alxx5+old
	 okHu+gbfc4Yh1o8RBat3iLYkur59MNmiOAooLlrA9X4ditDelg2SyNguzn2pqKfzcU
	 D59hFbY+Z1Rvg==
Date: Wed, 29 Jul 2026 13:31:48 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: unaligned: stop using kthread for
 check_vector_unaligned_access()
In-Reply-To: <1c378963f27c5960e8a57c50b8b444d30954cb54.1781666867.git.namcao@linutronix.de>
Message-ID: <dd5ff254-fc7c-ddd2-751a-50e6971b10af@kernel.org>
References: <cover.1781666867.git.namcao@linutronix.de> <1c378963f27c5960e8a57c50b8b444d30954cb54.1781666867.git.namcao@linutronix.de>
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

Hi,

On Wed, 17 Jun 2026, Nam Cao wrote:

> A kthread is used to run check_vector_unaligned_access() to optimize boot
> time, allowing the kernel to continue booting without waiting for the
> unaligned vector speed probe to finish.
> 
> However, this asynchronous approach introduces several complications.
> First, the kthread may not complete before a user reads vDSO data,
> resulting in incorrect values. This was previously addressed by
> commit 5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for
> late-initialized keys at boot"), which added complex synchronization
> between the kthread and vDSO reads.
> 
> Second, it was discovered that the kthread may not finish before
> vec_check_unaligned_access_speed_all_cpus() (marked with __init) is freed,
> triggering a page fault.
> 
> These issues raise the question of whether the kthread is worth the added
> complexity. A past boot time regression report was actually unrelated to
> synchronous probing; it was caused by the probe running serially. Since
> switching to a parallel probe, no further complaints have been made.
> Furthermore, the unaligned scalar access speed probe takes the same amount
> of time, runs synchronously, and has caused no issues.
> 
> Testing shows no noticeable boot time slowdown when running the vector
> probe synchronously (0.464474s with kthread vs. 0.457991s without).
> 
> Remove the kthread usage and run the probe synchronously. This simplifies
> the boot flow and allows for the revert of commit 5d15d2ad36b0 ("riscv:
> hwprobe: Fix stale vDSO data for late-initialized keys at boot")
>
> Reported-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Closes: https://lore.kernel.org/linux-riscv/20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com/
> Fixes: a00e022be531 ("riscv: Annotate unaligned access init functions")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Thanks, will queue this for v7.3, but I think the Fixes: tag should point 
to e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe"), 
since the problems that you mention are due to the use of kthreads.  
So I'll plan to update this accordingly when it's queued.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
