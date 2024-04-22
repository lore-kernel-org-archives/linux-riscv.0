Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A51CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTM0lkeRg+4rJ9Z074SRN3zrdSDNJ+SzfxQqRfa0s8Y=; b=Bt38/RZiRDo6bG
	kuYzQSovcFi5mS+cMMTlb7TJD48yMOiiyAWsMgl8pJqnWRp/30+sCxB5K4TMoaptefA0SZTG5W4tN
	16KGXD3s5ThhZYGdcXU5NzL6EiNxnSTZGbl7Se83f+3KNiWnjxxMT2pevftmOvUju8WJdvyfjsKGh
	YlBoKkleu1c9IAgu0yJd85cwtLKsH3nSV2YMc2j7e9I7VNRcjOe1lHj6XQt/h1M0Yy19TLWartlws
	QXLXL2XMnjazsLrl2/KbYSAJnhUeTluGAH1r5/RBdqbfYlgg1dBJtke4VuZr3dmrTN7HFjK0xRoKb
	nRFBBLvzBO52Vzl/Lxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzNd-0000000EoJH-16f7;
	Mon, 22 Apr 2024 19:31:09 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzNY-0000000EoFH-270T
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 19:31:08 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36c11a66458so2902215ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1713814261; x=1714419061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yh3rgiRcQXBNCIidxjhakiopwH4ays77o8Kd/hCbWDI=;
        b=dDRHmgZiQT5Gn0vuYty2Ef74zIR1NvIkPmUL5//UMiRkryuxWdw1uJH1ZUhevgcOud
         rzadLUjZOKwH+ZJqTCVl/i5u4n4OTSDigf3l+gQyEHmlH0N/xm4mfW2MAQXi/f+CvsDZ
         MP2xMv+7wj9S/OZjRYsHmir95L/wodXsKmbSm1S7uu0ZT/R9kS0mzCuQAF5rMYSo2ARi
         U93WRmf0rnD2RWl5kdSD0TNnbhB/A5ey3VSpqPp3qHjL0GQsEDSwQ25KetjObKp1sJil
         4CEJjfjKGzkbaxRT/w8XhqYfQIedQuLXCCIUi5qFgrxXfdkOVUBNlqUqBpZEj4AmYN+v
         IPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713814261; x=1714419061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yh3rgiRcQXBNCIidxjhakiopwH4ays77o8Kd/hCbWDI=;
        b=arjGybFsd0ZkJXAAO4w8u8N5kWJDkoah+T5IV9hG31+JY5aGAtWmPEIumX7s0HExKf
         14wLdbRLrZbN14ndhXjSCydCCQ247NLUA7ebR5/HVz9rYCO3Mox0PAFla+QQZzgGN+b9
         gLRqBsFqGtZN4cxdLvV2NVv5v6FFgFjX945TGfHnMjrUadwoy0QYvZQSHnxBJvztspyx
         egoAKam2qfekqy7PBEgr3hG2462TcOuq9EzdrIEEI3M/cwOFmwYcTWHbiij22rmgHK6S
         MRrlKof+yBU1v1C2eQ5ufIwtVlzDWY2mYeoz3Kiuyrmaoz6SyM/GdxOeUpJSO+HotqEe
         Y2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX8Xp/BhaxGL/vUq083ap9diO0wzTLqYRWIHCs1O+az9aidyrY5M92kO0Cinr+UfIivZ1Qpz8ydJqtF5qxms8Zoj5Ohkyi0ZaUQlfn8NyIb
X-Gm-Message-State: AOJu0Yz4CjlR7SD0sLB847SEtlqVD7jvEzX+G29y2j60kdOsYYRs2JC+
	3UaHPXfR5BRn+X3LTkS1nzO5nmuw+OdPXPU8UGDuWSPGoU2zMyLdaOqJ0zERK60=
X-Google-Smtp-Source: AGHT+IH895F9KLddG1s2eZCz4/bKHter3T6UNI8IsPcUq25R04uAGE5maPekZYiqnwm1PrKXKmatlA==
X-Received: by 2002:a05:6e02:b45:b0:36b:1868:fab7 with SMTP id f5-20020a056e020b4500b0036b1868fab7mr15663679ilu.15.1713814261611;
        Mon, 22 Apr 2024 12:31:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id u10-20020a0cdd0a000000b0069b60baec46sm4402412qvk.146.2024.04.22.12.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:31:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1ryzNT-0015IM-Mf;
	Mon, 22 Apr 2024 16:30:59 -0300
Date: Mon, 22 Apr 2024 16:30:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
Message-ID: <20240422193059.GC231144@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
 <2f2750cd-a5bf-4486-8f50-c93d246f8b0c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f2750cd-a5bf-4486-8f50-c93d246f8b0c@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_123104_742147_3535EDB4 
X-CRM114-Status: GOOD (  15.42  )
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

On Mon, Apr 22, 2024 at 01:21:05PM +0800, Baolu Lu wrote:
> > +	/* Track domain to devices mapping. */
> > +	if (bond)
> > +		list_add_rcu(&bond->list, &domain->bonds);
> > +
> > +	/* Remove tracking from previous domain, if needed. */
> > +	iommu_domain = iommu_get_domain_for_dev(dev);
> 
> Calling iommu_get_domain_for_dev() in the domain attaching path is very
> fragile because it heavily depends on the order of calling the attach
> callback and setting the domain pointer in the core.

We have a couple places doing this already, the core code accomodates
it well enough for deleting from a list.. So I think it is OK to keep
doing.

> Perhaps the driver can use dev_iommu_priv_set/get() to keep the active
> domain in the per-device private data?
> 
> > +	if (iommu_domain && !!(iommu_domain->type & __IOMMU_DOMAIN_PAGING)) {
> > +		domain = iommu_domain_to_riscv(iommu_domain);
> > +		bond = NULL;
> > +		rcu_read_lock();
> > +		list_for_each_entry_rcu(b, &domain->bonds, list) {
> > +			if (b->dev == dev) {
> > +				bond = b;
> > +				break;
> > +			}
> > +		}
> > +		rcu_read_unlock();

But now that I look again, this is not safe, you have to hold some
kind of per-domain lock to mutate the list. rcu_*read*_lock() cannot
be used for write.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
