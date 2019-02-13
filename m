Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DF4C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 18:17:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA0821934
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 18:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3K51fiy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA0821934
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRPr+UeudjHba5/aE4g3WJ4BhUqLuHe3CMqb2r9a7qo=; b=G3K51fiy+3QbAd
	kn3n+NspA3g9LDVRMrynw/yniyN/DrMynDT2FWpOABZqzYeC1Oa7xilNdnqA3D4LKhQMoqQpUwjFs
	6JumDEeVNMcB1/sBUIi/4y/VPajR6Seu6MIQzR72L+ytXJXzdz6NlKzkPF0Z5R8HOcfoP7Jox03L3
	5lMrbZsUZ0HOyKMI10AwVGrRjG04Tqn1MSUaQ3v3FnrynXqEDSrLwvjFXxquRxTySfq9tYRgUQMJZ
	sJktXV+kxMxoEGPOVkByeVdJ7Sy7e3uiZR0vUVkiXnayo7eQlYlaYLmLRmBFVNxpL6o/nxZAa949r
	zCWYe22ehynsanuDuW4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtz5u-0001vN-OC; Wed, 13 Feb 2019 18:17:14 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtz5m-0001n9-OL; Wed, 13 Feb 2019 18:17:08 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 42D2D68C8E; Wed, 13 Feb 2019 19:17:05 +0100 (CET)
Date: Wed, 13 Feb 2019 19:17:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/12] mfd/sm501: depend on HAS_DMA
Message-ID: <20190213181705.GB19706@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-2-hch@lst.de> <20190213072931.GD1863@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213072931.GD1863@dell>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_101706_935873_A607AAFC 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 07:29:31AM +0000, Lee Jones wrote:
> I would normally have taken this, but I fear it will conflict with
> [PATCH 06/12].  For that reason, just take my:
> 
>   Acked-by: Lee Jones <lee.jones@linaro.org>

Yes, I'll need it for the later patches in the series.

Thanks for the review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
