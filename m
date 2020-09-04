Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42854C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:25:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2E52065E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f6P6soid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2E52065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iLzFF5u0pkme2M1HY3L0ECDc+8HSFLbcsSwODKgBdfw=; b=f6P6soidJwFCamujFY3M/uGI0
	x3+ORVt+Kfppi9qaH4x+GyvGlF6IwLBqC4Lobd/uUQVEEhbOy78XwxqvS6tZpCTTAa0psB2ruAkY2
	mNsueRRouEFUSXTlcKajJ3qf+MQ6S6oVGLJSbl/goB5/AnjuDI3nIlJCtTdkeGB/Vq77vpKr9c6jR
	yuSFPBCKyaCYWp6aVyPH9Tix6VC54QsXJiWoqTkDtOMrATGuuZIqp2JYXvz8XFWdX794V3gd7Wtuj
	+wyJBAkBD1Ki1FiENifh54cuubFhBxiEr/OoM0sRpUrVOC8HF2LhsxGNyEOLKs9QLvzE0RhBYfQds
	9SXcYLTWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEWy-0001YZ-9B; Fri, 04 Sep 2020 16:25:40 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEWv-0001Wz-0A
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 16:25:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 84B6A68BEB; Fri,  4 Sep 2020 18:25:30 +0200 (CEST)
Date: Fri, 4 Sep 2020 18:25:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64
 for M-mode kernel
Message-ID: <20200904162530.GA32095@lst.de>
References: <20200904162121.279578-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904162121.279578-1-anup.patel@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_122537_176205_6F6A1BB0 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 09:51:21PM +0530, Anup Patel wrote:
> The TIME CSR is usually not present on most RISC-V systems so the
> M-mode firmware will emulate the TIME CSR for the S-mode (MMU) kernel
> whereas the M-mode (NoMMU) kernel will have to use MMIO clocksource.
> 
> Currently, the get_cycles() implementation in asm/timex.h does not
> consider the above fact so we provide alternate implementation of
> the get_cycles() for the M-mode (NoMMU) kernel which expects drivers
> to provide custom MMIO based read_cycles64() method.

Please just go back to the previous working version without all the
crazy indirections.

The whole timer and irq code has been turned into a giant maze of
indirections lately.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
