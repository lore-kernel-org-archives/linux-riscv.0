Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098FAC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hvda96CYcdrKR0PmSlmyp9yMdLYgLjWtYGE5v3sLxOI=; b=AW/YULMhVxEbyV
	XMWFp57Wu/w4AEv5nPq//pepjYtIorC1wF4ivQ1xMMMNbwfb9zKO7ExyZOqfdiGQL+4CWWQ7CZROP
	p4tu+5XkSsbJUhDcUU5Cy6USJr3NhUlKcmhbjGdiIWsabL/q+XMG4tHgODAWhYvBORMcIP7nzc9Ax
	cGTjKt5uP1JvPsUw58J3fOFgSfwjbdDzCEbzfrtVTqNzOT7+3TIO9fj72LPfj6MEJgtO9m26AqN62
	dVLakdaWUuymOmveWfTjqvlibMFBhFh3s2WE2I6ceHh/EDG28fUGzhF73KxB0jBv+07Gd/G6bU51w
	2pe4JBW71d2TUFDbKF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xNB-0000000HUkT-3FQ9;
	Fri, 03 May 2024 18:11:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xN8-0000000HUjg-2lMm
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:11:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so22565305ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714759861; x=1715364661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HP0E+W4CNjdiqYdYJTTOaBAgmGAiW3lunGcWq/PWMeo=;
        b=IlJ84b4UXXcQeica5+7cetOpxQMbSNQQmA6jmkKogo3JZ2fZtteZ0KSgt3fQuBAEnH
         Zj0UNQseq1Eb4KgdDSksUn+JJniniigreezP9R4W1PzLeCfRGuzu23eNYNGrlD4mCidv
         pusRYdZR48m8cloAwqLnsUVWggwMAIRf4Jq3TCYgg7FhoYDnH5lkqT8KwqLANiTMKk8Y
         oB4kWBIjXWH+tYNJC3k3arJ9BIGi+9oylFyllWSdEaL5DyO01Y6NX6mrZpKc90bcd9Zc
         sED8qOM/lK7xUHW2ifUPpC4QHJNmzbXOhSbPhuaXQufUnEVUpFX1/I2AgU9Qkw9/HoZr
         k/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714759861; x=1715364661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP0E+W4CNjdiqYdYJTTOaBAgmGAiW3lunGcWq/PWMeo=;
        b=o5HATs4/SX8q2Lj3VQwLswxjRM+YVZ3YyrdUxTFWPnhd9flufp7OGHIBsuwrYOuDgm
         rvs2XMxGybZJX/57yhwQO6/2F/9ZSAo+8p9vFLCpTmxFxVK22iBRie3R4chGzoCSJSzV
         nN6DZRyX3UXEvnXk5znyhfMcGmnd+50B7dmE4vrlBj3n0mIdUgdD5TmzC7I8r34ovU0k
         uN6Nzi/cQbIzM9pkoM93yjPU8GK5IYDCY7s4ZQLYtfZebF2vf1t8y2k0PFc3/TvugdNd
         aTp2DJW8d5zFP9hZ5hYsJWaW+w02yG7ocuqS3Q0dWRd27aUx8t35fqpLFdHIbsqDWupO
         6SPg==
X-Forwarded-Encrypted: i=1; AJvYcCVo2jPziurZvfiHSQVSLnUbys0QG1iefy7YVAqVlxQaihreQMNFlgLf8Fx9u34ckvGLsvbTwUOUKlvvF2+lk3oTFUFy/yft1dfZngfUu3DM
X-Gm-Message-State: AOJu0YwoeASG+EGaztuLg0XZ4R5vd8vlMqeo0upRjlqFbTp/Z/ZXr7bY
	TPZ0O4WGS0YZRvOVwfNTG2RLiK7b2Hd2kmjNWT3F/DJZbGHxaEiXpUb8SGkhYp4=
X-Google-Smtp-Source: AGHT+IHo2vpIWpxJAU/WjqREvj8GpGY4pEVGXqwcLeuMUP5qY8hdLdogyncesU12hPqCxKNhJeFqIg==
X-Received: by 2002:a17:903:120f:b0:1e5:560d:8519 with SMTP id l15-20020a170903120f00b001e5560d8519mr5281572plh.0.1714759861404;
        Fri, 03 May 2024 11:11:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709027ed700b001ec379d8167sm3590693plb.115.2024.05.03.11.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:11:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2xN5-007WHT-5q;
	Fri, 03 May 2024 15:10:59 -0300
Date: Fri, 3 May 2024 15:10:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
Message-ID: <20240503181059.GC901876@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca>
 <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111102_826308_3237CAA6 
X-CRM114-Status: GOOD (  32.12  )
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

On Fri, May 03, 2024 at 10:44:14AM -0700, Tomasz Jeznach wrote:
> > > +     list_for_each_entry_rcu(bond, &domain->bonds, list) {
> > > +             if (bond->dev == dev) {
> > > +                     list_del_rcu(&bond->list);
> > > +                     found = bond;
> > > +             }
> > > +     }
> > > +     spin_unlock_irqrestore(&domain->lock, flags);
> > > +
> > > +     /* Release and wait for all read-rcu critical sections have completed. */
> > > +     kfree_rcu(found, rcu);
> > > +     synchronize_rcu();
> >
> > Please no, synchronize_rcu() on a path like this is not so
> > reasonable.. Also you don't need kfree_rcu() if you write it like this.
> >
> > This still looks better to do what I said before, put the iommu not
> > the dev in the bond struct.
> >
> >
> 
> I was trying not to duplicate data in bond struct and use whatever is
> available to be referenced from dev pointer (eg iommu / ids / private
> iommu dev data).

I'm not sure that is a valuable goal considering the RCU
complexity.. But I suppose it would be a bit of a hassle to replicate
the ids list into bond structurs. Maybe something to do when you get
to ATS since you'll probably want to replicate the ATS RIDs. (see what
Intel did, which I think is pretty good)

> If I'm reading core iommu code correctly, device pointer and iommu
> pointers should be valid between _probe_device and _release_device
> calls. I've moved synchronize_rcu out of the domain attach path to
> _release_device, LMK if that would be ok for now.  I'll have a
> second another to rework other patches to avoid storing dev pointers
> at all.

Yes, that seems better.. I'm happier to see device hot-unplug be slow
than un attach

There is another issue with the RCU that I haven't wrapped my head
around..

Technically we can have concurrent map/unmap/invalidation along side
device attach/detach. Does the invalidation under RCU work correctly?

For detach I think yes:

   Inv CPU                                   Detach CPU

  write io_pte                               Update device descriptor
  rcu_read_lock
    list_for_each
      <make invalidation command>            <make description inv cmd>
      dma_wmb()                              dma_wmb()
      <doorbell>                             <cmd doorbell>
  rcu_read_unlock
                                             list_del_rcu()
                                             <wipe ASID>

In this case I think we never miss an invalidation, the list_del is
always after the HW has been fully fenced, so I don't think we can
have any issue. Maybe a suprious invalidation if the ASID gets
re-used, but who cares.

Attach is different..

   Inv CPU                                   Attach CPU

  write io_pte
  rcu_read_lock
    list_for_each // empty
                                             list_add_rcu()
                                             Update device descriptor
                                             <make description inv cmd>
                                             dma_wmb()
                                             <cmd doorbell>
  rcu_read_unlock

As above shows we can "miss" an invalidation. The issue is narrow, the
io_pte could still be sitting in write buffers in "Inv CPU" and not
yet globally visiable. "Attach CPU" could get the device descriptor
installed in the IOMMU and the IOMMU could walk an io_pte that is in
the old state. Effectively this is because there is no release/acquire
barrier passing the io_pte store from the Inv CPU to the Attach CPU to the
IOMMU.

It seems like it should be solvable somehow:
 1) Inv CPU releases all the io ptes
 2) Attach CPU acquires the io ptes before updating the DDT
 3) Inv CPU acquires the RCU list in such a way that either attach
    CPU will acquire the io_pte or inv CPU will acquire the RCU list.
 4) Either invalidation works or we release the new iopte to the SMMU
    and don't need it.

But #3 is a really weird statement. smb_mb() on both sides may do the
job??

> > The number of radix levels is a tunable alot of iommus have that we
> > haven't really exposed to anything else yet.
> 
> Makes sense. I've left an option to pick mode from MMU for cases where
> dev/iommu is not known at allocation time (with iommu_domain_alloc()).
> I'd guess it's reasonable to assume IOMMU supported page modes will
> match MMU.

Reasonable, but for this case you'd be best to have a global static
that unifies the capability of all the iommu instances. Then you can
pick the right thing from the installed iommus, and arguably, that is
the right thing to do in all cases as we'd slightly prefer domains
that work everywhere in that edge case.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
