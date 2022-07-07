Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F48CCA479
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzbbNDgRFaZnHow7JIY2e8uSZfkInaHTsob6zExjE8I=; b=CY1m6cDzL/FUZV
	oMbg8aTG+6c1yNuMO9BnQ/A2yIGn6KvWz/d7A4XY4k05uP6wR997Nlp9Peq+QJg44DtZvaVbNeECU
	LBOrINoJrgt26dwaHHBvquJRFUdJCwComKSnHnvBDXK9axlmY4CjeiXA1NR4/NKv/UZnHK3skZkAx
	wncodDwMtygnfzEM+X4ntle+WUyet9Gr3+UcMuSU3mrbzm0YVv8tpGzz5w0mb/r/y/zQF/YMSo65d
	NcYMUIDC4wCjCI24mmd2zZTkXLJoa0dpZEsv9GQeDlYwTdEtSyxt4UxcB57YXQK9OIVVFhwUtqtXn
	6Pc2s/nXuKJPN4EjzKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N4O-00FFHA-Ez; Thu, 07 Jul 2022 08:41:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N4M-00FFGV-6w
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 08:41:07 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9N4E-0005a2-Jj; Thu, 07 Jul 2022 10:40:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, rdunlap@infradead.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v7 3/4] riscv: Add support for non-coherent devices using zicbom extension
Date: Thu, 07 Jul 2022 10:40:57 +0200
Message-ID: <1729939.VLH7GnMWUR@diego>
In-Reply-To: <20220706231536.2041855-4-heiko@sntech.de>
References: <20220706231536.2041855-1-heiko@sntech.de> <20220706231536.2041855-4-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_014106_301620_26219ED6 
X-CRM114-Status: GOOD (  11.80  )
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

Am Donnerstag, 7. Juli 2022, 01:15:35 CEST schrieb Heiko Stuebner:
> The Zicbom ISA-extension was ratified in november 2021
> and introduces instructions for dcache invalidate, clean
> and flush operations.
> 
> Implement cache management operations for non-coherent devices
> based on them.
> 
> Of course not all cores will support this, so implement an
> alternative-based mechanism that replaces empty instructions
> with ones done around Zicbom instructions.
> 
> As discussed in previous versions, assume the platform
> being coherent by default so that non-coherent devices need
> to get marked accordingly by firmware.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>

Over in v6 Guo provided [0] a

Reviewed-by: Guo Ren <guoren@kernel.org>



[0] https://lore.kernel.org/r/CAJF2gTRN1J3edjbt5L9ELLtMzXKWUABQb=QxDA90uY7mj=O0rw@mail.gmail.com



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
