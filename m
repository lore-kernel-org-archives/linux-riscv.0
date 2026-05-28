Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D50CD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 00:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJT0mRPgmWHJ/sSj4TEA5ahdwUTfUwETBwi8yx32tV8=; b=Ldof7udzBbYqP5
	bNbw0ZjgJNbFImWjSP2F58ibVxfkxzutT4FTD2azy1olx+DlOZwCcmcbwg4/Vjc1D7pmtASnfKEW8
	0YGWqhVt7fOn9sucSVm0dFAFVZ2mZyKt7JgJXILQBuKCeH+Y2sY3k05PGTV+mzRXudoLMDtUzcUC7
	Gv/f1VSpsrVGZ3kHmdqNw5XYwUVhnDvUHbtDf00cdnQglG28MU1sfM8iXoqCYVWKxY86/SKBF70d8
	Hk+9ianiFO9/V42PJrPC/p9iAnVm00/2ny7lftzwvp37P+8YGwLawUIPdAhCB2y5vV0s0MlJZ7lbx
	PR99TB2UppQ8eQBstkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOTw-00000004r7J-0ndy;
	Thu, 28 May 2026 00:20:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOTt-00000004r7B-3nFc
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 00:20:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4019605C2;
	Thu, 28 May 2026 00:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABBD1F000E9;
	Thu, 28 May 2026 00:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779927612;
	bh=WwwxV04ucNWP/tbOhyJJVXjgJC8Fz+ra97PBKv7ZdNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Pfuxs5+8QC5Cq7qioyxBl1g5TmeXmzeGqR4deuf/Yr6m7fqHjyaeIey0DaiDws7da
	 aWaYz/Nv0zdxV+PGz4Lj1JMJGh9B7XynaBDexpV9wQZ7cCF/phi94iecTVICs9twjD
	 hrgYDLQTUfSvd4zpxc8sCPyzrhYjjYO3X3Ejr8Sbs8PeAYF2HIrzxzBYKPuxvE7E67
	 vIWBHYj6ZBAjVhbdVOtxhL9lgwbBPYJquBShSpjTI3JXPRviWbLtDx4vxs2TqFbWk1
	 4XW6/5fjouKi7vWFxL/HXfJZGEbtd5Kbt5p2fPQRK5JEyBcqDn6eE6xq6myJ1E/216
	 4A943bmfn+JyA==
Date: Wed, 27 May 2026 18:20:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, vincent.chen@sifive.com, 
    stable@vger.kernel.org
Subject: Re: [PATCH] riscv: kgdb: Fix a missing irq restore issue on an
 early-return path
In-Reply-To: <20260526113829.115007-1-hui.wang@canonical.com>
Message-ID: <994d9b89-b1d9-e642-0ef0-66a8cad538d5@kernel.org>
References: <20260526113829.115007-1-hui.wang@canonical.com>
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

On Tue, 26 May 2026, Hui Wang wrote:

> If kgdb_handle_exception() fails, the local_irq_restore() is not
> called and the function returns to the caller with interrupts still
> disabled. To fix it, add the missing irq restore here.
> 
> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Was this found using an LLM or some other static analysis tool?  If so, 
please add an Assisted-by: tag, according to the directions documented 
here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n637 

and here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst


- Paul




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
