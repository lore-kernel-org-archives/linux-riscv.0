Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2362AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FC320830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9nJirXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FC320830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZORBHi98mZ3uZc9fgYrPT9/T4T8EFJmq9USyldFJROk=; b=R9nJirXTVk4tCH
	P+/J98v0zstx4eW/ClvW2sHEr2kuhbL0Prmj55xoQSCIntL99xIrlx6XiRDLhRqN8njbpGWMJU+bC
	vtwvLXbdEfLjMDPynPaON9zZaSBS7Exje9J6lu4uA1HFpA1sVP/m/a2wYzQdWY/uX6IlQQWb52G/b
	sVYQBJhrdYa0CsmuQlMHWOkMV6OpCMyYmltnf9V9uXrSvQcf6YFPkZFvMXcfmLayinh3iWL1/mDf5
	YDozMsKOuHBQqOrpZgI9zYUWYUwChxDKr1zg21gyr8k+7FmjvKtTyYnvSStLORpS1sh5waJy8b+fX
	6gD2rx5YJ2EApPJ3lkkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kxA-0001iA-5C; Wed, 20 Mar 2019 23:49:00 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h6kx8-0001i1-UI; Wed, 20 Mar 2019 23:48:58 +0000
Date: Wed, 20 Mar 2019 16:48:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] irqchip: plic: Fix priority base offset
Message-ID: <20190320234858.GA5304@infradead.org>
References: <20190320223853.1209-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320223853.1209-1-alistair.francis@wdc.com>
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 10:39:52PM +0000, Alistair Francis wrote:
> According to the FU540 and E31 manuals the PLIC source priority
> address starts at an offset of 0x04 and not 0x00. To aviod confusion
> update the address and source offset to match the documentation. This
> causes no difference in functionality.

Well, it starts at 0x00, but the first one is reserved.  If you think
that is too confusing I'd rather throw in a comment explaining this
fact rather than making the calculating more complicated.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
