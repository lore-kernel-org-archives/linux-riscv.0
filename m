Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E7CC4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 07:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8400D61164
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 07:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8400D61164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ifjBpTnQoPc627ZlQ9mosProj6LcKeaRcfTNN7tAI4=; b=mHrZ/pkWyru7EJ
	4NGFhYviWpflO96kvXfgmw+odOyilnqzrNfG8FYPQ+zfYitQSBkxsUHSJ+3xhb3GRU15pE7v1DocN
	a54P+P0OUsJTfxtuhgIGJaE0Lma/JvhmppUfJ10k3Z5XCqB3FCswM8hs3HpZBfJlTulhwr59pabd9
	nLNPgQq4bd++43tPZXrOEKhb74M3iWLFF36TeFleDA7RJiq06feGTvQ695+FFbdi7c2U1gdJpRRIo
	OGS1lA/GXVAxRMm298X2K6e8WlTpwGRGaRICjZl+sWXT4clWHTgrI+J+JlS15AGpMHog5QvKl7VMw
	oZMjkdPqHXWjiDN6i7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvx3q-009gX7-3H; Wed, 23 Jun 2021 07:12:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvx3o-009gWz-Ko
 for linux-riscv@bombadil.infradead.org; Wed, 23 Jun 2021 07:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LjIbOik+tUzV2FAD2na1696gFXMGb7R+P+hDuHHFZOI=; b=JAZPOKEMwDPIg03f1aYgme25zA
 g9aQTjfMe07QbFC3mfhnrgbQlD/YUrJ38nUhvqx5RZQxUNLxFHUX1VD+YHbDEI0M0iMNJtuydIwqd
 GLisIytMEGBdipVxvGUj6Z3CqozBv8W5rX0fijltGRJHwMb2GP6sLaM35qj6d/18pBVi2cfV28tzQ
 s/U/cWaCk5fLB5Sn7Y+3ED2asMw91BZ7E5e5uQYkunpOzgmm8U1MHSifaCXFKH7TZnx6XliHz9zr+
 Qu4gM+hHyUyyLbQzr1Zg38NzDeSpz2B/XnurpGeEzZ32ijQG1BahdQRVJl5J+QpMb25u91sTI5oSH
 5kjUycFg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvx3B-00F8z9-5R; Wed, 23 Jun 2021 07:12:02 +0000
Date: Wed, 23 Jun 2021 08:11:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] riscv: Introduce set_kernel_memory helper
Message-ID: <YNLeuR9j5DE1zcLY@infradead.org>
References: <20210622082134.2404162-1-alex@ghiti.fr>
 <20210622082134.2404162-2-alex@ghiti.fr>
 <20210622225304.53d94c0b@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622225304.53d94c0b@xhacker>
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

On Tue, Jun 22, 2021 at 10:53:04PM +0800, Jisheng Zhang wrote:
> >  
> > +__always_inline int set_kernel_memory(char *startp, char *endp,
> 
> If __always_inline, can it be moved to set_memory.h?

Yes, __always_inline pretty much only makes sense as
"static __always_inline" anyway.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
