Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0026C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD20208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhTr7kB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD20208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKeDd7w6MzpoYDrOrYRamhlen3cs/1vzrkdybVjmF+c=; b=uhTr7kB2ImB8qO
	7B8+L630mPxw3T5wgAx3KB/RGcXoQ/Z2mat26tsAttikvidKgxcw0be8Hnj7bPjdK5ixyDmGlDvjQ
	tNH5xVu2FclGof/XG6K17/GM0RIPNmkvBPLAkOGMGY1qhayFmw3sCp8PL2erL2jys5V9V03YzkYnH
	Iq39rgP1ZpkfwqM/oymoYi0+yQ/8CjcgJLEH6///THgtzTUMGlPU4ykHoMnRvaDOciDlhm6VZpR1D
	0brkM4yXroWRbA3qy6N0v48dwKxTrqJCEvbG0aEEqbjcQb7uD7ymW0vw1KDlvQ3v/wU1/ghBTLuoe
	DHih14c8iFBoCVQ7c5gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadi8-0004MM-QJ; Tue, 11 Jun 2019 10:09:00 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hadhw-0004CS-Ro
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 10:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 608CF337;
 Tue, 11 Jun 2019 03:08:48 -0700 (PDT)
Received: from redmoon (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3B353F557;
 Tue, 11 Jun 2019 03:10:29 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:08:45 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH v2] PCI: endpoint: Skip odd BAR when skipping 64bit BAR
Message-ID: <20190611100845.GC29976@redmoon>
References: <1558648540-14239-1-git-send-email-alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558648540-14239-1-git-send-email-alan.mikhak@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_030849_025663_A4089D29 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, May 23, 2019 at 02:55:40PM -0700, Alan Mikhak wrote:
> Always skip odd bar when skipping 64bit BARs in pci_epf_test_set_bar()
> and pci_epf_test_alloc_space().
> 
> Otherwise, pci_epf_test_set_bar() will call pci_epc_set_bar() on odd loop
> index when skipping reserved 64bit BAR. Moreover, pci_epf_test_alloc_space()
> will call pci_epf_alloc_space() on bind for odd loop index when BAR is 64bit
> but leaks on subsequent unbind by not calling pci_epf_free_space().
> 
> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-test.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)

Applied to pci/endpoint for v5.3, thanks.

Lorenzo

> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 27806987e93b..96156a537922 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -389,7 +389,7 @@ static void pci_epf_test_unbind(struct pci_epf *epf)
>  
>  static int pci_epf_test_set_bar(struct pci_epf *epf)
>  {
> -	int bar;
> +	int bar, add;
>  	int ret;
>  	struct pci_epf_bar *epf_bar;
>  	struct pci_epc *epc = epf->epc;
> @@ -400,8 +400,14 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
>  
>  	epc_features = epf_test->epc_features;
>  
> -	for (bar = BAR_0; bar <= BAR_5; bar++) {
> +	for (bar = BAR_0; bar <= BAR_5; bar += add) {
>  		epf_bar = &epf->bar[bar];
> +		/*
> +		 * pci_epc_set_bar() sets PCI_BASE_ADDRESS_MEM_TYPE_64
> +		 * if the specific implementation required a 64-bit BAR,
> +		 * even if we only requested a 32-bit BAR.
> +		 */
> +		add = (epf_bar->flags & PCI_BASE_ADDRESS_MEM_TYPE_64) ? 2 : 1;
>  
>  		if (!!(epc_features->reserved_bar & (1 << bar)))
>  			continue;
> @@ -413,13 +419,6 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
>  			if (bar == test_reg_bar)
>  				return ret;
>  		}
> -		/*
> -		 * pci_epc_set_bar() sets PCI_BASE_ADDRESS_MEM_TYPE_64
> -		 * if the specific implementation required a 64-bit BAR,
> -		 * even if we only requested a 32-bit BAR.
> -		 */
> -		if (epf_bar->flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
> -			bar++;
>  	}
>  
>  	return 0;
> @@ -431,7 +430,7 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>  	struct device *dev = &epf->dev;
>  	struct pci_epf_bar *epf_bar;
>  	void *base;
> -	int bar;
> +	int bar, add;
>  	enum pci_barno test_reg_bar = epf_test->test_reg_bar;
>  	const struct pci_epc_features *epc_features;
>  
> @@ -445,8 +444,10 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>  	}
>  	epf_test->reg[test_reg_bar] = base;
>  
> -	for (bar = BAR_0; bar <= BAR_5; bar++) {
> +	for (bar = BAR_0; bar <= BAR_5; bar += add) {
>  		epf_bar = &epf->bar[bar];
> +		add = (epf_bar->flags & PCI_BASE_ADDRESS_MEM_TYPE_64) ? 2 : 1;
> +
>  		if (bar == test_reg_bar)
>  			continue;
>  
> @@ -459,8 +460,6 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>  			dev_err(dev, "Failed to allocate space for BAR%d\n",
>  				bar);
>  		epf_test->reg[bar] = base;
> -		if (epf_bar->flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
> -			bar++;
>  	}
>  
>  	return 0;
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
