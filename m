Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B3C4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QpxLwEAMo4JdaSXBGrdLvSmhsX7Ch9DXgRQ6VPru3E=; b=s1hi3ceIH4V5G2
	/8nsMigDmdFbfeywITzzhbc+csJvLJkz6ZGI0qMzR13eHT8eQcltYSJFHELp4NTLzJgUTSpT/szpd
	WtTchCJPTueVK6iOtYsUtwOjZFmiwR0XUGZpXfOy1tZqgISm5WNRzi5V07E2c7EJ8l2v67QMSbmkv
	sBzgaujjLBVtzfeDY1zUuPB7BkpelMGGwgiDuf5YYWiFe4iSBHRt9CQM79VmoKcLL4lI2lJnKhCH/
	D4v15hMOYNw7Lgy2SVXF9Ts9qQQwuGe+nAblb4S4Ks2OowG9KN4qxA0qBfSdOj6u5yJ5ZqQg+g1JL
	Kpx156+aiZzSj73Q1xwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3e4g-00000004eZK-2CXU;
	Sun, 05 May 2024 15:46:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3e4d-00000004eYU-0t07
	for linux-riscv@lists.infradead.org;
	Sun, 05 May 2024 15:46:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ec41d82b8bso10848235ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 May 2024 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714924002; x=1715528802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kaQDafqzubUAw9+/semCOIrnrfAwnNkCHgeJ4BoA7Vg=;
        b=Z5BMCR6Zan9GqeTdXJS4gNUs5DileYkVKgZrZHRY93N6woD10OmJanwOrNOXBe+4CT
         nBHaqSYcodgHVd19ExTFVQRm+12jZi61AdZNd6ms5ywNOD3SSTYUfdCm+iDlwfUOxu8M
         AaROgPUr+TGGnAbpCVYTXUWrD/XDOm6oyCW/yvllhY8PfEc5y08MyTeDqxa2S542wz1x
         EdgRNCvuqGvoq0KnPOt2gCyT4CScyn8SFhpZQIVIar2nvJADyCwdn5WjVkFIBw+qSqpa
         hGMYHNBeWl8NKdfR+EHfpHylhZ2DWBIfx43f6IEvrgDq6uaRaYKA+OH3ipcxcz5CsaRn
         7lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714924002; x=1715528802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaQDafqzubUAw9+/semCOIrnrfAwnNkCHgeJ4BoA7Vg=;
        b=w1qjpS9MoW3lB0obqkm/neSU0pq0AyZXQdEs+oSgsIltlUXCxV5M1dPWKPoKdLMzub
         zq0wvgcvDCoRYXEEznLPhbzADi9E1LNTMr3m5SSyxeeIxaxD12Sj+dcP83jgvETJF2jO
         olJwJC+d/gHmkwBagr77cgmivES9Zaljr1T7JCOxXtW/oSUv50mV3J0WQPU0gSQJN8j+
         1ys9y9eTr24NF/+TURRm0zj8phnZ0g16N6SLmSpCKkX8Xmyr4TClpjLfD4VmNzwH/2Qr
         s5t3Fn5fMF3lQVz5Nu/I0KgE5Bxz2mq9ZVHc0624gIVl2C59N5R6SRsd18XvylmlHEGe
         HyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhyIh3PlLSxOW2A6VVE3bMxNuJmt7AFqe0cvQIl7SpARY6hwFv+FKN5NKdaTxnNWPmjRCjKu3YYmN7tcCxHPr0qzTKbt5ddZAR6oj/RUN/
X-Gm-Message-State: AOJu0YxvQ8pcSmr/1o0m+GnWcodsg3bnga9JBzy5tIJxc91OHjmgrvfJ
	EkvUodgAtuejmDU6XEqcmQGQv7QSJ0OnjQsAZMFmvFbVyAHs5raRqFz6WnfZvIU=
X-Google-Smtp-Source: AGHT+IGrseAAt2y4uabYtqTQP/jWY6so2eoXUE8to+FlmXTVhjcIh8I045DqPXerpxzSkWzODtLLfw==
X-Received: by 2002:a17:902:bb17:b0:1eb:f263:d2fc with SMTP id im23-20020a170902bb1700b001ebf263d2fcmr8161144plb.54.1714924001967;
        Sun, 05 May 2024 08:46:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm6639923pla.114.2024.05.05.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 08:46:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s3e4V-00G2MH-FF;
	Sun, 05 May 2024 12:46:39 -0300
Date: Sun, 5 May 2024 12:46:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
Message-ID: <20240505154639.GD901876@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca>
 <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
 <20240503181059.GC901876@ziepe.ca>
 <CAH2o1u7av8zMucB2sKxBOZtd1eqEC4Qmgin=8VQ03pWbQdZUUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u7av8zMucB2sKxBOZtd1eqEC4Qmgin=8VQ03pWbQdZUUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_084647_410571_107952FA 
X-CRM114-Status: GOOD (  24.93  )
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

On Fri, May 03, 2024 at 12:44:09PM -0700, Tomasz Jeznach wrote:
> > For detach I think yes:
> >
> >    Inv CPU                                   Detach CPU
> >
> >   write io_pte                               Update device descriptor
> >   rcu_read_lock
> >     list_for_each
> >       <make invalidation command>            <make description inv cmd>
> >       dma_wmb()                              dma_wmb()
> >       <doorbell>                             <cmd doorbell>
> >   rcu_read_unlock
> >                                              list_del_rcu()
> >                                              <wipe ASID>
> >
> > In this case I think we never miss an invalidation, the list_del is
> > always after the HW has been fully fenced, so I don't think we can
> > have any issue. Maybe a suprious invalidation if the ASID gets
> > re-used, but who cares.
> >
> > Attach is different..
> >
> >    Inv CPU                                   Attach CPU
> >
> >   write io_pte
> >   rcu_read_lock
> >     list_for_each // empty
> >                                              list_add_rcu()
> >                                              Update device descriptor
> >                                              <make description inv cmd>
> >                                              dma_wmb()
> >                                              <cmd doorbell>
> >   rcu_read_unlock
> >
> > As above shows we can "miss" an invalidation. The issue is narrow, the
> > io_pte could still be sitting in write buffers in "Inv CPU" and not
> > yet globally visiable. "Attach CPU" could get the device descriptor
> > installed in the IOMMU and the IOMMU could walk an io_pte that is in
> > the old state. Effectively this is because there is no release/acquire
> > barrier passing the io_pte store from the Inv CPU to the Attach CPU to the
> > IOMMU.
> >
> > It seems like it should be solvable somehow:
> >  1) Inv CPU releases all the io ptes
> >  2) Attach CPU acquires the io ptes before updating the DDT
> >  3) Inv CPU acquires the RCU list in such a way that either attach
> >     CPU will acquire the io_pte or inv CPU will acquire the RCU list.
> >  4) Either invalidation works or we release the new iopte to the SMMU
> >     and don't need it.
> >
> > But #3 is a really weird statement. smb_mb() on both sides may do the
> > job??
> >
> 
> Actual attach sequence is slightly different.
> 
>  Inv CPU                            Attach CPU
> 
>  write io_pte
>   rcu_read_lock
>     list_for_each // empty
>                                     list_add_rcu()
>                                     IOTLB.INVAL(PSCID)
>                                     <make description inv cmd>
>                                     dma_wmb()
>                                     <cmd doorbell>
>  rcu_read_unlock
> 
> I've tried to cover this case with riscv_iommu_iotlb_inval() called
> before the attached domain is visible to the device.

That invalidation shouldn't do anything. If this is the first attach
of a PSCID then the PSCID had better already be empty, it won't become
non-empty until the DDT entry is installed.

And if it is the second attach then the Inv CPU is already taking care
of things, no need to invalidate at all.

Regardless, there is still a theortical race that the IOPTEs haven't
been made visible yet because there is still no synchronization with
the CPU writing them.

So, I don't think this solves any problem. I belive you need the
appropriate kind of CPU barrier here instead of an invalidation.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
