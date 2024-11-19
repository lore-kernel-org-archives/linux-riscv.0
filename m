Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC558D44167
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmVJVzaWdhxgvU+k1jvOBGU95lZgqmH0NCln8AsCW7w=; b=3/trV5v6hZbIzE
	jKM1lVbZKQv9doqX5PttJPQ7B3xD1EUsk1pMLIe1Q8gIf2E8z/5/0zE5lZTlal0c5qTv2LZqEy4g2
	ZWffJZpaxdEZP1vPbpeqAvh9rROSIEv3mJCJ/76QlHcw6i8qZqDHi2WVSuMd4wsBX5dv7TK9AUz52
	KejbF9UZNTyixbFZz821N58WKRFhdjZ4ThC25z0RYO4tVUKHh48Nt+T+25BrD+JjPqQU9hbnHCrDD
	/jD+iRLewfX79UWVXtZ/+d9Vg/R+b6wLNSDfwsy9eqvg3hrV7ZhPnCh8q6cqpfsRwusIZCNN6qNlS
	mXckbSTy2DYiOwUgP1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPzf-0000000CpXj-28jn;
	Tue, 19 Nov 2024 15:18:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPl0-0000000ClsA-2O7f
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 15:03:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so39692265e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 07:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732028588; x=1732633388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwuBbcUvdsJsNlAmA8kNK2a4zz8OYZ18Ka20Jiz0Pm0=;
        b=Pk7ZtmlWxgfFTSbD//G+vzufjnEX/b3kdegE4YnWDBKfFoo6U525vW1PqUsUDJeSVt
         4z066i39JrltxgnvOxXWyCH5xvC0Ok0TnXw0yEbBLZtSTmbb/pmwgzXktgvk8ejYwW1l
         Ey0qZQP7CwqLMAH5RNs2PEvYjsIHNsCqnE1IQOixeMAtwHcA0MafdYoMOV5W6sWHupRO
         xalcLP4VaKYSMMqWhAtFLwdyXuynnKTgg/u2OMnS/m5vOd33j2p+0x3LhXu0EnzO8wUm
         CjS0pJROXKDsIPgP+n/RwXNz1GZRvZ3s7aXBXuvM/3wDaqi1lXqkF6pALBG7w6S1cIHd
         eXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028588; x=1732633388;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwuBbcUvdsJsNlAmA8kNK2a4zz8OYZ18Ka20Jiz0Pm0=;
        b=f4UNCJk5N7woWeuBfw3Cm3lltcoYIjjHeqqgZaHkqNHExuO6YQhgVGc3ER8WPtFvxT
         lsY0j9p+ZC9aNEacuDQQ2S6OlKtN7igPaIpsUt53qus7T45bAWky8e2AtEz45zhcwrJ1
         VVwu3DOLZoDbwqB71xdl8+G10Dl56PIuFZeaOtdpwEnNUlZ1LOPAXRirQZuhGyWPIzW9
         ybRms/EhWvzaddFSvw2YGgA+rxBWsG+5p92yHTmIyX6sztAqWa8EBqCijfj1NzKNGA+b
         LQLatT0sJgQj4n7wSpD3C2CNSuVkxnonq2K7RsrnW0L/IFr/V67lVWM6SiB0Q+L5eXdh
         4GWA==
X-Forwarded-Encrypted: i=1; AJvYcCV/iNIJtyLs+W8j+VRnQRcIJgWSwoke6ezriJjEBidPdm5wL5gWJDRel1zdFW1I4J7PhAiadr3/wdT8VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw73kP4N+2vZEzI29YoajXW1BPRVQWWSoAdN/OPBEEL4pVgxZWC
	DYrtZBiWBP2M4lUss3yy0TlxQ1+vL72RB/WCoY6u51FpctlQXB8wH3P0ht1lWHI=
X-Google-Smtp-Source: AGHT+IFvFX7MJ8Tu28i9oH50avvlnQXkr7wiV44jnwVsLQSm9Sm8I2ZZy94Fp/+zJ+w9zxPk7qMCZA==
X-Received: by 2002:a05:6000:178d:b0:382:5137:30eb with SMTP id ffacd0b85a97d-382513734fdmr780854f8f.8.1732028585939;
        Tue, 19 Nov 2024 07:03:05 -0800 (PST)
Received: from [127.0.0.1] (78-80-61-208.customers.tmcz.cz. [78.80.61.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28bc11sm197286915e9.31.2024.11.19.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:03:05 -0800 (PST)
Date: Tue, 19 Nov 2024 16:03:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org,
 tglx@linutronix.de, alex.williamson@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_08/15=5D_iommu/riscv=3A_A?=
 =?US-ASCII?Q?dd_IRQ_domain_for_interrupt_remapping?=
In-Reply-To: <20241119140047.GC559636@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com> <20241114161845.502027-25-ajones@ventanamicro.com> <20241118184336.GB559636@ziepe.ca> <20241119-62ff49fc1eedba051838dba2@orel> <20241119140047.GC559636@ziepe.ca>
Message-ID: <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_070310_668909_870BF085 
X-CRM114-Status: GOOD (  38.33  )
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

On November 19, 2024 3:00:47 PM GMT+01:00, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>On Tue, Nov 19, 2024 at 08:49:37AM +0100, Andrew Jones wrote:
>> On Mon, Nov 18, 2024 at 02:43:36PM -0400, Jason Gunthorpe wrote:
>> > On Thu, Nov 14, 2024 at 05:18:53PM +0100, Andrew Jones wrote:
>> > > @@ -1276,10 +1279,30 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>> > >  	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>> > >  	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>> > >  	struct riscv_iommu_dc dc = {0};
>> > > +	int ret;
>> > >  
>> > >  	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
>> > >  		return -ENODEV;
>> > >  
>> > > +	if (riscv_iommu_bond_link(domain, dev))
>> > > +		return -ENOMEM;
>> > > +
>> > > +	if (iommu_domain->type == IOMMU_DOMAIN_UNMANAGED) {
>> > 
>> > Drivers should not be making tests like this.
>> > 
>> > > +		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
>> > > +						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
>> > > +		if (domain->gscid < 0) {
>> > > +			riscv_iommu_bond_unlink(domain, dev);
>> > > +			return -ENOMEM;
>> > > +		}
>> > > +
>> > > +		ret = riscv_iommu_irq_domain_create(domain, dev);
>> > > +		if (ret) {
>> > > +			riscv_iommu_bond_unlink(domain, dev);
>> > > +			ida_free(&riscv_iommu_gscids, domain->gscid);
>> > > +			return ret;
>> > > +		}
>> > > +	}
>> > 
>> > What are you trying to do? Make something behave different for VFIO?
>> > That isn't OK, we are trying to remove all the hacky VFIO special
>> > cases in drivers.
>> > 
>> > What is the HW issue here? It is very very strange (and probably not
>> > going to work right) that the irq domains change when domain
>> > attachment changes.
>> > 
>> > The IRQ setup should really be fixed before any device drivers probe
>> > onto the device.
>> 
>> I can't disagree with the statement that this looks hacky, but considering
>> a VFIO domain needs to use the g-stage for its single-stage translation
>> and a paging domain for the host would use s-stage, then it seems we need
>> to identify the VFIO domains for their special treatment.
>
>This is the wrong thinking entirely. There is no such thing as a "VFIO
>domain".
>
>Default VFIO created domains should act excatly the same as a DMA API
>domain.
>
>If you want your system to have irq remapping, then it should be on by
>default and DMA API gets remapping too. There would need to be a very
>strong reason not to do that in order to make something special for
>riscv. If so you'd need to add some kind of flag to select it.
>
>Until you reach nested translation there is no "need" for VFIO to use
>any particular stage. The design is that default VFIO uses the same
>stage as the DMA API because it is doing the same basic default
>translation function.

The RISC-V IOMMU needs to use g-stage for device assignment, if we also want to enable irqbypass, because the IOMMU is specified to only look at the MSI table when g-stage is in use. This is actually another reason the irq domain only makes sense for device assignment.

>
>Nested translation has a control to select the stage, and you can
>then force the g-stage for VFIO users at that point.

We could force riscv device assignment to always be nested, and when not providing an iommu to the guest, it will still be single-stage, but g-stage, but I don't think that's currently possible with VFIO, is it?

>
>Regardless, you must not use UNMANAGED as some indication of VFIO,
>that is not what it means, that is not what it is for.
>
>> Is there an example of converting VFIO special casing in other
>> drivers to something cleaner that you can point me at?
>
>Nobody has had an issue where they want interrupt remapping on/off
>depending on VFIO. I think that is inherently wrong.
>
>> The IRQ domain will only be useful for device assignment, as that's when
>> an MSI translation will be needed. I can't think of any problems that
>> could arise from only creating the IRQ domain when probing assigned
>> devices, but I could certainly be missing something. Do you have some
>> potential problems in mind?
>
>I'm not an expert in the interrupt subsystem, but my understanding was
>we expect the interrupt domains/etc to be static once a device driver
>is probed. Changing things during iommu domain attach is after drivers
>are probed. I don't really expect it to work correctly in all corner
>cases.

With VFIO the iommu domain attach comes after an unbind/bind, so the new driver is probed. I think that's a safe time. However, if there could be cases where the attach does not follow an unbind/bind, then I agree that wouldn't be safe. I'll consider always creating an IRQ domain, even if it won't provide any additional functionality unless the device is assigned.

>
>VFIO is allowed to change the translation as it operates and we expect
>that interrupts are not disturbed.
>

The IRQ domain stays the same during operation, the only changes are the mappings from what the guest believes are its s-mode interrupt files to the hypervisor selected guest interrupt files, and these changes are made possible by the IRQ domain's vcpu-affinity support.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
