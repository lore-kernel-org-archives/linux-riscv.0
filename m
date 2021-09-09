Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56BCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A267861158
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A267861158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRfrnW68KxTjf869ubSCDO3TJFXMI1fM3jWWM/LenEM=; b=PPWGXwdgyuFay8
	sBO45muV16ptWvAgG4POnD3TA4y/+FKZeKgQgjk3LkmRS4BDX4IN1EU5fiJBnmKeUpEPyWF5qsQpn
	W9SMPS7GqhWSnp6QXjW7OuoiqhGkiPjr3b2eYtiNNlrUedXpZBjtZs05YMYpaabnWLPnE4Q5rLam3
	Yi/3C3VgInV2K6lAqCRUz2Y6aCGzA6TGJHKorShoQoKWmW3oHN3tCjDiPq2AV/BPN6FreX8fdfKx7
	MeQE1LNqA4pjFSoV1bxbz32kaggVMz0Bk4wHVXehiphopBywwqcqXIjI5+Kc/YRa0dG7wXHfPev33
	/wAegONN4RZQMUHRMGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODNq-008KN1-GT; Thu, 09 Sep 2021 06:18:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mODNp-008KMt-03
 for linux-riscv@bombadil.infradead.org; Thu, 09 Sep 2021 06:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+rDn9niI6auN6DppWd/XkbmHQC+Jn0nMdhztebELsuk=; b=Oo0TzY1jbokYJR0ingKXUhlq6l
 UhWoACOhKO3V2VZGvwjL51JDFzJRPk+o+2nnaef6hBL+emIGtvU9NAN7yjygkSixKAeg7uUhf0MnB
 lU7P0lofWAlu5PdTtWalAJDMW+c3QttSNMxJam2jdRpi/UzDCZxU1PSi8if2fP53CvsBSk7G5NWKj
 HizrY6mokzKL/Oh14aB2oQzPvqfz0pgP+6jcdEzRiV9qOqBmA9cJ+IJzjSP5RRRdy0ToQHGW9elwI
 DVBQXxZKSGBTGg17K/fBWyTRlRkX8TQnU0yul+xHTQYhY+Aj8Pdn6FOkmOSZ/AL6CoOLhicL78A3s
 2dGRvgVw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mODNK-009XPU-0N; Thu, 09 Sep 2021 06:17:40 +0000
Date: Thu, 9 Sep 2021 07:17:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: Re: [RFC PATCH v8 13/21] riscv: Add support for kernel mode vector
Message-ID: <YTmm+ewo0WDHH9hF@infradead.org>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <e3d94eee049fe9f3b6597e21748efbb1d4eb81de.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3d94eee049fe9f3b6597e21748efbb1d4eb81de.1631121222.git.greentime.hu@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Sep 09, 2021 at 01:45:25AM +0800, Greentime Hu wrote:
> +obj-$(CONFIG_VECTOR)		+= kernel_mode_vector.o
> +riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
> +riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
> +riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
> +riscv-march-cflags-$(CONFIG_VECTOR)		:= $(riscv-march-cflags-y)v
> +CFLAGS_kernel_mode_vector.o	+= -march=$(riscv-march-cflags-y)

Do we need a helper in arch/riscv/Makefile to define the vector flags
instead of open coding them where used?  Also I think the variable
name should include vector in it.


> +EXPORT_SYMBOL(kernel_rvv_begin);

> +EXPORT_SYMBOL(kernel_rvv_end);

This needs to be EXPORT_SYMBOL_GPL just like x86 kernel_fpu_begin/end

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
