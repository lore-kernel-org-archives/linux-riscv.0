Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FBDC43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C602D20651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLsf9Oa1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C602D20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KFSZh8PkcuREa7kxR1dun7r9oBTcR6DQEFdHTVEEY4=; b=WLsf9Oa1zBgmGE
	urcarNuys6zyTnjBlt0L6CkxZbabBF0iQ9pv+R/Ov0Q5VSzCYnk3m6MhCp7qL2YlGtmEjpdyXrTnT
	mI6bXPAMZ92hBpdOoi6d9fLckvqFI7HsAScF7xwy236M7jyE+YGAKnQKKcfTuovaFieyLxYcSFClH
	UsIGMqgWcLlEMj9kFVzbOsjlnpErWRpO8EQCb7NAQjCibRXpGW3eYGIqBahwkan/tdN/S5er0y7f3
	6DxXx4b3uMI7HFSYy4wnB1Eb6dEhDEtNHA7SwjfmJKKVlKMPmeeHNjJMGntfSXGXyDzfrtZIMP0ql
	Wxzf3cHWHFHaovAPaJqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjP0l-0005nY-Jo; Tue, 15 Jan 2019 13:44:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjP0k-0005n9-DI; Tue, 15 Jan 2019 13:44:10 +0000
Date: Tue, 15 Jan 2019 05:44:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 2/5] RISC-V: Setup init_mm before parse_early_param()
Message-ID: <20190115134410.GC13216@infradead.org>
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-3-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190107161047.10516-3-anup@brainfault.org>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 07, 2019 at 09:40:44PM +0530, Anup Patel wrote:
> From: Anup Patel <anup.patel@wdc.com>
> 
> We should setup init_mm before doing parse_early_param()
> in setup_arch() to be consistent with setup_arch() of
> other architectures such as x86, ARM, and ARM64.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Is there any good inherent reason why the order matters?  Not that I
really care either way..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
