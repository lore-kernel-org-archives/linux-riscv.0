Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396EFC48BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038CB61151
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038CB61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgEd3pan5U0xZeKi8aSxL+jYl+VxP4et7dVjqenClFk=; b=TkoVDB9lHuLX1p
	7+EQsKuM3DZK6bVRxrvvynpIJpO69a8xjeXIbcrBaSwzkhUHKatQDYqAuynwn556JGK1rDugeQj9s
	VBNHDr4V72rU3FmhpNQ8935P38JLjmCgeqRTLG28Hm2TWfYq82RNwKEvK7TrTvkRqwuHRbBAVvPPv
	6nW/rqvqS80r9DxCtmCQo5R4Ez70r/RQeblFZlT1yf8LyL/Pn9bA0ZZtnYkSDl0dqQLfSPAG391fL
	gaYGYFTxQaaI4Lw4U0zTVZ6/nLvybyA2e9kTjPB4D33yufBOF46sJL4yFs7KCi5Ch/7BasYQ2twJP
	+3JrmzgQbOt4T0I4fZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKzW-003mop-NQ; Mon, 21 Jun 2021 14:33:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKzQ-003mnc-6o
 for linux-riscv@bombadil.infradead.org; Mon, 21 Jun 2021 14:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F3lPpurYTOvRvGy/EiNGokDSGvWu9C8CkAKgxWdkptM=; b=JRnJ3IO25Hmq7DYoX2Vbx5GJm/
 fDNcGjm1ieffO6U3KLc98dBSlQTRtTQ55x31pSFyxfAokhhQ7vE9nvyCIZq++aGdo5NHtr+n+2I0i
 R8FFBBgrXDEYyZ640A7gujeZp5dOrWbOEms1BoBpDdhou3eFSJr+UXl89qzJpgktHjV6NuMYOKJkt
 njOkvD7wY+nCYNleInQdLfRLXttQBOFxsd06kH/mBaLzcV+W8ptJj8LXokD4oLFFp76KSmBG2g46P
 DW/6g4w2xjDTU1InXc44QYx67lRJUR0CE6oARRzs4WBaAMxwRgSvs4UV3FBAtJE2e9XmGtsW7g0En
 RD3lS9WQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvKym-00DBQ8-RJ; Mon, 21 Jun 2021 14:33:08 +0000
Date: Mon, 21 Jun 2021 15:32:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: optimized memset
Message-ID: <YNCjEGQa1UMf2P+X@infradead.org>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617152754.17960-4-mcroce@linux.microsoft.com>
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

Looks nice, except IS_ENABLED would be useful here again, as well as
a placement in lib/.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
