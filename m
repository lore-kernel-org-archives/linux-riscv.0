Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790ABC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+4K2Z8Fk3sJxXmUKhTROjnBdMLjJmqlJh1EKisVgJw=; b=yxi4XRYC+XDDst
	NDlk+j/oZUM6I9bKKZiZhsl9xTTURwKnO6tTBrZv1Gv1mPhe28xyzvGncJUIITAN7mb8UF6MpzXmB
	qZ0XKWgHgNN9LUGsq9AGm1Yu5/7lY/F3uRvUd4sZ+/kGDqguE4PSbu0ZauzJmbwdcVBBCUveNPweQ
	0XFjqgRVyHC0ALcKIXoVhyYtJKlP1w3wCxv9vGXkoKuyDAjwI2/5jJB7ynZHfsoDDtgSFXzG3uOna
	P8fiyvuxrwHM3odxNF8R+3ruQr3QxBPsMjBVz+TCLeD3LQBU8o/0g+5UJ2+e898aJLGhLxH+C8xeR
	2sL3gw971iT8xSIQ1HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ApA-00000009myS-1p7h;
	Wed, 01 May 2024 14:20:44 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Ap6-00000009mxi-415K
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 14:20:42 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-790f4650f93so321662585a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714573238; x=1715178038; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OZdviol793TFl9mjb+jCdq8bdDZ0SVd44kIwXS0lLc=;
        b=OrfuY3ZUT9Ai6wpw+PwmttKW50SKZ4JPuGk8c6EsVU3Wko2aQpjRf+MbKEPjgy85xA
         DZHSSl4GvYXXKCsnRkjAmKxFL2fQE4dyjTinpxJ/UCc0TBK8l+VV5XnUtX792AHGn4Tu
         oeQ6vFcAHes0gLwTtAyS/knc+wDS5sG21CigLpx2vbtU4ReLAN1fC+9EjTxZfaG3fhQA
         rfreOTI93PP8m6OM9I94+gtmoAMYBDdTQ8j9TGMQtNak93ZoG9Z9jJ6+cJTmQAZKHOdm
         5jIpCzYsf4rOvYAOVIbrmoUqsoG1aIL6KFLUJCSXeHeFy5pHbPvZb4PEBslqYX+9Aqz/
         xr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714573238; x=1715178038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OZdviol793TFl9mjb+jCdq8bdDZ0SVd44kIwXS0lLc=;
        b=gulvrYQPc+HNXLeaTEzvVK9ldQZo1M5kOUdiOyhqIQem8F7zhMcWxy9OAcTAMpMgEU
         zyRa/yjD8RALqHJvze3OydxUVqjRevSfidRjCpHLwOuSo4lDD5Tk8Gsf354bSUajt5a0
         jlWcrzjuxb9aVxIb/BuDwWe6wwKrQOYiZtrpYkLZuxGwz2UeFJ5qr7g5xtFZ3Q/1u8F0
         W9AJX4+7vmUKAoKOl6nAQuHLncrwWFRIVZ3rJjDv2xfbTeBrS2v/gnUiQmo7TOjHsq00
         5G694Fvh0G5wsOTWfi6lFq9+9B/t5DWNfTQ+egm7Dg/tEpSeX3MKD4nVunIO9pfTWbjm
         zTug==
X-Forwarded-Encrypted: i=1; AJvYcCWx4kFfco9ovTcMfNmA/jdZJLd5Z4QXr+olNUElDX5Bi5PpK1pMwnBBHtQVbljVwhENKTY5+j233et4iZ3PvC1KYpdL812IO9iipyLv2eSp
X-Gm-Message-State: AOJu0YzwXzyybe3++3ps2wJHRg4OPgL2iMfDyv/JnJv++xj1UqzYJbIt
	anb361qeYT83Vf1s4JwBzHJUvFGkOnqGWCgHk7CckBIfDjt40NV/KtuY8uGo6AQ=
X-Google-Smtp-Source: AGHT+IFiJIn1eBd9gVbe/49MW98HCOu6t3+umtKOrKsFADYGs/1ovi0cAzILGroi/jB4gcqE/mL69A==
X-Received: by 2002:a05:620a:2719:b0:78d:67de:50a0 with SMTP id b25-20020a05620a271900b0078d67de50a0mr3265589qkp.44.1714573238426;
        Wed, 01 May 2024 07:20:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id q24-20020a05620a0c9800b0078d677e72f3sm12388656qki.118.2024.05.01.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:20:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2Ap3-00DSge-F2;
	Wed, 01 May 2024 11:20:37 -0300
Date: Wed, 1 May 2024 11:20:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240501142037.GC1723318@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <aa5592da66fe72acd4d4730f544882042e7b5293.1714494653.git.tjeznach@rivosinc.com>
 <6b4a4dc0-ac9e-43cd-bd84-447df2370dde@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b4a4dc0-ac9e-43cd-bd84-447df2370dde@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_072041_024644_7DEED528 
X-CRM114-Status: GOOD (  24.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 01, 2024 at 06:26:20PM +0800, Baolu Lu wrote:
> On 2024/5/1 4:01, Tomasz Jeznach wrote:
> > +static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
> > +{
> > +	u64 ddtp;
> > +
> > +	/*
> > +	 * Make sure the IOMMU is switched off or in pass-through mode during regular
> > +	 * boot flow and disable translation when we boot into a kexec kernel and the
> > +	 * previous kernel left them enabled.
> > +	 */
> > +	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
> > +	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
> > +		return -EBUSY;
> > +
> > +	if (FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp) > RISCV_IOMMU_DDTP_MODE_BARE) {
> > +		if (!is_kdump_kernel())
> 
> Is kdump supported for RISC-V architectures?  If so, the documentation
> in Documentation/admin-guide/kdump/kdump.rst might need an update.
> 
> There is a possibility of ongoing DMAs during the boot process of the
> kdump capture kernel because there's a small chance of legacy DMA setups
> targeting any memory location. Kdump typically allows these ongoing DMA
> transfers to complete, assuming they were intended for valid memory
> regions.
> 
> The IOMMU subsystem implements a default domain deferred attachment
> mechanism for this. In the kdump capture kernel, the whole device
> context tables are copied from the original kernel and will be
> overridden once the device driver calls the kernel DMA interface for the
> first time. This assumes that all old DMA transfers are completed after
> the driver's takeover.
> 
> Will you consider this for RISC-V architecture as well?

It seems we decided not to do that mess in ARM..

New architectures doing kdump should put the iommu in a full blocking
state before handing over the next kernel, and this implies that
devices drivers need to cleanly suspend their DMAs before going into
the next kernel.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
