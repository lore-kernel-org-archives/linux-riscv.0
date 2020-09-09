Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612EBC2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952A62080C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="22cM+yhL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JF9xLeJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952A62080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiGO0SuWyCUAhMvDrGidcde2MzrUWjj5LthijK/nnlU=; b=22cM+yhLKM/hgFSmay3dlW4cr
	O2YWtCkHpBJptk3PLk7D6GT6ijjemyl4nWuqbJEBPDShilHb7ZugLtyzKM+lUDhZKsAT3QU4EEAS/
	Be9yiTrTIX6WBP8a4zlmOKAdInZ8ab1aVhMYNSf/0UyapsP91JUekqLQK2NEV3MPxqI+N5mDJi08Z
	CmAANuv2uUeJDkg0SjPhDGAm+ERgC63l+3vlOuFfBTe4MXc+G3yn9XnhZgdcrEuAhvJecPV1MqkTX
	DipciOmKGs7bvNOOjBCICWvF1CMTddroNnSJmwwuKZ4ZZh/RGhAZSPhdfydzoTsaEuf8k4S2pn2ci
	OvCV46TWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFtA4-0003UN-Gu; Wed, 09 Sep 2020 06:00:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFtA2-0003U9-7o
 for linux-riscv@merlin.infradead.org; Wed, 09 Sep 2020 06:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r6fCejwG0iL+7qa2R9K1o31Ku9WHMAs55cEybInLu9E=; b=JF9xLeJ05bJ4buQmwRppivJZg7
 hFBS727vORj6a1zw4y4aYHspScHg5i4VntwFdoGCQYpCZL1OyicDHWHvHZoy/G6ncasFwH7y8OIRT
 ghAVAt9dGdjfCqdV95OoxVE0Zz6SI55zoXXitO29keTsBQBTpDig9Iu0X8XTlC6iDHAFZJxuJnoTK
 tjqCXcUncL8T+FRE/4KZ2aH+JcimPgSzCvgsFvC3WCeO9Es1spYOg8RSKXorg9wkFExMJNhOy8Iqs
 YPrurd+4pJsFbPkX/3L/Uehh7dhZdXSvA1KdPrvKcX6KT1ontnkgZDbwbY5pMVjb/4eYukLmLbm6q
 rzbwh/Xw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFt9x-0003xX-H6; Wed, 09 Sep 2020 06:00:45 +0000
Date: Wed, 9 Sep 2020 07:00:45 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Message-ID: <20200909060045.GA13647@infradead.org>
References: <20200907061126.GA14999@infradead.org>
 <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, dkangude@cadence.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com,
 Christoph Hellwig <hch@infradead.org>, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, james.morse@arm.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2020 at 08:12:16PM -0700, Palmer Dabbelt wrote:
> I don't know enough about the block to know if the subtle difference in
> register names/offsets means.  They look properly jumbled up (ie, not just an
> offset), so maybe there's just different versions or that's the SiFive-specific
> part I had bouncing around my head?  Either way, it seems like one driver with
> some simple configuration could handle both of these -- either sticking the
> offsets in the DT (if they're going to be different everywhere) or by coming up
> with some version sort of thing (if there's a handful of these).

regmap can be used to handle non-uniform register layouts for the same
functionality.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
