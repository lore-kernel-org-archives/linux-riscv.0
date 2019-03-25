Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDCEC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 11:39:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C722085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 11:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cDae0mrC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C722085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHejAnG61An6a48Eyzqae93w1MOKuRrQeKfte+BliRY=; b=cDae0mrCbHFDOd
	12rGMkeELnd8oqny8fZ1xdaJmbXJrVNDpdzUnX/i14ddC3MzgLcGkYv7I0WmiZ95qrtMUYhH3Q0io
	u5sRxbGXFY6cMdMFTifE52y57A3kEAdUu/Po0lyq1amVrnbTJzQYwCMyl/JJy69Od7fJOHVo+6wZ/
	BG7lDUcRjWerHOea1+TYvwgiV/bwwJLL9iuy1/ph54K4PPr9Boi5i6PNN8USw01C5bWvpjr9PhDGo
	Hp6CZd1rxsh3G0iIEjnfx1eF2alTKlaeyZBuSyOObqBsj/OpiZr4C+AeMUqQBqUSQwSQ6WGmBogFh
	9faPpozOWUujnsrOPa7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Nx3-0000bP-9W; Mon, 25 Mar 2019 11:39:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h8Nx1-0000b1-MH; Mon, 25 Mar 2019 11:39:35 +0000
Date: Mon, 25 Mar 2019 04:39:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Message-ID: <20190325113935.GD27843@infradead.org>
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190325092234.5451-5-anup.patel@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I'm still not sold on this at all.  It is a lot more code, a lot harder
to read code and all for a very narrow corner case that isn't even
going to be enabled in default configs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
