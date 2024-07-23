Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C512AC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PNr2XXtZrXCLEDB6yeve6gsUlOiViK57qWUgXyLSNo=; b=3XjhuF/7mEOwIR
	QJDNybK09PdJsUXzQ9gu9KefylGDwlaGvAk2Sv+eL1fQ/qp/QGMjPf3KnoOtx6biv3Vfb2YJ3fXHS
	n4GP7iwmFeStPcd+Wpot2t32pg4YOREArYub1ZRI1STExySr1SsHELNzDCBg5LlpZ8cAdJ/s1MC8R
	t5FYiIt1jGTOTpj1tsUaIU3hoTjg2rSd2u6P7n29t8LOf8Au34zBkwnomhsvqVPrsFw3EbqmUWHzN
	uk5CCkwB/J90meu6LsIVST5oNj8b9+v3Ro2qtLjeMobBPE699LJ5gkFVByg+0EbzwlBC221wBvpsh
	WUi+Hn6yhND5PSVYhOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFG1-0000000CTHh-37CB;
	Tue, 23 Jul 2024 13:08:45 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFFy-0000000CTH0-2vXK
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 13:08:43 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-447e2d719afso37431041cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jul 2024 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1721740120; x=1722344920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+axTqVsfgDHJ4ABgdOvxQq1+BYfsc3vDRLQbJOeOOAo=;
        b=BSgm8K/Q0u81qjawSmLhW09lkaifv57w17nOAjlOpfBVrslVY60yjfbLJGyrAKKdtH
         Q87SAGWg3z0lzfhA7dwcgOEEf0W9C7LPdZJN3ifNhY8iApmOCcoPluWTpefnGFxndkzp
         aPM36Qm92mbutnHW8xL5lGmeAFhXts77Sgtyeu+mOo3vlzvffuEbtRryvMQYV2H+J4cm
         p0os0/DnT3EPop3zTlCRm7aDKJmx4gT5zOQxSPdJmy956VPZiNDJ/JTJA6Ntg0Tdqh0G
         2QmyfYDUai7147DjIPKhD3lMeHO/L9dJKkpKKxz4WBpwTs/xSLyibbMlQHtypw0UqFu/
         GSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740120; x=1722344920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+axTqVsfgDHJ4ABgdOvxQq1+BYfsc3vDRLQbJOeOOAo=;
        b=RNkhnx4YCInRQbhn1v5RUtn/R1IGZKChe5v+kjpUV9jwht9oXtU1lxCs3IzTkECKnU
         JgAL8XLraFCFRA5d09oX8Dcb6vZ2nXwUHWGh9w+sJsNs7yV9vtO/sqpC51K5NyfnSYtL
         Qs6KCT9MeVBuGLD9Vu0e41LdoGolB1Z8WKOvjgmkpXpxoPXaGuLUPzibjtAIaTrn8d55
         OEO5K0BQtrXuk1iRB3oDGt/+7OtpG5CY6OB/+c7JW+pWV/ck+cYjoq58jla07i5yaijv
         a0IRlgupzTusoPQWYYeiprhfVx5JJ47A/uRtvCjVfriY6BIVeWH3Xm8vA0SZjh6tSvTo
         X4LA==
X-Forwarded-Encrypted: i=1; AJvYcCUMrVPsuvexnq+wuhkYqXZ5xMvxBpW+QDh4UJRG5ZzQDsPL7Vthj4AET9ZSxaFrU/tv+NOq0yEuRtTNscXyVV/1RpnXYcPaQ/n0PcdjElSN
X-Gm-Message-State: AOJu0YysfbqNqczFlYTXUT3lo/LuUHeGRVIkLDyxqVCrQEH5bBSW33AL
	gCsU/6zZffn88nbTW15Z/s1mZLPVAsydQvv/gjdNs1yTv3FeK0Ij1em6bNN71ss=
X-Google-Smtp-Source: AGHT+IFdiAXbdFdhLaoPZtxacfRA4jPBGSoBhjNyXiB95amXvNCVw1j1puDQQ+mYwJ3alK8exv17nA==
X-Received: by 2002:a05:622a:ca:b0:43e:1231:1040 with SMTP id d75a77b69052e-44fc7fa8970mr35543231cf.20.1721740120332;
        Tue, 23 Jul 2024 06:08:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd3cfccsm44348711cf.54.2024.07.23.06.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:08:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sWFFv-003hHI-CL;
	Tue, 23 Jul 2024 10:08:39 -0300
Date: Tue, 23 Jul 2024 10:08:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
Message-ID: <20240723130839.GL14050@ziepe.ca>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
 <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
 <CANXhq0rpX=+YZLfzLcBmHPUxBpo+xWPY9XaNkV0eQAX72KCFKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rpX=+YZLfzLcBmHPUxBpo+xWPY9XaNkV0eQAX72KCFKw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_060842_758830_0F4DBA4B 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 19, 2024 at 02:33:13PM +0800, Zong Li wrote:

> > +static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
> > +{
> > +       struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> > +       const unsigned long pfn = virt_to_pfn(domain->pgd_root);
> > +
> > +       WARN_ON(!list_empty(&domain->bonds));
> 
> Hi Tomasz,
> I recently hit the issue here when I removed a device. I think we need
> to unlink the device's bond in domain before releasing domain.
> Do you mind pick the following modification in this patch? Thanks.
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 859cdd455576..f0707147e706 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1541,6 +1541,8 @@ static void riscv_iommu_release_device(struct device *dev)
>  {
>         struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> 
> +       riscv_iommu_bond_unlink(info->domain, dev);
> +
>         synchronize_rcu();
>         kfree(info);
>  }

That does not seem the right place to put that, or something else has
gone wrong becuase:

> >  static const struct iommu_ops riscv_iommu_ops = {
> > +       .pgsize_bitmap = SZ_4K,
> >         .of_xlate = riscv_iommu_of_xlate,
> >         .identity_domain = &riscv_iommu_identity_domain,
> >         .blocked_domain = &riscv_iommu_blocking_domain,
> >         .release_domain = &riscv_iommu_blocking_domain,

The above use of release_domain will attach to the blocking domain
prior to calling release_device and when doing so everything about any
previous domain should have been fully cleaned up.

So info->domain should be the blocking domain during release_device
(if not that is another bug)

And attaching the blocking domain should have cleared the
domain->bonds of any prior paging domain.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
