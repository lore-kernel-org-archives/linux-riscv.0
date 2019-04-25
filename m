Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6136DC282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE96217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVjp6tdq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE96217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lHs67VSMa1CTLI5lk9ttNPrLqiYZb+kuVMUU1VOiSU=; b=rVjp6tdq6UlxMI
	/C53V7rozmV7dCdYLq691+KYs2ikR5g5ytUnb/vYl+xIsBn73Q5QwNh7P2IH7db4X4V1AaFJLvD3q
	K0dmBGMf6bLBj4e7m1qut4fxw3CbYrGNJOHc7LQ5kSCC0ycJ4tN26Xh93bvQ/KCaYoqHvD6GLo0Tn
	n/RCveiz8yFpDUmJgqo+foT5oYVqgZ4RpONeIqmMiH1mWiG5uWrMh6Oszj03YHlDhNp+OmmT5L6Qe
	El2jhJE7eH94CSC5IoAe7gWfOATWug61PiAujo8MY96BpuxQEy/9kgicKncCqRlnt1xSUSSdAqVUC
	/mmXXpnb3nZCEhOCu71A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZzY-0001sa-63; Thu, 25 Apr 2019 08:44:28 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJZzV-0001sJ-AE; Thu, 25 Apr 2019 08:44:25 +0000
Date: Thu, 25 Apr 2019 01:44:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 4/4] RISC-V: Fix minor checkpatch issues.
Message-ID: <20190425084425.GA7162@infradead.org>
References: <20190424214801.18880-1-atish.patra@wdc.com>
 <20190424214801.18880-5-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424214801.18880-5-atish.patra@wdc.com>
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 02:48:01PM -0700, Atish Patra wrote:
> While working on the patches, I found some minor checkpatch issues.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks fine,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
