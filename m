Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF4BC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 14:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A298E208C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 14:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aF55+34p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A298E208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmORlcSb/oa7gRovGA/Jq80jhHZX0yf2G4/Yz0SHNUM=; b=aF55+34pYTTeD1
	7Kl4cjY+5b09D80LpNAjncafxrM0WczMz3YNIGt+mznS8Awv3Wj004pnw2oAAV/ARiMP57YutAaTo
	C0DRg0HXMWyrvPWoUlEoJXn1tsrVrKp4kpbZqt+X4k3AoK7C3LFEsB0sI5YTBkDrpCepxuMonuxj6
	hSH/P5OKew7ch0K9poy/m2KZyKN0jpL1/ALoFN5VHcSapF5WmvdqgCgScUmmlhspMITRWsyYxg5Cw
	j89DQBg4FlnHb801paIPSRTCyoQVekBElfDBCmZBUmj3N4WEKjhNYfBFq+riRB7Nu6RrxOo2wAQ/P
	tsxTxu5FLTpXfc8S+v2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxBnG-0003nt-1i; Mon, 12 Aug 2019 14:59:30 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxBnE-0003nb-EN; Mon, 12 Aug 2019 14:59:28 +0000
Date: Mon, 12 Aug 2019 07:59:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH 2/2] riscv: Make __fstate_clean() can work correctly.
Message-ID: <20190812145928.GE26897@infradead.org>
References: <1565251121-28490-1-git-send-email-vincent.chen@sifive.com>
 <1565251121-28490-3-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565251121-28490-3-git-send-email-vincent.chen@sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Maybe s/can //g in the subject?

> +	regs->sstatus = (regs->sstatus & ~(SR_FS)) | SR_FS_CLEAN;

No need for the inner braces here either.

Otherwise:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
