Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6758BC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvdhNqCKgbt1JjDH1F28/VI6LtRgWwk+VXN4POeJPK8=; b=BVr0ThGg3eMa7b
	yDtA///U7Yp1bgKAjUO5YNBqOM/0inKuKwrXS6B1jC0rUIyS/7FggfcyzO45Hf2/NqyKgz0KGjAdX
	e+XNE/APPGEFcdz8LGh8MSSbYJ7VfonrU7DebUlB7A/rbGIQKeyFNYhQ/oj8lhClhCBQBUZWxwlrV
	awvrkhsEJrHgsmmPqyi8JgODFofX8Qi0lEmZgy1OZOVUAOSf78O1NU4beMoigTOnCT16vghWfs4ge
	2swI63QVrE5yhHxuVxYIdo70NfJrUl7CNmQfIzN7D9cKe7ZspelGx0JdHWeIUDJf6q5PtXog+Q7VG
	ExjvyqPYPQMM9PYWO92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2BOp-00000009rzw-3Fq6;
	Wed, 01 May 2024 14:57:35 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2BOn-00000009rzJ-2tKl
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 14:57:35 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-78edc49861aso512529885a.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714575452; x=1715180252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yMDuFgQIFZusBttFcIEeiK3dO+QLC27z5ORAgCsbWKI=;
        b=Er3yHNviJbbrog39m2NKV0iImoDk641ozSVBQ05jo7A8Bv/F3GvzXpj0ovenqep4jW
         +vsEE9/r6toZsyM6fDHeXj75ePSFR0QVqP0P5ordY8XckTDf1yLez2TECapJFFkkGPw1
         4MXJjVOVdE2TOy7SYyFuIdZM/4wAEbsMV+RFyjEb2GyV+YXFal+FmyJeXRYL06srHa1s
         e+zGKbOr6b5rVwdbLFmsJBbwxjKFMBUcCrrRcnbKayttiJFZ/KiPIDYh3mIR/S1mY5nc
         2Qow64CCY+JwEMXQeJDQN5Alm9U5SmOPKMlvGGy3R6CLjl3GYVx9mrS9VcAcnjsq8C+u
         zk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714575452; x=1715180252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMDuFgQIFZusBttFcIEeiK3dO+QLC27z5ORAgCsbWKI=;
        b=YXoQbn0TMcyGCdHstCZXsjFNfaIxQT3hggg2QcZ0epY/iIicpJIn7KQJ9NA4OTJonj
         r4A5TIY3E/1Fw665Ak5TcOot+sSgDtqrcvJ3pPiYPfNG92SwTc89kVlF4G4hLb65d5sj
         e3MK44396tcD+qlHKl8lhBcgBbNqOW3+ktER1HkP8iduRBHCzByNACd26dzmivH31Df5
         O0GiDEZ4vLm1KaeLQbbPCKoJzSkJg5hUQXr1b15MaVytbheDJUfgxjUVJslJb+dKq8Ct
         tcORc2LHZDm24XTRbnelDZRJ/7s3/MtAj+LxZOWZ6penuP8s2WOEs9IPRVwY4xzYW70D
         b0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYmmMrtVA/Pc72p7HyLASWxDoXiH3k2SFYOPY0+nI8UzZmLoi0mBn5W/U7Vr0BVZ/wuIPrRLbTq9SQC6c6NfwcHG7cEn7u3atJ1nAloj+U
X-Gm-Message-State: AOJu0YxAoYuuUWEIaJizdO5kQxReCuuW0Uo/AuL5owRjt/XyqS+Zo/sm
	avzbIWlDuXjJwnAxU7P7R8S4WqWF54CPx2QsDA8E+lf6DstV852ApWXjM7qLpfU=
X-Google-Smtp-Source: AGHT+IHmOIDK/Mldt2hAVSSoxj1UCLR3AUkPhDiQrlj4ZsACrgmp5YSJE5CUYE4eJ91yhllDRNrddw==
X-Received: by 2002:a05:6214:2486:b0:6a0:cb42:993d with SMTP id gi6-20020a056214248600b006a0cb42993dmr3978427qvb.23.1714575452398;
        Wed, 01 May 2024 07:57:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id g18-20020ad45152000000b006a0af6e25c2sm5039912qvq.94.2024.05.01.07.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:57:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2BOl-00DcLt-Fb;
	Wed, 01 May 2024 11:57:31 -0300
Date: Wed, 1 May 2024 11:57:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 5/7] iommu/riscv: Device directory management.
Message-ID: <20240501145731.GE1723318@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_075733_854573_4735E230 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, Apr 30, 2024 at 01:01:55PM -0700, Tomasz Jeznach wrote:
> Introduce device context allocation and device directory tree
> management including capabilities discovery sequence, as described
> in Chapter 2.1 of the RISC-V IOMMU Architecture Specification.
> 
> Device directory mode will be auto detected using DDTP WARL property,
> using highest mode supported by the driver and hardware. If none
> supported can be configured, driver will fall back to global pass-through.
> 
> First level DDTP page can be located in I/O (detected using DDTP WARL)
> and system memory.
> 
> Only simple identity and release (blocking) protection domains are
> supported by this implementation.

Why rename the concept? We call it a BLOCKING domain, just use that
name please.

> +static int riscv_iommu_attach_release_domain(struct iommu_domain *iommu_domain,
> +					     struct device *dev)
> +{
> +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> +
> +	if (iommu->ddt_mode > RISCV_IOMMU_DDTP_MODE_BARE)
> +		riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
> +
> +	return 0;
> +}
> +
> +static struct iommu_domain riscv_iommu_release_domain = {
> +	.type = IOMMU_DOMAIN_BLOCKED,
> +	.ops = &(const struct iommu_domain_ops) {
> +		.attach_dev = riscv_iommu_attach_release_domain,
> +	}
> +};

'riscv_iommu_release_domain' doesn't make sense..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
