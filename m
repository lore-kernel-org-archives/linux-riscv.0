Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44465ECDE39
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 17:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193722083E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 17:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPDOtBum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193722083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNhpL2+rqeJJsiwzT6c5Qd3TnPzHdnlRUBQBHytdvzw=; b=gPDOtBum4x7WHh
	XrhBVZs5O3d8QmfA/PImXOj3/IMjGDtuTi/PqayHhL/m1JsLEM05ijQOgZkLU378Nx9/Q7MnpgMPN
	IJG3Hlp08zyWtKXz718SYRz5JMJZRAJRFzFrysNKNvdHmmNByfy8G4We90Ay+pKW2oxR3L43mACP5
	yMI9YzbFquwz+yXGHNBOi3YhSYoHRznz8C5W2uaDVobXAI9IqLTCCxw47OcXL8iUF3RKqiMxJZ2rC
	oHNxdGwCorDMowy8H0kTnljOEI/9O296e+2pLDTML0E4AuuKyV5W46bL5AhPW9R/JzM8hFJnA9Bwq
	W0xI7QjjMU6pEUFkZehg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCpPt-00039t-Pp; Wed, 17 Oct 2018 17:15:29 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gCpPs-00039l-P3; Wed, 17 Oct 2018 17:15:28 +0000
Date: Wed, 17 Oct 2018 10:15:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jim Wilson <jimw@sifive.com>
Subject: Re: [PATCH, v2] RISC-V: Add futex support.
Message-ID: <20181017171528.GA5834@infradead.org>
References: <20181016214259.12063-1-jimw@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181016214259.12063-1-jimw@sifive.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017171528.jdQ-9-pC70vsS4FMKNuhcD16504_3kr278FRbvBCjps@z>

On Tue, Oct 16, 2018 at 02:42:59PM -0700, Jim Wilson wrote:
> Updated as per sugestions from Christoph Hellwig. 

This tends to go under the ---, but I guess Palmer can just snip it
when applying.

> +/* Copyright (c) 2006  Ralf Baechle (ralf@linux-mips.org)
> + * Copyright (c) 2018  Jim Wilson (jimw@sifive.com)
> + */

Nipick: the /* should be on a line of its own.

Except for that this looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
