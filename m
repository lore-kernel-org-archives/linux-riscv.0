Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4234C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 18:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A214222D0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 18:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d0v5PHkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A214222D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtQSJkQI42jH4ThKMwJXLnak3y0UCwFSGjMjUAViwM8=; b=d0v5PHkQTclTY1
	9KBr0UKkBQKk6G9vGrlmoY5T40bMpdtab2hTqGM5ypIasdg3E/AexSWuIHBkbCoy5bn5EEWmupVA1
	/zr6qa8eZw98/VWWzunrvHtVPLmyAWp7ikE+mTiD/tZVcPbg0qQkXVJbmb6wCMqT6cq/5Y4rp6vNd
	baPRDjml7ahCrBr/qZVEo2UdyYEwkui9yukKRyyEpeAUXbaxbxkLoxgPKpYPpIGAPkrLG4EPSTx/3
	kc84FGDZrjEYGfoRhKXWlN/CgcgEKbff+GuFQT5/hudU+hQBXszmITAWC+WFe5wh9uERSrQ7WNJTH
	EqQok+/n6+DigCzdRecQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtzDB-0004Mz-Ah; Wed, 13 Feb 2019 18:24:45 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtzD2-0004BP-S6; Wed, 13 Feb 2019 18:24:38 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 76AFD68C8E; Wed, 13 Feb 2019 19:24:35 +0100 (CET)
Date: Wed, 13 Feb 2019 19:24:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
Message-ID: <20190213182435.GA19906@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
 <CAL_JsqL+LiJTF5kZz2hXGbQcH+D4U0jAQE376VSUVMQmdg=XFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL+LiJTF5kZz2hXGbQcH+D4U0jAQE376VSUVMQmdg=XFA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_102437_058650_AFD3CF34 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: linux-xtensa@linux-xtensa.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 SH-Linux <linux-sh@vger.kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-riscv@lists.infradead.org, arcml <linux-snps-arc@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 02:40:23PM -0600, Rob Herring wrote:
> > diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > index 3607fd2810e4..f8c66a9472a4 100644
> > --- a/drivers/of/Kconfig
> > +++ b/drivers/of/Kconfig
> > @@ -43,6 +43,7 @@ config OF_FLATTREE
> >
> >  config OF_EARLY_FLATTREE
> >         bool
> > +       select DMA_DECLARE_COHERENT
> 
> Is selecting DMA_DECLARE_COHERENT okay on UML? We run the unittests with UML.

No, that will fail with undefined references to memunmap.

I gues this needs to be

	select DMA_DECLARE_COHERENT if HAS_DMA

> Maybe we should just get rid of OF_RESERVED_MEM. If we support booting
> from DT, then it should always be enabled anyways.

Fine with me.  Do you want me to respin the series to just remove
it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
