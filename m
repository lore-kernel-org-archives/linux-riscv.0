Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F938C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnStzIJxTYnqrReuRjdi6WG4XC4xvnVU18K5rs4CWc=; b=vvOuMGyEHLbw/N
	XCExCrNLcyNoWeIZ8ZT3CpKz7ZmL7553yHE80pG4m5Yw85gmcr5Z5bqz3ZublSoZkO61vzO7krJvT
	DKG9EdeegvBafBnge6xFKYvNtG6x2qu+HjMAG2pW9jbHNNMh+CwS4rcM9SC0OLH+Uvn7VJIJN0+Zm
	tHHKNXjM3vojrJA9bYwW06EpG/uQO4qo3hQyZnb7wzGvMD+lOGAB7PxjMaaNyR02FfHi7owPDq2do
	/Utvwtakim6zt8Z4KN/Oqdgsu/ZWMCHPEOIEZf942ujkL24tX2yVUgqhB+612EaAcPQWmfzeZRVVK
	k3Q39dorBaXgoggK+x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcqv-00000004lKo-1N1x;
	Mon, 10 Jun 2024 11:06:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcqr-00000004lJy-40V0
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:06:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57c72d6d5f3so1992268a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718017571; x=1718622371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKRDnT36YiO5NHWmifxOcGKSpN9i3QJZvUnqhc0HlYc=;
        b=j9waD4ZrQLV04s4SwB4Ewv/q0gLzLefxRg0U7JqpFxHdY4maVKUsl8t5N5rnsrErrt
         PVbC7bQLXRp4KjUMScw18boj5YMUy2wofiaMhIebUF4XG45CJrUZ/oMouBKbwLJqGbei
         GFzQe/xNz6Q+baRfODpIDdi/ZFSlKCNjSeisgxlYUcHPPZPhgOWjkiWAEwOAXQ7643ZB
         UPddsvgXJK+lg98cKO/CIzHEEmgWO8ilEsPgG53L/P/JxXY2GjBSJft23GHa5setqDQB
         VZfnN1tZG+rnQfHVeuYjr+AYABzkay6i+5rsL/hwAksJ82B/nq4hrBbyhHxxc3HM1eWU
         cTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718017571; x=1718622371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKRDnT36YiO5NHWmifxOcGKSpN9i3QJZvUnqhc0HlYc=;
        b=w8CyX04bj49AeCoD9vkWimvTmEpNjs/Dxur+1/nzvY7XDFIJGaYtArwssiqeCOj+Lw
         RLOJZmOc5eZnUe+oa6cHDuSWHtqVejZFimCR4s0G88910TctM9uVmMBIUgtpwVSjTaYo
         5mynYVw/gJS2v9eWM9DAS5+VCRaUGBZs5f9/+PBZow2MU+vpl94bu1NyWhx1VfKhBrri
         lxLyz3FKzsCck8d5rowkMSI4dJZsQQu8okZMVVrH6j5/zIEJobi8PJ3Rb8pygdEDKwyv
         RHnNNQqCgAW13utN0WlPEL34j3Q/3p3mas0U2jHUlBk57V4fNWDvIqpCqnok+zSSysqJ
         G48w==
X-Forwarded-Encrypted: i=1; AJvYcCWGkNBllVCwKYG/2bkR3PPCBY5U8nOMAT5Jhf0Z/a9IywG3qpmtzjZyrHPCTDJ8slGIrIlnUjKMuJyypCAE9IqybNbwb8WYumUu/rq8w9Qd
X-Gm-Message-State: AOJu0YzXNiq5r61AlvyjMwWI1WP1cKBYIB76wDcJloT5xkkyXXKxgzqD
	0Fi0Ix/sUfw8HHqsxcbjh45MFyq7AMx3sm9V6ePh06I9cYTqkIt9i4aGS7ZdMXE=
X-Google-Smtp-Source: AGHT+IHo0tOX7ZoqFEj30qNwq0kZf+ky7YJbEiSPIgRIvjy2gNXCneqdIFwRINKKmlx0kL4JUlY/jw==
X-Received: by 2002:a50:8d43:0:b0:57c:6d89:eaf0 with SMTP id 4fb4d7f45d1cf-57c6d89f06cmr3373682a12.14.1718017570481;
        Mon, 10 Jun 2024 04:06:10 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9e093sm7201840a12.13.2024.06.10.04.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 04:06:10 -0700 (PDT)
Date: Mon, 10 Jun 2024 13:06:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v7 6/7] iommu/riscv: Command and fault queue support
Message-ID: <20240610-3cd1ba07c1b488a451dd7ddd@orel>
References: <cover.1717612298.git.tjeznach@rivosinc.com>
 <422f66285da1b164466b223f83d7f06564968f09.1717612299.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <422f66285da1b164466b223f83d7f06564968f09.1717612299.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_040614_019908_0AB7B335 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 05, 2024 at 12:57:48PM GMT, Tomasz Jeznach wrote:
...
> +static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
> +				   struct riscv_iommu_queue *queue,
> +				   size_t entry_size)
> +{
> +	unsigned int logsz;
> +	u64 qb, rb;
> +
> +	/*
> +	 * Use WARL base register property to discover maximum allowed
> +	 * number of entries and optional fixed IO address for queue location.
> +	 */
> +	riscv_iommu_writeq(iommu, queue->qbr, RISCV_IOMMU_QUEUE_LOG2SZ_FIELD);
> +	qb = riscv_iommu_readq(iommu, queue->qbr);
> +
> +	/*
> +	 * Calculate and verify hardware supported queue length, as reported
> +	 * by the field LOG2SZ, where max queue length is equal to 2^(LOG2SZ + 1).
> +	 * Update queue size based on hardware supported value.
> +	 */
> +	logsz = ilog2(queue->mask);
> +	if (logsz > FIELD_GET(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, qb))
> +		logsz = FIELD_GET(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, qb);
> +
> +	/*
> +	 * Use WARL base register property to discover an optional fixed IO
> +	 * address for queue ring buffer location. Otherwise allocate contiguous
> +	 * system memory.
> +	 */
> +	if (FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb)) {
> +		const size_t queue_size = entry_size << (logsz + 1);
> +
> +		queue->phys = ppn_to_phys(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));

Shouldn't this be something like

  FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb) << PAGE_SHIFT

ppn_to_phys() assumes the ppn it's converting to be shifted up by 10, but
FIELD_GET has shifted it down to zero.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
