Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34848C5AE5E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E782086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bbr/1gvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E782086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJWQ1/sloa/j7yMPMaVFLcZiWdp3sSiASRcPlt+Dzq0=; b=bbr/1gvFsGzog5
	IZ2mvv7dP7SCmJ36oRjzuzKE7cDmn8UCtCqrxeSKEs/Ny8Sp1F8+yeel77zmd+na+1sbYe/fkXf7v
	TfkAeakn0EBpbtcjaellMfWe3B/nqcJwZWPrKwf0hPIv65dTxQB9OBmJsaqnhFXr4ZJQv0+O8aRfC
	1b2iJt8ZzRc1azCNraN5VCSb4LyTyfjGPihWg1THSzB9ilYLUAA7Hb8/6uRzoJqzyvv5arctYgLV9
	U2gz79PXop8MKiK2KfHBWNDhsmzfSFviPDYRHQOgBtHctB79QRzuj6DdHxuTZQEynGqrsqOF+i5MF
	xDLwReWLTbjFvcZkjyqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkfbl-000855-0f; Sat, 19 Jan 2019 01:39:37 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkfbh-00084Y-EW
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 01:39:35 +0000
Received: (qmail 9033 invoked by uid 1019); 19 Jan 2019 01:39:29 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 19 Jan 2019 01:39:29 -0000
Date: Sat, 19 Jan 2019 01:39:29 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/5] riscv: use pr_info and friends
In-Reply-To: <20190118140308.9599-3-johan@kernel.org>
Message-ID: <alpine.DEB.2.21.999.1901190139140.8813@utopia.booyaka.com>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-3-johan@kernel.org>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_173933_816792_4328EA49 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
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

On Fri, 18 Jan 2019, Johan Hovold wrote:

> Use the pr_info and pr_err macros instead of printk with explicit log
> levels.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
