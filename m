Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008E9C48BD6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 09:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C965A2080C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 09:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAt2+jGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C965A2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1fILQrpxDj9Q0d4AcHZ6BrbprceqjOm85Ova2rJLOo=; b=pAt2+jGUi/RbJW
	WCXluKguF6lb/0hOdEnAZB9W6ouONhHM1w/zXpx6hOzYkHwaNSqDHHpToYxIN3oe94wXL5sF2wUGe
	Q5pTbtsojpPTkKPIozq/j8XuJoR7HR+whaF4sxTQWkn57+U+SbRvRQ6esw0dm4lCycP8AIFlc+j/u
	1hCfQ0zUEsJJorZ37hY8Gknu6GEXvs+vqbxCn9/NbtkQ26csD1VJJmRODx9w/G6Z9sJp0dOUNOy7e
	1LWr5Nkf0UTjTClGGZoWPqQmNx62t+tHqTSCHMJ7M9MRU/hbp1gORjEKNDMi4yfdw+SGk07nU9IOG
	eIusNiJfxiiqzOlVlnAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgQHO-0007fA-11; Thu, 27 Jun 2019 09:01:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hgQHM-0007f0-SE; Thu, 27 Jun 2019 09:01:16 +0000
Date: Thu, 27 Jun 2019 02:01:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] MAINTAINERS: change the arch/riscv git tree to the new
 shared tree
Message-ID: <20190627090116.GB23838@infradead.org>
References: <20190613070721.8341-1-paul.walmsley@sifive.com>
 <20190613072518.GA1327@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613072518.GA1327@infradead.org>
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 13, 2019 at 12:25:18AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 13, 2019 at 12:07:21AM -0700, Paul Walmsley wrote:
> > Palmer, with Konstantin's gracious help, set up a shared kernel.org
> > git tree for arch/riscv patches going forward.  Change the MAINTAINERS
> > file accordingly.
> > 
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> 
> Should you be added to the maintainers?  Is Albert still around, as
> I see a lot of people Ccing him, but never getting an answer?

ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
