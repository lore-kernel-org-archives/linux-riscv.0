Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E99C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3WSPS8TYEi7iYZG7ss8pQFZxkuKKirDvaKzyfFLaOU=; b=M3WHOAfv4b0EjG
	7JnahPLtYXy4TUntwG0b4DSapP+iaUDguL4SdZkqsMg7cKd4pfyL9QH5Is4upnJFf9lBTU76Z/xOP
	2v46ytb7j2cs84ka9O5gvdMjNZhbVd8cl9scODCtG7VM+U5BNuxKzHHJSShxOAc1QI+Pbu+zVLUQx
	CsoVbnt+65tFLEFcaDSjPnEE/g2U5A8dBQYC2hYpLcg183ev32oDuEz8yBwfyjBiu9xf2BHOv9ZMv
	OIvPnvUetHceHJa6g92rbaK4mA5FvHn025WQpim4IaQ01lGgRvL85hooKqmF5uV85pp8DnTZIrkEw
	4yJi+Gq1e+GPk4pKNtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWNGX-008nVD-HL; Mon, 21 Mar 2022 19:00:29 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWNGU-008nTs-Iy
 for linux-riscv@lists.infradead.org; Mon, 21 Mar 2022 19:00:27 +0000
Received: by mail-oi1-f176.google.com with SMTP id b188so17223891oia.13
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 12:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gYimi7IXaGh1o6TmiU/YwpmZl88VAlShoDJCgXTGA4=;
 b=g48mW5qrV+lIolHANRgygaNxgO01oAZ3fN6dbfAt1KgwrXZnZe2VP57nRzHhmcOOSB
 revRqZbWl2SWR4hOgAW9I6U0/GDklcJwp0cmWLr1tArA/NkvsiYSB6GNe22YNBfczTk3
 NeFAHqUhzg2ckJXN8LAAxXHKIPR2vMmzbDNXVmp3TssqA0GjVx4l+/G9LE5f7HV/H021
 0OQVBEhqgfp1gItjuzzq8vc0PxD9S/Wn9ldEyhMj/qAQ//LFwWXx9m8swTd0tPvH2b30
 vH8Q5e24DrYswROuzYtEZJ8gtoH1G0cRBqZKlm5k1h5r9VCqC5DuChHnHMnQNhSIk69h
 4rLQ==
X-Gm-Message-State: AOAM530KQtMJIQ5KeJGRaURAC0EBfUeLJN93vwwLMa0b01+64bjQMlNL
 VQ5DiD5UvBXlUoWHykcaFFNH/pwKAA==
X-Google-Smtp-Source: ABdhPJw1MRcil7h8zdAWMFtY/6TL02ehb+MaL8EpGrGIMuov9NUrElMt1E9LSjlNbJgNtXYHt1C1ig==
X-Received: by 2002:a05:6870:d348:b0:db:12b5:d6a with SMTP id
 h8-20020a056870d34800b000db12b50d6amr224887oag.183.1647888920545; 
 Mon, 21 Mar 2022 11:55:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 gk6-20020a0568703c0600b000de4880b357sm83241oab.50.2022.03.21.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 11:55:19 -0700 (PDT)
Received: (nullmailer pid 362706 invoked by uid 1000);
 Mon, 21 Mar 2022 18:55:18 -0000
Date: Mon, 21 Mar 2022 13:55:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-riscv@lists.infradead.org,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Debbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: sifive,fu540-c000: include
 generic schema
Message-ID: <YjjKFvNZ1BVn/zaB@robh.at.kernel.org>
References: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_120026_643647_0E8FDF87 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

On Fri, 18 Mar 2022 17:20:43 +0100, Krzysztof Kozlowski wrote:
> Include generic dma-controller.yaml schema, which enforces node naming
> and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml   | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
