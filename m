Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C3C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NtoZpqnR64sgy1L4Atl8zEmgRAhHiAZ9LdsJz8I55Q=; b=JsFZC7CxmNSQ+C
	hfftZEXMeF70ojJ+EJxrCPBkgTw+YwvGUw+/li1uaxQU9+nVW2/5lTMX6zBBPJIsZztxFHDvXIY3S
	t0pP2up+58p3ZBSQjn6jmhG7uPxv+2ny1RIgDZTTTTLxoWKqdIMuI5mQU48fLL6uktcusWfwGtprG
	deAAzvOzT8OeIpNlOQtZuUzn4RKjz/IIYYZB+kKPSS1Zw6xrrrPl+YeALGdhLxDwO4hqv9094O5gu
	MA5Y+sePJdFV4jM7fYocTsxMQQKB/hVoA54tiB8O9clmsloU4gEMrz/3/vAHOFg7jRPAwvR5Enk6+
	Bo9wjsQeoprRSKcZirmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfO-00000005EvO-1nAb;
	Fri, 10 Jul 2026 16:01:30 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfL-00000005EuQ-2xRP
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:28 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-8f18d92172aso13908686d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699286; x=1784304086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibYEVRhooxeSrQ5xojyVHvKfco3aR1AHaIOv/pn/k8M=;
        b=y3k2Oa5ux0DoQ88uOAATciDhvbwjXsG4lCJEmNZ3IbmZDGEUDe8A/ygZo2x1imKvuP
         Ryh2LL8exB8vI4odWwR+FHTU/9TsO+XFiJM7bsydnRplHjGeCyX5hZPTY11G2Gk0eYEK
         pY84zRGPlDrEMfv+cOqT16dH9fvhOC11Jsbxg1iV2KITvN6scO61KdRGRRPeruH4AskF
         B98C/E9iSJBwcQ+9eAXDKbTy+Sh3ipK8LeeYJ/kryLdcbvOXRd+pj9L5LEKd5tJpcmNe
         AYnXKeyGiVaEDT48I5KHXUjRHWU1kANqZjHSKe7yUcTLOl1YkySLC1S2M0vQFTX6GJNe
         F9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699286; x=1784304086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYEVRhooxeSrQ5xojyVHvKfco3aR1AHaIOv/pn/k8M=;
        b=NejmNMlXbuZ/SS+ObyXwLGL547yp5/89CuijewHguLga+FXyHMU9riS/k2bhqOoq4x
         dgpmN03Y8fsmSrTNTFzZA4RNBEEu+cPwLXRtKedrlDOe6TnKK6jKxsr7t4y114LMoV1P
         213HdjYUfvjSXSt5YsEoHpYBq7r/eFmPfvj1K+y+K1E9wYePq2tRgyrR2lypowHZnSaf
         WMcocNrY8QJJNjBybkaZ4YKWR5ugzY3DNue8OzTlk/VdDrI/1W9IPuDYjjG7wZ6JC0zF
         RYUFW9iJpWUNiJsB75OS6qSLCRNHeTnLjRMzLWNcTnduqFz6hWAU9wKam+ZHtGR7rdyN
         z9zA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3wsP95LktKTvd5zc6NSKkNRdOGc5cUX3w3UQ/sfYvCyGVcXXvcdy+jMxQoh6PWZwh4mjlFQaKRNXJsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8vfWiQ5j05l9muy8/4b1UDQKrR6XuO3UxhJsTOffAWr3v+vbj
	qM02/gjQ8DNxy3D9n1wi/nYAnjWcWVah/z3CeddlDWfuEuvEMId8+4mkv/yXzUVs9xY=
X-Gm-Gg: AfdE7cnRG2Q3hY++wq+sTrhK39jZWJ0a6GpgjmpKd49MQdcPocx1D1C/S4RhEKz4xOb
	7tXoY9c7VQtXVZadhrns4tfJgGzwTQ1Ce/LoOj/99ZeFeSVOrMWeapcqjextzEV3YIh4j1kJv7m
	te0pUXg2r8gMOVrx376ZaAjY8sxbfBFptLiGzeXt7ArQ74X4ZQiDkeQFOOq4xQE5FzfPj56xuF5
	rG218ej5kU5BG5ktyjAwfjqUfu+/U98gPTMD0/jg/6Aqm8GRssqLL/Afv2g5+3pDY2oBdkpgQLX
	BYfSbuWpcVTZyrV8Pla7enMKd3efjAns8mj+xROoZDHjqHuA+PlvY3EomZALzLk6dNBON/68bVh
	QdPQ6BDoDuzpIRALZPtTq+b9rHDkpmgpF/FM8UdgXIRY7BddVIPD0k1cRghhbh0Fo03Z0VT9r4R
	APDk2AKsXyERFn
X-Received: by 2002:a05:6214:2f0c:b0:8e9:f5de:d628 with SMTP id 6a1803df08f44-8fec333688bmr139493076d6.55.1783699285931;
        Fri, 10 Jul 2026 09:01:25 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:25 -0700 (PDT)
Message-ID: <7e8cc486-8d0c-4bb0-ada9-fb4dd53e53e8@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
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
 <20260709040027.958400-3-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090127_769957_06B156DD 
X-CRM114-Status: GOOD (  37.81  )
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
> The PCIe controller on Spacemit K3 may use multiple PHYs at the

s/use/uses/

> same time. The feature is not support by the current driver.

s/support/supported/

> So extend the PHY definition to support multiple PHY handles.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 70 ++++++++++++++++---
>   1 file changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index f6ae8ff3589a..e22ecbd09579 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -55,12 +55,14 @@ struct k1_pcie_device_data {
>   	const struct dw_pcie_host_ops *host_ops;
>   	const struct dw_pcie_ops *ops;
>   	int (*parse_port)(struct k1_pcie *k1);
> +	unsigned int max_phy_count;

Is the name "max_phy_count" meant to suggest that there
could be fewer "actual" PHYs than the number provided in
this field?  If not--if it is simply "the number of PHYs
this platform uses"--then just call this phy_count.

>   };
>   
>   struct k1_pcie {
>   	struct dw_pcie pci;
>   	const struct k1_pcie_device_data *data;
> -	struct phy *phy;
> +	struct phy **phy;
> +	unsigned int phy_count;

If this is always the same as what's in data->max_phy_count,
you don't need to replicate the value here (since you're
also keeping the data pointer in this structure).  (But it
looks like it might be less than max_phy_count.)

I believe I suggested making this structure use a flexible
array member for the PHYs.  If that's possible, it should
go at the end of the structure, and the way you allocate
it needs to change.

>   	void __iomem *link;
>   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
>   	u32 pmu_off;
> @@ -119,6 +121,54 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
>   	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
>   }
>   
> +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)

I would call this k1_pci_get_phy_handles() (or perhaps
just k1_pci_get_phys()).  Or even k1_pci_phy_get_all().
The name you have seems like you're just getting one handle.

> +{
> +	const struct k1_pcie_device_data *data = k1->data;
> +	struct device *dev = k1->pci.dev;
> +	unsigned int i;
> +
> +	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
> +				     sizeof(*k1->phy), GFP_KERNEL);

Use kzalloc not kmalloc.  Even if you're initializing all fields
now, a future change might not (and in that case having it zeroed
is safest).

Also, if you find fewer than max_phy_count PHYs, I think it
would be better to only allocate as many needed.  If you
used a flexible array size, you would need to count the
number of entries before allocating it.  It would require
changing the structure a bit--providing a single function
that would allocate the k1_pcie structure after doing that,
and most likely initializing the phy array within the same
function.

> +	if (!k1->phy)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->max_phy_count; i++) {
> +		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
> +		if (IS_ERR(k1->phy[i])) {

If this returns -ENODEV, you are done getting PHYs.  So
max_phy_count could be more than the "actual" number.

Is that reasonable?  You indicate that at least one PHY
must be found below, but is it OK for a platform to
define fewer than some expected number of PHYs?

(Maybe it is.)

> +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> +				break;
> +
> +			return PTR_ERR(k1->phy[i]);
> +		}
> +	}
> +
> +	k1->phy_count = i;
> +	if (k1->phy_count == 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int k1_pcie_enable_phy(struct k1_pcie *k1)

I would call this k1_pcie_enable_phys().  But actually,
because what you're calling within this is phy_init(),
I'd probably call it k1_pcie_init_phys(), or possibly
k1_pcie_phy_init_all().

> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < k1->phy_count; i++) {
> +		ret = phy_init(k1->phy[i]);
> +		if (ret)
> +			goto err_phy;
> +	}
> +
> +	return 0;
> +
> +err_phy:
> +	while (i--)
> +		phy_exit(k1->phy[i]);
> +
> +	return ret;
> +}
> +
>   /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
>   static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
>   {
> @@ -174,7 +224,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>   	 */
>   	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
>   
> -	ret = phy_init(k1->phy);
> +	ret = k1_pcie_enable_phy(k1);
>   	if (ret) {
>   		k1_pcie_disable_resources(k1);
>   
> @@ -194,12 +244,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>   	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	int i;
>   
>   	/* Assert fundamental reset (drive PERST# low) */
>   	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>   			PCIE_RC_PERST);
>   
> -	phy_exit(k1->phy);
> +	for (i = 0; i < k1->phy_count; i++)
> +		phy_exit(k1->phy[i]);

Please create an inverse of k1_pcie_enable_phy(), like
k1_pcie_disable_phy(), to encapsulate this code.

>   
>   	k1_pcie_disable_resources(k1);
>   }
> @@ -266,23 +318,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   {
>   	struct device *dev = k1->pci.dev;
>   	struct device_node *root_port;
> -	struct phy *phy;
> +	int ret;
>   
>   	/* We assume only one root port */

Maybe you could get and put the root_port within
k1_pcie_get_phy_handle(), since that's the only
place it's needed.

					-Alex

>   	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
>   	if (!root_port)
>   		return -EINVAL;
>   
> -	phy = devm_of_phy_get(dev, root_port, NULL);
> +	ret = k1_pcie_get_phy_handle(k1, root_port);
>   
>   	of_node_put(root_port);
>   
> -	if (IS_ERR(phy))
> -		return PTR_ERR(phy);
> -
> -	k1->phy = phy;
> -
> -	return 0;
> +	return ret;
>   }
>   
>   static int k1_pcie_probe(struct platform_device *pdev)
> @@ -358,6 +405,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.host_ops	= &k1_pcie_host_ops,
>   	.ops		= &k1_pcie_ops,
>   	.parse_port	= k1_pcie_parse_port,
> +	.max_phy_count	= 1,
>   };
>   
>   static const struct of_device_id k1_pcie_of_match_table[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
