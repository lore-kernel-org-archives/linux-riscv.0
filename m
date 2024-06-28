Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E5C3064D
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpreElghTsVOmCT7D4Ct2JyFagpiqYSS6kA/Fx+6wW4=; b=eOn/tTby28V7oz
	ODeEPxpUphwD/pSXrUfUKjaMU+AhPEwzX1Xcp7xsd3P2wh8iNrTCq9NufQIELoYpn6HH329blGeOz
	tPwGSoW3//Km5YKr2IJzt3odEST5g64HXKcvtIzxKf4UMc1nthFHMHYXqs0HC/9NxOEvEqlc7KCP/
	z4CgaBhtDvJ1VEdC2o3qQm7NiYT5GJrA37gUYM7QE4b8Q3cioqM3RpYWlLLSrZQRCxyrop9aFu3Er
	/b1UVFiB0W4Za10TCzlj2sH9pPChRYhIeCAY9RJo8qrlCR9w/GF7cUVQRnaCkBiLtSL90GmdNtPys
	NtJpH7fk/nDrbt+68WFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNMd3-0000000FZT3-1Sdz;
	Sat, 29 Jun 2024 01:11:49 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNMd0-0000000FZRE-05DI
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 01:11:47 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-25da8a19acaso186203fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1719623504; x=1720228304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=18khvwf4h1DwFim0s+8NOwCXvsGKrMBWRxVL6/hqfpk=;
        b=gD34QDFRyQ0DFvK4ApaGuTJ6u0es5IWi/OpQ6un3iHzyEBmqaJ9Owg1avTBoyR7qj+
         v21XMWyrpT57AYawjfDPmgGbN9VA2d5GdyOvXEOmsBbVXrhDJ+bIxH/11lPBMPmz7Tdi
         3D5Cv0WwSvqxjC5fwy2687hMzVeeWpvT+QfAUJUeDV1klVxWdop1gx+5zZG4SHy47t7z
         83naaPKVt3vOKI9quyj7A8MQcJ8KpQqPgE/xilxuDdGQNWTj7irq1rp72HHYLQU8vtC6
         ucTP4iXJXue0mUrVSRsNjELVgSGBQ76U8w7fIAwLqrXiErSEKqyineQZxsckdF5n+w1Q
         Zhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719623504; x=1720228304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18khvwf4h1DwFim0s+8NOwCXvsGKrMBWRxVL6/hqfpk=;
        b=cKeyTqnGe/nXRfj4nSBs/1doNuGZF22R2f9vu/oo8x4ORgu8K+xg8526UBUaJLcReP
         hTiyGdXEpI8u5wmIAGfzqugLrQl/fDJz8uEWZSCefT3/pyJhV8ej76JmmVmJQzRrihtl
         LSrPisWDJldiL90qEHoM5DSP/3AJ+Al5AiMdQ6Y+9DtACnR6igA4I7eujuEWUWj3JmtT
         oyjDTRyDUFsT74XDn3qYjp9Tx7CbUBJrGqe2nRBF5W22Ros94iEHovgY2g2vHokDk17a
         6sii5c3ogVSqQBAonjMNjrnHOUZXhRJ+LwlrCCseNzT3F7LCv1tyIkfs1dECb4n7+MyY
         qx/g==
X-Forwarded-Encrypted: i=1; AJvYcCWYPzZNWxpaO1+Pv0IJAF3OdWR8o0ZKRZQJ8A4Zt1Ugo3m3u2zjmwT8FuooLP88Iy2oXxCYgror5C4TxMjAXoz6NdfLN4D4/l/svPvKAiy2
X-Gm-Message-State: AOJu0Yw56Y5uNW41yGcj3EkV0nz+a81LCKFUoKOZzfTCF0rZojKa3hnj
	dQ5wfQsU53CFHUJo41VPmjkfuVUlmqZ1EHRAG2KRdEg1o8WBjI7uITrbujH7rpLagfzyp61kp90
	D
X-Google-Smtp-Source: AGHT+IGyyW5KndiFNz+epN7jJRTXH3ZBYGRiXtHZ+r8Fe0tboO3Y2/PcZ2TNfI9i03f3ztbYgwYyLg==
X-Received: by 2002:a05:6870:3294:b0:24f:cd06:c811 with SMTP id 586e51a60fabf-25d06eddeebmr18624565fac.54.1719623504024;
        Fri, 28 Jun 2024 18:11:44 -0700 (PDT)
Received: from ziepe.ca ([24.114.37.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53be5sm1784142a12.16.2024.06.28.18.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 18:11:43 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sNK8e-0004rF-Jn;
	Fri, 28 Jun 2024 19:32:16 -0300
Date: Fri, 28 Jun 2024 19:32:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 07/10] iommu/riscv: support nested iommu for
 creating domains owned by userspace
Message-ID: <Zn858MB9/t1qltV2@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-8-zong.li@sifive.com>
 <20240619160211.GO1091770@ziepe.ca>
 <CANXhq0qqrU8xbTecFOcRNLqm2=DbTYsN2YBX5K_O1ha530bu_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0qqrU8xbTecFOcRNLqm2=DbTYsN2YBX5K_O1ha530bu_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_181146_181435_54AE9776 
X-CRM114-Status: GOOD (  27.45  )
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

On Fri, Jun 28, 2024 at 05:03:41PM +0800, Zong Li wrote:
> > > +
> > > +             if (!dc.fsc || dc.iohgatp) {
> > > +                     dev_dbg(dev, "Wrong page table from user data\n");
> > > +                     if (copy_to_user(event_user, &event, event_len))
> > > +                             return -EFAULT;
> > > +             }
> > > +
> > > +             /* Save DC of stage-1 from user data */
> > > +             memcpy(&info->dc_user,
> > > +                    riscv_iommu_get_dc(iommu, fwspec->ids[i]),
> >
> > This does not seem right, the fwspec shouldn't be part of domain
> > allocation, even arguably for nesting. The nesting domain should
> > represent the user_dc only. Any customization of kernel controlled bits
> > should be done during attach only, nor do I really understand why this
> > is looping over all the fwspecs but only memcpying the last one..
> >
> 
> The fwspec is used to get the value of current dc, because we want to
> also back up the address of second stage table (i.e. iohgatp), The
> reason is that this value will be cleaned when device is attached to
> the blocking domain, before the device attaches to s1 domain, we can't
> get the original value of iohgatp anymore when attach device to s1
> domain.

This is wrong, you get the value of iohgatp from the S2 domain the
nest knows directly. You must never make assumptions about domain
attach order or rely on the current value of the HW tables to
construct any attachment.

Follow the design like ARM has now where the value of the device table
entry is computed wholly from scratch using only the contents of the
domain pointer, including combining the S1 and S2 domain information.

And then you need to refactor and use the programmer I wrote for ARM
to be able to do the correct hitless transitions without a V=0
step. It is not too hard but will clean this all up.

> > > +/**
> > > + * struct iommu_hwpt_riscv_iommu - RISCV IOMMU stage-1 device context table
> > > + *                                 info (IOMMU_HWPT_TYPE_RISCV_IOMMU)
> > > + * @dc_len: Length of device context
> > > + * @dc_uptr: User pointer to the address of device context
> > > + * @event_len: Length of an event record
> > > + * @out_event_uptr: User pointer to the address of event record
> > > + */
> > > +struct iommu_hwpt_riscv_iommu {
> > > +     __aligned_u64 dc_len;
> > > +     __aligned_u64 dc_uptr;
> >
> > Do we really want this to be a pointer? ARM just inlined it in the
> > struct, why not do that?
> >
> > > +     __aligned_u64 event_len;
> > > +     __aligned_u64 out_event_uptr;
> > > +};
> >
> > Similar here too, why not just inline the response memory?
> 
> I think we can just inline them, just like what we do in the
> 'iommu_hwpt_riscv_iommu_invalidate'. does I understand correctly?

Yeah I think so

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
