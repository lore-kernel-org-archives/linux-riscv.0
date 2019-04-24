Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CFCC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA534218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVyBaL35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA534218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNJr1UdgZBDVdrMDlrpdjHJs9x4xoDz/ImKd6CRJZyw=; b=YVyBaL35InM4b4
	AV/J/CwEaUGSH0cir5NGhkdFUkZA++/fIh+79SAS+O7OIkOiuKZnJyC1pQdl7aJdFXzBsLT5PowXJ
	h5nSG01J0LNCQLS1ptfkrc4MPo0y0X5U6Uu4NyDYAcstcW1bh5MN4E2djEd+j9HVUNazXjIGzddmn
	/Nl2Be+z2tTdjH/YPOaHfvjsDWDOQjHVLaoNsQY8B1dhul1b5MIo2a5dfLe+ZiUZGsUFCBaFwUQUx
	3G0g1jNVcIx1RH7gRH87E1SiwhyZdtgMqSu6ouGdijwsaWVoqCbkmn0F6Vk41HkaVXRpxg25SuKzN
	cHTxIbFYPC+G5THX3cyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJBNa-0004On-8h; Wed, 24 Apr 2019 06:27:38 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJBNY-0004OP-AI; Wed, 24 Apr 2019 06:27:36 +0000
Date: Tue, 23 Apr 2019 23:27:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v3 1/3] RISC-V: Use tabs to align macro values in asm/csr.h
Message-ID: <20190424062736.GA10400@infradead.org>
References: <20190415093648.7525-1-anup.patel@wdc.com>
 <20190415093648.7525-2-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190415093648.7525-2-anup.patel@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 09:37:17AM +0000, Anup Patel wrote:
> The spacing between macro name and value is not consistent in
> asm/csr.h. This patch beautifies asm/csr.h by using tabs to align
> macro values instead of spaces.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
