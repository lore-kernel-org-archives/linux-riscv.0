Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E4CC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv8F4XRRdhwWEfkNoQC6Rwaorc849OZdwakAUvE+tlo=; b=MVs+iR+3b5YhIW
	ye6mk78tjOhlRpf3kgRttBE2ergZf4Nv4WbR27VWlXf434GoXkbaIyYhfxR2KrnBwmMOhIFKzZNIB
	/gnODbfimOhEXZUcNGtbn3EhUcu22r5VRa8gmHqklWi3xieJzHCunwyHMbE3+hTUiZrJSoS5nBDJ8
	5RkEDNCnbC/byL8FFoBJ5GYw38Xr1uR84FCz2HlOmhEp9GDJXSmwjca3ukO9gp1TDx+wL8QdA6rtJ
	ehZphSDPrvEHQOqcdAslsaHh1XIin27Nib50YhoV+0hYfklbQ4vyxlxKXheC9ZkeKQ6O7BzgVg0ln
	HKgulbZbaeK1hWJPRBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Td-00000000Jem-0J65;
	Thu, 22 May 2025 08:40:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1A3-00000000GNH-18sf
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 08:20:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-231f6af929eso62104805ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747902018; x=1748506818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RcuFGqMF/ZgB6n2L9RXkll3Uqc1w8n3CtfrWdVWfP90=;
        b=GVxpkaVsJzogA1ORgIps2oGI9u1UfPLzEMJLTP44rmZ8FICKkgCDZkj/bAiRGRjsRf
         hkQDxQTt2GJh+EjtjZ5Dd8HGSdjsJ/dkTESW/1j/MRlOKcf1t1LrheMa5kaWfjjbcz7f
         VC0prB04QB5xfDcXfW8u3bfkOYf4l8dvzll8I8Ys/NvQ5u4SjIrdwUXTxojZfi8jwWS9
         NnXJgGc8RFuEFOwyCWY8szxHt2vyJsr0UKpmJCczK8Z0yIhOdGKQoX75aAwf/4YSBkoS
         +UcMXcfZZl9Mt+oU614O/wr/IPRstqCOv81IO1LUw4PeGNeBlD3Q/THS8iYJu/xDY7NI
         D8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902018; x=1748506818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcuFGqMF/ZgB6n2L9RXkll3Uqc1w8n3CtfrWdVWfP90=;
        b=hPbiroQcd6Obv+zMD7MVv+1XJEcdv1xRrsaFSgYsTSc7dan6cnI57sW7+EcNJKRqwO
         QxgYFyVGovgtDVLKhgtqKNeXUjfZYiHHhcm1Ty1ruO6VKPlgtUr5kOsBoMIocUDa33hq
         bzc6nrh+eV3l83M965ElSgYSKyLEg/wBw5Kz6JP4iDkcYNzS5k2L4SZ3jJwE+ZPqGTa8
         rw6CbkNryb/DWFzCqj4Ry5csmPMCm8OKUFbtWGyTJzx4+60PqTTKfL3MQwRNtLfx1psz
         LgqtmqeYMzOiRadt6dezANef7kXPN/7PyA0wTEl9050KeqogsjSWBQXCiTvC80kzCPQi
         QvbA==
X-Forwarded-Encrypted: i=1; AJvYcCXXn/RKDDrpX9ke66V7arE2lkZfzdGKHu4hitb3o79G8WssjDMxMW/WACzvKip72x9lHpzLggGwqttBXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYYg2S90dzkEmnapVMNn+4bli7TDP3IqZ+gp3CwPQTMUaGtmQE
	HPvu+E/mIWQ9iyfvjaGZTEcMdjT/hdEFGDySnQGFn9i4zM5j9nOD7BBLS4z0W00C7z8=
X-Gm-Gg: ASbGncuw1pLkBCZYqUCh/RY6XITvzR2CouVZwDra1IcwTSVxJTYBd3pacBXlez3/TFa
	0u7wXBr16XQ4CdXsCHN1jtQ+4YUD7uu6Q/9+LrMmffsCU3gwLLtFkJka11+hL927FepsCBt+IXD
	Sr3LMtQpOFh/lP5Uu/3jWUJe1l85nm0dIxRlCB2ZJJFX/yuQYDJlmc9PXkELeszs2Q0pQI7o75e
	LKanZHdrJ8l9Njf6cIk+2fUGU0z69tzQJ68Uxai/wUTKvX/qGGoc4aTNRbLkw3sQPiB/76W8Twd
	/ZOLjUwmSDeQJjNAaFAWHTfM7cr82P0G3pljdvE9qKoXX5rBae1R8VwxPv7J
X-Google-Smtp-Source: AGHT+IGWUWoZ8nlB1v4QhGuyYjXUJIGpjeTdY9aoCLZrIG7jsg9/EnwS5AkAfpjE8UnXzW0/hfZx3Q==
X-Received: by 2002:a17:903:19c4:b0:220:e655:d77 with SMTP id d9443c01a7336-231d452d0e3mr353009895ad.36.1747902018137;
        Thu, 22 May 2025 01:20:18 -0700 (PDT)
Received: from cyan-mbp ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adca4asm104828005ad.78.2025.05.22.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:20:17 -0700 (PDT)
Date: Thu, 22 May 2025 16:20:13 +0800
From: Cyan Yang <cyan.yang@sifive.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
Message-ID: <aC7ePdD0bNhi48kz@cyan-mbp>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
 <20250516030310.16950-3-cyan.yang@sifive.com>
 <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_012019_317263_BF78A8F0 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue, May 20, 2025 at 11:26:39AM +0200, Geert Uytterhoeven wrote:
> Hi Cyan,
> 
> On Fri, 16 May 2025 at 05:07, Cyan Yang <cyan.yang@sifive.com> wrote:
> > Add SiFive vendor extension support to the kernel with the target of
> > "xsfvqmaccdod" and "xsfvqmaccqoq".
> >
> > Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
> 
> Thanks for your patch, which is now commit 2d147d77ae6e96c1 ("riscv:
> Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> in riscv/for-next.
> 
> > --- a/arch/riscv/Kconfig.vendor
> > +++ b/arch/riscv/Kconfig.vendor
> > @@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
> >           If you don't know what to do here, say Y.
> >  endmenu
> >
> > +menu "SiFive"
> > +config RISCV_ISA_VENDOR_EXT_SIFIVE
> > +       bool "SiFive vendor extension support"
> > +       select RISCV_ISA_VENDOR_EXT
> > +       default y
> 
> I guess this has no dependency on ARCH_SIFIVE and does not default
> to ARCH_SIFIVE because this extension can be present on non-Sifive
> SoCs, too?
> 
> Probably I should have asked this when the other RISCV_ISA_VENDOR_EXT_*
> were introduced, but at least for ANDES I already know the answer.
> 

Yes, you are right.

ARCH_SIFIVE enables support for SiFive SoC platform.

RISCV_ISA_VENDOR_EXT_SIFIVE enables support for SiFive vendor
extensions, which are not limited to the SiFive SoC platform.

> > +       help
> > +         Say N here if you want to disable all SiFive vendor extension
> > +         support. This will cause any SiFive vendor extensions that are
> > +         requested by hardware probing to be ignored.
> > +
> > +         If you don't know what to do here, say Y.
> > +endmenu
> > +
> >  menu "T-Head"
> >  config RISCV_ISA_VENDOR_EXT_THEAD
> >         bool "T-Head vendor extension support"
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Regards,
Cyan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
