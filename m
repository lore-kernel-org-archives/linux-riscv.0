Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48158D60074
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2g1vBQn1DcXDYxKRE0uaktyRxKd8AzVKGESrWWHwpc=; b=KPQsEwT/vXi8wq
	cz59dSCJAZeXBm2GF1/FuRPRYdt3ZiXmSDMaid7YGRsa+ji8/lyca/gtHzNnm6942Pa6QrZQZZDRQ
	vwQrKlfyS7cXg9Ant4Ak2JoiFNPNLl1RYal5MusUxVfTCqGY4A2Ev1LX8TM7r7n3YHbPF0Pl046TD
	L/3Y1fgrYTCU9C0e4XlIk1bESnYs8G2UvPtPc6qqD9VTvz6MGmEIAr1bvE6+H0M12uFBsuRvLbrxY
	YeWwaOx/igqERycgQ1P1xdRqQexcF3HBO5YK4eGyACiV9c9NLPw7NzWUSfGjYMNUkn3kgQkinlkKQ
	6xSJWkDvUw0OYqUr2v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJbQ-0000000Bky4-2Y8Y;
	Tue, 19 Nov 2024 08:28:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJbO-0000000Bkx1-1XlK
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 08:28:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43169902057so42942045e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732004928; x=1732609728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cyUY32m7VUxlCTDLVt1b+JPHfOUSRIx7q0KXl7IQeQ4=;
        b=iSJJGCIuLZcagBy6KWUwPBOlhuR+RAXCiI3wqpA52RCXkjOhd/LQhn4jfVLhCDQVEb
         ii94LbhvGFeNIMOaRON2Bqg1LfFHDtYMRVKTF9f4b/NJkaGAEwJNNvT1lIuEZ/FYWXQz
         VdhzDt/oj8Z8gF2xIGd/6GjEXBPxirBVv4vVTGQdVE0NSntiFfQp3SVoGWn6ugidl7Po
         tasjOCVI0fV5hhCi8mkrJxYnpf5ZPNAT0ucd9mhJNiIiLt9LkUChNgTnoIpb5t0zhEdI
         4xqx2nm32+23tsF3mvtuAN+TMPAQZF90y5qZkEvUdoTfi06zy0qSD+9xowUi7cC5nsIE
         kEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004928; x=1732609728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyUY32m7VUxlCTDLVt1b+JPHfOUSRIx7q0KXl7IQeQ4=;
        b=i5zH78YkYdJk1kO5Zdopuypgf+SHh25yV6ndD6o/nzt4/DJ+sODtsmKt0Xlin+Efzz
         5E3tIlNg0C73SWYVIAbgNlOtQkUl/lAB+ihdi49SlsiU7MNxtTOdD64cgGPxVE8/uhQC
         m9Q99asZ6yJol5lxgeYf59ORroXoPFHKrlbbia+uN3iJdj2SFWR53XDCSlz8zouVnRT5
         PYCDSs0AdDdpWDm2byNVym0P+I7sc2kAKbM67+WsrpCx56ObTtJiMoma8qty8vdf4jcQ
         ipiw5bnVAP0CPw/+GQfrgG9OZpNCMXTzbqIJ71KYNWu9ibPizjuyIpdQWj6PKp7SrQvi
         TAPw==
X-Forwarded-Encrypted: i=1; AJvYcCWUHhrAjZpL7PZJuhRxxi+mHQsDD3lHgin7HHxkdSWRcbTBTZ6eVBXIVAJcY2TarorNSL5+y5T0y8eX7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGfDKF+MSot3iAtXg2DJli7Ry5jOYTKqnAugTLkwS2uBk9R1jK
	E/gKqEG49Vd1BPs16I9+BinE7eUsq9+pTrKzg6NrqB2q7jY+4GLfwOSHzjJd+gI=
X-Google-Smtp-Source: AGHT+IHpZMhXyydhQ7Idy4ENb5ObblYkccalbUBLPzNSlCP+c5FRHdBQ5a3DSr77U7024nHK4LI/fg==
X-Received: by 2002:a05:6000:2904:b0:382:4aa0:e728 with SMTP id ffacd0b85a97d-3824aa0e803mr4138031f8f.1.1732004928543;
        Tue, 19 Nov 2024 00:28:48 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac21a15sm183138595e9.38.2024.11.19.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:28:48 -0800 (PST)
Date: Tue, 19 Nov 2024 09:28:46 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	anup@brainfault.org, atishp@atishpatra.org, tglx@linutronix.de, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 04/15] iommu/riscv: report iommu capabilities
Message-ID: <20241119-76c9ff71b8834ef886b3ca86@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-21-ajones@ventanamicro.com>
 <ddd40bc3-7f2a-43c2-8918-a10c63bd05ba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddd40bc3-7f2a-43c2-8918-a10c63bd05ba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_002850_402608_6B3D0762 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, Nov 15, 2024 at 03:20:36PM +0000, Robin Murphy wrote:
> On 14/11/2024 4:18 pm, Andrew Jones wrote:
> > From: Tomasz Jeznach <tjeznach@rivosinc.com>
> > 
> > Report RISC-V IOMMU capabilities required by VFIO subsystem
> > to enable PCIe device assignment.
> 
> IOMMU_CAP_DEFERRED_FLUSH has nothing at all to do with VFIO. As far as I can
> tell from what's queued, riscv_iommu_unmap_pages() isn't really implementing
> the full optimisation to get the most out of it either.

Thanks, Robin. I'll drop this cap for the next version.

> 
> I guess IOMMU_CAP_CACHE_COHERENCY falls out of the assumption of a coherent
> IOMMU and lack of PBMT support making everything implicitly IOMMU_CACHE all
> the time whether you want it or not, but clarifying that might be nice
> (especially since there's some chance that something will eventually come
> along to break it...)

Yes, riscv selects ARCH_DMA_DEFAULT_COHERENT and the riscv IOMMU hardware
descriptions don't provide any way to say otherwise. I can put a comment
above the IOMMU_CAP_CACHE_COHERENCY case which states "The RISC-V IOMMU is
always DMA cache coherent", or did you have something else in mind?

Thanks,
drew

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   drivers/iommu/riscv/iommu.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > index 8a05def774bd..3fe4ceba8dd3 100644
> > --- a/drivers/iommu/riscv/iommu.c
> > +++ b/drivers/iommu/riscv/iommu.c
> > @@ -1462,6 +1462,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
> >   	return generic_device_group(dev);
> >   }
> > +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> > +{
> > +	switch (cap) {
> > +	case IOMMU_CAP_CACHE_COHERENCY:
> > +	case IOMMU_CAP_DEFERRED_FLUSH:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >   static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
> >   {
> >   	return iommu_fwspec_add_ids(dev, args->args, 1);
> > @@ -1526,6 +1537,7 @@ static void riscv_iommu_release_device(struct device *dev)
> >   static const struct iommu_ops riscv_iommu_ops = {
> >   	.pgsize_bitmap = SZ_4K,
> >   	.of_xlate = riscv_iommu_of_xlate,
> > +	.capable = riscv_iommu_capable,
> >   	.identity_domain = &riscv_iommu_identity_domain,
> >   	.blocked_domain = &riscv_iommu_blocking_domain,
> >   	.release_domain = &riscv_iommu_blocking_domain,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
