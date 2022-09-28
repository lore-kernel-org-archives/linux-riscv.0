Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D4BC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy2M5hFaWWjY3AzVEEuRX291gYwqg0+aAanyuJYVYZI=; b=FFxrmxhRySjIMV
	kgcI14Slr4u/qwVhdRZ9QyHIbIxB/wU81MrXfsz6jKiEvPs9oOjyCkrHbZKkwnaKy2Wms+/bs3FpL
	lf+KRv9Sa65PImiEKtGGqOSBgu5bgUO7/CeMC4Q2Kt+AwcjmVmat38TP9zzJlmZ0DBme9l1JkxMTb
	SYAfFGRCgJQKIf/iKxpeLBsKd3W6Hv71Y4Hzi2PxnSzebWLUdhj5zGHT1GyMP9Gq0rWqTaEauaR+t
	lofMNJogYiZqPTowU2K7GUC5fo9KeOXJoEBetp+wj9ypvVdc8JzuL3U+7d/pcljs5Rp6zFUpKS4+O
	iJPxunzK/AvdziaNPq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVxR-00GAlV-1B; Wed, 28 Sep 2022 12:14:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVxO-00GAkC-MR; Wed, 28 Sep 2022 12:14:30 +0000
Date: Wed, 28 Sep 2022 05:14:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
	atishp@atishpatra.org, heiko@sntech.de, anup@brainfault.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	mchitale@ventanamicro.com
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
Message-ID: <YzQ6pqykLhJVeD2p@infradead.org>
References: <CAK9=C2WkqVgg58sKyDEMWue_vL8Pz7bCfERuaW_4DGnYTpcSMw@mail.gmail.com>
 <mhng-37586d5e-5576-448a-8d9c-4d277c252365@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-37586d5e-5576-448a-8d9c-4d277c252365@palmer-ri-x1c9>
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

On Thu, Sep 22, 2022 at 09:35:56AM -0700, Palmer Dabbelt wrote:
> Sorry I missed this, I thought it was just part of the rest of this patch
> set.  That said, I'm not actually sure this is a critical fix: sure it's a
> performance problem, and if some driver is expecting ioremap_cache() to go
> fast then possibly a pretty big one, but the only Svpmbt hardware that

More importantly nothing should be using ioremap_cache at all.  It is
an API that has long been deprecated in favor of memremap.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
