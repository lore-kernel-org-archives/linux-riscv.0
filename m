Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4506C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QgHia1IeEz3Kh/rc23d3dxanfZuaKhDzLIsfBZt0FA=; b=eMnM2QaDpvymxJ
	IFtihF1azZdmXNOYMVeMDFNJkSACt0jpwBd5qoiGFwlIeB6dvAebxNIqGOENR2BU6eFhIJ8hV2nJl
	HeFrpYsq/TUh7k0yn0ClrPbKUPtpM/Ikv2a8J8qQQyL6GNGNcQCt5suxXgizkANikwfqw5/NwT2aW
	IsFrOq4c7Cqb3Zr2Be2pa2XOig/q0mc90Z9mxCEVsmtVVO6iA70VySsPrINtlobGG+P2lwG+AfdpT
	xGerzhocf3EGwQgHjFYO+1khOb+yfFFASww0cS7GAIDrWIojdlhXBwhnJkxRgZ8cjvT27MyFGN6Mk
	G6zE/8RBmm/IwK7uE+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiogM-00000007EH3-3956;
	Sun, 12 Jul 2026 07:32:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiogJ-00000007EGf-422F
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 07:32:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8423f236418so1502378b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783841575; x=1784446375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYobm8dTP6JvcBfLyO1CnudZo9D607kvLt1hZ/YvyDM=;
        b=IoArD8X5B2ye2/OiWg+WNaDtQBjxx+ulvSEBQNLqvI24Bzy2Oy7e3fsGwy1DFcIrM6
         wvk3lndsO/SL14Cwzf3H4ZvaojJet095GwtqPKw8lVQa8rkFpSSuW9+wa/vq19aGj7Zn
         Ro9llXTQ6Z1xurZflgHaFfKV9M5uF+qGDhdzRqqURYXaACZD/WbjBpbc+DRDKrt0rkvE
         /Y2ht1N4X/r4RFPloMEF7dNVqv0eiAEMKsWoUQYalm5MF8ZF7GWfXvaO1wqI7aeGVPu3
         Zt1VASthFOioB90Z+x4VhpHsZlRHgsppdF19+JFeqsMtypZcB+IW7E8UKfoh0l1fCELq
         swyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841575; x=1784446375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYobm8dTP6JvcBfLyO1CnudZo9D607kvLt1hZ/YvyDM=;
        b=fYL5owVNEow6UCIw3BqX0k8G+oIymvmUwAeOo/WQmw0uPR9Lc8MHkclPXsuqmw/mi2
         DW/GDdcG/ghmmC+ikMl5NBJIBtFHu3Flk2vBGElRLzfxGQMvHnrx7pjI7BjMpDC2d/KZ
         hzXhbb/xs/gs8GOFRauoly3c7uO3RkPre5DXsyuBebD1U5lUnRqi/By1QrTa3rMKFBCY
         WoCBXuzunCdTm13Xh83AgKABFSRaGo8lYvABJap0qBODh43T9seRN6mIoeWLnfgCGm/W
         GMf7eSCiBICDD7vWAaE6juGZjgDfmr10EzvpuwGVIVqBah9y2oYsqq45tX62tAr1giWw
         jVTg==
X-Forwarded-Encrypted: i=1; AHgh+RqsXAnKnhXvnKsb9PxAL+sYj7rizaRv/5TM28xrTXbb7z0v5CVSYkY335QM7nZhl04PxCGIdzyrA67oGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIShdb82SoNdnx8nOziXIzaQVmswvjA93QFwgWpazNOF1OqNAZ
	cJvy3kFUMj9EXvf0Me7itEogw9aUMk/UoJpt7AZMpZIinK43LbouQDQK
X-Gm-Gg: AfdE7cmZrvA+WWiNvmw9shyFaMyI7g4USLZ9LlhQWBq2yBVqCPvzRlTfpwWrVcnOs3R
	hGj4+sWIe1DBOZBQ/sWSmNIPemFRvDfVRkJ3V3wcw/l6kTb4o7nb765LiIzxiWgH+2nv0XvlvVL
	69k4ic7Fkr8lKb1Nn90ULq73qgrrwel5EN77AijxR+5KMWWkS93AmHHWmhybctBFJ2u+0e0CZjB
	JQ4nVrujZ4CbclYri6kBHZszn9VG23iVrXRTLTfB+SmmSbB7TCfEt8EiT7PKRmNyMGZm1MHDOwB
	kLvyOoh6dWfV0V6IDuuv8vJzHpc/vF5dTI3UNlg5IuaJ/lvHuaRF3fu/NNlcwedqkKTgmxkX664
	FxTsjG2u+tsXzmSgSlFXtfvgw2/h7JsCO0bNO59ziTlF1cZsUE7+pEgYrDD4odTUS
X-Received: by 2002:a05:6a00:14ce:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-848895db925mr4637512b3a.3.1783841574926;
        Sun, 12 Jul 2026 00:32:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm12376839b3a.14.2026.07.12.00.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:32:54 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:32:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
Message-ID: <alNCYMQ0dh_Yt5av@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-4-inochiama@gmail.com>
 <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_003256_008762_F1EC5C35 
X-CRM114-Status: GOOD (  31.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2026 at 11:01:27AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > Both K1 and K3 needs to set vendor id and device id, add a helper function
> 
> s/needs/need/
> 
> > to simplify this.
> 
> I think someone might have commented on this, but I expected to find
> that the next patch would fill in the code that's needed to support
> K3, but that patch is at the end of your series.
> 
> The reason I say it here is that I wondered while looking at this
> one why it was needed to create this helper function.  I now know
> that k3_pcie_init() will call it (but I had to find that in the
> last patch, which was later than I expected).
> 
> Your series should start with DT binding changes, then code changes,
> and (often) end with DTS changes.
> 

There is another order, starts with the common change, then 
the specific logic for a specific driver. This is the order
of this patchset. For this patchset, starting with DT binding
changes makes the common part hard to be identified and taken.

> Anyway, this looks good.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index e22ecbd09579..31aac056b68e 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -56,6 +56,7 @@ struct k1_pcie_device_data {
> >   	const struct dw_pcie_ops *ops;
> >   	int (*parse_port)(struct k1_pcie *k1);
> >   	unsigned int max_phy_count;
> > +	unsigned int device_id;
> >   };
> >   struct k1_pcie {
> > @@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
> >   	dw_pcie_dbi_ro_wr_dis(pci);
> >   }
> > +static void k1_pcie_set_device_id(struct k1_pcie *k1)
> > +{
> > +	struct dw_pcie *pci = &k1->pci;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> >   static int k1_pcie_init(struct dw_pcie_rp *pp)
> >   {
> >   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > @@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
> >   		return ret;
> >   	/* Set the PCI vendor and device ID */
> > -	dw_pcie_dbi_ro_wr_en(pci);
> > -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
> > -	dw_pcie_dbi_ro_wr_dis(pci);
> > +	k1_pcie_set_device_id(k1);
> >   	/*
> >   	 * Start by asserting fundamental reset (drive PERST# low).  The
> > @@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.ops		= &k1_pcie_ops,
> >   	.parse_port	= k1_pcie_parse_port,
> >   	.max_phy_count	= 1,
> > +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
> >   };
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
