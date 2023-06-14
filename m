Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C5EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTIBeUIUDvsMXbt+A0ZC1NbojZE3Jgifd1TBJbuOBeA=; b=KyCSrBSDd+fTcD
	ccGBNk+5dAdIaM5sSKKVoWb7QFrwVXFzrLT+3d+7HtxDbO0IaWMjlq02KnKiZAp6P0+Q7mrqJR26G
	Ufsya5JpZpHk5DF2tTreThTekvugFmR+IBn9Osq8tAK+M8YqFuGKoHi14LtnekrxS3j6idu/SXI7Z
	FqS/5YnKkhf6tjrRPfwgJmcO8DlWFO66BoCQPc0ZSbY3bI+1nYwAVKJzPCykJvW770kpDnqkSNioA
	PDavr1tDpgHoHb68OOv7LqeCFYCZVnYexpd7mL0TJqiB55lUhy39Vgj1ZH682F71M0ViWvieiFzAY
	m1ztutaIaJYMwfoTA5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Rl6-00BwbN-0p;
	Wed, 14 Jun 2023 14:46:04 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Rl4-00Bwat-0q
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 14:46:03 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-62fe192f7d3so6855676d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686753961; x=1689345961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCPI5ZcRcUuga+hwGvL6zbC51EZUbGkp50/wT3gC0jw=;
        b=bxe8uVF1FEFSaF8JRbza9nJxP5K4Z2yuCd6J5OgmRschaBVxVJWJfmR+Ixcf6XsCRD
         VQGIikKxvftgKxlPbwVUcIOeW1ItnaXi0L9T24RrWyFWyUKgAKRwPeOhpH7hFh6F8sut
         jfeVokjQBWaGawD+ng6KqGLNS2xBnH9Qsjz03TyIdT94ubbeK/TtqLGXGf4t+RIxSQWO
         52o0vVvPYfTfR984Gy3/51k9fZpw+606eog4fRYT1dwqqc3HBjtl9YL8GXmCIy0qAkT0
         H8izUvIjCjOVtOI+9wUZ1aCs2HTvUtIXN+RsHs0mvBD8QwW+edk74Aq/Rv2f8Vb1W63i
         QpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686753961; x=1689345961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCPI5ZcRcUuga+hwGvL6zbC51EZUbGkp50/wT3gC0jw=;
        b=k1DlmHyYUwQIXXyROQ8+Hygoi+snv46b5BShoT7l4+DRmRhX3C4zsy2UbPMVrbRy+u
         8ZgX7Mu5B8eSH2+F42SoG3uWGYTKAT+wC8G5VvkAu7Z39YsKoqbQ1nevhBEcoCYCj2jk
         HpWbJUAZDw/cVAhtFJzU0+5VNMe4Z2sftf7gwBYf6+d+eXOc+XBtvJRRCNj5noGaChbT
         eYpwHXVeOGOhzPFgpHw9bv7xW4E1xyILaSALGCauqnRJHw4XSnOeehgMqwSW3TSjyxU0
         kdMqbleBjXGSq4H6gL8xJ5P4SUjHCP91D/LRBxjbIbs+miq8DbaGqqwA9Cd1KbuaKBJh
         C6zA==
X-Gm-Message-State: AC+VfDwvrydSvVv7iCip7DMpfFNt6lJvXeyGCBscVicIOZTa1yBDz1at
	46w934bxFxcaYELYNvP/zAmQBg==
X-Google-Smtp-Source: ACHHUZ6YaaB5KAvmXloQoWaGZZvdtx8GavR+DcReFGFHeE3s5pRaCqmulS8858ZysFsR+JLXe8ovLQ==
X-Received: by 2002:a05:6214:d0b:b0:5ef:46a9:15d2 with SMTP id 11-20020a0562140d0b00b005ef46a915d2mr16973858qvh.7.1686753961443;
        Wed, 14 Jun 2023 07:46:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id e21-20020a0caa55000000b00626330a39ecsm4785870qvb.9.2023.06.14.07.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:46:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q9Rl2-0058qB-9u;
	Wed, 14 Jun 2023 11:46:00 -0300
Date: Wed, 14 Jun 2023 11:46:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	iommu@lists.linux.dev, Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH v4 06/10] irqchip/riscv-imsic: Improve IOMMU DMA support
Message-ID: <ZInSqC6b7RPD1nzX@ziepe.ca>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230613153415.350528-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_074602_299043_A55D5064 
X-CRM114-Status: GOOD (  15.54  )
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

On Tue, Jun 13, 2023 at 09:04:11PM +0530, Anup Patel wrote:
> We have a separate RISC-V IMSIC MSI address for each CPU so changing
> MSI (or IRQ) affinity results in re-programming of MSI address in
> the PCIe (or platform) device.
> 
> Currently, the iommu_dma_prepare_msi() is called only once at the
> time of IRQ allocation so IOMMU DMA domain will only have mapping
> for one MSI page. This means iommu_dma_compose_msi_msg() called
> by imsic_irq_compose_msi_msg() will always use the same MSI page
> irrespective to target CPU MSI address. In other words, changing
> MSI (or IRQ) affinity for device using IOMMU DMA domain will not
> work.

You didn't answer my question from last time - there seems to be no
iommu driver here so why are you messing with iommu_dma_prepare_msi()?

This path is only for platforms that have IOMMU drivers that translate
the MSI window. You should add this code to link the interrupt
controller to the iommu driver when you introduce the iommu driver,
not in this series?

And, as I said before, I'd like to NOT see new users of
iommu_dma_prepare_msi() since it is a very problematic API.

This hacking of it here is not making it better :(

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
