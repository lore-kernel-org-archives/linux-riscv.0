Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E2ECD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rACVTX7C9R3Xv++6RhwvVKiEI7FYepWSIPsEkmN3CM=; b=rq3+cXvCYvywY1
	7jvRFRsOP51xm+lMvNdX5/n8bLE4YAgpyD3Ooog8sgca5d75z62Jt1eGBBDBtxJ2VVBycxevVH1g6
	lXxydcxJP9j2BnSkjKc+xek4zeJB49KK8JiYUKazc7unClZ5RgHKnsuRHHbHtp5i9QJXV7wDgiqn0
	mtt+oUHCBB3RIk0u7kVgvA9K2wfASdVcGnyd7fFIS2es1IUrsinW+3hMhB8cynmnyrgGWZ+PW0d58
	RYUDH8JLvyvDg0OrXlS3VWMKUq71E1AzYBDiIEmzsSEOIYFXoAlP9GBrbxw/06Y/LXSUhwbsE7bF4
	aAwBo1tV/Httm9K9YpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPS0N-00000002qQy-1Mao;
	Tue, 19 May 2026 21:29:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPS0K-00000002qQe-1boq
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 21:29:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA62760216;
	Tue, 19 May 2026 21:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AAB1F000E9;
	Tue, 19 May 2026 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779226171;
	bh=QMXRh40IUVnxLmZE2+sDE7X3HgJoRTKsMswa14DX5pQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=mAtUme0zi7NDaYq//ogK4W36a1xFXE7ry5jtopm3g1sdUxa91DlMf5hiOeE2d1MlU
	 f19xEM9AgDqs6AymZJVBIIfdosKxeIJQKq/TEcYveT4xutY8dZB5Mgq063PTWfKaaR
	 jDJDSRA9gKp7oTfeKz5G7vmbpIBYS3TiOtRg05MUl7REwxsbyhhFhfbDAKwJY4WDif
	 waxbFFrN2nLBXrm2FCiiV0uCpEqU4Mxrzhkpp01y7rlFcSOFPknRogHaYkPDOklDnz
	 2ecVeXl1o+xYVBCoeLvrEOXLzUnb0eNx4eAv1SkIA5bpGVR/sQAm9nb0FzU/r0f25C
	 SAbCvRcn14n9Q==
Date: Tue, 19 May 2026 15:29:27 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Florian Schmaus <florian.schmaus@codasip.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Sean Chang <seanwascoding@gmail.com>, Miaoqian Lin <linmq006@gmail.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: module: Use generic cmp_int() instead of custom
 cmp_3way()
In-Reply-To: <20260512063231.708256-1-florian.schmaus@codasip.com>
Message-ID: <f0796b8a-ffc5-234e-bb9e-79e8deedf908@kernel.org>
References: <20260512063231.708256-1-florian.schmaus@codasip.com>
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

On Tue, 12 May 2026, Florian Schmaus wrote:

> The module-sections.c file defines a custom cmp_3way() macro to perform
> 3-way comparisons during relocation sorting.
> 
> Instead of maintaining our own implementation, use the generic
> cmp_int() macro provided by the already included <linux/sort.h>. This
> removes redundant code and relies on standard kernel interfaces.
> 
> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>

Thanks, queued for v7.2.  Looks like arm, arm64, and loongarch have the 
same problem.  Care to fix those too (in separate patches)?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
