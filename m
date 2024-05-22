Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD9AC25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6WXrk8IPUQSZ5HoYibKSHY6smBRYJ5NHG2gy49CjBc=; b=snVkblexAh/fDa
	f+YRZOemTPYZqAROlKC3MP11MgnRgD0iko45k6e6Je0woP6LplQqZOCR2s0bL64CMXUWG98HEPHY/
	99anUzxzqsvIfvAb0MIAsVZZmmJpI7PT9Hx+1fDo7jbBm4CcIPQaawzJARn1fGrRZeKrkK6ARiZ8I
	1C8XN6xckKnaVrY++RxQwI86M6GKYb/vTayHFJXiKb5gdGtxguW7WnkYsg8hgMQDZNscznDvi71dB
	0J00eN7WH4szmukLxvhR9sQb78YuKUZUGqm3KTdtDQK4UoOq2x9MosTeAO3p83kDbBZ48y5TohKGv
	bABtabma1NDS1WebotiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9h0L-00000002J57-0Jdq;
	Wed, 22 May 2024 08:07:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9h0I-00000002J4e-0Tjj
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 08:07:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so7794978a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716365236; x=1716970036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjJc7AAlreo5EdXOmmG11eZiUCAvljdqIc2K+uOGIsQ=;
        b=auNsmEVW1pqi0sZqZh2nuNkikpm1NPIwxHdCJiNo05LQfUaEdkdNUR+x5SYK+9iVse
         9dfOk19yXLqGOZoWGD/dHZrNA1d7eLMPteRIqJ436HBP+8oky2TAoB8537whAddIPMu8
         TyPsAXAY6yYWJMpad4r5hdzYExv1CeUpGGNzomsoNRtdlBbz7zfen+HafoTA33MMG0+j
         aZH1nfDQF9vqtVg0kO4bp5+DjJRE/vXqRVMV3ZGmuriGv15xHfN8uoveaGah5vNO7IyG
         fd+/jDotAjB7Bl5FVZor5ytpvDUFpNMf8CSxyc6oOiamsn0Lbj/25Y7K8AVurJsiQtne
         hhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716365236; x=1716970036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJc7AAlreo5EdXOmmG11eZiUCAvljdqIc2K+uOGIsQ=;
        b=lUWN8lbSBZ6sNy2fhsImMVJ2kIRZgA5jvv0nLLMdCizFn5/rilyarB242rDmnIS2J3
         0rwSS1Vx10JYfyTGZjCQvnlBNl8UbcR2iCvRLvvgFSOch91BED6m7fMoYtVxE/eohcAQ
         4ikxBkzeJxzpoP5svU0RTnO54SHBh+VS7+ibqRCE9XVpNBsIkFLnl2GcnBlJSlL3ugU5
         l+JzZmjPobCD4dus8f3TgtUIE3GYQZftngpTR6H3iMEIObMW7zkY+ONMHZfiHTfgm57j
         QRZ8HsOSfxxf83EZ9sFylG9PQd80kf1cixY2Qn3PbaAZyAlabxbS0J693gT1L1iHEk6m
         jSRA==
X-Forwarded-Encrypted: i=1; AJvYcCW9S/mGks1y7lturEntzTLi/It/6W+bN5+ks7VM406Eq4lWlOi6qHKop+4LcXiiopUGoKtMeZztOqpia0sDT2GirSUXyS+fPKwQzkGsu/3F
X-Gm-Message-State: AOJu0Yz8Yw15olRf0Vl+7z3zLhskLCVNYCK2/JYpgimfZs/pvIcYs5y4
	RBIi6Z+G4cF4U0bqldaGSUCHgFLgIC+dDPJ6+aKkmzBRNieWppGc4YpJh763fF0=
X-Google-Smtp-Source: AGHT+IFxkk46rQN7LJxAzq5cGNXR84hroJkBlxdzGPSkPpe2syhCs/1Mf1/sjeCOL+ArtyBeWNzrvw==
X-Received: by 2002:a50:ab4b:0:b0:574:ecc4:6b54 with SMTP id 4fb4d7f45d1cf-578329c7ca3mr1206147a12.9.1716365235959;
        Wed, 22 May 2024 01:07:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323887sm18071800a12.89.2024.05.22.01.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 01:07:15 -0700 (PDT)
Date: Wed, 22 May 2024 10:07:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 7/7] iommu/riscv: Paging domain support
Message-ID: <20240522-b25680db03b547123f1cd59a@orel>
References: <cover.1715708679.git.tjeznach@rivosinc.com>
 <1ddb50a47c86d384157a979a7475b45f807ba81e.1715708679.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ddb50a47c86d384157a979a7475b45f807ba81e.1715708679.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_010718_175693_3912C726 
X-CRM114-Status: GOOD (  12.75  )
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

On Tue, May 14, 2024 at 11:16:19AM GMT, Tomasz Jeznach wrote:
...
> +static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
> +				 struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +	struct riscv_iommu_bond *bond;
> +	struct list_head *bonds;
> +
> +	bond = kzalloc(sizeof(*bond), GFP_KERNEL);
> +	if (!bond)
> +		return -ENOMEM;
> +	bond->dev = dev;
> +
> +	/*
> +	 * List of devices attached to the domain is arranged based on
> +	 * managed IOMMU device.
> +	 */
> +
> +	spin_lock(&domain->lock);
> +	list_for_each_rcu(bonds, &domain->bonds)
> +		if (dev_to_iommu(list_entry(bonds, struct riscv_iommu_bond, list)->dev) == iommu)
> +			break;

We should wrap this list_for_each_rcu() in rcu_read_lock() and
rcu_read_unlock().

Thanks,
drew

> +	list_add_rcu(&bond->list, bonds);
> +	spin_unlock(&domain->lock);
> +
> +	/* Synchronize with riscv_iommu_iotlb_inval() sequence. See comment below. */
> +	smp_mb();
> +
> +	return 0;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
