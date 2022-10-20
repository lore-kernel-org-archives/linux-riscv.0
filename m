Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8738C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApikUS0Cg+D960D7SWQGfPBMYWmxhq7PLGtpiXuQvTs=; b=Gr2Rv3oNP38WQp
	FiKRY3takJ1i46nJ2ZcqNtUG4EO15mUjg2mw5IjqcH+Uy0ZImviaqI2fE+jI97/4pkWDVFAuuCbFX
	/nGZLWIGPZkBT2ZHhxpztaK6LdEy4rLF27KYWoT3ETXle4KaneOKCOJTlgxnqC60pXtW2bAK63oNp
	V+SAKsP1c1wOiY5ucuGvDImVO82Rzi7wouoJh1iiRU1DBiDkkPASz5qe9+q4++CL5G/zORAkYrV7E
	ynOVMy4u1cF1yKTMLVJOdKypjovttlcLnl/xE7iaPb7xrR3b/IcwEuupkWnsXxzzLYd3rXu63RzI3
	j8KJX53E65yX5w6XbvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQql-00CB9c-Un; Thu, 20 Oct 2022 08:24:23 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQql-00CB9O-A9; Thu, 20 Oct 2022 08:24:23 +0000
Date: Thu, 20 Oct 2022 01:24:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/5] RISC-V: Add a syscall for HW probing
Message-ID: <Y1EFtxp2fdUvAU6T@infradead.org>
References: <20221013163551.6775-1-palmer@rivosinc.com>
 <20221013163551.6775-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013163551.6775-2-palmer@rivosinc.com>
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

probe is a very unfortunate name.  This doesn't probe anything, it
just reads out information.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
