Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB4C25B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sM0qXm1SL3FNGa9u7lvcJEYwZJu/rRjjfe9tgOcxKlg=; b=tpjYSLYKOJ+ys9
	cunvgsEx4ejY2w+ErGHfGUUM0yoFsgZyWt/VZf6wUf+0Czu0MX1HF2Q8EHvThSDVyBgs62Hqr4PIR
	2cEzlnq9aSSiCPMfIA9KLzS2Y3z/1uwA6SCPyeMV+dNyBm6/w8xPKB/C7UthgMS1l+mGd4te7fxVk
	F2t3CstIeCQNylo8R8YshdEaG2g6YnW5NMfgLPmEOpp6VPXwbxB2GvhGDNpkPlfvNqQprRB9V6gu7
	Gw3ADrYiXmYIoGkdPHKlbFBO6JRue6PO66ctTIB7KLguNEChI5Ac5glcMIjS8A31zhrj96TZOFLwh
	iWU6LFf2AMQSiQIzZ/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAMd-00000006eZt-45l8;
	Thu, 23 May 2024 15:28:19 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAMa-00000006eZB-2fJb
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 15:28:18 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-792b8ebc4eeso464222385a.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1716478094; x=1717082894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hmfyLYVCfyswQ3c7xb61Hr7O417fd5EFVF7yNKTH3w8=;
        b=PL+/2gJtPDOuOQ6yAi9Ums2rocO4HhOoyssCAobh0UOcNTX4be77oSObiv7s5mlbJy
         eLVNDjgax6ZHAeCgmg/d+LMpJ82a1AVACB6Ys+5urym2uq+wrmK6hst2bgXj7B9cuD22
         swUKMBnd8QV5tF5lHWCsDzDDtAv+rIuDNBSzIhaicKY80/m6F+wsN1vs3SM3TpoEp3UT
         WjzGYZGNhVg3F50eUk+VnRYMzuYeIlMf8q3aFUASFBFw8hh6oVduwxGZMdCX80unS3cL
         769UUDHIv9iYcWg8XyarUyV3ocUi814c+4bzOjfvhEpnlIf+kX3ZA+enfyxSIvQNb5ll
         PcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716478094; x=1717082894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmfyLYVCfyswQ3c7xb61Hr7O417fd5EFVF7yNKTH3w8=;
        b=T5BnoPNn3tLdDnkBsXCSWFxzWQXqk9/k2+K+kz3sCNVqT+/INjVffA+Mz5q3xlXVzm
         BZPEBVTdWelXblQOY5ZbxJLbZaCPSHYZcgbkLJ2VL+ZbQ+6Y5jUhHdbkrme5c6Fq3Ks0
         yyZskgCaKIqvcvypGtiQL3WNMNxTHC1Ih7PcVib1E211SLhoK26iNjX7aQBbiLn9y69V
         BpJigKAIh3LA7Y3hn6KyRYxbZrxVDwaBhgMCMp/N9Z1LzO5fSJdkLcnjJiltGE+1RHyY
         epkSdLHvZ58Zn96923vObg7Td3nMltJb98n9+v5wRz8HrAUnvdWwISQamz5nNRRms5ih
         R/bA==
X-Forwarded-Encrypted: i=1; AJvYcCWjIHL8led7n6J6soKcxpfsG20o4HJhISqEnaY6CLzkZAjQWWCbTJDMmwQ4Cy/RSNaJRxhKulA+rCdN5T04PoICWX9velvLld5YMvBQ9rMv
X-Gm-Message-State: AOJu0Yx5XvSXcE7WeCZJAqZTpHKv4YmXAkjvTlTxsyJ1WyuhNN8T2gdY
	5iMY2geIeH9TBEifDH/6d9p0BYKAukW4gLDeOs6rQgSxzh9zI8P31QT7TGEFpO4=
X-Google-Smtp-Source: AGHT+IHTBzzwi4PjhcyoMTsLG+C6xPlPNq6v4XQ9szwtINNcWYZzWlV7kEZtWT8wPy12nifAJzgm5Q==
X-Received: by 2002:a0c:f593:0:b0:6ab:8cbb:79f4 with SMTP id 6a1803df08f44-6ab8cbb7b85mr30572656d6.56.1716478094519;
        Thu, 23 May 2024 08:28:14 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ab84cd6d93sm15777036d6.127.2024.05.23.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:28:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sAAMU-00Frqn-OL;
	Thu, 23 May 2024 12:28:10 -0300
Date: Thu, 23 May 2024 12:28:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 7/7] iommu/riscv: Paging domain support
Message-ID: <20240523152810.GL69273@ziepe.ca>
References: <cover.1715708679.git.tjeznach@rivosinc.com>
 <1ddb50a47c86d384157a979a7475b45f807ba81e.1715708679.git.tjeznach@rivosinc.com>
 <20240522-b25680db03b547123f1cd59a@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522-b25680db03b547123f1cd59a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_082816_699656_1D75FE45 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, May 22, 2024 at 10:07:14AM +0200, Andrew Jones wrote:
> On Tue, May 14, 2024 at 11:16:19AM GMT, Tomasz Jeznach wrote:
> ...
> > +static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
> > +				 struct device *dev)
> > +{
> > +	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> > +	struct riscv_iommu_bond *bond;
> > +	struct list_head *bonds;
> > +
> > +	bond = kzalloc(sizeof(*bond), GFP_KERNEL);
> > +	if (!bond)
> > +		return -ENOMEM;
> > +	bond->dev = dev;
> > +
> > +	/*
> > +	 * List of devices attached to the domain is arranged based on
> > +	 * managed IOMMU device.
> > +	 */
> > +
> > +	spin_lock(&domain->lock);
> > +	list_for_each_rcu(bonds, &domain->bonds)
> > +		if (dev_to_iommu(list_entry(bonds, struct riscv_iommu_bond, list)->dev) == iommu)
> > +			break;
> 
> We should wrap this list_for_each_rcu() in rcu_read_lock() and
> rcu_read_unlock().

Not quite this is the write side, it is holding the spinlock so it
doesn't need RCU. It should just call the normal list_for_each_entry()

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
