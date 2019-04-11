Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33044C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 06:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039CC21841
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 06:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Se3wLDZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039CC21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDPEPQv8Sm232aIeHT6fWz1kBt7VXRNo/4CiK/WyLto=; b=Se3wLDZk+S4BTE
	1xdYjWneFOo7fTsr4H/ovFsH7jXS5zRfanaA66lh64qGZyzi4EPyt5ueJHWZA+1XF5TtFUNUXbRY2
	V5hBC5PDHj7rFEbaapEphVoQIRG4u9NzD/c9fRg3Yr7i/aas1CZDwice7oHOwlJObqM5ikI/5TkEy
	ymBSzKSh3gjPvWtTJ+RnE0+YOHgf5g0QjyU1S28v1k9BrPM/GUQXI8PH7GsZAeNrWNGfPSav+/tBK
	9Qjinw5sWjTyUSNiyCvHtTGx6F1VaKdXjG51mvwJoqruDgvHf+4YN3ltYTwEVZufuDynz8EssW3yJ
	FcGUpDu0NN+PbP7j12SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hETfu-0001to-QS; Thu, 11 Apr 2019 06:59:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hETfs-0001tA-Kl; Thu, 11 Apr 2019 06:59:04 +0000
Date: Wed, 10 Apr 2019 23:59:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 2/4] RISC-V: Fix of_get_cpu_node usage
Message-ID: <20190411065904.GC29422@infradead.org>
References: <20190410230443.15729-1-atish.patra@wdc.com>
 <20190410230443.15729-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410230443.15729-3-atish.patra@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 04:04:41PM -0700, Atish Patra wrote:
> of_get_cpu_node expects a logical cpu id not a hartid.

But only because you changed that with your patch 1, so it should
be folded into that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
