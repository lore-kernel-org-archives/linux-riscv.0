Return-Path: <SRS0=pPdh=ZF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85045C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2019 13:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E33222D0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2019 13:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/2vfHaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E33222D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2MWMTRLHYnxEJzyQWqHi32pfe3d5icTtgDzjcXBn4A=; b=B/2vfHaQWJqa70
	D5NIbH65LDTnShuhD554bH4n7AN/kEFEr8gciVaoOPY2OuhWDTp65qz9W22sH5L6aQs2ilzXRtQJ/
	Z90uqONWzvGTbWGm0lwti+494QOo8Yfb6EXhGkaZFIiNtVP4OaXeMngWGOoRNZhXMOK65TM8RKDhM
	2Ym8sx+HFZzsNQOaos7NrRpa3Xys79E3R0F3y9AwDxqTfKI1uPNkXl2oCCNfxThlRcp6U/ZwEpP09
	O+F8mpFXnvIaTrib49+UARX3e1Z7IxsmEqukIZ7wrbHuBd05lOiRGWhWLarrtgkxLn75hDQfBH2fQ
	5mVIaBSEJczOCqcl/EVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUsXA-0008F9-Fb; Wed, 13 Nov 2019 13:18:08 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUsX7-0008BN-Fc
 for linux-riscv@lists.infradead.org; Wed, 13 Nov 2019 13:18:07 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 65B6A68BFE; Wed, 13 Nov 2019 14:18:02 +0100 (CET)
Date: Wed, 13 Nov 2019 14:18:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: RISC-V nommu support v6
Message-ID: <20191113131802.GA9996@lst.de>
References: <20191028121043.22934-1-hch@lst.de>
 <alpine.DEB.2.21.9999.1910301311240.6452@viisi.sifive.com>
 <20191111094729.GA11878@lst.de>
 <alpine.DEB.2.21.999.1911111702030.30304@utopia.booyaka.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.999.1911111702030.30304@utopia.booyaka.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_051805_669514_C25367C9 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2019 at 05:02:51PM +0000, Paul Walmsley wrote:
> Hi Christoph,
> 
> On Mon, 11 Nov 2019, Christoph Hellwig wrote:
> 
> > what is the status of this series?
> 
> At the moment I'm waiting for acks from other maintainers.

I think you should have all ACK now, the only ones missing were the
onces for the trivial search and replace in the time driver which
really is maintained by us anyway, but Thomas was so nice to take
a look.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
