Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D0C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4P4fmYR6uI6GZ0IIbvmP9YwkXY+gbLQ3SLf0h2Q41s=; b=AE/T/vnAIrUgUk
	qUJnn6kAx67hKCuwR+5BkcKX12ry3BFriskFo3XDWF4VrhuO5dHH2ZNWz8q7QrppYTUb08NaP9B8U
	pBNZ42VsylVn5nn9CynkGuVOPIAvOyTO/WkUTt+TOWX8D0aPVDF7XDeLAZDhtqQkoyMrsKkXJHAaz
	Lt1RYtqU4L6/bGJgBnE8trpKEPto5ywAT+6H2y7x/UlBOfCcViLeKSb9xn37aFPsoAWYNFJ1F08Ns
	1vgqWS0R7rVn8ICDjQCHzJTFNAirhcjaGMOaWh5++M4V0pfaFymxfTe1sYBaaFzm5c3aqYN6Iv4ee
	vDAk9weCii5L9aUZNUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsR8l-00000008ir4-0nXQ;
	Fri, 07 Aug 2026 20:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsR8j-00000008iqi-239O
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 20:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D007242E2E;
	Fri,  7 Aug 2026 20:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8ED11F000E9;
	Fri,  7 Aug 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134360;
	bh=Bc4gIRFzJfGmpp5me3HZhZ5+IwWmkc+ucXJ3MYUcjHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ctNjDXhE+PL3F22dX2Qr14z3v3823iHcSK7w0xo1rrPnIaNsSoNjxhUfZoU1aZyFo
	 UzNnS3p2xRGmCasGq5x4q/v+7dS3OvBtHoNV19jk8Yum+VJs+i/aqtn9a1Ac36EvN0
	 ez1HL8Th4fj8K+4dg/7wU8qKcZp2pm91MFaNaqA/azKGA2kwWpeGz/ImPjNbbPt2SJ
	 ZTJRPPoqKen+CTSqLWJMQ7X/Yo3/RjMLHRJNNPyzNCmi+TQoyEfDz/ljYC8F6Wd/EX
	 1A501XVuDo9KRXT0btzxuaEY3v5JX4o43dUk5dQF8JCOOZZA2m+ItqwHVq8pik1IVV
	 o7uK48e1Mb8oA==
From: Thomas Gleixner <tglx@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v3 06/19] irqchip/riscv-imsic: Compose MSI updates
 through the hierarchy
In-Reply-To: <20260807181713.228535-7-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
 <20260807181713.228535-7-andrew.jones@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:25:57 +0200
Message-ID: <878q6hekyy.ffs@fw13>
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

On Fri, Aug 07 2026 at 20:17, Andrew Jones wrote:
> imsic_irq_set_affinity() wrote the new IMSIC target straight to the

Wrote? When was that?

You are describing the current state/context, so this wants to be
'write' no?

> device via imsic_msi_update_msg(), bypassing the irqdomain hierarchy.
> That skips any intermediate IOMMU irqdomain sitting between IMSIC and

Otherwise 'skips' makes no sense either.

> the device, so a remapped device would keep the pre-remap physical
> address after every affinity change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
