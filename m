Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4555C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Cz7hLsWn/aFUScEzD+sAUBWjcreTWnaAKhyi9dHBiYA=; b=BNYlZZRvbMsKsTTNDyikygQCeT
	RI2hbJ0T5Q1KSiq6xM8bPYtts+dbka5MgRdgoqlVv/n1SmRWyr1kXqUl/ARrYGcZZmZrOBIADjVDA
	H0GJ1YPSBnev9/tM48Ed+YOPPewxF/n9oR56ObkONp3jnuvvS7KJphEHj9RfguCtnm7ve4wOTTEBp
	U6kMLZ6uyBwGTPYiifr+uL5Q8VjF6Pa3v6OoZSpZSaYkkPyiZTuKWh7MdcqDbwCJQ2AGkVqR77fe3
	HtkX+q/Ez9QnneY9pz/Pe5DtSyzk5zlo8mOgxij1GZEny/Wqa1BWOgrG4zCkAkYTmdgCJZ731MPW/
	JJBuF+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVLd2-002z4x-Hc; Fri, 18 Mar 2022 23:03:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVLcz-002z4W-7P
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 23:03:27 +0000
Received: by mail-pf1-x42c.google.com with SMTP id s11so10677705pfu.13
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 16:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8Zpa6Qn0bzd8YP1ZuPMntA/+ayBrlzlCpXYkVCdaiKU=;
 b=lwTx2u9mxjhFFttGNIW4v9CD3gMsG+yJQs74296XmAbfxNUPIBpb+RkaPuBQpUuVtM
 +Zi7dO8/oSrj/w9wvDjGAQ/zOgwS3foc8h/FgsydjVKAGhYSinqmdz6DM9fRHIUt1uu2
 enr/zbJSLWzOmeir8tuZsM3TKvHAkvUeI6/YNcC4CTKacIbR6Qy8fguyXS/ut0PXCWn+
 a22hD6zF4x/409TFt3JcQHinZ2LyZOAX44YIQxIcVRUcrSqjwy75ejjhdFC8zY4XE4vj
 aL1ixw5PcH3v0JIA1kATWFeRuxAfyAt5PwKZ1YDkJnyJJWzF4NKfbI14V+pWSSc6B2sJ
 0xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8Zpa6Qn0bzd8YP1ZuPMntA/+ayBrlzlCpXYkVCdaiKU=;
 b=IGb+mY2cnY+QccaUEv5kY4RIcpIOrQNEfDJmMNU7mlmroQOR/3LAsTm/C+BFyT/5C6
 OpwXMLx8A6nXSitOqjjCVvL9k45ZfNoNwIKP621BOkzA70VMGUduQTl11OYCvCtOYnH1
 oKiF09fftDjvxOFAuSRyaXaJKVdEov4H3o+C/BHRgp/nLv2XmAs7bTUBZHKEBq+7LtJ4
 bmYhrS9Q/TQyrfsI2RONSAemaRUPFf9abhn6F85wkMFk/nuHyGGyljSatE+L0z9f1RbL
 IKZxFDnujetYaEJ9mm49dkFf0ZE2ibwDH43Qn5WpbnSW9f3bwqlV6pf0V0hPnFziDJI0
 WkxQ==
X-Gm-Message-State: AOAM532Wzc/auOsI2ilPYU1201R+xGzAqW37N60H5JHWoUOCXJ9EQ8xM
 xcFxGB6bpMq0GVZ+MTpVC43xLQ==
X-Google-Smtp-Source: ABdhPJzTyOtIaU3T83y3+QXzkQdKotkP6sjxNfWhi0T4xgxDJMCLgozrffWdtNc/6m9EkGC1qUTEkQ==
X-Received: by 2002:a63:5c53:0:b0:381:309e:e72c with SMTP id
 n19-20020a635c53000000b00381309ee72cmr9675883pgm.40.1647644604180; 
 Fri, 18 Mar 2022 16:03:24 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k4-20020a17090a910400b001bd171c7fd4sm12684023pjo.25.2022.03.18.16.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 16:03:23 -0700 (PDT)
Date: Fri, 18 Mar 2022 16:03:23 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Mar 2022 16:03:21 PDT (-0700)
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing on
 some boards
In-Reply-To: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
CC: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, bhelgaas@google.com, robh@kernel.org,
 lorenzo.pieralisi@arm.com, 
 greentime.hu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 ben.dooks@codethink.co.uk
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-0c8e7e26-5480-4573-b7f6-27b09f06de59@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_160325_363601_B54B5247 
X-CRM114-Status: GOOD (  36.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Mar 2022 08:24:30 PDT (-0700), ben.dooks@codethink.co.uk wrote:
> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
> board without this fix (or having U-Boot explicitly start the PCIe via
> either boot-script or user command). The fix is to start the link at
> 2.5GT/s speeds and once the link is up then change the maximum speed back
> to the default.
>
> The U-Boot driver claims to set the link-speed to 2.5GT/s to get the probe
> to work (and U-Boot does print link up at 2.5GT/s) in the following code:
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c?id=v2022.01#L271
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --

A "--" triggers some mail handles to think the rest of this is a 
signature, git folks usually use a "---" to indicate a comment that 
shouldn't be part of what's eventually merged (like this changelog 
stuff).

> Note, this patch has had significant re-work since the previous 4
> sets, including trying to fix style, message, reliance on the U-Boot
> fix and the comments about usage of LINK_CAP and reserved fields.
> 
> v2:
> - fix issues with Gen1/2.5GTs
> - updated comment on the initial probe
> - run tests with both uninitialised and initialsed pcie from uboot
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 52 ++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 842b7202b96e..ecac0364178a 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -181,10 +181,60 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)

Is there an errata?  IIUC this will trigger the workaround on all 
FU740s, but from the description it seems like more of a board bug than 
a chip bug.  The distinction doesn't really matter, as there's only one 
board for this chip (and I'm assuming that'll always be the case), but 
if there's an errata (or any way this is documented) it might make 
things a bit easier to sort out if we end up with another similar 
chip/board.

Either way

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming you, or someone else, has tested this on the board?  I'm 
pretty sure I've got one lying around somewhere, but I don't regularly 
use it.  I can dust it off if nobody else has tried this, but happy to 
avoid the need to do so.

Thanks!

>  {
>  	struct device *dev = pci->dev;
>  	struct fu740_pcie *afp = dev_get_drvdata(dev);
> +	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	int ret;
> +	u32 orig, tmp;
> +
> +	/*
> +	 * Force 2.5GT/s when starting the link, due to some devices not
> +	 * probing at higher speeds. This happens with the PCIe switch
> +	 * on the Unmatched board when U-Boot has not initialised the PCIe.
> +	 * The fix in U-Boot is to force 2.5GT/s, which then gets cleared
> +	 * by the soft reset does by this driver.
> +	 */
> +
> +	dev_dbg(dev, "cap_exp at %x\n", cap_exp);
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	tmp = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCAP);
> +	orig = tmp & PCI_EXP_LNKCAP_SLS;
> +	tmp &= ~PCI_EXP_LNKCAP_SLS;
> +	tmp |= PCI_EXP_LNKCAP_SLS_2_5GB;
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCAP, tmp);
> 
>  	/* Enable LTSSM */
>  	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
> -	return 0;
> +
> +	ret = dw_pcie_wait_for_link(pci);
> +	if (ret) {
> +		dev_err(dev, "error: link did not start\n");
> +		goto err;
> +	}
> +
> +	tmp = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCAP);
> +	if ((tmp & PCI_EXP_LNKCAP_SLS) != orig) {
> +		dev_dbg(dev, "changing speed back to original\n");
> +
> +		tmp &= ~PCI_EXP_LNKCAP_SLS;
> +		tmp |= orig;
> +		dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCAP, tmp);
> +
> +		tmp = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
> +		tmp |= PORT_LOGIC_SPEED_CHANGE;
> +		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
> +
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret) {
> +			dev_err(dev, "error: link did not start at new speed\n");
> +			goto err;
> +		}
> +	}
> +
> +	ret = 0;
> +err:
> +	WARN_ON(ret);	/* we assume that errors will be very rare */

Maybe a message is better than a WARN_ON there?  Something users might 
be able to understand.

> +	dw_pcie_dbi_ro_wr_dis(pci);
> +	return ret;
>  }
> 
>  static int fu740_pcie_host_init(struct pcie_port *pp)
> --
> 2.35.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
