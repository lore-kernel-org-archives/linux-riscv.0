Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9293DCD8C9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tE+Qs60nrH6xwkrdddJlGe79Ydh98S70zElDZ5LvxGA=; b=SvSdNC5aovK0n5
	mm+ndABxsmF5n7KPUmY7PY6xGViWNI3ZjKWriZSk5YmXpU3BVtRgStKz735CQLpwluSiEHdmPN99d
	9VF5qGi8v6/7AexGs8DYev4Z8whjtrQNEPnwn2g20/qx7HOmygwC78p4zbcqyIh/Eow+r1+DXL8Ci
	4jdHkbOWby8AKwS6GKuduRM6CHK5n2mXaeGxrOG9IL4bvPVClBFkYjtfDwuOMSFFSoIfjtMeNAPIT
	gjSxh8DTIVbmbWOAHlc7R0MMLM6QLS/Jdyw7qX3d0hhWWODCJi8zd93WnC9zuSVQcvF9ozz8yXrMz
	lqUWoBYwD+up+8vNkQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeRe-00000004FpQ-0ClN;
	Mon, 08 Jun 2026 18:11:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeRc-00000004Fol-1n1R
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 18:11:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7A20429D8;
	Mon,  8 Jun 2026 18:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72A61F00893;
	Mon,  8 Jun 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780942287;
	bh=AQgDSMpBoTHdyVultPXj49TQrqaMQSNiauOeQAfscRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcORRrIqKT2hBoZcq5HsV5hnaOhMpXfucPQbCPmjrmZmpwgyp7GSHb6vOg1dSSzva
	 csTnEzBdvCcLpKe/5yoOuZbYImYwzt32jAGuSnpgtDF/WQiF8R/6tlAGS7TLtsxC8q
	 mpdzQO/5guOFyCkbteqt5iLEla4+gH2vKi4yx351y8F30r0Oo/eW4zRyrqa+mGKc77
	 +JOPDoQc6dUF4JQZGRk06f7Vr9hnmpfha/8Uy8L+vX6buS2VMqp2KbQrZBvg+2Vky5
	 oTqgcqUcrqsB17qrqVYZl33pPCqjLd8zxivSrf9yxYaA5l1IsHSNRNqqEMxIsZiJ/3
	 O9GZnZq33ESOA==
Date: Mon, 8 Jun 2026 11:11:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v2] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <aicFzt2i3_D4cebS@thelio>
References: <CGME20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1@eucas1p1.samsung.com>
 <20260608074104.2198409-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608074104.2198409-1-m.szyprowski@samsung.com>
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

On Mon, Jun 08, 2026 at 09:41:04AM +0200, Marek Szyprowski wrote:
> Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> LicheePi4a board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - copile GPIO_PCA953X as a module
> v1:
> https://lore.kernel.org/all/20260603082132.3200787-1-m.szyprowski@samsung.com/
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
