Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EED2EEE26A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoOMp/7NdIta/fYCV9FITQQlNcb9rbSFhO30kWftWqs=; b=ZaXlyEK/i6dF58
	pRE0nvIRhJIZcYDhaj/2KaJPYsHdU/T7GK8w1QHEpiFUtuTLoxtz1My86uZxJaUFpAqbN/h+qQALj
	TaOgll7byHWvhJ2xRsdz/mxdqSbomoO3JZ7lIzDL5waQo0pTvAy2vMGqRjdJ/AX2NkJO25Ov+Pb29
	wul1H0/5xW+lqlwq1zdsBgrVjgGYz2NlxECj9Iov/kUR1MnOYz5+5QsZC/wrqmNji+UTgd/mPN6JO
	FENH/gPKlgQVB6e4LGwQeNaEVXuzNuMMEhlsnmm7HT7xxkWWIxnXiknesynTNzNAYwAvXugLFRK6V
	catlkLZqsyNJCAEcBUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorOs-0000000EHop-0tLg;
	Thu, 12 Sep 2024 21:30:50 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorOp-0000000EHoL-2J1J
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 21:30:49 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-82a238e0a9cso10141939f.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726176646; x=1726781446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtIMN8hjt+eHm8/8igTe0EDjoiHpYlyPflzpSE1/b8c=;
        b=lYqKEcleymTSy64HOkOLXrVZ3G+lKE7YFxkC/MAtVUar74UmcZgdliwGS8/4Wb2Dya
         oz1zxH+yx2AWsiYdlrL6yTE14YRCg1CJJktE+yEwSOxEjBvkbGoIZbT5saB/1s24ohdI
         nFC3yltllv5xXP4PdfHq9e7xiyULjW74V4qVqvYp2hj8uoIhi9RVr+5qb/deYJISXOf6
         aN6dk+MW9W/Do2tlnmxj0sQlP8UqwU7/aQYxf3tv9Uj60QXyI8CfUpAMekxcuRbBcFDq
         Vpw+9u/u3AIOYc1qB36rg43iwWDWqvgIhiP0l2dHHdL0HzwRC5jch6ddGo/ifkdy6Ean
         gk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726176646; x=1726781446;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtIMN8hjt+eHm8/8igTe0EDjoiHpYlyPflzpSE1/b8c=;
        b=URNiuZ21hacvgpSydOR9f+keM9q+eYUrR+pfk2eoPQj7hzi7L7YO8+FmROC8pj+X5/
         wlTpYS8eitMx5/Gkw11S0dSXmMIrQ6sVRq0x3I1HvJopO2ZMsdQJv+Tn+yl4tBgCJhQq
         0hhABNByRsMQb/l45S3S7DFHKv+BudBKNEa3GTZ1KX1zVUxb0ev8+Mri6y8n4R9Iedc5
         3biEcHDciZMnyZDNQ+O6Z1bUHXTmBzVjjr/ql64B2QLyKqyquR1rYYwro1ySg+9WGYD3
         v3dc9ofyTPqjffJfIKb3Cn356IA+l6kjDw3zx6jlyxpQtCmCqSGXvNjQM3LNhChMVGZa
         oR5Q==
X-Gm-Message-State: AOJu0YxrICOTOiPDQ5rVoWLI3kRENXmOF2cQvg/SZzT6HqdRWlbs/3ce
	k+3/P917c/w+3qtdLBu6NG/LyYFbWq7PjA+EIQ0G6zDC7Wzkt1+uvQ8CeW5GE94=
X-Google-Smtp-Source: AGHT+IF0Dj116Hozge8v197MDvYjeTxK3MKp0aY5RS13PAtZvlLU8oqWjlPSuwRMds/rwKfYKaJo8g==
X-Received: by 2002:a05:6602:15ca:b0:82d:d07:daaa with SMTP id ca18e2360f4ac-82d376b01c6mr102431939f.4.1726176646337;
        Thu, 12 Sep 2024 14:30:46 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d35f8dac37sm807546173.133.2024.09.12.14.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 14:30:45 -0700 (PDT)
Message-ID: <22dd1d53-9ac5-4672-ad68-e82499038283@sifive.com>
Date: Thu, 12 Sep 2024 16:30:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] mailbox: add Microchip IPC support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_143047_626984_335AAD41 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Valentina,

On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> +static int mchp_ipc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mchp_ipc_probe ipc_info;
> +	struct microchip_ipc *ipc;
> +	struct ipc_chan_info *priv;
> +	bool irq_avail = false;
> +	int ret;
> +	u32 chan_id;
> +
> +	ret = sbi_probe_extension(SBI_EXT_MICROCHIP_TECHNOLOGY);
> +	if (ret <= 0)
> +		return dev_err_probe(dev, ret, "Microchip SBI extension not detected\n");
> +
> +	ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
> +	if (!ipc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, ipc);
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(IPC_DMA_BIT_MASK));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "dma_set_mask_and_coherent failed\n");
> +
> +	ipc->buf_base = dmam_alloc_coherent(dev, sizeof(u32), &ipc->dma_addr, GFP_KERNEL);
> +
> +	if (!ipc->buf_base)
> +		return -ENOMEM;

One drive-by comment here: you don't need to use the DMA API to get a physical
address for passing to the SBI interface. You can use __pa() on a kmalloc'd
buffer, since kmalloc() returns memory from the linear map. This has the
advantage of 1) using cacheable memory and 2) not rounding up the allocation
size to a whole page.

> +
> +	ret = mchp_ipc_sbi_send(SBI_EXT_IPC_PROBE, ipc->dma_addr);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "could not probe IPC SBI service\n");
> +
> +	memcpy(&ipc_info, ipc->buf_base, sizeof(struct mchp_ipc_probe));

Here sizeof(struct mchp_ipc_probe) > sizeof(u32), so if the DMA API wasn't
rounding up the allocation size, this would be a buffer overflow.

Regards,
Samuel

> +	ipc->num_channels = ipc_info.num_channels;
> +	ipc->hw_type = ipc_info.hw_type;
> +
> +	ipc->chans = devm_kcalloc(dev, ipc->num_channels, sizeof(*ipc->chans), GFP_KERNEL);
> +	if (!ipc->chans)
> +		return -ENOMEM;
> +
> +	ipc->dev = dev;
> +	ipc->controller.txdone_irq = true;
> +	ipc->controller.dev = ipc->dev;
> +	ipc->controller.ops = &mchp_ipc_ops;
> +	ipc->controller.chans = ipc->chans;
> +	ipc->controller.num_chans = ipc->num_channels;
> +	ipc->controller.of_xlate = mchp_ipc_mbox_xlate;
> +
> +	for (chan_id = 0; chan_id < ipc->num_channels; chan_id++) {
> +		priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> +		if (!priv)
> +			return -ENOMEM;
> +
> +		ipc->chans[chan_id].con_priv = priv;
> +		priv->id = chan_id;
> +	}
> +
> +	if (ipc->hw_type == MIV_IHC) {
> +		ipc->cluster_cfg = devm_kcalloc(dev, num_online_cpus(),
> +						sizeof(struct mchp_ipc_cluster_cfg),
> +						GFP_KERNEL);
> +		if (!ipc->cluster_cfg)
> +			return -ENOMEM;
> +
> +		if (mchp_ipc_get_cluster_aggr_irq(ipc))
> +			irq_avail = true;
> +	}
> +
> +	if (!irq_avail)
> +		return dev_err_probe(dev, -ENODEV, "missing interrupt property\n");
> +
> +	ret = devm_mbox_controller_register(dev, &ipc->controller);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +					 "Inter-Processor communication (IPC) registration failed\n");
> +
> +	return 0;
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
