Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B07D4A5E2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY7pZIwLgdGnml+KlrGtvfBjDaKcv9IbOi6fjDGaX/Q=; b=EYBQ/QXVbZFsBX
	AI9J4SDvgxZOG70ZVw0g3ucnfAiKyFELmhIBqKNAxb57xMydOfDHDyhEHjHMuQMxnpzk5QFavk/op
	jsx1BNz1KK05x73AIFsZ5U77DV33mfH9v8wep2VDgkxq16WicR0RB9DWuglKf2iFFZtN+jA3doTc/
	vobJcuER/8kUv2Ovj22bbywS0Ul8SwCUD3asSALn5+TzAJPEtXI/d4rr+ShKplE4pylf/GBV7D+vF
	E4AQKTiJqxlfX1Qvp6PEKKjeV6YNOM+OQKSHH8bxiZ6xj5Sb172zGzd/9JChCh986VUWqa648/k6b
	duVJ2J2U7urzRuSYGRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZUF-0000000DT8e-2oBX;
	Fri, 16 Jan 2026 02:22:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZUD-0000000DT8Y-4AyP
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F188960193;
	Fri, 16 Jan 2026 02:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B845FC116D0;
	Fri, 16 Jan 2026 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768530172;
	bh=TWHUtPL95MkRiG+v+nOoNJAuEBWRyynH8/ZewunoRlU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JCAlzKrYUleW8QYv0gHGTOyq0iGusgjtJwqGC0Q6JIjsbOAfxWbbcz1BZxfTWElhS
	 GDXIvbi4jT9pcTn+YqFAGlWpHng3FaxtljcVyRLTLvgECdg+rEYWKTu+z/nLGitKgQ
	 3DthycaqrMunmmyaQVl5JrVqpYHyZBjoL1WtAkzBo1U6/86aqiySIhk5TbfmvPl208
	 PpixjdsaxqFRnmt75oCTNmHS7ky2nd4iDkaFNMjXPzgzeMLIRD6eLDjb0XOXwvCwkm
	 AQ8uPXDYXemMvU91FLzuXcwOg0yMvxqfo8zIYSjfgnYe0PdbJREny6H3VncTNcg0Wk
	 IXmKXG6KwM7tA==
Date: Thu, 15 Jan 2026 19:22:48 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    =?ISO-8859-15?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Robin Murphy <robin.murphy@arm.com>, 
    Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
    Qasim Ijaz <qasdev00@gmail.com>, 
    Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH] iommu/riscv: Simplify maximum determination in
 riscv_iommu_init_check()
In-Reply-To: <d1a384c9-f154-4537-94d6-c3613f4167bc@web.de>
Message-ID: <d36377ae-97bf-a39e-a3e6-caa982dc29ac@kernel.org>
References: <d1a384c9-f154-4537-94d6-c3613f4167bc@web.de>
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

On Fri, 28 Feb 2025, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 28 Feb 2025 18:56:00 +0100
> 
> Reduce nested max() calls by a single max3() call in this
> function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, queued for v6.20.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
