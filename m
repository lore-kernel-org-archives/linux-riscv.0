Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31EDC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C3120657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HrCtH00F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C3120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPPoFg9iLMCrgp8Vw8irJps7D2RdWpnWqLXiJPeZTZc=; b=HrCtH00FqS3NWV
	OuqMfNC17eu0Iw4mJ66/CcO8zQtZqlZF+0vPSeoCQZRveGNWwWHMDw8rCBFj6+DMJVBjJnkZ5r9EX
	xk3R6mLKtjWATNEYPIzJUHHP3KHk5K2NFhd9IvnvJahz9qRazoxG1OrmjiRMvXF/POodyp915aDH/
	y+wPFUI++yqg220VI7DiCdIj6bCnVZboS9If4Isad8bPF2MjRQbRxIxpNnUYNpA2BNvOqAiVZfi0R
	LVUwupg9sza0tjDYURN6+sfMe+5tL5HVvO4XSdfBs7pxA0LwfDeeSZot+SVkGb8pCweGPGHjlzWZl
	KJWQ7Iqr8rJuY17KkeVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQpD-0006uK-96; Tue, 15 Jan 2019 15:40:23 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQoO-0005GD-1M; Tue, 15 Jan 2019 15:39:32 +0000
Date: Tue, 15 Jan 2019 07:39:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20190115153931.GF26443@infradead.org>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115083518.10149-2-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115083518.10149-2-bjorn.topel@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@sifive.com,
 daniel@iogearbox.net, davidlee@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hmm, while the RISC-V spec requires misaligned load/store support,
who says they are efficient?  Maybe add a little comment that says
on which cpus they are efficient.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
