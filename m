Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30759D6AAE7
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoB3RSSIUZ2s0CmbNFOT+kS3+mS2VMOnU6iEFZoPvK0=; b=iW3K2ziVeJhuuV
	joFV57ZfXWl6HM7WTNUlYedpRF/3gCY3ScR1HwhhwSyXwP0d0cIfnw0L4lUKWO5FFYIjVdzVa5G5n
	n8LKv0ZWxF+WT7ggKfCMO1Vg6n1qX7hW+Ft4L6CBYlytApL1Lzj9zjxuRAXGjHW4OH2tuFx8jPmho
	L3oUWs5OdglrGXTpfoNLD2kvMezxiJW8YLW9JRURH9VfvM7fO6165g4GKdQ/W5yMzO/Hz+NgBNA/b
	MvPO4Awtcz5RuJUHdvzLSlz35pNRKQ1Nahi9tTU5a8uebPQeuHCJmdPhyFEk0SSAU8Q8QrZkcyQ4T
	vmMpFhPX85XVPCvzMQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QUD-00000000tGC-2crh;
	Thu, 02 Apr 2026 22:26:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QUA-00000000tFQ-3zj8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 22:26:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82735a41920so478329b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775168757; x=1775773557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=AyfbFhpI21I5xlGrUQG9y4L3zigVEzSmxhlXUWVScre8UyO86DcjeTCNy1jPoPI/lU
         wgr/tmADc6kXpwgfGCTPWdPWZIFSyb6BzBDMp3MLZ+vSrcZiCukKTZWZ3V9Wa5mqwpcd
         TeNZgS0vi19vwBAf0kp4F8LN6DWyF2lhZJzbMIzH7hULNdqIO+JLTS5pMt0YhLKWe/Yv
         zJi3VhNPsOHLaaNPzG4xdlKr5EhKBSQH8FKwH01ZPTy5XsoERsxFeGSRPGvzIc45e43f
         jmjRiVxRHj6rvrn4mAUPkqQBXfwAu0c8wQvKna/LBaZ4E9bsVr/2bDIxD+tRaMuflgL/
         FgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775168757; x=1775773557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=N3hArfTCnLMUPBAMVOqoxDfrci+dhdwtmKguhbllvjVk/kH8WCzZqaeVcaKRlIfJW2
         NM8GJP02zr2SewjR56vtK2u8/53DklrGQ992Zp/klHV6f1TksjoeaS8x3RB0kZonWHbj
         HxT3DkazJ1hz/t2ncRYTKBb3HZOGEd7QLu2rq5kziUw9GzECHgsUW+BLN7vgTfo39qUH
         hz6dzCH4q8sRmu5anBnDaDDhUNUrOyi+7wJVK01sbNGSIb3w+tcsLW8KjgbDcUne0Mmy
         hres4PesjD7CP3A3hz1iuakeajLgjsXZ6dms/iU27kylXOS9xtyty4+knTVYvZkHRJd9
         UmFA==
X-Forwarded-Encrypted: i=1; AJvYcCXnb5+a1M609iG214v0Q/FsltAv9m/ZFqV5MivYaRPOAtyYe9oVPw/KGqgbGvLuG8YnwkTmp/5K64gEJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEBd+/QOtElW//lvaAiRdFZNSlntsFynBuKBPwbwz3fLzUtubf
	n6jkkm0oqDwRBJ5T9tyJe7o4typKor3qm9p8hDmUvy9RNzGex+IjW+F9
X-Gm-Gg: ATEYQzyob7Hbk2gPC+WtQ36u6xm0YZEVxlbcPsVEuMtmh8i9peRwQOQRAzAJd7Pl0gx
	5oNWkC0RJsTcMaiVYlU9oZQfacJ1GepVQp1SRlGHudtRfQh+5rSjpjnSL1kIXbQ5L1sb/ra1vD1
	Gd7FQyE98X2XGoYg7InlQPsHVJ0rw36Xv06S+HdxKl1gYHDSdITEb8fMrzhI3enfIthq0rKxdCG
	yFoZUuF8TuVrNWCM/9aA+XWEIdFlRbhaHZa8eeJOMEb0lgEUBloCYIXEvam5SCiesnY6MFYZHqA
	zcF8yhHRbVhuTHkyV3wl0L11N317AxZjFcID5E3l4Ir0f7wWg4FTViNZjWhcMU7/M5DViK+9paP
	8fhkWpif4Dar+6wUT3/uLIAKyYq0Y1MZilCbW5yqmpqQ3cBn2tgvuH64czxEIF/xh8kQb0xBFJp
	rgvcqirkb+pllmFvAYDLkMkQrL4fvNya7qVQ==
X-Received: by 2002:a05:6a00:a0b:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-82d0da4594cmr742546b3a.1.1775168757075;
        Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm4338596b3a.40.2026.04.02.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 15:25:56 -0700 (PDT)
Date: Fri, 3 Apr 2026 06:25:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <ac7rV0xGGVmxT-V4@inochi.infowork>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152558_990832_2BEEE0C1 
X-CRM114-Status: GOOD (  18.36  )
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

On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> > For CV18xx serials:
> > Just a minor patch to replace the compatible for
> > dma-controller to allow setting DMA channel number.
> > New bindings and driver part change are picked by
> > DMA subsytem and this patch handles the left dts
> > part change.
> >
> > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> >
> > ----------------------------------------------------------------
> > Inochi Amaoto (1):
> >        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> > channel number for DMA controller
> 
> Doesn't this change break backwards compatibility with
> all existing kernels?
> 

It will break if a old kernel with the new dtb. But I
think this will break nothing since the DMA device is not
used by any devices in the old DTB. And if a user force
the some device with DMA in the old version, it is just
not functional and lead to a broken system.

> I did not take this one for now, need clarification, or
> a new patch that keeps the old compatible string along
> with the new one, if that is possible.
> 
>        Arnd

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
