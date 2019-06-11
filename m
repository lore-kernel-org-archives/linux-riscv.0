Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CDCC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6E72145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKQmfxOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6E72145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lyYR8FkOr6MIw5oBGpu0s1vxZ3Yd9tJl4JErE5HcsU=; b=PKQmfxOQZA8rhv
	I+dHMtjrcasy8lgEuk/dTO9FUrTSPoW/5MzLK3KcMD+Vl+Tjl/XFTr0DAFjyCKUf+2Yk1N9Gq+hQA
	hOp9l3GSWfIdu8vHm7IqjRSmpr6mn5rfKway8ktxiRuS8lgkJqMQuiEjeTsBPvzZba2vF4aCnvwTK
	sGl5ScsZP+EoviHgEfErND/LAYY2L8beSvwMqdv94OoTfjeptxh9mW10a5ReCqLPGTJHP1SCFi1v4
	CdqUiTGXMIqalVTf5xrEOuCuU1Vcr7zKCKIheF7HJMZv1Cba0N13sqkWN5NLjonG2cLEDUdy5QOAq
	srqHNfhG8ADCKoJO9Ajg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadhj-0003yw-3o; Tue, 11 Jun 2019 10:08:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hadhP-0003ge-Cy
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 10:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E075D346;
 Tue, 11 Jun 2019 03:08:14 -0700 (PDT)
Received: from redmoon (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FAB53F557;
 Tue, 11 Jun 2019 03:09:56 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:08:11 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH v2] PCI: endpoint: Allocate enough space for fixed size BAR
Message-ID: <20190611100811.GB29976@redmoon>
References: <1558648079-13893-1-git-send-email-alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558648079-13893-1-git-send-email-alan.mikhak@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_030815_499599_BFE29EEC 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, May 23, 2019 at 02:47:59PM -0700, Alan Mikhak wrote:
> PCI endpoint test function code should honor the .bar_fixed_size parameter
> from underlying endpoint controller drivers or results may be unexpected.
> 
> In pci_epf_test_alloc_space(), check if BAR being used for test register
> space is a fixed size BAR. If so, allocate the required fixed size.
> 
> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-test.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to pci/endpoint for v5.3, thanks.

Lorenzo

> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 27806987e93b..7d41e6684b87 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -434,10 +434,16 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>  	int bar;
>  	enum pci_barno test_reg_bar = epf_test->test_reg_bar;
>  	const struct pci_epc_features *epc_features;
> +	size_t test_reg_size;
>  
>  	epc_features = epf_test->epc_features;
>  
> -	base = pci_epf_alloc_space(epf, sizeof(struct pci_epf_test_reg),
> +	if (epc_features->bar_fixed_size[test_reg_bar])
> +		test_reg_size = bar_size[test_reg_bar];
> +	else
> +		test_reg_size = sizeof(struct pci_epf_test_reg);
> +
> +	base = pci_epf_alloc_space(epf, test_reg_size,
>  				   test_reg_bar, epc_features->align);
>  	if (!base) {
>  		dev_err(dev, "Failed to allocated register space\n");
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
