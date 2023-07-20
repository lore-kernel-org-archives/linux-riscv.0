Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A0EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVgKBbDUcyXxcFgTe8i89TSjXbjfQiGDs7CukpSzszc=; b=VuHGDLof2cgYg4TZ6ZS7C6adhC
	HskJuz7ENqFEvTei3zPrRtWq+bmwi4SCzQ38s9hCrNpwufEksaWsKcz5yw2SDh1m1qepriRJfxNP5
	B/BQT5oKC29lKgxhHfY3TQaBMguwrRJtVC+2jT133bZa4oYByyK1jsO9N73AtXr/MFpvNkn0gTIku
	JjVPVuQQyp59CNaOczYpZF13pqsyTJBIeCMzVbf8pY1ir3yf+NKRm/wm402UZYNnJ2ZuSxHPHLqxi
	QQTXp7Sx4fVlVWM6Sup3L0OagihuioDsAA+ikY5nP8sH4hCStMkoYyHUT4oWWh9foQo1+9BGPfoGZ
	n3YuvTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMT7V-00BB56-0c;
	Thu, 20 Jul 2023 12:51:01 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMT7S-00BB4I-1a
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 12:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689857458; x=1721393458;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0AeQWKZgQumjGRyu50VkLRMKLVhVKVhQS0rXychQk0w=;
  b=CbUGEQBEMIb1r2tdw2fpKmnPoaDmHVDzCVZhrNiDW1f0pe1OjPlNjDX/
   cgcVRtw76FVclUe5KBopKku3RcwXZqSbPRNbxzMSOjOCz+amI0IVhdMNx
   JSY0NYsr3E549V15o8AJgIpWoyIZpVearo4uSfbaQiQ+TJ3o1BzsxgKXz
   UcyRZ9bAJkWk9rFve6h2eNwHqei+qyTamMdmIwePLVNsjh5cCOGQOvfLc
   2NP1xrRE7Cxwpef5Y8d2sXmQ/GtMLMfLM/bn9sYCqvIM8xSPtDqra4y1m
   5N3oZavI5NdmsCNhAU19EhGCzq2ZVyPIq8b1kv7lrBUC9Nof2bCuvcIDG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="453091710"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="453091710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848436243"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="848436243"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.109]) ([10.252.191.109])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:50:48 -0700
Message-ID: <2556751a-c439-bb69-a102-583dd985fc5e@linux.intel.com>
Date: Thu, 20 Jul 2023 20:50:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_055058_559993_5936AF35 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023/7/20 3:33, Tomasz Jeznach wrote:
> +#define sysfs_dev_to_iommu(dev) \
> +	container_of(dev_get_drvdata(dev), struct riscv_iommu_device, iommu)
> +
> +static ssize_t address_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct riscv_iommu_device *iommu = sysfs_dev_to_iommu(dev);
> +	return sprintf(buf, "%llx\n", iommu->reg_phys);

Use sysfs_emit() please.

> +}
> +
> +static DEVICE_ATTR_RO(address);
> +
> +#define ATTR_RD_REG32(name, offset)					\
> +	ssize_t reg_ ## name ## _show(struct device *dev,		\
> +			struct device_attribute *attr, char *buf)	\
> +{									\
> +	struct riscv_iommu_device *iommu = sysfs_dev_to_iommu(dev);	\
> +	return sprintf(buf, "0x%x\n",					\
> +			riscv_iommu_readl(iommu, offset));		\
> +}
> +
> +#define ATTR_RD_REG64(name, offset)					\
> +	ssize_t reg_ ## name ## _show(struct device *dev,		\
> +			struct device_attribute *attr, char *buf)	\
> +{									\
> +	struct riscv_iommu_device *iommu = sysfs_dev_to_iommu(dev);	\
> +	return sprintf(buf, "0x%llx\n",					\
> +			riscv_iommu_readq(iommu, offset));		\
> +}
> +
> +#define ATTR_WR_REG32(name, offset)					\
> +	ssize_t reg_ ## name ## _store(struct device *dev,		\
> +			struct device_attribute *attr,			\
> +			const char *buf, size_t len)			\
> +{									\
> +	struct riscv_iommu_device *iommu = sysfs_dev_to_iommu(dev);	\
> +	unsigned long val;						\
> +	int ret;							\
> +	ret = kstrtoul(buf, 0, &val);					\
> +	if (ret)							\
> +		return ret;						\
> +	riscv_iommu_writel(iommu, offset, val);				\
> +	return len;							\
> +}
> +
> +#define ATTR_WR_REG64(name, offset)					\
> +	ssize_t reg_ ## name ## _store(struct device *dev,		\
> +			struct device_attribute *attr,			\
> +			const char *buf, size_t len)			\
> +{									\
> +	struct riscv_iommu_device *iommu = sysfs_dev_to_iommu(dev);	\
> +	unsigned long long val;						\
> +	int ret;							\
> +	ret = kstrtoull(buf, 0, &val);					\
> +	if (ret)							\
> +		return ret;						\
> +	riscv_iommu_writeq(iommu, offset, val);				\
> +	return len;							\
> +}

So this allows users to change the registers through sysfs? How does
it synchronize with the iommu driver?

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
