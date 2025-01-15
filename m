Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AB7C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRlJHp9fKEOFao70Bq+L47oaxCprRfZT8Hrf+0p7DdI=; b=V+lziMoaeBKvTr
	tdY7ZZwSf61vpWcIlq31p6mIv/Lpc2DmCg2UC+nMNEf5EXi1K1CW+dNbzCOqCVs3bJREA0zRse/6o
	6kn8ouLzOlq/bFE9p40OrzP+6YsyGJSe7u6ahpHllThKS50Bpxw84CDIWv1accSyBXSV4vtImgsiE
	mLH5Nu1FtaiUVQMbQYhS4k5JrndIbMMDw/uDijkrUo/VUncEbUDvI98yqsmunzTL8iUJEhX69KkRg
	sYaxOsZvMpK5UaEtGT0LCjSx2VQfD1sGqLbVpGJDYdgGlssk9iU3y+W6NHIIgQo95VjulCGOGqQgg
	OZHdHPqWpKwyXFvl4Xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzzE-0000000BOVw-1IFB;
	Wed, 15 Jan 2025 09:46:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzwr-0000000BOEF-0xe3
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:44:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso46124345e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 01:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736934267; x=1737539067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esAtTk/lpEE2twEw0jUtCey8Py/XgPIAB3dxsOhtpJc=;
        b=SoQOw3K0u1bz4CgPRBo3KG3mLSz9KEpX3pFqhjU/NOqaFs3te+862dD08vrfjQ2HQL
         FuzkBV5x2nXGh9u7kCDiLKYa+OdXedxthnR7QQ88C0G/sGWf9frkYLczabPt5wyNLWXc
         8daqE6lKojkEbUJ6/FgUmgBRIrUCRXYiDTkWL57h71503hVbp/MVXpwOMcis3M+phB5G
         XJoU3KOEQNJwDQrxpQ3L3RHr4cJA1j59T0FwlnxnitGGvQY/jVVejLiUexrMDRHNm2VP
         t92fkJebNGZqryTvUOiaTdMosKuFz2yMn32LKgSbizM+cfH3yHkBHStceTlsHDkNIHm8
         yF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736934267; x=1737539067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esAtTk/lpEE2twEw0jUtCey8Py/XgPIAB3dxsOhtpJc=;
        b=mgxJqyKsoWPRU32c9WVxCDjCZYNRkba6mJbPq3PVlJVYe7yvJK2n0WXZQ81uH8S8N0
         GD2KU4rJIXpXywXTpwnQ68doeiw9oL20uKvkJW/HFHwE52O/OUPvY7JG7mNYN+L7i1Ci
         vt6D81Bne9brBu5cU0OQcm/CvJCepY9xXMovjbK3NboJjSTCE0TS/bnwEHbdUP855xhg
         wFRhxyhA1IoR8QNdNRT84YgEBO09BUoHMjD7R355zYO98wJjSnsmVNeD7ENOS3381llq
         N06nIEdASP6tV5paPhll6DVevb9n/mHgzJVNkrOXjmuwh77yAXO+5TvsZMlVu6AbEKRw
         iVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVvq7DFfc+bTFyR7y/EBlbDalCKNx4Xj8JePn9eHzTiKIj7vSQ5mIKBLEzW1UUTaqPFeZLN0GxbtyLRQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7+/RDaWDzIMh8HiutccRuAUp3TN8oJxbszBDRgWz99Ef/QJ8
	m6zfVGCz2EnnF/XA4wHYC4FXHet4MW1hLkgNJeF/qBp0DmDRsuitJsrzYvl0r+c=
X-Gm-Gg: ASbGncvkfbw3DLfMKjhFFt+4uRG6sHa3BXh/Hezxxvrkzrwqf/Spio8qGm32lCswipf
	Y9VxA76gIyD43H8E3eA4ZzspvaIJ0lmf33+iKVpoYrPfF7yZyYfeedUWzqv0cwGiqvQRAmkWfEu
	mg8rsRrgip/rJALFD1wGaBoLyfMS0O/rjxBVZKQyz9sIso2R8vN1FCAjES8JtFqLMl8es5P1ob2
	wTjzYTGQDgKhk5BbDDU1VJ6+PO4wZJXLDk5oRftgQXX703lMYBLxVvrp4xKPfs5618ncVSjJtf2
	w8XulXhJDzDxN2SRYALh3r5vYwnOE0ZLSQ16Ffo6EA==
X-Google-Smtp-Source: AGHT+IGhbkSgvY+dW7yHkdG99m1xQ+qGuWMmxBZmDcAmT3S4qDuCQLsGs5KooVSA8ixJDjHmJigmgw==
X-Received: by 2002:a05:600c:3516:b0:436:5165:f206 with SMTP id 5b1f17b1804b1-436e27075eemr265829195e9.31.1736934267210;
        Wed, 15 Jan 2025 01:44:27 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753bee8sm16984215e9.34.2025.01.15.01.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:44:26 -0800 (PST)
Date: Wed, 15 Jan 2025 10:44:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] iommu/riscv: support HPM and interrupt handling
Message-ID: <20250115-9d8193b7c67eeee41d18a7dd@orel>
References: <20250115030306.29735-1-zong.li@sifive.com>
 <20250115030306.29735-3-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115030306.29735-3-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_014429_279962_2B53E666 
X-CRM114-Status: GOOD (  26.73  )
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

On Wed, Jan 15, 2025 at 11:03:06AM +0800, Zong Li wrote:
> Initialize the PMU and uninitialize it when driver is removed.
> Interrupt handling is also implemented, and the handler needs
> to be a primary handler instead of a threaded function because
> pt_regs is empty when threading the IRQ. However, pt_regs is
> required by perf_event_overflow.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Tested-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8a05def774bd..20ae90471484 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -552,6 +552,62 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * IOMMU Hardware performance monitor
> + */
> +
> +/* HPM interrupt primary handler */
> +static irqreturn_t riscv_iommu_hpm_irq_handler(int irq, void *dev_id)
> +{
> +	struct riscv_iommu_device *iommu = (struct riscv_iommu_device *)dev_id;
> +
> +	/* Clear performance monitoring interrupt pending */
> +	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, RISCV_IOMMU_IPSR_PMIP);
> +
> +	/* Process pmu irq */
> +	riscv_iommu_pmu_handle_irq(&iommu->pmu);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* HPM initialization */
> +static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
> +{
> +	int rc;
> +
> +	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
> +		return 0;
> +
> +	/*
> +	 * pt_regs is empty when threading the IRQ, but pt_regs is necessary
> +	 * by perf_event_overflow. Use primary handler instead of thread
> +	 * function for PM IRQ.
> +	 *
> +	 * Set the IRQF_ONESHOT flag because this IRQ might be shared with
> +	 * other threaded IRQs by other queues.
> +	 */
> +	rc = devm_request_irq(iommu->dev,
> +			      iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
> +			      riscv_iommu_hpm_irq_handler, IRQF_ONESHOT | IRQF_SHARED, NULL, iommu);
> +	if (rc)
> +		return rc;
> +
> +	return riscv_iommu_pmu_init(&iommu->pmu, iommu->reg, dev_name(iommu->dev));
> +}
> +
> +/* HPM uninitialization */
> +static void riscv_iommu_hpm_disable(struct riscv_iommu_device *iommu)
> +{
> +	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
> +		return;
> +
> +	devm_free_irq(iommu->dev,
> +		      iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
> +		      iommu);
> +
> +	riscv_iommu_pmu_uninit(&iommu->pmu);
> +}
> +
>  /* Lookup and initialize device context info structure. */
>  static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
>  						 unsigned int devid)
> @@ -1596,6 +1652,9 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
>  	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
>  	riscv_iommu_queue_disable(&iommu->cmdq);
>  	riscv_iommu_queue_disable(&iommu->fltq);
> +
> +	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
> +		riscv_iommu_pmu_uninit(&iommu->pmu);

This should be

   riscv_iommu_hpm_disable(iommu);

as the cover letter said it would be.

>  }
>  
>  int riscv_iommu_init(struct riscv_iommu_device *iommu)
> @@ -1635,6 +1694,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>  	if (rc)
>  		goto err_queue_disable;
>  
> +	rc = riscv_iommu_hpm_enable(iommu);
> +	if (rc)
> +		goto err_hpm_disable;

This should be

  goto err_iodir_off;

And the next goto (under sysfs add) should be

  goto err_hpm_disable;

> +
>  	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
>  				    dev_name(iommu->dev));
>  	if (rc) {
> @@ -1653,6 +1716,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>  err_remove_sysfs:
>  	iommu_device_sysfs_remove(&iommu->iommu);
>  err_iodir_off:
> +	riscv_iommu_hpm_disable(iommu);
> +err_hpm_disable:
>  	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
>  err_queue_disable:
>  	riscv_iommu_queue_disable(&iommu->fltq);

This should be

 err_remove_sysfs:
   ...
 err_hpm_disable:
   ...
 err_iodir_off:
   ...
 err_queue_disable:
   ...


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
