Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0074FFD875E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjRPJjT02cC5x81WUcMmPs386SLIa9FhemnT9GCH0bk=; b=DhTS5nrj/uZNmw
	aYTTpqmO/yDb4ap1HFbOnWG4OxCJgCZXJLN/s2kxEqYfHB9oWgf1rRBMvHDBI/RSjvwj8H1A+EqZg
	MswG3EM2wG+RrGirVyk+GCsU7mu2mYZ+s80ChBXLz/pRkR8VV2/bHUYQO3y2ZR/fKUzM3XMVt3G6A
	JANFZX0ShhGrLpscotQengGILMwML/KeoJbOgd9iPSGq5zQjtenCuQuOBLutYPjk1uc0pJxRukj2n
	Y9B2DCWs1hAIKYoGeztMFvu4kv+mTLEb8SuXYVz2jyWJFnKSx2pfBNsviZlefJuP4OZAtI8aLQG5P
	0Datb+stZP+Qe5X2/Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TyX-00000006LAs-1gut;
	Tue, 17 Mar 2026 12:56:45 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TyU-00000006LAH-3Dpv
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 12:56:44 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 11F7A1A52C5;
	Tue, 17 Mar 2026 13:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773752199;
	bh=xgddnoxO/L3X9VmRAud6XcT+rSY9ASQ4eV1SCfp6rws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI2QUJbT/HfiPWFIB5L+EU/MQHMyiNqCvDd7OtjkB+kr3hdL99uPxeEWMm7KKpbR3
	 R8VIjmt1McriTuzUyuErBmJrAGW3zEfEAIGKLhX41pl9UhWm/7w3j2klDmIoj37f0t
	 0SutCjlf8vGWw5X7c1dXElub5IlyxeaMomsVCGvxU4PMkajkuPYoOGoiqYcLupsaFF
	 G9GWc0xhCc98iRad5zUCWf68LMJ8hgqnJM6ZlU4Mm+7Q8+d4RJLtOK+YbRjYHb5CMy
	 PiO2etV3mpI55F1WQemf2BP/7Z+wPbrXoVNsTpKHLGgeTkJH0o5aZpN8bQmRimTdJz
	 hgmNJgiGpZhxA==
Date: Tue, 17 Mar 2026 13:56:37 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@oss.qualcomm.com, baolu.lu@linux.intel.com, zong.li@sifive.com, guoren@kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] iommu/riscv: Stop polling when CQCSR reports an error
Message-ID: <cv3mzx2zvwyqy6v7vxouzzdjvf44thcfdm5u45g2zyb566tcf7@fx3n5m6w4ibs>
References: <20260227112640.20197-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227112640.20197-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_055643_026929_F6BDC972 
X-CRM114-Status: GOOD (  12.90  )
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

On Fri, Feb 27, 2026 at 07:26:40PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> The cmdq wait loop busy-polls the consumer index until it advances
> or the software timeout expires. If the IOMMU has already signaled
> a command queue failure in CQCSR, continuing to poll for progress is
> pointless.
> 
> Make riscv_iommu_queue_wait() also terminate the poll when any of these
> CQCSR error bits are observed.
> 
> This helps the caller return earlier in failure cases and avoids
> spinning until the full timeout interval when the hardware has already
> reported an error. On single-core systems in particular, the current
> busy-wait can delay servicing the command-timeout interrupt until the
> software timeout expires (90s by default).
> 
> Fixes: 856c0cfe5c5f ("iommu/riscv: Command and fault queue support")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
