Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA53CC6B19
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGsUSLW4szXotPi7/j+K2TXMsHBmQ4n/6amoqPhpFWg=; b=ydJm3ckLB0bE1o
	qmyx+ZQEiZWS5pAIfsMM/vG/tguBtcycZjM7Yy/TuZResbl37ROaPiJfgpRa09zIJ55jm4CZHCKIZ
	/lv+1c0ZH0zGjoUzocTc3VST3xU6PztHyFvPgcHIU2Xi7rutxIV4X/7eTBIz7wUVW94g6qV30DVAD
	vdXmqrpvSclX2+k15mw4LxZ/0IR3ssM0+SGmBr97EP0B+hPYLmAN9iU1A0l18yj3kQn7T2CU+O1J8
	hH7gp7HflQ93M35VMIMv+h7YP75pArJ6Pa0/qu9a7biF92Iis6gsak1m5/h4M3QEVqRFwoXGdMhBD
	m0knslTWoIwLZknyXEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CbD-0000000H6Ep-2yOr;
	Thu, 02 Apr 2026 07:36:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CbB-0000000H6EN-3OQV
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 07:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OIoXTKZ+dmpo3ix24iVvbhvRgEH7wx4E6DmDpzMxfIQ=; b=OJaoChg/eM47m6dMT7ykUMurm3
	ljjCsqv47kAKXdFUmXF/yrWwo2V8QdoaSBmlxXUFJ8QT5zyPey9is70Laiiu8VLcru5S45iCNAkmU
	W6+mgTiyhbmf3TeqW3CNJ++QtNv8tycUwxSt5v2Q/JIgj1BayQXcrVe6eiVVmCCeakfOgXlbRcduP
	OHGClqcQOhuTYrVxQsz+WWltRlkSruhvJLFnmA4wn/5fr1MiEn1XYatVAvwZbijMWFivG8m/LZCE2
	E5NnIQ5jc5yPfHXbDvTz2HohtMEZHCmOFOXY02zet0OMyFGvZuVbaibmHSxc/hhG/u/iPzVtMw/CD
	f6zG6MdA==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cb8-0000000Bq72-3dwc
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 07:36:16 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A0DBA1A7158;
	Thu,  2 Apr 2026 09:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1775115369;
	bh=mqWV3JlY3aJsYMOVTGFTC7ckdC9nkLHFj2myWjU9Byg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEi2RUUyCAMWWB9Gsz8YvnhcVw3I5hwB2NV5rigwkJ/+yRO1P/7E/eR8igXqMfSAe
	 ibGReGFjxDZ/dVSEzNQLqpWEjfHeujCq+AWH5+Cw6a/7sySJjHS/BnqBWhQ9/QM27+
	 0ifdcl6Bj4ZL4ajQCgB3VMHXd2+aSxTuoi68gPj5UERqHw5okU5X6/i0zW3VH6K3Dj
	 hOmjyQFNZIs5sv+5gGQGuDtNClodIgUlOP3PmJJVsfkK8cdihuq5Qv6IcgN/uaSpaa
	 hvuSryrAzIjNSRPrcNXrruevbfBXplO+/sqiXAM1nkKkJNw0PmcITKaT0bKTzSba3d
	 HJUx5TBas7Ngg==
Date: Thu, 2 Apr 2026 09:36:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, 
	Palmer Dabbelt <palmer@rivosinc.com>, patches@lists.linux.dev, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] iommu/riscv: Remove overflows on the invalidation path
Message-ID: <necasbrohxayccg2jlgqjnmvwewlur2beiqf45hac5rc3xj6ww@6fmz3arzbbub>
References: <0-v1-0f76ffba5af6+11540-iommupt_inv_riscv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v1-0f76ffba5af6+11540-iommupt_inv_riscv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_083614_995471_0AB5C837 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 27, 2026 at 12:22:10PM -0300, Jason Gunthorpe wrote:
>  drivers/iommu/riscv/iommu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
