Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB60BC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF08C20666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sc9xV1sd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF08C20666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/AreoEVLdLAo4fVvu55ZGyHakJAD9LCmMAigvGv8ig=; b=Sc9xV1sdThZW35
	h3j92ndfMnRep+/Ieamh8LejEZZbWq2fKPu7hVH15hIphzwysuAyV7ZUw7kzSO5r0FfZ1ttYJUjnk
	/+qyIxsqhvIIWiX8hXYo8Lxdo+3ebanid66utsAGuV5GNLTMFrxrFv1tWHYiv5fegsNVG0a6M3jAP
	p7H7FoukqanrtadSBh6G5H/Ft4UYLfxV/BUblQWdlvu0OIQU3ZIWRZoL8jy4kpM7GxKtypFHQAIBL
	wzgEKSQ00158/3nLyC6WxwwHEBOk8j2siQQYpeD0QCLt6ni7Amd/8ATgTj0z6ZgxgBzsde+uLWkld
	pbPhuhELyLJ/v9tIMSgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7M18-0002p4-AE; Tue, 02 Oct 2018 14:51:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g7M16-0002ok-EB; Tue, 02 Oct 2018 14:51:16 +0000
Date: Tue, 2 Oct 2018 07:51:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH v3 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
Message-ID: <20181002145116.GE3889@infradead.org>
References: <cover.1538470103.git.zongbox@gmail.com>
 <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 Vincent Chen <vincentc@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002145116.ylGgEgLSzpPQT3fA7FMHjQPcPKlRRq0PpfEVp3ek-BY@z>

On Tue, Oct 02, 2018 at 04:52:31PM +0800, Zong Li wrote:
> From: Vincent Chen <vincentc@andestech.com>
> 
> For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
> after AND with PAGE_MASK because the data type of PAGE_MASK is
> unsigned long. To fix this problem, the page alignment is done by
> subtracting the page offset instead of AND with PAGE_MASK.
> 
> Signed-off-by: Vincent Chen <vincentc@andestech.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

(and I'm pretty sure I reviewed this before..)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
