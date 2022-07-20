Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF0C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hAqw+sBkYRoTU476oJ6pIzNUYp7Bx7qNGqKWylO18A=; b=2Dz5LFs8Gdn7Yu
	L3Owwb5NvvP7yuSP0QvOzfPaQqfStFAQeBPgkkrPeNgP3mrZyVDsosjZVepQwel3qW6v8vjidC4Dc
	gfHR+H6hxsrWegrfVF06RQHo/rXF8JQnVQfCZG0IDzdxdJ4s+hCYcHzhXv6L2MADTn1ICOx9CiRee
	r8ZjzGkteXxDqQ28dPA3ZBxm3NzdF060wzRRHqcwkOxPbFkd8tZ3QdFcr63uZisF17BtOgwo5/k4K
	/lPfgqFw0r8fzwDTvim9qqD8xYDicW10eWstMMnb0XvcF86gFZ8JY42/HY2yxqhRs6J/GB1SwmPIM
	5516ZNi94vTzTzI99gjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9gb-005yNP-KN; Wed, 20 Jul 2022 13:24:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9gN-005yER-4f; Wed, 20 Jul 2022 13:24:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id y9so16466586pff.12;
        Wed, 20 Jul 2022 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qoHI37+zVu7Qu074WZ6GrbYXTMMNTsp7PXDFTwcZApQ=;
        b=jkM4/VWCQKNXt88rlV4yLzjzVpZ+BxaEQxOTjHLxnMBf2F9hAAZVGP4bKTmw6kzeOK
         8Cyl1AfrpG6hcI+aVH5qnXjIxtIyyA+xNJ3s32sC5cYdNK1CgzQ/MxEv8mEi9xX+j7HP
         YwEOneXyP3+K8VHIha8VQnBbTl9TERdXgtXVSpJf1RjT/YXyCTyxfSKbpztOv422F6m7
         e4QPTSafxtGn8cok66RYZQLtTuI7JgfK4w/XpiM2K8hn2Scf0yaayaXkLIUXjtAXo/87
         iN7nt65xBQek8y08NkCpEtaGg68iEYDek68eZzh2P/1RqII9orvyXNymLrWg2R3u8CV/
         SyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qoHI37+zVu7Qu074WZ6GrbYXTMMNTsp7PXDFTwcZApQ=;
        b=VcOUNXHa5qfeQZ3f1P1ZBEoBNHh4+yAi65Y+6h6U85WVtZk2fkoFGLUAtJKL8PnFW5
         ljsMznzKd7EKx5cpXWnPXCqMk+Rs2BCJIdxOaJKB+x+Z2vmYMhzYVGwMiXxvXiDKCP3O
         AuAq1NWHX9nQ9MjFwepQ/lVW7lNFPVmTPYIBgPiA92pbOyXL+KDu/+RxOJBHSRW1TaYJ
         Yrw4eVyH6+EWchKpx9/ZCvg3pDLOvbXW48X8JcpqN2I1P/zv4gibMHxq9Qg9KVr+fX2z
         0t96d4imE+b0UarXc70uXPC41zfAvXyRBtC7/R2OSiMeLkkvUXqkdh/NstifjtHyoDYx
         sb4Q==
X-Gm-Message-State: AJIora8hY/o0bM0KyBWoo1CZDGB0FnX71UyhDeRp0ydBCdWhyS1eJHRj
	Cr8tWrhOadCRtbFi4DWse80=
X-Google-Smtp-Source: AGRyM1sMVPCqO1HB0VzUyhf95qtf0daAcPdgM7eDHGhO9cf71JB8i8DeEBqMYiJ6/usOYcxxnT8BCQ==
X-Received: by 2002:a63:464b:0:b0:419:78b4:dcf1 with SMTP id v11-20020a63464b000000b0041978b4dcf1mr32196171pgk.500.1658323444156;
        Wed, 20 Jul 2022 06:24:04 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id h3-20020a63c003000000b00416018b5bbbsm11870969pgg.76.2022.07.20.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:24:03 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:24:01 +0900
From: Stafford Horne <shorne@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
Message-ID: <YtgB8SDLB4d0adfB@antec>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
 <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
 <YtaNvpE7AA/4eV1I@antec>
 <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
 <YtaiSEAnMhVqR4HS@antec>
 <874af766883a4c0da6759eff433ec6d6@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874af766883a4c0da6759eff433ec6d6@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_062407_210513_A2649E97 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, Jul 19, 2022 at 03:09:35PM +0000, David Laight wrote:
> From: Stafford Horne
> > Sent: 19 July 2022 13:24
> > 
> > On Tue, Jul 19, 2022 at 01:55:03PM +0200, Arnd Bergmann wrote:
> > > On Tue, Jul 19, 2022 at 12:55 PM Stafford Horne <shorne@gmail.com> wrote:

> > Option 3:
> > 
> > > Or we could try to keep the generic definition in a global header
> > > like linux/isa-dma.h.
> > 
> > Perhaps option 3 makes the whole patch the most clean.
> 
> Isn't there a define that can be used inside an if?
> So you could do:
> 		if (!IS_CONFIG_X86_32 || !isa_dma_bridge_buggy)
> 			disable_dma();
> (but I can't remember the name!)

I think you probably mean:

  if (IS_ENABLED(CONFIG_X86_32) ... )

That could work too, but we still want to move the definition of
isa_dma_bridge_buggy out of architectures and into the global header.  I have
gone with option 3 for now.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
