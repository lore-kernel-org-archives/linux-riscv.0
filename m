Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054FCC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB645204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKwHXbaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB645204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7M1pb/foWOlxGaZCntsnEVExnnHZ6fVPNN5F/5UHuJc=; b=LKwHXbaq8xhmfD
	aUOmf9YuC59ge9vSoFewviPwdJT7V0Au1O6f1xDnRyF8vRug6viaELUXWHbe1Hchzsbq+dcyxaSg/
	ZOCP/lQs1EMxGtKHJmdxzi5hiUUZr7+WblyCP1SZxqVJ8t0iawvzw0ie4kf550l6tiDA3wSTGMe0d
	DR4vYZYaXT19824BNWHAvJwLwWeVGfqQ6yRYNXECL7ds/nDmgmUOrEemmEMAkPDgzYjf9yCN60arJ
	NKjBHossux7zTDmFvu/Xs8Qj8roN0Oyt3m2ra606zlhPX3DUscu8ZPP7ZsGZtD+IBxj5NeYHBvKzm
	cHjkqB6zcO+esb5gY/gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQbR-0007EY-I3; Tue, 15 Jan 2019 15:26:09 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQbP-0007EJ-EA; Tue, 15 Jan 2019 15:26:07 +0000
Date: Tue, 15 Jan 2019 07:26:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v4] RISC-V: defconfig: Enable Generic PCIE by default
Message-ID: <20190115152607.GA26443@infradead.org>
References: <20190112004117.28265-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190112004117.28265-1-alistair.francis@wdc.com>
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 12, 2019 at 12:41:26AM +0000, Alistair Francis wrote:
> Enable generic PCIe by default in the RISC-V defconfig, this allows us
> to use QEMU's PCIe support out of the box.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Alistair, is there a ready-made qemu machine with riscv + pcie?
That would be really useful for testing..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
