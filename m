Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91364C001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA7jOlgDaXoCZ/J1xugOQGl/A0Id0z2to+AAqgwFPes=; b=xL1Ajb1U/5jFJt
	xXLFtiA2zO7oIDuJDltMHLpEfSvgRLQ73kh5wNqeDQm0AvDC6VLotwAnNpxht1a0DpQPnH3kQ4WZC
	yi04mDptzp1SFQDu7PIBzByI3EZEMvCRSwqWoItBcNik6P7OssQwBvs31KhimGF4KRPk/Q/nyyOfb
	3B5Lh/Dcs23T5Nsax/rl2UKbu+QXekFc8rmWb9LD85RQVi0ziKgLw9dZ7MEFBt/grOwrOJFRLEc5m
	9PjPzYudzQ4xYesgK7KYHlsga9ATfIYcb395mW4gRCyhAzAUBRCodcIydBuFqmwGFrdVeqWS0hjpC
	Twmtceh11+NkYlGpAG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcbS-001UGv-0J;
	Sun, 23 Jul 2023 17:10:42 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcbP-001UGO-2h
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 17:10:41 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1b3c503af99so2663224fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jul 2023 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690132235; x=1690737035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JgyTeqzzEBTgMPq8o2Ksi8juxN+B8S7QtSriz161NTk=;
        b=CndI0q4jZmZX+yEgkciWpQorfzd1k1dDevtdwVzqOqEOX3QhBFQxwzG2K49nXro12Q
         STMfrBEGeTUW1BpmHZyVioaIAxqQDnje468k53THnfue214Fv9W7gTI/Q22zrk/gvdlj
         fDDs3urkmL545jlsIrW8VeVvoOaCsRbZVfZHEMpOBpCv+0gy5iHTMOzV22sum7VyI+80
         zDnd3uMuq9bgYGSa3oCF7fI4taYITLcLswzvYLzxD7ogFNNzcbAGhfljCjqFW2GYej7j
         YlLsIORlQXELLhAwM+ZYFHP+xJkwVtdHUjrYLDzk8A//v6WM7++fwWFE6FDyC13lpAQY
         Lr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690132235; x=1690737035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgyTeqzzEBTgMPq8o2Ksi8juxN+B8S7QtSriz161NTk=;
        b=QnfNRPKdVfe220lR6r+tvpRUtOQUpwu275ylzlto5nX8vk0aWorJPPp+Lui5foUYJz
         08sZRohqUCMgl6rLld8F8uigOcjQHtnPp7bRSYvu7ecYITD9bbCRTsO9Rykr8ufu4NQe
         cIupaXBRkLvqkFLhQCrRgPxyDFoddEu25GSfL0dYcH/xLmwf/Ro/sFu+eKPkqOyu61gs
         c+rn1r7T5elPmby7/JfRj3xRJM8YWX7Cn4xX3xxO5rZrLePSqC+z1cAZmzzAucYEUL/i
         yr3kl+sr3xeUqjbLQagihb8UkO1xwFp/VKda3y9gI1KlhXRhZKL4OSytNUz3FeWHLAeh
         urzg==
X-Gm-Message-State: ABy/qLZi47NjdLrjQGn6Y2i9+KGhajvmQug3FU4HxoTJKoocaHFm0nBa
	NXqFxGjNw7Z66lqh+gA0c7rZPA==
X-Google-Smtp-Source: APBJJlE12sMCV2EzMzXjJOS4YAI2oblAQYPP3KokynCvM9eCcrdNQYdLfYc/J1E7WQSVveGVFPhvig==
X-Received: by 2002:a05:6870:a54d:b0:1ba:dbad:e70 with SMTP id p13-20020a056870a54d00b001badbad0e70mr9642657oal.21.1690132235204;
        Sun, 23 Jul 2023 10:10:35 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id n23-20020aa78a57000000b0068288aaf23esm6178456pfa.100.2023.07.23.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 10:10:34 -0700 (PDT)
Date: Sun, 23 Jul 2023 22:40:27 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem
 address
Message-ID: <ZL1fA0p4nFzvTdMP@sunil-laptop>
References: <20230723150434.1055571-1-sunilvl@ventanamicro.com>
 <20230723-penniless-revered-20ab702bcc8c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723-penniless-revered-20ab702bcc8c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_101039_896762_4BDF7DFB 
X-CRM114-Status: GOOD (  16.34  )
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

On Sun, Jul 23, 2023 at 05:49:22PM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Sun, Jul 23, 2023 at 08:34:34PM +0530, Sunil V L wrote:
> > Fix the acpi_os_ioremap() to return iomem address and
> > use memory attributes from EFI memory map while remapping.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
> > Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> Huh, there's quite a lot more going on here than $subject would
> suggest... This really seems like it should be a pair of commits, with
> a trivial one fixing the lkp reported sparse issue & a second one, with
> a more detailed commit message, implementing the memory attributes
> stuff. Doing it as an "afterthought" as part of the LKP fix does not seem
> at all right to me.
> 
Thanks!, Conor. Yeah, I agree. I had the patch ready to enhance this
function and when I saw today bot finding the issue, I just updated to
make it fix patch. Let me split to two patches.

> When you split it, I figure you should CC Ard and Alex Ghiti on the
> patch adding the EFI attribute stuff.
> 
Sure.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
