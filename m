Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FEBCD98C5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1Y9HUuETJ97Ut8cdSSBCJ0LofmycT8NNW1B7TDEakU=; b=Oh+5H6si6lbow2
	V8XkF8LnTDdG9YDva0hkQpPjhdjWtqsle2xCqefO772hWY+a7OnkdSxaQ2WqqFCmclVfFWWygthFO
	6hGRcXDhX2mWknoS2jRj9LJyN8ACjiv3exeocOWznJUAv3ak4v7EYTbrIlt5AoXjIrbdnqZKO+bFi
	d0CKwi8BcX4VU/Uz60QaV1uqgOPwUBNEn8RNyt5EJJFWGiAyJarTdcSHZJfSOyJOupC70pNbINfXT
	qcQ5ziBdBRuUZX2UBvQnajOtFtNbDMzMAuzbg3WOQeSaAGcFV+KnUX6S5u/mbldhvFW0SWuz+SUKn
	1GTEZcU04SuPLWbmqMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz2v-000000060Ii-2EK2;
	Tue, 09 Jun 2026 16:11:21 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz2t-000000060Ho-02Cj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 16:11:20 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-48657fc84a3so5116508b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021477; x=1781626277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pq2jric+p38fa4KyXkbxPznlex9Z4eaGY3w5MG1zr2w=;
        b=HH3rpgntm16IXFVaQ4qdUYTVbm4Ezs/hh5/LE/zREuuqHNXaoz6uXmQ19a/sj74Dpr
         0CZO5ABmJI+Ly9yNLApAYQvGpbmDAqcbXXn1xUP2UGDfdlfu9FR2tm6QEXzqgRJ3cCIM
         oqCE1HxfiWXs7IhC6ZA4505vNnFZBF+Lq2D5XTApp3t5sxw5of+mEG7ECDrdWqlgck15
         WMK/F6YNl8Gg5UtwmVAUTV5O6/2pCrykcUjt1GjFoJirDHNg83L8fSM49UJIAXc1jYWu
         bHCyjq6pye+79+9factbtso6Ed8tuABKaFFgO5h94pkzXdvBVmhoFfYLyHE/vjPTeElV
         2W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021477; x=1781626277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq2jric+p38fa4KyXkbxPznlex9Z4eaGY3w5MG1zr2w=;
        b=aysnZe6SSg3xmBV5vZagnX3oK05ACccqfhwfqA1nKOodzpV5WmilJe/yXpMb3b2o0k
         zUO103MTrpkRUWJibBXT91+ykAs0BYI5M7xBquxNtEubeCj0w5Wdk0lqV/sj/d5c4END
         ZTHxZA/59T/knUAZ8Ip1xw0kP3M9hIIsEu3IDx8AIDj9aKPqc4/HAGzvbhODRxH4usCM
         gjkf4Q6gAV2tYFh4ISrnKAFZE5+xTcFAyOyQHs8G/4Qrq21YpwVkPTGJLEz/OGYhQrdr
         dEBZApkM7+aRRCPgac72U56fEwXxIwS459l3D44Kiu5Z3Hj0ebolSV8ZhvRPTQLN3ttC
         yqRw==
X-Forwarded-Encrypted: i=1; AFNElJ+nAu/TrCqrDKgEOjCNy07YTs7vfEVWkq39TIU+4jHEgUn8wFKCB7zJEUZ4N1mKFHU+oKPxykUBTLrIEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLk092LeM9jgKcYodbf6UBv2Q1uxHFxecKQlY8nkAwi5jKAnnd
	AlcOrktlLd0dkxSQzcDHZaCko3uni2bavSfIDIbhTzfC0UrzPlPhNr2zBZ+iA57kW6o=
X-Gm-Gg: Acq92OEGvLq2QDGqusHXnsqByJa4S9ne2Ki9C2qoNr/3XFOUlhjEnTqK0/3/7J29DHt
	KxpWQU1DwntYvyrl7K1qubjnAF+uBvBs5mLDDiUzgU88O97vfJGNJpYPomLe5tBC+7Wrvm+wlON
	aOx5el4TaGobURIhYBw2pSP47jMaoomJue2cRa37JqA6wlSCSPIgfV54ufTXYloDkZkGxgH+KPL
	w+2K9TwbWtqb3kFCjGHedYNoS5i1Sg66LjHFQgWIEVaqPXjhWtuTYawvEPJmSLPQ6cPKJyczZeL
	dWkDAtz/1gOKyMqHoRPT9xv9Q2gw1FqxvxTnc/W0/Qke9EdloK3moDViyKkxy5cPq0vcYRwkOJb
	1+9pRC6LG8YjhikQBnYYRZW5iHID37/u+fH3dgFTVT48m1jcQg+usMuXJncbBZmINY0UfgSPAEJ
	/decFe5W9p32vFjwunWrRUxQNoyQC6bCZgGg==
X-Received: by 2002:a05:6808:180c:b0:479:db65:8dbc with SMTP id 5614622812f47-486f01d5030mr2399484b6e.30.1781021477577;
        Tue, 09 Jun 2026 09:11:17 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:17 -0700 (PDT)
Message-ID: <433e917b-16e3-4744-a614-6372ef22825c@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260517014841.254085-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_091119_312746_C1B523B4 
X-CRM114-Status: GOOD (  25.15  )
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

On 5/16/26 8:48 PM, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 may use multiple PHYs at the
> same time. The feature is not support by the current driver.
> So extend the PHY definition to support multiple PHY handles.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 1b519d49dcc0..7f6f1df31cd8 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -51,7 +51,8 @@
>   
>   struct k1_pcie {
>   	struct dw_pcie pci;
> -	struct phy *phy;
> +	struct phy **phy;

I haven't looked further at this series yet, but do you have
any interest in making this a flexible array of pointers
(counted_by(phy_count))?

> +	int phy_count;
>   	void __iomem *link;
>   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
>   	u32 pmu_off;
> @@ -171,7 +172,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>   	 */
>   	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
>   
> -	ret = phy_init(k1->phy);
> +	ret = phy_init(k1->phy[0]);

If you're going to have an array you should probably put in place
a loop to initialize all phy_count elements of the array here
(as is done for phy_exit(), below).

>   	if (ret) {
>   		k1_pcie_disable_resources(k1);
>   
> @@ -191,12 +192,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
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
>   
>   	k1_pcie_disable_resources(k1);
>   }
> @@ -277,7 +280,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   	if (IS_ERR(phy))
>   		return PTR_ERR(phy);

Andy said something different about this.

But it seems to me you are intentionally allocating an
*array* of PHY pointers, which happens to have only one entry.
But your objective is that you want to allocate an array of
them so you can support more than just one PHY, right?

> -	k1->phy = phy;
> +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);

Probably should use the kzalloc variant.

> +	if (!k1->phy)
> +		return -ENOMEM;
> +
> +	k1->phy[0] = phy;

I think what's wrong is the above assignment.

If you are truly allocating an array of PHY *pointers*,
then you need to also allocate the phy structure that
each entry in the array points to.

The above assignment is erroneously assigning the first entry in the
array to point to the array, and not a new entry.

					-Alex


> +	k1->phy_count = 1;
>   
>   	return 0;
>   }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
