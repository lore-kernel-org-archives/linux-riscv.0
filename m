Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9819AC02188
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiE74e99YYujBn2RCAQY0qgqddalvXWidtJ128/2Bv8=; b=AHgWV/IdNE7q0S
	ChBsTYfc9ebsXz2+q0QAIsYH8waP7e9x9dub6brtACTCQw7DVwqIEnbUANIT9HjW5LiKjbbEEQJJB
	b2iLYSwgSXfAZHOI7SfYgIt4xeQ31YxhLE0q8LVdcM95DW3gjKRpXDIEI7a1HGi+VzlLuSdXFO5Yd
	PLkzP0eopQH5wG8oTFb8yF+CTkmKi7BI0uG/CKOtZxOIXYptF3Jg5COCwA5HkLEacdczJSI3Djh0C
	9ELsx52AjFHyACaclHU12qxcjctGNvms4frFWg2wNk4DvVprk68u8ucikulT89GcYwezp+5qr8Iv4
	G8nrYejbu0jes9NMzlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYk6p-000000005iN-3sea;
	Fri, 17 Jan 2025 11:01:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYk6m-000000005hW-1jiO
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 11:01:49 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54025432becso2177326e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 03:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737111706; x=1737716506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/hfVNdiD8ZF1+lHEjxob8Hwbpl53iD8/OV5iv22cOQ=;
        b=Rrts7F3IGVAuxEI27Fs86oojxWQZ1jV8V4Khz9lPfPidrxRwFDZIY9QSfgF65t/7Ys
         776l1CprcpGu+Kq8FG+FTNcZGWFf/UJC/dTxyomBMCGPkCP9F9W6UnNpPpptZ4W79p8e
         tB2eVTEwkUgBODF+kVzLb2DE4WwKupZY8tmOofJLG9oEQ5OMDugPmticHGNxeVQR5DXP
         roAufUnryiHa9LNfjzothihC89yCeUEFYw+B8enJrLXc3dhMpEMvi80sX14Hj8UZv5yA
         R178qk6yjBjguXXrPiHrsE5C2ixtI237W/4QGAimEMk4Vi59RxrvkO7yT21RDU/RGOBN
         NWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737111706; x=1737716506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/hfVNdiD8ZF1+lHEjxob8Hwbpl53iD8/OV5iv22cOQ=;
        b=K9OYGYVv6VkJj8g5o48mXk9xpyrcXntuZjjSWz/Ch6+8e/Nf2sTj3ZZoxo0oqZdYNS
         cV7q/R+CyHtG7hKPwlgQek087Dd60ErFkCaBhIeE85+5kx5MVapdM8ro4ZUPCJYH+ey8
         UsIpvv+AaiUrJDwTIMsNF1Jsuv8MYkdpOgFW1edJyRaLMRFM7+362DsgDVfzHzt4ZPW3
         UaGO1ty/b1RQ+nwVT/XYSc98bq3UvUiOfdhlNo9JBzuk0rSFhOsYv+TPeaaiySKo6J2e
         FSQgR+tJjaL0W81QfIt1RS2WQ2jpINLtpcl35C2tUALYP6CS4/gfLo4eZQS3uFdYaxgL
         4HDQ==
X-Gm-Message-State: AOJu0Yw2O1DQPvN6NlvQVXM+sP4EbZKtaDGSDQ2iyW6vgUte8LSiCbKG
	b6zgsSPVxy+mADLYYjGGMs3j1PPbmWgXDttkoedOKRl+rjCV9jAu
X-Gm-Gg: ASbGnctzMLGbv5JHJ7vvp54HqwuF5bDuYq0NPkH/wRc8ezfi4c0CTcfLL2PMLRp9PkZ
	Rzjm/WgAbZL1Z/MLax5zddGw8TyBzw83q5+nybrmfOMgYDM65y7L3kgUSGER5Zrt9m4mR14XQ6K
	d2qe1GtYXmccVsnXELS2sGStGkYIWyZ3uE4jUOe5+YVbar/yC76cVNgCmUbH+dUd4yU/21bGCOp
	sW/fazJuaetyvsKzf4vvJh0NKtcHTi73n+ExXGT+R+q4IsY
X-Google-Smtp-Source: AGHT+IGe9It4lgmzQxKKvYmVgRpdLyID9nZin78MkWk3aMz0P/C1ucyECRHRA+UcEu1r+TOQPaKuzg==
X-Received: by 2002:a05:6512:128d:b0:542:238d:d714 with SMTP id 2adb3069b0e04-5439c2855e3mr811983e87.32.1737111705421;
        Fri, 17 Jan 2025 03:01:45 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af7364esm313195e87.162.2025.01.17.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 03:01:44 -0800 (PST)
Date: Fri, 17 Jan 2025 14:01:41 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Message-ID: <Z4o4lVb_AUiQcvM5@curiosity>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
 <20250117075238.GA25422@lst.de>
 <Z4oXF2ewizIIk1cL@curiosity>
 <20250117095832.GB2585@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250117095832.GB2585@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_030148_451537_FDCBAEE0 
X-CRM114-Status: GOOD (  24.51  )
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

Hi Christoph,

On Fri, Jan 17, 2025 at 10:58:32AM +0100, Christoph Hellwig wrote:
> On Fri, Jan 17, 2025 at 11:38:47AM +0300, Sergey Matyukevich wrote:
> > > Please explain what this is supposed to solve, because the above
> > > explanation dosn't make any sense.  DMA_DIRECT_REMAP is one
> > > of the implementations supporting dma coherent allocatiosn for
> > > non-coherent devices.  So selecting it from something that
> > > just keyes off support for an extension, but not the dma
> > > implementation is wrong.
> > 
> > Now DMA_DIRECT_REMAP is selected either by Zicbom (standard) or XTheadCmo
> > (vendor) RISC-V extensions.
> 
> Because they need DMA_DIRECT_REMAP to implement DMA coherent.
> 
> > However neither of them can help to implement
> > DMA_DIRECT_REMAP on RISC-V. So selection of DMA_DIRECT_REMAP has been
> > moved in Kconfigs to Svpbmt and XTheadMae extensions.
> 
> But Svpbmt does not imply that you even need DMA_DIRECT_REMAP.
> 
> Are you tying to solve a problem here?  If so can you explain it?

Sure. In brief, this about the choice between DMA_GLOBAL_POOL and
DMA_DIRECT_REMAP. We can use either of them to work with non-coherent
devices. But on RISC-V those two options require different extensions.

If we select DMA_GLOBAL_POOL, then we need only cache operations. So on
RISC-V it is enough to have Zicbom (standard) or XTheadCmo (vendor) or
any other vendor specific cache ops implemented using RISCV_ALTERNATIVE
or RISCV_NONSTANDARD_CACHE_OPS.

Using DMA_DIRECT_REMAP requires not only cache management operations,
but also a way to modify page attributes, e.g. to mark it non-cacheable. 
So on RISC-V in addition to CMO extensions we also need extensions for
page-based memory types such as Svpbmt (standard) or XTheadMae (vendor).

Current RISC-V Kconfig files enable DMA_DIRECT_REMAP for Zicbom and
XTheadCmo. According to the above comments, this is not good:
- it is wrong since Zicbom alone is not enough for DMA_DIRECT_REMAP
- it prevents using DMA_GLOBAL_POOL for platforms without support for
  page-based memory attributes

My suggestion was to move DMA_DIRECT_REMAP to the Kconfig entries for
Svpbmt and XTheadMae. In this case platforms without Svpbmt support
can disable it in kernel config and switch to DMA_GLOBAL_POOL instead.

IIUC one of your concerns was selecting DMA_DIRECT_REMAP under config
option not related to DMA implementations. Does it make sense to add
additional layer similar to RISCV_DMA_NONCOHERENT ?

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
