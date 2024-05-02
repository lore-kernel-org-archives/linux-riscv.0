Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQd/iHZ5O//HX4XvJSMsdOmroHaNRTMkfI6Ke3WJIHk=; b=Vuw7VGRXNj4d9XRwho0G4OmCUN
	69JyJjQxi89/kSYq6AaoT97Bn2Xf1pMpueysZuBVG1SQd0S5/kUud2XJFA9ziVIzmD04GdswdzYnV
	lTExRj7bhr9RaJwyj37krFIi3eQNpsi2x7j/q6WgPXfjXKILVzklsdLOMiz+Ge/EteyUYGeoj8VcD
	dIO8Cfmci+H62zQIF+C73V/gVE5KemJmYXvCEIe6lPfiyU2oWlGxPUE6LFMC8oi6pUU7fW30gympO
	z7EVSYv07Sn+seOPIONRQVe629pu9vH8WKADCrAnYCoKlinZA6NdY6pao60yNLe2ccszFepv5klPy
	7AUPT/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LR4-0000000B8q7-2N2O;
	Thu, 02 May 2024 01:40:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LR1-0000000B8pY-3Gjs
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 01:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714614031; x=1746150031;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rB8QaHvvVc37SrREtm9E3Ka0ivGapfuZ+pPLjENqNqQ=;
  b=VlwaIPOHh9+qwvI2fiMM4idNItlKaSGduE7nlvkYJVGanwZ1u1Xv5EbO
   yhandjPq5ia3mmKbOBa7fTep6nrLQs9iWWLlIC5pqoRWESFbzEbhkUWSj
   YSY/IWnbuZ0EGamKS37iteE855bnaufweSsBIGu9jXAaLFmOM/ZcKFkdd
   P60O1BoDk2OqeYBcSSE3S8JdiqjG4zXsILWk9FMHMxS3tpdGVGbgYQXso
   RRrNKgRgfsdsi9QzN9OybqI4YB0mcYqEJjiroE1/4gya3UDoF8ajZOShv
   r+jhKfDc1XyAKkXygYcBr5AEpIVpANFGZ8evn/SIAE0QikKay59O9EV4Y
   A==;
X-CSE-ConnectionGUID: Yt/VH9AETnOxKW40qyWd8w==
X-CSE-MsgGUID: dM2w7DRPRiKT+mTab/+Phg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="32883906"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32883906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 18:40:29 -0700
X-CSE-ConnectionGUID: h5YM6Yf1Q9GE9Rwcx5b5JA==
X-CSE-MsgGUID: QsBLxdJaTuCtZm8iROSJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31581522"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2024 18:40:25 -0700
Message-ID: <104358de-ea86-4e25-8942-ba285d6f317b@linux.intel.com>
Date: Thu, 2 May 2024 09:38:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] iommu/riscv: Device directory management.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_184031_931905_D2DF62DB 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/1/24 4:01 AM, Tomasz Jeznach wrote:
> @@ -128,6 +489,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
>   {
>   	iommu_device_unregister(&iommu->iommu);
>   	iommu_device_sysfs_remove(&iommu->iommu);
> +	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_MODE_OFF);
>   }
>   
>   int riscv_iommu_init(struct riscv_iommu_device *iommu)
> @@ -138,12 +500,13 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
>   	if (rc)
>   		return dev_err_probe(iommu->dev, rc, "unexpected device state\n");
>   
> -	/*
> -	 * Placeholder for a complete IOMMU device initialization.
> -	 * For now, only bare minimum: enable global identity mapping mode and register sysfs.
> -	 */
> -	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
> -			   FIELD_PREP(RISCV_IOMMU_DDTP_MODE, RISCV_IOMMU_DDTP_MODE_BARE));
> +	rc = riscv_iommu_iodir_alloc(iommu);
> +	if (rc)
> +		goto err_init;
> +
> +	rc = riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_MODE_MAX);
> +	if (rc)
> +		goto err_init;
>   
>   	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
>   				    dev_name(iommu->dev));

The device directory root page might be allocated in
riscv_iommu_iodir_alloc(),

+	if (!iommu->ddt_root) {
+		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
+		iommu->ddt_phys = __pa(iommu->ddt_root);
+	}

But I didn't find any place to free it in the error paths. Did I
overlook anything?

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
