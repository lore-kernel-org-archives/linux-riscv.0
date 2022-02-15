Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C34BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFc4ShbJMW+QpXaUv4OLOv7NPeWhdGBspgk5xokuaPE=; b=eWLpP/sT8qcma+
	ZToGn/vFQxSxNHD2DDnYlk4nvD87YYqYhpt8bklDL7RNlo5+cXFyCsEaof+Su8d8Lm7zi7W0IqDgz
	iP0p49ICpVqxa7a6pFuZiwV5qc2WSt245MfsaLE1WYofJ4nIMC86nsNRDDEXf3y+l+DXAzvZRTCtE
	8xKNq94b5CiGI+NalMfoDluOfVZmEMkqigPYzuz5ir1q2SCw1O/3sMzxJ1MWU/st/y3m5UxQBPone
	5rHWDD9EJ2gPIXCQa8PnF4Duj4vqsss0NADbhz113wjv/+VG8dL6kgB3Ssu2SjAujKPYR0hvXn20u
	7SX7K8IQJ0yXSIwbd4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrtX-000yqv-Lj; Tue, 15 Feb 2022 07:05:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJrtK-000yjI-L4; Tue, 15 Feb 2022 07:04:50 +0000
Date: Mon, 14 Feb 2022 23:04:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
Message-ID: <YgtQkjRe7fbXI/lS@infradead.org>
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
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

> ===================================================================
> --- linux-macro.orig/arch/arm64/include/asm/Kbuild
> +++ linux-macro/arch/arm64/include/asm/Kbuild
> @@ -3,6 +3,7 @@ generic-y += early_ioremap.h
>  generic-y += mcs_spinlock.h
>  generic-y += qrwlock.h
>  generic-y += qspinlock.h
> +generic-y += parport.h

Instead of adding generic-y just ad a mandatory-y in
include/asm-generic/Kbuild.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
