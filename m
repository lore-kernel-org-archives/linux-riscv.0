Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91530C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzKpAaI0YTOqAz+oB84Y2aHrpes6zCPvGkhjAcID5X4=; b=k6M0U7sAOGqpjR
	iRprXY4tOUYd1saZeRPewprInX9L7ggxR0uHzh0fRvje9Hxb1E3kbcx/qe1ZKC+vMokQGB5NswKu9
	j7MsPxfs5CWWpkl6iCOEcZJEh+ydYFqPHjJCp1KHSsO3Zn8si7H5QTSSO1bwUMDbUFjiS8VYeoh8W
	rH1afDqWynG2Cx7jOAPluRbz4XwXhR1GbOHEve3pGHfv8k55Jwd4O7JXcikor83i2I4DlrMdXFEgj
	E/HBhw3DjGxXcx//Zbl/Abr/LP3dLfyglvOtZPDDv/CjbEVu2R5lY+S+73RdHDeMTkiMk3mzMkmtE
	y+DxTSCuNuBkGVn+XU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3dr-002ojA-1h;
	Tue, 15 Aug 2023 23:40:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3dp-002oiX-1L
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 23:40:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68872cadc7cso697201b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 16:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692142799; x=1692747599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIaRDF0hVkKVd118QxNJ2cE/XyLPoGMK6bw4OO6dAQI=;
        b=KpiC1bx2GBkkMOEUPYLOcCkfIKKrETx6xewfdKH2qxYUpAR1dH+2CCuQbTiVl1twuN
         1cgsfirNT3DznrIxn4vvefZyiC/hGImcqAFIJImFVc/XldElBR//n133wjYT1u7CvWay
         dUmrifB1r/a+Yg4dQstXSjcMasY3eh7p7zyb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692142799; x=1692747599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIaRDF0hVkKVd118QxNJ2cE/XyLPoGMK6bw4OO6dAQI=;
        b=e8ifHsBAA0RGQv0HVMDalry+mLvoGIX/b5FpIWyy4y0EJO1NnSUJiRqco95Wf9pU9p
         JYtdUdDfQtA21WwV/RSokV4N6m1RnimSuINr9goUhIqlSQzXwZkWeE9ZW7fx5LJtZ668
         51HWZn0jLH4z3BaKB2jeCWH5nsPhf7rPEPtE1tEltgFhnYR3VUNFScDROFQ74IGkS2Ds
         rPJ3PDPBPslG1JlFpYMaYOVZTULXYZ+qJ1SqyerZl2PA348tfKvkDc6IjV07eaVTcWxn
         p/XfqaZ6bufH1YR2ZyFAs2grsFwR6PK7dYF5s3/vHCSm0+8zXzvm99VNjBNuSmSHhNLo
         dCBw==
X-Gm-Message-State: AOJu0Yxlo5UsDh6WTuKNVW+ipWruLolTncC3e8EsG4Krd2lp2SdV6ekl
	zb2bmvD2PoE76ndC4+zUwKm4og==
X-Google-Smtp-Source: AGHT+IGKj1OJIbGGo8TvNIdevDKSCFtWd0N+yBBZ3SGTCWIvm7nfp5p39o9iYLxM+kzcddzCJGhj7A==
X-Received: by 2002:a05:6a20:5503:b0:13e:f5b5:48f5 with SMTP id ko3-20020a056a20550300b0013ef5b548f5mr307713pzb.27.1692142799586;
        Tue, 15 Aug 2023 16:39:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b0056420d3cd20sm10723119pgc.71.2023.08.15.16.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 16:39:59 -0700 (PDT)
Date: Tue, 15 Aug 2023 16:39:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
Message-ID: <202308151639.44FEBD10@keescook>
References: <20230815203442.1608773-8-samitolvanen@google.com>
 <20230815203442.1608773-14-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815203442.1608773-14-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_164001_507997_69F3F2D7 
X-CRM114-Status: GOOD (  10.09  )
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

On Tue, Aug 15, 2023 at 08:34:49PM +0000, Sami Tolvanen wrote:
> On RISC-V, the return address is before the current frame pointer,
> unlike on most other architectures. Use the correct offset on RISC-V
> to fix the CFI_BACKWARD test.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
