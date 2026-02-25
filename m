Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A08FD45F1
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gexDjrXu4IB2m+bszRLjSWse9wqWMUHtXijHjhSXgCM=; b=1suI1OjXZF/SuL
	nzmECYFnp4F6PQbA/bNLauIfKe3koVk4ddEPHIOLPNGJn/d7daRBg1KsD1vBDTS/SbOzRQKagz9yk
	7e7rnrNylzos2vilMSTcDmg3NhAIqxNWnKWain8GceYuLeMm6jrPUyCxfLoqib66JdsycsLCDs7ow
	gS/KAKloAYbIeFVkaPDnFVMC8FvgfDJcP8HpIy2BROkGhH+9+MZVFCHe6urr899XVlZUPzujVuPqk
	6Vb6pv6HYUij8sbRdGxqr4xIU0BTqoK4oFLyyZIraOlddJ9zpp7tUzoKqGIBr4jEpV4bhXo3Y1zwn
	F+AnMJbmtYZd22lRqJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvN8h-00000004yVx-1J5w;
	Wed, 25 Feb 2026 22:13:51 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvN8f-00000004yVO-0VSh
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 22:13:50 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8272c559597so211437b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 14:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772057628; x=1772662428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aiKwhpHaGzJ3DICfSZzF0PjdBtray3xMHDXBsERpgo=;
        b=JG49dtj8mSRks4gtpvnnXP4DMe2PoSoyqOskyI6/Qisaxc7N0g1SAb4CqpBcf506E7
         xMVgxn6b8BpjSpdeBtOCOip/fqRcHZwgqGM3OaKcq+D8vvX5C5gwBbqudo3jN4PGnL4F
         WyHjbK3G67SYQ6/x5j2jWpyZVWm/UH5kDFaFd39652ztKwSZjOmAZ2QKE2eRFC8iP7R6
         BOalS4DWW4O3TOgH6Qj28DBooM/Yn++k5336E0U8kQQemTFewhgA9gVkm5oA9OjSgaXf
         8dGJHAUCJd2Iz4qE0JIMVPznZiRvsZjU66kuQlIwNne/QXJ3sVry5LhD0ir/0t22QGaL
         t1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772057628; x=1772662428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aiKwhpHaGzJ3DICfSZzF0PjdBtray3xMHDXBsERpgo=;
        b=BmlOW15cQca/ynyIC6FvzdQKaL/eyibiLUiIWZa4sFFBAUYcDgwKUjXodXOQ7BZdNC
         h5V6b5p4gfETNcXFBUHdvt9I+N3b6L3TdNUueQcXMeiD9Q1oOfPV4BjS3eNQHf6zekno
         AFL22DLfrL+nd19XQu9nWIfYgFEfWUiNMfQD2qUkhj2bDFhadSVFfFKIvulMlSFrNS/O
         IhjXohf68C/MnqHRBXPuEGkGNHmYQcbWoOuPARmqHcXGTKX/hQPlSsx4U8RWl9aOpq+X
         m8yc7RpyLXfI7CtlP7U/CD15vQ/ugoLkVWOvpeC38u+WBURoA7hdB8C359yBK8h+r8AT
         8HoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpizo4CfzH8WqyTFB6Iq0mZX6ZtGc5s6uMNsSmFq7mY6cmUTuVht1uBAROpxAt+1Qmk8XRReJt7g/hXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZIXmnBs9VjE0P46lUPf1P+3eT0CQwJw5uDhyrL+ED8X9pCAOE
	pk9xPtXuM8w5O+f1t/+njht064ajGpu9EGrNr+X4N3+Aj+aY1R19VqL5
X-Gm-Gg: ATEYQzwHL1ra+MT7D30mt2flNNmOObSCfjAaSKqYD4BJY48/H+/PhtbTTsgi2XaxFNt
	kW+oNi13mL9L+m9Jw/akvUv2YQ3ANCWS6a3ppsGp9LVsuMjvW4v/BLWrDx08Ffkc4KUZz+wmwtm
	wl+xuCVV5JgvOkIDGd4uFhJw7f4x/TNommzpw8y/jKxUGtgGiwNga/Jz2Z1auegMgLmd/QdNixe
	UelPu/5uBfMuR4GyXM03OWMISugh/jL06GfP0v8/azsPrxZT7oEzu9j3BX9LSQiUSzOeinKZ/u6
	RwnyOwYpx7jZfUKT4lcTa7nWNqhnrP1yp+hhgGyMRsGL2otT8z7oOd1zcBG4XdoGouHH/FEZJNs
	1qial/Io0OJxz/SN95KAyYI0K84Hl3+VJxrZD0014HwDatFbMxLfjxmq/+BhiXZHXxhfxH17rCH
	SkQXZmi1nHXWNRw93NW5dLTQ==
X-Received: by 2002:a05:6a21:4910:b0:34d:d030:6739 with SMTP id adf61e73a8af0-395b482d1e6mr88993637.31.1772057627939;
        Wed, 25 Feb 2026 14:13:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359130719a3sm1267511a91.8.2026.02.25.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:13:47 -0800 (PST)
Date: Thu, 26 Feb 2026 06:13:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer set
 channel number for DMA controller
Message-ID: <aZ9z0gV8ZrfpL2JG@inochi.infowork>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <177201865381.93331.6104381063514168222.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177201865381.93331.6104381063514168222.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_141349_184667_583D951F 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, Feb 25, 2026 at 04:54:13PM +0530, Vinod Koul wrote:
> 
> On Tue, 20 Jan 2026 09:37:02 +0800, Inochi Amaoto wrote:
> > As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> > the SoC provides a dma multiplexer to reuse the DMA channel. However,
> > the dma multiplexer also controlls the DMA interrupt multiplexer, which
> > means that the dma multiplexer needs to know the channel number.
> > 
> > Change the DMA phandle args parsing logic so it can use handshake
> > number as channel number if necessary.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
>       commit: 5eda5f42d2fee87127b568206a9fcc07a2f6eab6
> [2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
>       commit: 02a380ea7ed2d737a42693d7957ec8c33a92d9fd
> 
> Best regards,
> -- 
> ~Vinod
> 
> 

Hi, Vinod

I guess you applied the version 4, but replied to the version 3?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
