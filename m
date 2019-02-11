Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDE9C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001C020818
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JCqIEWEI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001C020818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=JCqIEWEIO5WAqF
	iQBBtz9lrWiSzU9KRNaTZ4oWtrOEuUcJVMBfg9Ys2iK5vvv5d4b8942291iUMXY4MIUVI4aeQ+Uqe
	t1ICk2QX2jMj92h0uhhGrSX8KxV7pgU/WsalmBoYSF3MROPELooWQk+Ysub1Q+LbWAw5/WUEhmp71
	hp1gDGDBOiD/zyYhG+AfyxRJvBb+lOnggakR6Hzc4LD9nyvIhSpzlQuk62eeCCd1fkp4XQYkuIlB6
	YXkzviSPKY2hnAHSxXqg15shZZ5PKtSvT2mKVza4saBj0CFoVecyodk8lVqsAvBGmCphvknckQqn1
	O+WCJKl9UtVvnPFMqu7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt6tz-0004ja-LG; Mon, 11 Feb 2019 08:25:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gt6tx-0004jF-J6; Mon, 11 Feb 2019 08:25:17 +0000
Date: Mon, 11 Feb 2019 00:25:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] Revert "RISC-V: Make BSS section as the last section in
 vmlinux.lds.S"
Message-ID: <20190211082517.GB13103@infradead.org>
References: <20190208172819.944-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190208172819.944-1-palmer@sifive.com>
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
