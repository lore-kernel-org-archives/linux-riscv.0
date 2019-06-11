Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB4EC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9632089E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxFPRRSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9632089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVrKBlyUrRRCM4y7nutg1IIV0y3nw2k7wNDJtenhDMk=; b=GxFPRRSB29GYoX
	jWpuhRmDsgwZenE0HG9aJf6dD/8d5LNnEuiJ63L6sD9QiPXfmlIFIqDIXo1vBhT5gEjw+kQaNImFo
	nmawYPW0FqOx9qcdV06AvdXG+ZuNWkOW4P7W/imfGLJW3nWTwY8zg2yI4ZP0mPozbP8ToTsj8yLJJ
	tJU4urUwwYfpeeebu3j/TgYeCCPoFcAfq9lKJKZDCVYWcKk4ZNpHyidseANsPkeFETCKOVHQtFNVs
	FAx99kBDpmR2YDXSHbXAGOlIhGaZpMKyzkO37gsygShLRfvFVKZg98bqQd0gbotqZkCWrwIeNO3zS
	QYrTMdnA3L3OYtE8ABeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadhI-0003a5-GJ; Tue, 11 Jun 2019 10:08:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hadgy-0003G1-5S
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 10:07:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7D65337;
 Tue, 11 Jun 2019 03:07:47 -0700 (PDT)
Received: from redmoon (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0681F3F557;
 Tue, 11 Jun 2019 03:09:28 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:07:42 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH v2] PCI: endpoint: Set endpoint controller pointer to null
Message-ID: <20190611100742.GA29976@redmoon>
References: <1558647944-13816-1-git-send-email-alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558647944-13816-1-git-send-email-alan.mikhak@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_030748_272461_792A8E54 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: linux-pci@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 kishon@ti.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 23, 2019 at 02:45:44PM -0700, Alan Mikhak wrote:
> Set endpoint controller pointer to null in pci_epc_remove_epf()
> to avoid -EBUSY on subsequent call to pci_epc_add_epf().
> 
> Requires checking for null endpoint function pointer.
> 
> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
> ---
>  drivers/pci/endpoint/pci-epc-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to pci/endpoint for v5.3, thanks.

Lorenzo

> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index e4712a0f249c..2091508c1620 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -519,11 +519,12 @@ void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf)
>  {
>  	unsigned long flags;
>  
> -	if (!epc || IS_ERR(epc))
> +	if (!epc || IS_ERR(epc) || !epf)
>  		return;
>  
>  	spin_lock_irqsave(&epc->lock, flags);
>  	list_del(&epf->list);
> +	epf->epc = NULL;
>  	spin_unlock_irqrestore(&epc->lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_remove_epf);
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
