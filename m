Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABB3CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0jYCowm35mllEeEntC4FFT6UUpQVFDvuh6w+g8EgMY=; b=UYDfMQ3ugt7s+1
	dT219f3WFh18gSecvxLzVEpKZ4LQfllhN1i6srhci1lkaGA6yRBJQXZVutZ1LPxUM0aKMz5omC1WN
	Y2iv7yim+XHh7wHD9afzrt6yJ9CmKoI34KBxV3J/py5zPDU718tH5ekEN68q9gP7zNra6SvWhz0M7
	6DwRuXD0ED8JGlXAFLVThYW/02maTIIkrY6mypWPgi6WT1B4tzehiyp360hOlTr0qUfzbnpKQK5eL
	346I/GWSAvOj5YD18OkjTZMn0pDalc7n9J6AP/ELpWshpVAd9v7TdOOIQvVJZRBePa881XevBgJhr
	bWbjOPr+nu5J5wI3mc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKJj-0000000CVxy-2ny5;
	Mon, 11 May 2026 06:40:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKJh-0000000CVxR-0Toe
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:40:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c795f441ff7so2910533a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481636; x=1779086436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=X9FJW6sntGrAgExtdTI+pDSBZ9hOsuGsbuHZgNN9kXJvKTShmrimHZLqSDq9mC1LaH
         L/FIxTfu5oUNZbgexo/j3v0t4a7iP9Q3UT6GITYFJGWr1kgRAiuiW4uo27K6hy2Ttzzl
         Cxz/+GqR4tjEfQtEp+Xk9pbtntI77ql+HZfo5AEHo65KUH9fFPL8CcqoQKdJmlJgIOFT
         pLCQIQKQ4WwXgSJNt/DoiZgR6HjfkILDywfOjEJLnyzCZVBd2fuG/IUED7JaMuo31H8g
         NcHN32dvdkNSxpftyc0liM844ec8vh+5o1wEKv3Ctexh6j4fDZDa9QqQZLvXnfa6wscv
         aGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481636; x=1779086436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=qcVBbZQNrZFvTJT3U2FyP84ISvP7QMUH6MtMzGfkPqWVtpvsOLmcnHFdeUB2+b6e9r
         Xt2Q/BtjTrgh+Y/FRtmWKv8WBoQDHk4OOVxQM5I+O1BU5hNiJOVyugDIyF3ZzmPK3HyP
         0Lz9cUBJeM3A4exiS+x9DSa4roB2WzPRXDjaGVQDASGSeHO1PzspSwZ6zs4ZeVlkxwjo
         he2KTzNxMYdKYdU0AyX22lxFbOgZnBwcsOJ6+pjbTkF8c/w2PNz01H86rsZoDDzBu71a
         eQo7egXBq6sHxAxdv1wL3YgCINQgo+cbkuO9NFCydrm52rSgCp+qzInggH+NFb9Nvm8X
         acYA==
X-Forwarded-Encrypted: i=1; AFNElJ/1hksnPXaY/JXSmx9JodB/FhAjbzLk6QOjkfkJwuXbZ7lQ3bLFXZ4QniYwJ+kesjRJVE2HVn4EiJrrTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ysBWTtCPmR2Cp0EgD/eTSGSTPHgpeQYDJH7Ovno4yMYYBS5Q
	jh8fu7mTlbeben2F5eULxnBacG1n2YG6DcO3ajl4Gki2JazfGd4oMwmy
X-Gm-Gg: Acq92OFELaYdVLae3oO3L/mDNoefXr7DY2bEWOZ1v79g7fmyh5ZK0CoZ8D+DydtcZEL
	cBwdbwwoERBjQ074zubDTDWrjmYbeK+kyxi+N81NZ0t33cUnS1TilujPGoeFEaQSMwsuZ3TJd6K
	KbOTEeONzDny81ljoXnHoj4++tngwYcDqJk4AV81WDvIz1x0OEsFRNh3H5dXh2QrtDf2QkPSHzx
	iMMWtPf6X7T4+5/S7kuQpmU7MHkNN5BrBFjkCixiL/J/3y706l+npa2dz/7wOPa70y8g1dZfmw1
	FLGdP1Q9hbvU8qZMRV78vAViH6ReBc2MKWZs7Mnm1pehP9cjn04Ple0k14Glv9pvp/KCZgNTHhe
	oRDZtMuFwUNGVOpP/OxtN1SDhjpuTuFj14HT0wJPN6tfR336gvRXf9k6dhJ40ig9PKF4oLxFTCD
	qZlm6MQqT9WYISWKuHktu9DFQ=
X-Received: by 2002:a05:6a20:1582:b0:3a3:a6fd:7fc1 with SMTP id adf61e73a8af0-3aa5a8fc80dmr25500333637.14.1778481635951;
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267689d76sm7967107a12.11.2026.05.10.23.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Date: Mon, 11 May 2026 14:40:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <agF5dRASi8ombhFM@inochi.infowork>
References: <20260511063719.460049-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_234037_253634_EDD207A0 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, May 11, 2026 at 02:37:16PM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> This patch series add fallback compatiable according to the disscussion.
> 
> Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
> 
> Change from v5:
> - https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
> 1. Add dt-bindings patch for fallback compatiable
> 2. patch 2: Adapt the binding change.
> 
> Change from v4:
> - https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
> 1. drop patch 1 and patch 2 as they are merged
> 2. Add ABI break statement and clarification for this patch.
> 
> Change from v3:
> - https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
> 1. rebase to v7.0-rc1
> 2. patch 1: Apply Conor's tag
> 3. patch 2: Apply Frank's tag
> 
> Change from v2:
> - https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
> 1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"
> 
> Change from v1:
> - https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> Inochi Amaoto (2):
>   dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
>     CV1800B
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> --
> 2.54.0
> 

Please ignore this broken version, the right version is 
https://lore.kernel.org/all/20260511063818.463877-1-inochiama@gmail.com

Sorry for this noise.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
