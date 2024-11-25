Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC5D58D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmGvTvGZ21UoRn8BYGZlZ2XBaAzzvSIX7VL4PdJmoJY=; b=gF0i3i1ioWjPdR
	Iru2yl/qpkQ0gxltCWQw3HjpyeDxeKtMWtyqGxuUQxIoPwIrYZ7ytG6Yk2Ryh4ypyPlWxCEIjWVLb
	pcoJlm0WavM8DuDet94H1O06aWAzjvLtzfNQ4DBGsLa5FVBD/XlqosY20dmtmirYPnHraQ5Gzg67z
	0JatqIVi7xc6DLuo65TvFdnidCuSEZK7mNy3H4gpIcTvjYe4u4w9dgP/djPgINFLBRUf4kqhW/IKC
	5zIH9GWqC6BVtgtY3eDv4rbia/VLY5xPBjPUAdiQGEDADwAzu0QG+NX1OA3HfMuXm4CKcuIh+wDDi
	re0eY25dBzt04jjBsIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFah1-00000008OW7-1goP;
	Mon, 25 Nov 2024 15:08:03 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFagV-00000008OPA-06tn
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 15:07:32 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7b15d7b7a32so335339885a.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1732547249; x=1733152049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twGWU6mtjTufZth/+pvf0jPNX0dQZ+T26QxysrcZJis=;
        b=cmEpcNXSmiHLSBcmuKYkPItXpKPcfoUNdM4Y4J8Gpmm/Y4o+YfAyHC0KsmAxgM9HW0
         y9IhVzi6WjSNn3X/vKcT6KpVY6WQYwLYY+jSBlq6nqpr+gYDmS+Fy/rBhJ8tR1UeUqO5
         BTPbTPDPfY1hb06h/OhnqIG+PjwPklc0BpPA7b8OL/ta733STSetKLhVuqZgIFUTt6Wu
         acpVjXU0ZSJvIjV1hXe6Pf+SeIK5d80CiUxMSOGKF/u3pITvB73e50nHexXp05WPfe3p
         8VXtfed2ZIpsf9lCZe72SO8FuC5P/9OOcY8LScWEm0Ep635CDO82NKXXlmjm2kkm92+Y
         UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547249; x=1733152049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twGWU6mtjTufZth/+pvf0jPNX0dQZ+T26QxysrcZJis=;
        b=QPbYZGLfnbb6St+u20OvEsq6iaJY06SG6kekxyVPx0DPi/48CECR9dyekKe/sUtMaI
         mPdeVINC9kpIOwobARHnQiMWSGHKausDocQjUarM3oa+9CcJY2qPrRsJyB0INgFTSSg+
         hiNd/Ur3/Hgje3+qvaM5RIbhAYCWTik9RX0xwcZvvcXpvibUodFHJgeFKYhrAU4xbfje
         fwjkeIBT7kKNW5ydAWw3lNdJa78Z4UbBomgYGLsPBx57kPHGdFONbzdDTN8iKqA+WGpb
         ioG22NpnQQ8U71jAwbyBFmehqfehsMEos+t9Mv5Vhv0aIuLXZWiqKZPKasbCeSI50pDw
         gVbg==
X-Forwarded-Encrypted: i=1; AJvYcCXrCeLSQPwWW/lCkZU5rub1lTPtmKW6PJmo8D8lrb96EM70y0T4a6pwnVmEvvNPIpH9UJUETqGyNc9Keg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxewHYzd07ncywks7+YXOXdBhwfoGVe5w6oMdH7gYdoVh8yU76M
	Aek+oYMhJC5mN4ZcRrHOsgkW07VrNXW8PXWyoLcdrl35pmz5hxM4xBThYWOAUBq5YOU4sNUQzBO
	Z
X-Gm-Gg: ASbGncv4+BFqzpubxYyLVFjtz19X456VSAPy16jTkGvP0JAss41gN5FBKEEvfylISRH
	EP2k1FXFVZxF622a7wiPEX/mfufY5aDLmch5bQ5V1YrV8zVo0as/sLfcjS2zdjFp5fLxaIPz8jX
	EeVZD0N9kZAsFlMpDVNgICN+U/SoDhZeF02g8kbr9PXWU8kxAlJlkXBkuOhqePsBYgaaGsUsSuk
	yXHG6kHDHV1JQDGC2+H6D6sz15zLOSjY7ugL1f+doQGkfC5BlRKKQxfURA+n4R9mcFJZRb2XBu3
	EUGLngW0LYXxwEa/tAGrswM=
X-Google-Smtp-Source: AGHT+IFwf0rZmHcROgKHTVBJNGS81A60fdkLkHL/TjOd3GPuY+6MrtSu7XfH3JVuUswHCoYHME7qRA==
X-Received: by 2002:a05:620a:29c9:b0:7b6:6bd7:7adb with SMTP id af79cd13be357-7b66bd77cd2mr503418185a.23.1732547249439;
        Mon, 25 Nov 2024 07:07:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b66c8d41d8sm99837985a.95.2024.11.25.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:07:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tFagR-00000004zCr-3o1V;
	Mon, 25 Nov 2024 11:07:27 -0400
Date: Mon, 25 Nov 2024 11:07:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	zong.li@sifive.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org,
	tglx@linutronix.de, alex.williamson@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241125150727.GD773835@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
 <20241121-4e637c492d554280dec3b077@orel>
 <20241122153340.GC773835@ziepe.ca>
 <20241122-8c00551e2383787346c5249f@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122-8c00551e2383787346c5249f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_070731_168422_906062DA 
X-CRM114-Status: GOOD (  14.50  )
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

On Fri, Nov 22, 2024 at 06:07:59PM +0100, Andrew Jones wrote:

> > What you are trying to do is not supported by the software stack right
> > now. You need to make much bigger, more intrusive changes, if you
> > really want to make interrupt remapping dynamic.
> >
> 
> Let the fun begin. I'll look into this more. It also looks like I need to
> collect some test cases to ensure I can support all use cases with
> whatever I propose next. Pointers for those would be welcome.

Sorry, I don't really have anything.. But iommufd allows changing the
translation at will and we expect this to happen in normal VMM
scenarios. So blocking, paging, nesting are all expected to be
dynamically selectable and non-disruptive to interrupts.

So, you can't decide if remapping is enabled or not for a device based
only on the domain attachment.

I think you'd need to create a way for VFIO to request dynamic
interrupt remapping be enabled for the device very, very early in it's
process and that would remain fixed while VFIO is using the device.

The dynamic state of interrupt remapping would constrain what iommu
attachment configurations are permitted.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
