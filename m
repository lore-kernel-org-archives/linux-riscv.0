Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF90C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxbBLXdQooOjBwd5g0MFbVFlpRDAn06LpRJAmJoAJhA=; b=yqp0kcTy6s2Z/J
	AXBNCcoXugbPYM13VD2WctO7h7GNsjn9TFqyZkneKx4dfS7Rdq8uDkZUKz1oMlaq7OT5QLteAUp3I
	sEz/e7Xqe7UaeMQAApGKKGOeBIOfyCDLTal4E/kZS9Vow6HUVfvdrRtZ0JswHVE9e559nkI9z7yUd
	L6POPlwwjzv+g+cHjujOKztuF5hyK6sQRspTtFQevmLgfeUmUxFzrYuZ/6+cguwhM25YEzbSxaQGs
	MLLv4rOIY2si1QFsyBCDzCt9NvWM1o0W14j2ep08cChcHGfh7Aupc6N4/tK6lZL61PdGH3oEpgFom
	7IrZnRLND90o1eQQNf7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRl4-00000003wnZ-1UbU;
	Tue, 01 Jul 2025 03:34:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRl2-00000003wn8-0Nz6
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 03:34:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-236377f00a1so50958045ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751340847; x=1751945647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31XS2nxYehKiliXMsYuVNFSQuv9hNJl6nMqw6J9ZvFA=;
        b=l2fx3uyyRiSB7XaZ9PReeiJx5rEAEMdi0YppYLS2JABCTOSaMXDXrStux1pLHhZZvp
         6klYFk8Lvup4Isq5iDSpmmRmaUtHmil4oLlFTNXziYsh+FqN/E7YPIneqly1kv/CjXLp
         xRfbGFvo08ZvXy9yDM2y5BmWsqlKMCQIHOl5///Mdjmdxt8+A9D1YibYXWKTDeba/QZk
         op8fYVx4+cNBcRKS2U6td5mVQTa+F2rPzH6438pR1CwQfL01drw5j1kGkxJR5W1iASYE
         +d8YPk7Qr3l3cna0Flp8qCnAGrVnHKc6NwvKXUKf2JLsEXglx9+SDd7zbgDFXkEtUUf+
         MRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751340847; x=1751945647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31XS2nxYehKiliXMsYuVNFSQuv9hNJl6nMqw6J9ZvFA=;
        b=QOzTeT613JE7qqMSvLhgwYK+SKa3x3zLmFC4DN4UDoT+tML99kizgrcr9ia5l+mRig
         9x63smzTWa7TpiBOWGRGxRBMC/XZNB2ZmUe4dAFvqK1z8VpzA1aMA8AoN/PQIKNMctZc
         26d7ln4NkHkfT+5Vc8vJuesKlaNSXXDhApupoxRGOUdQ20zoTtiIu5/cWUVySdDFGnry
         rUwIFeDLCWI2sD8RpNbpkdaBQMjciYnkF9dmQ4WgfwocQ0syVCy1HCNaPkDwQ8a3IBaB
         sSUPaE+u7CoweC+a1y/ZV2Pl9lKNrQ5sMqSUhSLEEbM0YXG+w/O9liup730iNYxQU+lp
         gJFw==
X-Forwarded-Encrypted: i=1; AJvYcCU82rVGq9mZ9upZ7YqxR70+EDoXZJu1M2y7nJexsbwezlIAP79EDj2sUfnAB4DFKNaMf121iA1CKcVKyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6Fr05XtvEuj9tLLqYixGt35B2ztS1Es1h2ylNZ3swJcnurkF
	E3qqYQ9zuL/mUClUvEzgfDwQyJrmmZYtv057gDq9n3O05zAl+R6Gj7CdMVwtlUUZzxU=
X-Gm-Gg: ASbGncvorPReIIXF7w1nqFkkIArl+ZWLtKa1xjFlPDg8vRv5K0OembKSJLgOcBDoLiv
	O7mtBPLswn0ROV6FcwK88LIhp4DSMSKCNFqqRjydrOBMij2tASUV+JmUfNwA19X9BlDVUWX88kF
	/KYv/uqXXVOwf8Pp9OfwTM4LnR+gX5hBy8NZiu/Y/LaHy43deY+QeHS8nGudkyptFn2U5ITteo5
	WrLf67BdlAZkfSLTSGHa6gvkkxbAJ6SHdr11b/L0mpIfy+Kw27bJoRjlCBK9mUdvPUK7iT0jaFh
	XzO4+DTuRj99UtuDOBH5E5RHOn7O9oCbjSTc3BQwWNxFcq28B063loo5exXfsyupKZ6kvQ==
X-Google-Smtp-Source: AGHT+IHBFOUU87e7HImdYW3OwpB6jU6VOhsQ+1GbwVU50fpWtSuIe6bavi41hI7Zk0rpNJpgH2mTrQ==
X-Received: by 2002:a17:903:1a70:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23ac40f4e43mr241646815ad.15.1751340847108;
        Mon, 30 Jun 2025 20:34:07 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c90d5sm95757375ad.247.2025.06.30.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 20:34:06 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:03:55 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 2/3] ACPI: scan: Add support for RISC-V in
 acpi_iommu_configure_id()
Message-ID: <aGNXIzi8vYL4AOj4@sunil-laptop>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-3-sunilvl@ventanamicro.com>
 <20250630-c479c6607cf8c1430f11336f@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-c479c6607cf8c1430f11336f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_203408_136970_5ACD3FA7 
X-CRM114-Status: GOOD (  19.04  )
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

On Mon, Jun 30, 2025 at 10:02:53AM +0200, Andrew Jones wrote:
> On Mon, Jun 30, 2025 at 09:18:02AM +0530, Sunil V L wrote:
> > acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
> > Add support for RISC-V as well.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/acpi/scan.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index fb1fe9f3b1a3..70f57d58fd61 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/acpi.h>
> >  #include <linux/acpi_iort.h>
> > +#include <linux/acpi_rimt.h>
> >  #include <linux/acpi_viot.h>
> >  #include <linux/iommu.h>
> >  #include <linux/signal.h>
> > @@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
> >  	}
> >  
> >  	err = iort_iommu_configure_id(dev, id_in);
> > -	if (err && err != -EPROBE_DEFER)
> > -		err = viot_iommu_configure(dev);
> > +	if (err && err != -EPROBE_DEFER) {
> > +		err = rimt_iommu_configure_id(dev, id_in);
> > +		if (err && err != -EPROBE_DEFER)
> > +			err = viot_iommu_configure(dev);
> > +	}
> 
> This can just be
> 
>   err = iort_iommu_configure_id(dev, id_in);
>   if (err...
>      err = rimt_iommu_configure_id(dev, id_in);
>   if (err...
>      err = viot_iommu_configure(dev);
> 
> Thanks,
> drew
> 
Sure. Let me update in the next version.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
