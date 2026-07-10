Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD30C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqsT2A1NdQgOhOV954d9L47jlP1b2Vyd4qcctgiTh2U=; b=OK86mjNC6t+8pd
	5e3kBYKczCm3hSw7CTuJjJE4mtHkh0a7Dj3Cx3wJ2I0pnT2QncvKe6PNcA8RJoiMBUQDJNmD3ZBSb
	mpxfps2E1ZRcyrkCJf3l7PKVgXeEPaUpJXf4WXt79Xc60av5XvJ/oloPIAgWxErHGRMvoGROqeTUT
	UBlFdev0zIetBELHK4uIug8h25BdDqsRT2hXZuqqc1quC3ouv2/EZw3DHjZsrLbEyVLjKLYIxhXI9
	vPQcA3qA+FMkK7x4NbgT6/MRC+snBj3+Siv0y7n4F0+K/yZIYGhHybChk01h3NdEQ/O6/GRb+Joj4
	pZLBe/FnQRF67J+FnFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfk-00000005F8h-1FLD;
	Fri, 10 Jul 2026 16:01:52 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfh-00000005F5U-075M
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:51 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c2c8f43aaso8101811cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699308; x=1784304108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWNfOaNlHk0GiFu1v0JlG7D8WzjWj+a5Z4WDgZZuLZs=;
        b=ObDJd4n+yUxUNvAtMPRClb7oCYUIbNoxCo8+pyM1GbEywpNFrAddX6QuVmz7vyOoCt
         /G6zQwFCOrV3D3a3WrIQ+9qvHmXuCawiBIH/OG5KD366CZaae3wbwAMej0kSeFMJgG4F
         ie4uDOOVlXxCY1owHKarY9J39KjfVPW4wwruUBVESyx/8TiIO2kr7qRMKW2vqKjWNlwn
         Dq6+4rVVMSl62rlEjK8UX2RthGG/8XkzhAT/rOnbXVF+/IUaoQ3N2ZziklFYTKY/kKto
         KhUjF8te6hUrSmJe/yx7ZccLsUceDWo6l0iW1lc5txjPfQO1pz28mYE//rYeHvEHbFG0
         HnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699308; x=1784304108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWNfOaNlHk0GiFu1v0JlG7D8WzjWj+a5Z4WDgZZuLZs=;
        b=dBZZzXBtcxO7HXLLSEpF6DNtDtpGR9Heu4YeScmoywyH5ohjyaW2yIpwLvceYELBvJ
         sF4opa907Ddj6gdIAjndn7ftV+uoze/gCsqf83HfzWIcKaASe3ft7+9L/hnuYQD37g9D
         NbT2HVudZzM5TjCb/I/JR4vMkqNTfbiWvvqd16w+9lWbQcXcCKd1A/XtXxc7ta0rQEhm
         4Kb+fqVvwJgc6q3T0c6bQDKHN7ROuIZ3mHV9PQonbi0krLa6rsLe+Xrnc9fqVx2hEHZt
         35Mi/8PFfXCTH09tvmnFVhweJhy/80olIwR4DIqLpoVWIm6+OYM7LBLcXwGTOab6hJIQ
         sewg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1D9Mh/Q0r0Q5208sGIhofjvojvWaGnUdNhd1GwoNn9mjIB6KZB0jcke4ukztf908/ZHAXRkLD/w3DPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfOc520TpGVm7ewP1EHaKfTs6s8EqL5ic0WZdqZYWEpsCl4aa4
	kpc8DS2VpfyOE/nPFm7lwX7CvnmpZgrzmqdy0N7EY3TtLFYvaTCCKfUfDlFxiQKhUu8=
X-Gm-Gg: AfdE7cnsEYjXi/Vi9tClY+KlJl7g7eaIZkmIPeNJqZSJngqIAinskBeq6FZZLCMDRnf
	LkH02v1qZozo8gk/2jLcf9GCnF1FAAItChzzEA8JROlRIg3vbhqRUxJDO+9WUU0YKdQqv/xUEDZ
	b4o0Bgkofn/zgdvRoKnjBTuFToYfZnlFlYKXjnmAKd/JINb/Nk4p/ePHNPN11VbwRbVcEHEH5Zi
	L7TErVAqo43/+W+T/7feNFC6T1T3o4xF6JpYOPbmMImCiBWdacBtjSWeb0A2t/PEAS/SkB7s4tP
	WbKnLiXh+PQ3Gj3Qown9au9Ar93VdyoQAff9gRjIbVyWABq/ZsQthThfr8BJDFq3q6u6hprwQSB
	Nn1nTvuXVB0vJfafoH2rUHb4UZ8rda5c9b9PfwSYhg1uQt0QIpcnKdJSWhyP8g3OYylZitYM9om
	kHxHsxAK8T5i2x
X-Received: by 2002:a05:622a:1aa5:b0:51c:7b12:5fff with SMTP id d75a77b69052e-51c8b57c8e8mr126511541cf.75.1783699306855;
        Fri, 10 Jul 2026 09:01:46 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm18644921cf.22.2026.07.10.09.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:46 -0700 (PDT)
Message-ID: <900e6239-bc00-46b6-aa9f-abe219c039d2@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-7-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090149_683381_5E845FA5 
X-CRM114-Status: GOOD (  51.66  )
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

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> DesignWare PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple PHYs at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.

I think it would be good to summarize how the K3 differs from
the K1 here as well, since they're sharing code.  It looks
like it supports up to 6 PHYs, not just 1 (as the K1 does).

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/Kconfig            |   4 +-
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 126 ++++++++++++++++++
>   2 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index aa0b784c85b4..dacbac5cc35c 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -440,7 +440,7 @@ config PCIE_SOPHGO_DW
>   	  Sophgo SoCs.
>   
>   config PCIE_SPACEMIT_K1
> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> +	tristate "SpacemiT PCIe controller (host mode)"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on HAS_IOMEM
>   	select PCIE_DW_HOST
> @@ -448,7 +448,7 @@ config PCIE_SPACEMIT_K1
>   	default ARCH_SPACEMIT
>   	help
>   	  Enables support for the DesignWare based PCIe controller in
> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> +	  the SpacemiT SoC operating in host mode. Three controllers
>   	  are available on the K1 SoC; the first of these shares a PHY
>   	  with a USB 3.0 host controller (one or the other can be used).
>   
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 31aac056b68e..680acc93f539 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -23,6 +23,7 @@
>   
>   #define PCI_VENDOR_ID_SPACEMIT		0x201f
>   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
>   
>   /* Offsets and field definitions for link management registers */
>   #define K1_PHY_AHB_IRQ_EN			0x0000
> @@ -32,8 +33,18 @@
>   #define SMLH_LINK_UP			BIT(1)
>   #define RDLH_LINK_UP			BIT(12)
>   
> +#define INTR_STATUS				0x0010

This register offset should probably be named K3_PHY_INTR_STATUS
(or maybe it's just K3_INTR_STATUS?).  I see that INTR_ENABLE
doesn't have a prefix, and I don't know why--that should have
a similar name.  (Please fix that in your next version as well;
I think it's OK to included it with this patch with a simple
mention in the patch description.)

> +
>   #define INTR_ENABLE				0x0014
>   #define MSI_CTRL_INT			BIT(11)
> +#define RDLH_LINK_UP_INT		BIT(20)
> +
> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008

So is this enabling INTX support?  If so, you should do that
first in a separate patch that only applies to K1 (and that
should be verified to work correctly).  If all you're doing
is ensuring the status is cleared, that's OK here, but if
you don't enable it I'm not sure it matters.

> +
> +#define K3_ADDR_INTR_STATUS1			0x0018
> +
> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
>   
>   /* Some controls require APMU regmap access */
>   #define SYSCON_APMU			"spacemit,apmu"
> @@ -48,6 +59,9 @@
>   
>   #define PCIE_CONTROL_LOGIC			0x0004
>   #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_PERSTN_OE			BIT(24)
> +#define PCIE_PERSTN_OUT			BIT(25)
> +#define PCIE_IGNORE_PERSTN		BIT(31)
>   
>   struct k1_pcie;
>   
> @@ -340,6 +354,109 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   	return ret;
>   }
>   

I ask a few questions in this function; I'm basically
asking "are you *sure* this must be different for K3
than K1?"  Because for the most part this function looks
very similar to k1_pcie_init().

> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);

Would it be OK to clear this bit in the reset control
register for K1 as well?

> +
> +	k1_pcie_toggle_soft_reset(k1);
> +
> +	ret = k1_pcie_enable_resources(k1);
> +	if (ret)
> +		return ret;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +
> +	ret = k1_pcie_enable_phy(k1);
> +	if (ret) {
> +		k1_pcie_disable_resources(k1);
> +		return ret;
> +	}
> +

The handling of PERSTN looks different for K3 than K1.  Could you
implement a helper function that abstracts the differences?

I don't really understand what's happening here, but if it's
comparable to this for K1:

         /* Deassert fundamental reset (drive PERST# high) */
         regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);

...then a callback function (similar to parse_port) in the device
data might be able to be called for both platforms, allowing
the init function to be common for both.

> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> +	usleep_range(1000, 2000);
> +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	/*
> +	 * Put the controller in root complex mode, and indicate that
> +	 * Vaux (3.3v) is present.

Here too, you could abstract what's happening and that might
allow the init function to be common for both (all) platforms.

> +	 */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> +
> +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +	val = u32_replace_bits(val, BIT(7),
> +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> +
> +	k1_pcie_set_device_id(k1);

This is done earlier in k1_pcie_init().  Could it be done at the
same time for both platforms?

> +
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +}
> +
> +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)

Why is this needed for K3, but not for K1?  Does this
enable any functionality that K1 could use and benefit
from?

> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u32 val;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> +	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> +			       K3_CACHE_MSTR_AWCACHE_MODE);
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> +	.init		= k3_pcie_init,
> +	.deinit		= k1_pcie_deinit,
> +	.msi_init	= k3_pcie_msi_host_init,
> +};
> +
> +static const struct dw_pcie_ops k3_pcie_ops = {

This is identical to k1_pcie_ops, so isn't needed.

> +	.link_up	= k1_pcie_link_up,
> +	.start_link	= k1_pcie_start_link,
> +	.stop_link	= k1_pcie_stop_link,
> +};
> +
> +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> +				     u32 *status0, u32 *status1, u32 *status2)

I don't see any value in this helper function, at
least not based on how it's used now.  It is used
exactly once, to clear (by writing) three interrupt
status registers.  Just do that inline.

Even if you want to use this helper function in a
second place (when handling the itnerrupt), don't
pass in these status arguments, they're not needed
in the caller.  Just define them here.

Also you could read/write each register, and use
a single local variable (status) to hold the value
read and written.

> +{
> +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> +}
> +
> +static int k3_pcie_parse_port(struct k1_pcie *k1)
> +{
> +	u32 status0, status1, status2;
> +
> +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);

Is it really necessary to clear the IRQ status *only* for K3?
It seems like it would be a good idea (or at least harmless)
to do it for K1 as well.  And in that case, it should just be
added to the existing k1_pcie_parse_port() function.

> +
> +	return k1_pcie_parse_port(k1);
> +}
> +
>   static int k1_pcie_probe(struct platform_device *pdev)
>   {
>   	const struct k1_pcie_device_data *data;
> @@ -417,8 +534,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
>   };
>   
> +static const struct k1_pcie_device_data k3_pcie_device_data = {
> +	.host_ops	= &k3_pcie_host_ops,
> +	.ops		= &k3_pcie_ops,

I think ops could just point to k1_pcie_ops here.

					-Alex

> +	.parse_port	= k3_pcie_parse_port,
> +	.max_phy_count	= 6,
> +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
> +};
> +
>   static const struct of_device_id k1_pcie_of_match_table[] = {
>   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
>   	{ }
>   };
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
