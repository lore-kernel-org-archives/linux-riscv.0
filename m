Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97953C10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNNkqr+Ig4TjdQ3k8i6xDurU8VpIZclBJRxdd2VsTBI=; b=DXipDxVutTNeEv
	fOKE4t6XKEbOOTy+JkglT2O8pOpFCIoMJhbtg/cdoWZ7LmlHhl20jrLFXPFTDdp6Ewf8W043dU+51
	YeGoX/aEEVJnpigLIVMA65JHGRqkFBWW1ZEaEjJ4WJowDPSusnEHRu6lAqIOsY/i4MJ0bWYAcaSNz
	jh3lmjwB8juXn9+hLHVmEjh9oPMVCzvKvWmCF9iLYEVStx15xg7u5sVHKK2hUNhrbaOqngheFxjxn
	epWLfs0rgZIK460st40MSKAc5YZRo3PE2GfzyRRzJLUnZXw4dYXe5fb/Io9Pvh+vXJ8neiQrRG8NW
	VaMJ7vz5QRYhcNAa7vQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzmDU-00000006OKb-2EXX;
	Wed, 24 Apr 2024 23:39:56 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzmDR-00000006OK9-3q7G
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 23:39:55 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c751bf249cso299616b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 16:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714001992; x=1714606792; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu6etYv5ocPJpDTio+T7Fs2/aD2ssrnDfuoC/AGwC3E=;
        b=dO2r9/DLNqzqxOndE/ZwoU9RtnseZSG6PqBvWztXGPcWo7KTjiYOH6vISoOFOzHxBj
         LrXlXGyFydAFwrenF7qhX3hzKAIsXNNnRAOmk+7cCH+nTShUTTLjVR6cZ/w7tbDePTeR
         3n6EEaabrQ0PcDYuf9A9LSrp4bc7Hqj7I2BhQgRa8okPryKeOwiKO2NHfN3f6+tMXTBb
         D77G/D0ofENfTAG7XtwuFreSPOU1Dtk7WXgvXumqa1ZepTYa5OpMkYL5Qm/yn32Oi7Lt
         XhScPpTAQGTNnoO7a+eYbiqOWq0LIfZhy/UahbmXA54dvEUvW8LJghlHdQ3Yhu5DgQxW
         bSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714001992; x=1714606792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu6etYv5ocPJpDTio+T7Fs2/aD2ssrnDfuoC/AGwC3E=;
        b=eEb7s6DMMVZ0/DXYuzc1Zci5oZST/v8Sh9uX0Yx6Guo0kPOpajw/oNed/Py2lHaaPS
         8fhCYzP2HEZywq59f4ywcV5OVsAr73Ril0ln0tMzVitK41FObwFwNMJJBiEFqrCmyR5R
         kXSQfXLZtnsqN778nS7Nd0SqKwkJvxeC8rnjdubxlVNPT9xBWsdPLTj1xMZlgXHS3mSo
         bzqvf1MZaj2j34KOT6pSjEHQs7fA9YRjF0R/E80QcqYuUOKTyJjj2UfizLwSlsNdablC
         +ZiUP6YEIDL+sy64LA3QPpcB59hPeFCjDcNWwYg0A0yfOzs3347c9cz8mkfAZNfbLSNP
         kVEw==
X-Forwarded-Encrypted: i=1; AJvYcCVMRXIvXtJCqlvsI8noXhZGjIlQFkgDncdmspMCna9MjlkONUBiucWjjXUmDWu127PyKJsF74Irn8EKfQVR0TkEQOP8oLrHw7FN/ATGeG4o
X-Gm-Message-State: AOJu0YwsN5qblzRygcAxdoNR7BwWhn3cE5p/syEUkvuJkVceTC4ndBXr
	LYfVsm28LTprg13pE1m7M2fhCF9Mde7zBaAmSCXtbADDq4JrveWCIGrhwu7ygQ0=
X-Google-Smtp-Source: AGHT+IFHSoQmOFvkIt4UdS9vVvm/+9LOICy267nTOZxeYgmuzEs2JusAIDrqy2AljxZbMWh+yyg/Lg==
X-Received: by 2002:a05:6870:9602:b0:22e:bc50:3492 with SMTP id d2-20020a056870960200b0022ebc503492mr4335970oaq.47.1714001992183;
        Wed, 24 Apr 2024 16:39:52 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id pv10-20020a0568709d8a00b0023b50a85913sm78072oab.38.2024.04.24.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 16:39:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rzmDO-00A1fN-HT;
	Wed, 24 Apr 2024 20:39:50 -0300
Date: Wed, 24 Apr 2024 20:39:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
Message-ID: <20240424233950.GJ231144@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
 <20240419125627.GD223006@ziepe.ca>
 <CAH2o1u5+XD9YN=gdMVtfkyhKoKha0UpwKgOVbCAwOQa+saPfRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u5+XD9YN=gdMVtfkyhKoKha0UpwKgOVbCAwOQa+saPfRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_163953_980597_5FBEA4F9 
X-CRM114-Status: GOOD (  24.36  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2024 at 04:30:45PM -0700, Tomasz Jeznach wrote:
> > > @@ -46,6 +46,10 @@ MODULE_LICENSE("GPL");
> > >  #define dev_to_iommu(dev) \
> > >       container_of((dev)->iommu->iommu_dev, struct riscv_iommu_device, iommu)
> > >
> > > +/* IOMMU PSCID allocation namespace. */
> > > +static DEFINE_IDA(riscv_iommu_pscids);
> > > +#define RISCV_IOMMU_MAX_PSCID                BIT(20)
> > > +
> >
> > You may consider putting this IDA in the riscv_iommu_device() and move
> > the pscid from the domain to the bond?
> >
> 
> I've been considering containing IDA inside riscv_iommu_device at some
> point,  but it made PCSID management more complicated.  In the follow
> up patches it is desired for PSCID to be unique across all IOMMUs in
> the system (within guest's GSCID), as the protection domains might
> (and will) be shared between more than single IOMMU device.

The PCSID isn't scoped under the GSCID? That doesn't sound very good,
it means VM's can't direct issue invalidation with their local view of
the PCSID space?

> > This seems suboptimal, you probably want to copy the new design that
> > Intel is doing where you allocate "bonds" that are already
> > de-duplicated. Ie if I have 10 devices on the same iommu sharing the
> > domain the above will invalidate the PSCID 10 times. It should only be
> > done once.
> >
> > ie add a "bond" for the (iommu,pscid) and refcount that based on how
> > many devices are used. Then another "bond" for the ATS stuff eventually.
> >
> 
> Agree, not perfect to send duplicate invalidations.
> This should improve with follow up patchsets introducing of SVA
> (reusing the same, extended bond structure) and update to send IOTLB
> range invalidations.
> 
> For this change I've decided to go with as simple as possible
> implementation and over-invalidate for domains with multiple devices
> attached. Hope this makes sense.

It is fine as long as you do fix it..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
