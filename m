Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B93C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ6yjhtkYtd4+Rh8i/9wsH8UNZWjIQ1PqUUY1SfdiFs=; b=zaKN0KWp5zwdAp
	WF88ljfJem6d2uIZwYIC2bLQYpxtPoG5vsdIdwWvldyqEJGRJ01wR3xNvCRjTjFJZAASwCc/96Ksa
	VQKJcd1oi3JyqVK6eOeidxGCEwvA8vyo1v1O7CaQnxlnLyPgKdyrbZSFFYxFK7nGagOokNSPjYufx
	qdeehCGeo35TIIyK8CMqNtbM2Q3BJab2Fi/lON/vzlJWtZAiNOBaIu67RZhAZWr+leMAF0aWbPY5y
	Nm6exVMhAgTUyumGz2qOTQFCSB5qETmMdxHqAuNTLPHvEuaifs/pN5QwON9vsrehuja4T75kaT12G
	NGWLvynWbOQC0Q9cUbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfV-00000005Ey1-2KN8;
	Fri, 10 Jul 2026 16:01:37 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfT-00000005Ewx-04S7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:36 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8f256eaedf8so11366146d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699294; x=1784304094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ1o73BxjtDCU3tES64jvElPh2pTfJj5ck4Dt4zpj7w=;
        b=SiCUDiGUpOcam4krlyK43O2DqoY7KYSzgOSDfdtvUwSI9XaUwsTsam6AdpiAPg3UAe
         6+5SNk418vRiFlV1K8py1ofsqM6RbQTO+72duszFf/3b1KrM5kKfe4zswEJrnYqCArV5
         0Vr+Z132CsQ0jhV7+VJ+Z7LwskG7jBJtNH8ndm2CISWMRBp4fD9GqxguZYCCv2K5ZY8Y
         W9O9Nj1HWbq8AIHRiQLbTvhK9zi4jS0oufsFXr//ZtGk0WNqQA/h070xXV3qoVBUdb06
         bddAHMZEqSyHlMA6ZH5joCiGipS6/WOLQoIGICAoV0RLate3rBm7QL0Nlp35icHAiqso
         vSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699294; x=1784304094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ1o73BxjtDCU3tES64jvElPh2pTfJj5ck4Dt4zpj7w=;
        b=oW0tP4wQ6qiGh/GQX/UTYarSlAlHeUs4vc78XN9hopO/GjOc+t5cv3CCH2FQwZDoq6
         CZw0fXeh3MPOq9UpyIIOZuifKXAZKBtXvUWa1vQ38L98yncCjqXzaDvvmsCK0eXS0ZsU
         F1ui90yeL08yZcXo9/JkkHXIfR6zfwpbDIlyE3qp4CoLO5iA1cNf2QyOpQw80RUOpZl2
         8A47WVPCbmBl/XgswhEHhCQ4ltPSchE3KcpkOf+UKvmde0p8sx6mtXtd+ATIoko0Viy+
         tNjpEyFPIgJyZoUCS4R7CX0R9TZDVTu6oWRHgiWfoqPEGRWXdQyaZnF+UmKoL+3lDixU
         Hfsw==
X-Forwarded-Encrypted: i=1; AHgh+RoqZTrqYc1rt72JYWRSzAjmQJ4yNjujp95XrMu/m05QLxsIG3R58LX9Qmc1rCWFmQgmYULeDMYQcT+VZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YztZZ8efxXp+9ljeIb9F38VZmRi3ejY/fuNTHfC3my2mFPIjTyr
	QLCyus7KMZoSIUoWc4HMj3AauaBV2nkCQ+Qi1Fc+yVxHdAGt+rGCpZKnuJJJWWZqdBU=
X-Gm-Gg: AfdE7cmKxEpVsc8YSrxEa1eCjimuCQYQVg6RJU9/yoHoB5KQ4dVXrrrnZ3KNDlOHX5U
	9t2iPX0PLKvDbPc/bTTpwLPQBt4uW4boS/HJ6rDy7+NuqBrn00GYpCwCbN6mJzG5TELPofKoo3I
	GQalXc/TAzZBnqwbZf3VotdsI5yxBUuERylX1MRWOa8GzDimZzrXXUlm8SzPcoV3oNX3QPlsDfv
	DHpuL8K94GN4hbP9uDqRSBomJQup1XUwFYZPiM6qqvg7o9nrPigIuveg+BX0DlqCdP1+Xu13gxa
	Zvd+WmwO8zE2TdR1jVdyNp+/d+7rWKH3JjmUzOJkaDCYuF36lY09ndiTjcJIM740BE+n/xAJDVS
	ygjgeQBEtSrqvGq2aSYpOv6j0bLLHW2lfBiWmvGgh+jrA42m+7wbn2ZyCS9KsWVKe1XfwEIKaTJ
	wKa53gfsi2gHCd
X-Received: by 2002:ad4:5f86:0:b0:8f0:f35c:23ab with SMTP id 6a1803df08f44-8fec189aed8mr127228496d6.16.1783699290317;
        Fri, 10 Jul 2026 09:01:30 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:29 -0700 (PDT)
Message-ID: <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
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
 <20260709040027.958400-4-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090135_094347_FB3B50D1 
X-CRM114-Status: GOOD (  22.27  )
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
> Both K1 and K3 needs to set vendor id and device id, add a helper function

s/needs/need/

> to simplify this.

I think someone might have commented on this, but I expected to find
that the next patch would fill in the code that's needed to support
K3, but that patch is at the end of your series.

The reason I say it here is that I wondered while looking at this
one why it was needed to create this helper function.  I now know
that k3_pcie_init() will call it (but I had to find that in the
last patch, which was later than I expected).

Your series should start with DT binding changes, then code changes,
and (often) end with DTS changes.

Anyway, this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index e22ecbd09579..31aac056b68e 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -56,6 +56,7 @@ struct k1_pcie_device_data {
>   	const struct dw_pcie_ops *ops;
>   	int (*parse_port)(struct k1_pcie *k1);
>   	unsigned int max_phy_count;
> +	unsigned int device_id;
>   };
>   
>   struct k1_pcie {
> @@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
>   	dw_pcie_dbi_ro_wr_dis(pci);
>   }
>   
> +static void k1_pcie_set_device_id(struct k1_pcie *k1)
> +{
> +	struct dw_pcie *pci = &k1->pci;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>   static int k1_pcie_init(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>   		return ret;
>   
>   	/* Set the PCI vendor and device ID */
> -	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> +	k1_pcie_set_device_id(k1);
>   
>   	/*
>   	 * Start by asserting fundamental reset (drive PERST# low).  The
> @@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.ops		= &k1_pcie_ops,
>   	.parse_port	= k1_pcie_parse_port,
>   	.max_phy_count	= 1,
> +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
>   };
>   
>   static const struct of_device_id k1_pcie_of_match_table[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
