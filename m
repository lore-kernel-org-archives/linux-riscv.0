Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBADE6916C
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+GphSoWyZFTbTGLp03L6rbPwEgL897Xd2QYbActP2s=; b=vM1LGHrhGkaQmm
	MV/63X8xkNP68xS+dJMWB3YM74j7P6dgQHIUdSYKzh4UaL49Z/82o18Dh4BglVZg1rfMi+Zbe2Xri
	JE4rilDkrIWbd/BVMtp/DqwCcF9QUK6g3t6f81VuNkGtmZLjltQO3PmSMQOaTMnCogxkH6+ydFLWu
	mvAaY5G8bbQB6tDfsdA9lSAwp9Ft8ECdZRBPS1gLEL44/D9IKyV7qRDrwR+OMkJRwWS6KZA1wdcxo
	qVXZVgFUjL//dEVUxvfA5fYq9w9X0eggpAy7ttBDS+EFqgdarQ9mA/qwHCRhw4REYsbFDg/NgRXse
	vM0OLxwnfmjpdZTUWFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVfH-00000002jbR-0Y7o;
	Fri, 22 Nov 2024 15:33:47 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVfD-00000002jaT-2wSS
	for linux-riscv@lists.infradead.org;
	Fri, 22 Nov 2024 15:33:45 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-460a415633fso12550911cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2024 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1732289622; x=1732894422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOCWTCKBT/RmxXc7uytrHzl3RpOs2C/hy6YIYREc/Lg=;
        b=BEQma2ZYSPb4N0pAynzosqnNxdAhfx9Kx0TRNPQnKanmqP3VRgPppfCNGyU7pIgrKd
         VpD+eSivy48hYz9VcZQ83V7+078ocxs+lsihhz+aR33Ea0fWn4PQIvdQAd7+euTnCJDw
         x8zNS8lO6tDyIGV1WLvdeKmLgsP1FyOK5XbAafmEg+hEvKuY8Gva0F1eIeDSK8HvR1Kz
         bG+mFW0PaVKYmf73xpc2jiK12z8L6KScM4oG0ZV0pWvzo+PxZBAHtoqujsK52gHGaFmB
         vAKuX738oC7EMjLSO2lVvlo2W3RU3FgiMJ1stJF2/zLUCArU4bD3TFMq9eU/OyvkNxHJ
         v9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732289622; x=1732894422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOCWTCKBT/RmxXc7uytrHzl3RpOs2C/hy6YIYREc/Lg=;
        b=E5P4KSOBELUJcLsqZ7JCjFS5ifOaNC6TkyVY7EhiIsEMbWxvdEQaNazOxkVTFH86lP
         m+lt+VGYvSct0Z5M7V3I7ksB2m45w5a8m5av3C/31lsOjufwRd8G0Ro7vTjW805+bSZu
         asSwlgEn5x0WxoBfD23a03i+iOJrsVwPII0qr1Wef5YyUTa/ya7IcVr+Vw8J0pLu2fqQ
         gVXkBnzebrIzOccZ4GWIYM0sOQ8D9hM6w4l2LearIgFlVmSdCQwuKMrhLqSzpA2LjI7H
         MBHJGzmVMfL0G2QSWRwpfPTpOwS7iXskIWO/RX31YSIoz6Kzx5kPe+937tX+HaIcDIKq
         ogPA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKhQCs3X0WTWmZ59TQz9h1jYu8NdoiGqIXMk3RMtbXOipt9gP16d9BEJ+mex+pRzqpUH+0C5dyBXWPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8oPvQS2roCJ/ilx20QN9KItFaDydFaTon2n/OA6aJ1lNfls7
	3MmhIyK1arYRV82LXNgnlWy5gdKxDUBklBK3bc885R/Tx4IoFRNQeLfqemZwMhI=
X-Gm-Gg: ASbGncvzdrl9dUZ5aOK38xEC6nllhJLTqYMaUJ3o5HbAAk0Fu7ak6ErBnUdpdKC7Fku
	9XSdRXT3TlwiEncNMEvZiRtHAw5Rp4+FScPNTOvT8VVDsrdWD5/Sj37h+nlxP8hJWb6lDRjnFbr
	UeQ68lmEyH79aZdc54dPBMc1TFQGkjqTxDSWSKcoeUA4c1rW5PUTkp7zsgsB7p0o/EfkXWKcNhB
	o6drqO44CTCNTNryqHzw+hP9qJGdFxILkhyyIOLmhnuR14sDVxP4sp8QCOYWkj9qiB+1E7UcbWA
	5xGx3428jA0tBzdN61mLeFY=
X-Google-Smtp-Source: AGHT+IE/84E5Hy9Mt/fOujPHeev+IBUL62FBMMJZ/uhWKf39i8Fv9iytqMnfgjTl0nmjaLXsEb0oaw==
X-Received: by 2002:a05:622a:388:b0:461:186b:6b9d with SMTP id d75a77b69052e-4653d568a95mr41065441cf.17.1732289621751;
        Fri, 22 Nov 2024 07:33:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b514152bbasm95886085a.100.2024.11.22.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:33:40 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tEVfA-00000004Tw6-1J4a;
	Fri, 22 Nov 2024 11:33:40 -0400
Date: Fri, 22 Nov 2024 11:33:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	zong.li@sifive.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org,
	tglx@linutronix.de, alex.williamson@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241122153340.GC773835@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
 <20241121-4e637c492d554280dec3b077@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241121-4e637c492d554280dec3b077@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_073343_778421_58F96E9D 
X-CRM114-Status: GOOD (  28.72  )
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

On Fri, Nov 22, 2024 at 04:11:36PM +0100, Andrew Jones wrote:

> The reason is that the RISC-V IOMMU only checks the MSI table, i.e.
> enables its support for MSI remapping, when the g-stage (second-stage)
> page table is in use. However, the expected virtual memory scheme for an
> OS to use for DMA would be to have s-stage (first-stage) in use and the
> g-stage set to 'Bare' (not in use). 

That isn't really a technical reason.

> OIOW, it doesn't appear the spec authors expected MSI remapping to
> be enabled for the host DMA use case.  That does make some sense,
> since it's actually not necessary. For the host DMA use case,
> providing mappings for each s-mode interrupt file which the device
> is allowed to write to in the s-stage page table sufficiently
> enables MSIs to be delivered.

Well, that seems to be the main problem here. You are grappling with a
spec design that doesn't match the SW expecations. Since it has
deviated from what everyone else has done you now have extra
challenges to resolve in some way.

Just always using interrupt remapping if the HW is capable of
interrupt remapping and ignoring the spec "expectation" is a nice a
simple way to make things work with existing Linux.

> If "default VFIO" means VFIO without irqbypass, then it would work the
> same as the DMA API, assuming all mappings for all necessary s-mode
> interrupt files are created (something the DMA API needs as well).
> However, VFIO would also need 'vfio_iommu_type1.allow_unsafe_interrupts=1'
> to be set for this no-irqbypass configuration.

Which isn't what anyone wants, you need to make the DMA API domain be
fully functional so that VFIO works.

> > That isn't ideal, the translation under the IRQs shouldn't really be
> > changing as the translation under the IOMMU changes.
> 
> Unless the device is assigned to a guest, then the IRQ domain wouldn't
> do anything at all (it'd just sit between the device and the device's
> old MSI parent domain), but it also wouldn't come and go, risking issues
> with anything sensitive to changes in the IRQ domain hierarchy.

VFIO isn't restricted to such a simple use model. You have to support
all the generality, which includes fully supporting changing the iommu
translation on the fly.

> > Further, VFIO assumes iommu_group_has_isolated_msi(), ie
> > IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
> > be true if the iommu is flapping all about? What will you do when VFIO
> > has it attached to a blocked domain?
> > 
> > It just doesn't make sense to change something so fundamental as the
> > interrupt path on an iommu domain attachement. :\
> 
> Yes, it does appear I should be doing this at iommu device probe time
> instead. It won't provide any additional functionality to use cases which
> aren't assigning devices to guests, but it also won't hurt, and it should
> avoid the risks you point out.

Even if you statically create the domain you can't change the value of
IRQ_DOMAIN_FLAG_ISOLATED_MSI depending on what is currently attached
to the IOMMU.

What you are trying to do is not supported by the software stack right
now. You need to make much bigger, more intrusive changes, if you
really want to make interrupt remapping dynamic.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
