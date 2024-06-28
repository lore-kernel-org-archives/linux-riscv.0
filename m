Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32A1C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0Cg/C+Lghmx0R4pJF7lIWzArxqq1YF8uCa8wPFZBhc=; b=Zq8sMux3og6R/r
	rdI3jKM/AhgWUvvujrsKwSLl++NZRkAFdgZOPVWlzGOhxOi+KojmcEHO/R4L8Zk+XhtLqoPaU4cr7
	D7zZCZA8er+SG0V+jb9LaG9Rfm8SjUZ1e4jyvqZhCRE0dYFo/Te7rQv7iPXnGVk6x0OkLScmPWnZM
	/yqQKfIgTGxOBXLYa1kJhPUOULY7eupxOdP7U5NzsGDd16yOvmaTrDrI+9fCL8rWY8wFvhytlP1z8
	20cLufMQmgT+qtXfJJNwozoLRRC8v9oyQZnmdFsQoRSDr9mGG6XPn6oM76ez6W7eDPXpja89UgaB8
	G1DhYL1TFvaEXo5/zg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNMd3-0000000FZTD-3taP;
	Sat, 29 Jun 2024 01:11:49 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNMd0-0000000FZRk-1LHl
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 01:11:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70a078edb8aso374064b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1719623505; x=1720228305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsoLsLBS6AWLToaBUgOlVBtvPTidK4aikxWEMjAfiw0=;
        b=YQpwam3NlC4laAypnxTuAy+noP3Y8a51O1XcjIEoMNn30FqnaCvwYf3t4f0aMB1nC1
         fB5mn4npEzTZHmTHxolR+/YdBRDy6hAGqIYqYSD87/1WE36iy/Ho5dXm37DcJi+a/GV3
         3w3ElPBGJcNYt3tVDTGqJmNcm6rsrS8uCVnibAwMti4rMzYAgRSqxvLPTn4wns9dDgWn
         SilRz10i3f3BhfufiebzZN89AEDta3lHJa5r5oAw5EqRkBGkanutmXffYBr6OqyWYQoj
         nP00k2jDmZkJXoZ5bJEE20Rk8MExjRw7W/5JLml4Owd1QYyn2xfxqICRPon9IIEFeImF
         odeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719623505; x=1720228305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsoLsLBS6AWLToaBUgOlVBtvPTidK4aikxWEMjAfiw0=;
        b=qQ60+apxkZvBr5eo5H1vvkNXVAlsU2ZtTDANTE+LXwKlc/RD9Tuvmxrq4hj44uMZKe
         Es9p+AKo1i5IT94+BCA8EE0rMe0RaWZZP/eQCjAtFq/05sE424y9luZXjQxTqDt6qp5B
         lhmZxn9aUrK0UrmbbrMtgcUMRB1rt3sm1iZkTbrX3bEEWhnCQMD5XV2Se0OUJD6eGxj6
         eKPTr+0xMpNK1nxQCIpdI882VnmH1rfDU+qQBIzg31Nwpqh9rk9I/tF2Pezhsx06QdAk
         oNWzCilY5ErlVY5cSZ9qjhzCVj57XCfY4SIC+oDkfds/yOCTdWrY1HAYqKU7SQIvhWaN
         MKvw==
X-Forwarded-Encrypted: i=1; AJvYcCWJCfxS3i9h4y9z6wHwziefLfn2b8BmY8JpI8BQHSnGDHnJANhtGJ6vFUCMLzQiDZsffSmG1tUFKnLJfyaCFtFNW0aYWf7n8EnpOk0Gr9JZ
X-Gm-Message-State: AOJu0YwGrYPOZyW3IS3u6RCVqGT9jdqtCcugDetJB8UA5nCKFrg6F3WV
	O7zQfMIsIx3nZDHYcdvZR5z25NvI62NZ4DZbhxHtMcUgPWVN6UN9KGWsh+wmgRY=
X-Google-Smtp-Source: AGHT+IGCN6aa6Qe8gHQG9Hq0ONeW1TMgiLD0kMLyYmKolWs0bnwTa/i9nPUQ7jMeYAfEUM+zT4NvhA==
X-Received: by 2002:a05:6a21:6d85:b0:1b8:27dc:10c7 with SMTP id adf61e73a8af0-1bee4910b47mr5469407637.12.1719623505492;
        Fri, 28 Jun 2024 18:11:45 -0700 (PDT)
Received: from ziepe.ca ([24.114.37.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53be5sm1784142a12.16.2024.06.28.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 18:11:44 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sNK2g-0004qO-1B;
	Fri, 28 Jun 2024 19:26:06 -0300
Date: Fri, 28 Jun 2024 19:26:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for
 flushing cache
Message-ID: <Zn84fnUs3UtZ2vrM@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-9-zong.li@sifive.com>
 <20240619161740.GP1091770@ziepe.ca>
 <CANXhq0pgQMHGVv12K0s9ovd0OkOa15QCdH4HMfZGCy5hYXSWMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0pgQMHGVv12K0s9ovd0OkOa15QCdH4HMfZGCy5hYXSWMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_181146_382350_C57A6471 
X-CRM114-Status: GOOD (  27.73  )
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

On Fri, Jun 28, 2024 at 04:19:28PM +0800, Zong Li wrote:

> > > +     case RISCV_IOMMU_CMD_IODIR_OPCODE:
> > > +             /*
> > > +              * Ensure the device ID is right. We expect that VMM has
> > > +              * transferred the device ID to host's from guest's.
> > > +              */
> >
> > I'm not sure what this remark means, but I expect you will need to
> > translate any devices IDs from virtual to physical.
> 
> I think we need some data structure to map it. I didn't do that here
> because our internal implementation translates the right ID in VMM,
> but as you mentioned, we can't expect that VMM will do that for
> kernel.

Yes, you need the viommu stuff Nicolin is working on to hold the
translation, same as the ARM driver.

In the mean time you can't support this invalidation opcode.
 
> > >  static int
> > > -riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg)
> > > +riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg,
> > > +                     struct riscv_iommu_domain *s1_domain)
> > >  {
> > >       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > >       struct riscv_iommu_device *iommu = dev_to_iommu(dev);
> > > @@ -1663,6 +1743,8 @@ riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_
> > >                      riscv_iommu_get_dc(iommu, fwspec->ids[i]),
> > >                      sizeof(struct riscv_iommu_dc));
> > >               info->dc_user.fsc = dc.fsc;
> > > +             info->dc_user.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, s1_domain->pscid) |
> > > +                                           RISCV_IOMMU_PC_TA_V;
> > >       }
> >
> > It is really weird that the s1 domain has any kind of id. What is the
> > PSCID? Is it analogous to VMID on ARM?
> 
> I think the VMID is closer to the GSCID. The PSCID might be more like
> the ASID, as it is used as the address space ID for the process
> identified by the first-stage page table.

That does sound like the ASID, but I would expect this to work by
using the VM provided PSCID and just flowing the PSCID through
transparently during the invalidation.

Why have the kernel allocate and override a PSCID when the PSCID is
scoped by the GSCID and can be safely delegated to the VM?

This is going to be necessary if you ever want to support the direct
invalidate queues like ARM/AMD have already as it will not be
desirable to translate the PSCID on that performance path.

It will also be necessary to implement the viommu invalidation path
since there is no domain there, which is needed for the ATS as above.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
