Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DA8C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE95820657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 14:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlM03N9e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE95820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXnFV1P/+FCpoEE7unKeDwiCxx6CGMw4aL/jRr6eaA4=; b=FlM03N9eKG8BKv
	23gdvd1Mcu+8nUvHyyVoLANbPIo65BcNX8Xn8GC6c6HJEuw8EBy+UjpvkKDVi0BMVYfRFU4Ou6T80
	vJk1E7u0M4WdIzwEaM6TCYqN4URES0PzO7ArNmnQ7EljkVUC7GSHTdBke9J0ckqEY+5Y1wAiXkFEG
	wwLlEoKcvdCcKk35dqJiGGuN2B/iXTBkw5ZBn785DcJr0+AGO7Mpdn/oGCwZYW/1kpqJm6OVieeDi
	n77/KKHCFOTPHPHW9onkP0aR9zEmc87eCZZ+H99oDtHoTvfd2vcOTLpjsIMrQcId58LnWkpNVEo5Z
	Wm+oc0F8VGIfZasRKCUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjPHE-0000wO-L9; Tue, 15 Jan 2019 14:01:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjPER-0005Sn-Ti; Tue, 15 Jan 2019 13:58:19 +0000
Date: Tue, 15 Jan 2019 05:58:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
Message-ID: <20190115135819.GK28946@infradead.org>
References: <20190109203911.7887-1-logang@deltatee.com>
 <20190109203911.7887-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190109203911.7887-2-logang@deltatee.com>
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
Cc: Rob Herring <robh@kernel.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 09, 2019 at 01:39:10PM -0700, Logan Gunthorpe wrote:
> Cleanup the open coded for_each_memblock() loop that is equivalent
> to the new memblocks_present() helper.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Probably no need to keep this in a series with the RISC-V code, this can
be queued up by the sh folks independently.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
