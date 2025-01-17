Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43252C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1dhaIn/GxueYjP9Vpp7lyfoHMjzRqV41iv5Ld8udsQ=; b=Fm57MhekqXMsnD
	eoNW9d5ZBNiFAviKF4kqP/AOmg6nffKO3dY0SBx8CQkKIXdnsxwrMJpFdZe8swQA4ex4P/4d3QkhD
	4tzx9fXP/eozPE0XQMoPU/ZE/soXUtRxPxSOmyWNyPK7pchcAQH6V/o4BD/U7N8/Y6Y6vouOOSm24
	ab33mhq47HXo90OUgjddSGBzSShjeMCI1Creqehpo22V8NhxzTJ1xTDWRcoR7+00MVmtXBOpNsBWR
	sN5b2tY5o3BaJa8JWBqY1fJMpxSSZq2+J92Ed5ZF+wys07mhAXqcrmbefWFEV7lk1GEARisdN/fwx
	iSmZ4S3nCWGyG9JM39Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhtD-0000000HM6L-2Ja7;
	Fri, 17 Jan 2025 08:39:39 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhsV-0000000HLxu-4A0J
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 08:38:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1925294e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737103134; x=1737707934; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phCkAThSkaHv33wSw1qeoZNPv9mc+Clzmmzr3CFp7bY=;
        b=OrtoJaVZSEDnJ7WLhyYJMjm4Uvk/Y5Z/NX/Qn3v/NvsI95h08OQNA4oe1W7C6bPNYm
         BT4A/4SxM38QIj9uVVtnBXbovYUpyp23ePRvZpj06+vwBbSCmt3kLKYEG8bWiXlXPJ7k
         61wkhHjDQ0p8GiijbYuSCN76GRJVIdaIWIsef6WH2SBr68FUd4xgpvnqLYfKIYByO58M
         MIHjZxcsF+dAq3URlP58jdo3InJxFFdzAkf2WEHIirkRgionYsDZPUa//3pHwHopX02j
         T0U/pDOlVqq80RUj+6cGd5s0JQ4difKaafhbKxvVuX9zCOvYEjAWDx12fjzzdhMMeL+n
         HzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737103134; x=1737707934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phCkAThSkaHv33wSw1qeoZNPv9mc+Clzmmzr3CFp7bY=;
        b=TDVxv1wel0Di4Q6bXx5qPBmXaXM/6Tl3GKl4wpHO+1TLYU2iqqve7SUZ8jwgaqgSks
         X43/Tvz+aDeTzO7JG1j+zHZASqLp88qahc79KarJ6PYJaNoTaoM56XsCj4O6qzCqh/WI
         Ca1PyFESyPaDE1UuDbUy/0AXm4M2UttyaCdoKLhv3iTqsUq44FFIyzKyVt2fQljTDaxx
         VyEmh3uSOD0VC0AtGWYTkg5MKaePiWeRM0Vd94ZUFXPNn1hw5TjglN/+/YR8re/02rnR
         2RBOOs9II85YaCj5y9eMWow3DiseHJgstb+J1EpToUFlTAKwjtkfgr3dfoqKBOuaGzwI
         3ysQ==
X-Gm-Message-State: AOJu0YwuVaI7LDs5mkmTuiFveWjcwU5MswxcDVhHBJ59+Mp5Kswl3BqW
	JKKVxl1LU/9xa0svOfKYZr24tIpVE8FM8gvm4HJca+Umg9BokmEl
X-Gm-Gg: ASbGncvPL13IPCml6uUlQ1mO5z7x+RcUiE/FgoLJ+ouVfLjE2pLkEn1xCK5hOBarEb2
	hEomBc055qYkoNikVZy2EcG6LLBvxW7KS4qL89IWrj4acHiCuC9TuvryFPwGkz8H8nv3tWvZXck
	gqbRHfMu5D15VPVb4d+Sd4lJULut/5DCS3WBd8YuowdGYS4LksUs7M7Dw8HfLJIKVA4T7WosKCE
	26qkdjRHYcl6IU0ZJE7ixJevXmBV+K/1XBcg82OeOiabjA=
X-Google-Smtp-Source: AGHT+IGPR58JXW2CvqeP3ZEGQz9M1pTPGCM8DkLCSABZ1gi9AN7l3rZqU3//sE5p59h8unREvgAsMQ==
X-Received: by 2002:a05:6512:3e28:b0:540:1f7d:8b9c with SMTP id 2adb3069b0e04-5439c286bbdmr514239e87.45.1737103133760;
        Fri, 17 Jan 2025 00:38:53 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60c4esm275733e87.128.2025.01.17.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:38:51 -0800 (PST)
Date: Fri, 17 Jan 2025 11:38:47 +0300
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
Message-ID: <Z4oXF2ewizIIk1cL@curiosity>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
 <20250117075238.GA25422@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250117075238.GA25422@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_003856_030444_91611C7A 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Jan 17, 2025 at 08:52:38AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 16, 2025 at 08:29:35PM +0300, Sergey Matyukevich wrote:
> > Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
> > page-based memory types in PTEs according to the requested DMA
> > attributes. This is the purpose of Svpbmt or XTheadMae extensions.
> > Zicbom or XTheadCmo serve a different purpose, providing instructions
> > to flush/invalidate cache blocks.
> 
> Please explain what this is supposed to solve, because the above
> explanation dosn't make any sense.  DMA_DIRECT_REMAP is one
> of the implementations supporting dma coherent allocatiosn for
> non-coherent devices.  So selecting it from something that
> just keyes off support for an extension, but not the dma
> implementation is wrong.

Now DMA_DIRECT_REMAP is selected either by Zicbom (standard) or XTheadCmo
(vendor) RISC-V extensions. However neither of them can help to implement
DMA_DIRECT_REMAP on RISC-V. So selection of DMA_DIRECT_REMAP has been
moved in Kconfigs to Svpbmt and XTheadMae extensions.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
