Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7202DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4655D20657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aOLScp6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4655D20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDBshDISEgQEcGrS19h0YBbjhKhwqRHYP22ceefGkMI=; b=aOLScp6Hic2jFZ
	P8iDTR7xk/XEgkB9tYXsDAlIrPTuJM3fj7v/pubOAIG009KXM8n758ai/wPwfiVVPInBwbaTNyLyE
	BbsUHYuT+eldYOiSpClJUHbW4U6TS11gQnVr5LxkKs3hQjc69uYAQKnJwvn8LJEG1Xc89TtVgozD7
	3TVQVhlcSXDEVQlXe91P04nc8V1Vc0xxBm+940gPcrBkeN4aK3LxPVeJVkPG4CN6msIIuYrWJ9LRz
	ZfLYePtk0VXWzLcLhVORF1v6o+VES630rznhTUqev0nAbO39ALGdLKYn4QWFpYnQQpvC0MrN5oYxD
	SHucZxB47VF0Mmqmv8vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjPIQ-00022i-98; Tue, 15 Jan 2019 14:02:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjPFz-0006w0-1w; Tue, 15 Jan 2019 13:59:55 +0000
Date: Tue, 15 Jan 2019 05:59:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] tty/serial: use uart_console_write in the RISC-V SBL
 early console
Message-ID: <20190115135954.GM28946@infradead.org>
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
 <mvmbm4oehd5.fsf_-_@suse.de>
 <CAAhSdy3-SaP7RBbgx7kZgkkxeN2W-Ue8QDFXkOgFG5GiAg52-g@mail.gmail.com>
 <mvm7efcedop.fsf@suse.de>
 <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
 <mvmsgy0cu9g.fsf_-_@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmsgy0cu9g.fsf_-_@suse.de>
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 06:11:39PM +0100, Andreas Schwab wrote:
> This enables proper NLCR processing.
> 
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
