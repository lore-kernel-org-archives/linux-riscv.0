Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3056EC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D3C2184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WBtP69aU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D3C2184A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCOt5UDv9Gz5gafj408qutc++oALrgq1zlr/TfLad10=; b=WBtP69aUbUs7jM
	sqrjiJT6KwHiuQV6j99aODVCzP04iJ0IS7bkfS/iUgbZBOaM7Sn5A6wzQe+WLDXWqAUQdvbAtJxTj
	T6VQ4Dsx5AhRIJ6Hgn/CNyTlPP/iZG9QrO134AoenoRAt4ICRuGU7FS6Egac0t72sykXn/ntIqwoC
	7uOGmiu+OK5lRXhZlYfSlfSRBR6+eLMUHi7d8IXv/EEZadtKnQaUzHVqIVG/yCyfmFwlrD4InCWs2
	R7K6QvV1z1LuhNBnM2mneZGysGTePQXgc4k2+B5MLKojS4f9pqzD20hzTO88OBEhigzFrFrioE4HI
	/S5KjjfxfD7pJ/QZKx7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSEZ-0002iA-4v; Tue, 12 Feb 2019 07:11:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtSEX-0002hv-Hg; Tue, 12 Feb 2019 07:11:57 +0000
Date: Mon, 11 Feb 2019 23:11:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/5] riscv: use pr_info and friends
Message-ID: <20190212071157.GI26747@infradead.org>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-3-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190118140308.9599-3-johan@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 03:03:05PM +0100, Johan Hovold wrote:
> Use the pr_info and pr_err macros instead of printk with explicit log
> levels.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
