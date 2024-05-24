Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C9EC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+xCf361MdmhuzV+miuV0RyUq/RTFNcF3TxROn7WLq8=; b=OpXhlpHJsF5TCp
	s16Cpq0Mk3dTgTSNNk7LL94PB8jY4YmXbFUO2yZpe88vPCganbNbs4D5rYF+KSChiVbruTzofdKcJ
	DOH+si5HgDMv3bJ961bFXbjcWqNs10L3hQ/L4H/yoxBjhM9ogApF0HjoAzf4o7Pez8f4/k4hhjzXG
	AAwFRl2wZcQOHRNvhKSpDaDPf4g+YYgerlI6bh4qyVRA6LuVvZzvNa78gZAWrL9LuuunEpcw7LPRK
	U3QODV+yAkk/q3HR2ixTPtr8Nzl/McPAQjc9k18TkF+Fxc4YPnBgE3xHVPx1Fv0Y4ytTz4R/Eu62Q
	6E+TXlblwRBfO5yw0WJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWY9-00000009Bvc-1v1o;
	Fri, 24 May 2024 15:09:41 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWY6-00000009Buz-3Bfh
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:09:40 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-792e4c2a002so262768985a.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1716563376; x=1717168176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPPk9ZMB0Ku0hRWNSYQthiNRSt0noAUHxb8eADGB9tY=;
        b=JNCwgLb7WjLpm6ZbMPKOghnLu8ByLBa/YwbHNKQ3TcUfiaf5VM9+pubZp0A5PPbEYz
         Iyx/NU2YA5NeWbYled+2L1tOIEDN/wOly6DBuBVtYjnUhAVxeVsnpFiW8Dz9hXvYPePo
         6R7pFhLrICkjDqRa7RUizK+AR+2lo+0HCbw5aswExkrBkiicxOaJ8/APXGVkFu3RiNbS
         rgMQ2RwvXMnYSUuI/XzlFTKpVMwybCT641ayyJiDWOFg0tI4PVbIDSev3fvppQXGzjoG
         ZuO27/xu9vXrdDS441XHCcn+f/AZD8dSLShiCsAL0S97Zm72wsSmLap/XaFJaqOyZSyq
         1INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563376; x=1717168176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPPk9ZMB0Ku0hRWNSYQthiNRSt0noAUHxb8eADGB9tY=;
        b=vGsNrh5M6KiFXyfvpsNhh0ZITXKmGEuTeCfItuJ2zhs88TpSugalAYr98fLqfSlRt/
         O+ww20bBFups2uvHphERVW92YIFeBuSwFTHYlrLwNVAifjd/IdqVBiX5H6CNIlCf1XfN
         KNH9xNvKaLFPkh2zj34tmI4LMuILZrbB/Bns6WfNCqVtCTLBXM3wBeqABdXhM7/Gw/hZ
         bGzQuePrLdIZmMFkQjfvK2KW/JsuViZvhtjcJG+McsuLswGPK1bECnevzkXGjPS1HEjv
         UicuwHPDTbR5er3sR0zJaSnSB6RG5CCUA8Lowm2wNTHlQMwPljeClRx+3XmJi6FRD5fd
         4TuA==
X-Forwarded-Encrypted: i=1; AJvYcCVZthIOR8O4yOio2ZMKKTBATj0V783wocnBwihAHpZ7z6nOQK8pwx2gkJl8m6pkuey9xcE/MbzQzxeSqyoC+1juk8miKDIOVgZh+G+7Q3I1
X-Gm-Message-State: AOJu0YxZTdHWlhYwJr6Ev/OWhRFkJq480+LiEUTxmKNeqeU1XDCgxAxM
	46mdSCrbn6WGsgcm+3G7jFzpq1N3rcKqlVC3efM2ssqKyE9EoPJxIN3lbyHQ6xU=
X-Google-Smtp-Source: AGHT+IF+iMK+Fk/kuTHFaJ9i9wXeJLcDfA5+fUTHGZpkoNnrMobEJ8vPGJL+mvQIBsyXRFWw9nLt/A==
X-Received: by 2002:a05:620a:2603:b0:790:d62a:da09 with SMTP id af79cd13be357-794ab08688dmr336194185a.5.1716563376237;
        Fri, 24 May 2024 08:09:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abcc0f04sm71408585a.42.2024.05.24.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:09:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sAWY2-001QzP-Mh;
	Fri, 24 May 2024 12:09:34 -0300
Date: Fri, 24 May 2024 12:09:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <20240524150934.GR69273@ziepe.ca>
References: <cover.1715708679.git.tjeznach@rivosinc.com>
 <4a1ac62b8b452f9face321c29502dee8ee88191c.1715708679.git.tjeznach@rivosinc.com>
 <CANXhq0os1R3kR7dCKWs1Yu1ZeaKoQ2b3Q7QbvyU9nRgbB8ZFmA@mail.gmail.com>
 <CAH2o1u4j9MS9Pq7d=4skq-nLM7c_x0Dwqy8WxVfO1FBSWqA0yg@mail.gmail.com>
 <CAK9=C2Wff07Q72LXrB9POz=91t4SNZ8AaLhQdjjjXhbqTYKCHA@mail.gmail.com>
 <CAH2o1u5N9ZdXePh=aJHkYOpLMXeuwQTzCuQJyLdgc3-FAKim2A@mail.gmail.com>
 <CAK9=C2VAWa4jzCW63q366rB60wk2KDUJmF86EtQkVcMYLyiPBg@mail.gmail.com>
 <CAH2o1u4jbObtXDAiXkedy_7P6VyRVTFj9OtmqwjgGYYfys1RmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u4jbObtXDAiXkedy_7P6VyRVTFj9OtmqwjgGYYfys1RmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_080938_824909_A341D0D8 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, May 23, 2024 at 09:13:43AM -0700, Tomasz Jeznach wrote:
> > > The activation of IOMMU_DMA for the RISC-V architecture will be
> > > feasible once the core components achieve compatibility with the DMA
> > > subsystem, which unfortunately is currently not the case. Without
> > > IOMMU_DMA enabled, driver will recognize RISC-V IOMMU hardware,
> > > register itself in the IOMMU core subsystem, and will provide basic
> > > IDENTITY protection domains for connected devices.
> >
> > I am not asking for IOMMU_DMA feature instead I am asking for
> > supporting device MSIs in this series.
> >
> 
> Ok. Makes sense.
> I've looked at the option to pull in / add small change to enable MSI
> bypass window for systems with IMSIC enabled. With that, MSIs will be
> supported, however without full interrupt remapping capabilities that
> could IOMMU provide. If that sounds as sufficient change I'll add it
> to this series.

Honestly I would prefer you keep that seperate as we really need to
discuss the irq window stuff in alot of detail. The current thing ARM
has done comes with alot of problems.

This series seems pretty good to me as is, let's get it merged.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
