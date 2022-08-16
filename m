Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA0DC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4hPrnnJJ4dlYQ/fRr9OdBGPzWi6mRjT9HH2vl3Qim4=; b=mQn57ikZnt0EI/
	q4xElRnNBUIZN2M3jWGLfzXFeAJSIcVLVtrBkHK8hv9Bo7A1BWqXFd+e3S8Z/dm4HQinnJHoppirT
	kcCs7iP1D9FIqmwsgBhC9maAPUvK7KUtaGDTrzmaQaWJmOB7vgZSDrkhAYGdlv6t5sY8IxWe4Ruuj
	MyvRIvYC4bWPEXWVHRc7B5s+cyRyXDomKcMuuWkQv8k8RcHIpfi+EVSbXm2ocXn77QjR/NscySDov
	pPuvgg8xRMvRMAAZ4D42v9ARFrcxaUCrSwSX6sOQidi6povqJdbnnC7BZ3I0N+aiZiqsILPz2N1v8
	uGZV5fHbx04gdlcpnT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0Th-005Lgu-MX; Tue, 16 Aug 2022 17:35:45 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0Te-005LfT-Js
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 17:35:44 +0000
Received: by mail-il1-f180.google.com with SMTP id j20so5721281ila.6
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 10:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RnoAucd176W+o4ETJ7P9jHc6+1EKnkGk1HGPAZBXuwk=;
        b=L96YyYz8m8k4AUSjSUpl5Hiwp662GDttld/p1irWw/unnJsF+QcyknwKRwwZfUy3dH
         ZGN/pLCN1/kNR3tyq0deHFDJ8IY5kf5gNQ7EwsMle+q7yn1fZkPxa8flSJ6GJ96LPO/G
         OnKl6OLt2C04HXz+Vs9CI9+QJXcpfEIhzB3DHWEvPZHBfefGll3pOSbyjAzHEKs7b9bL
         fEDjXbzGZSm5Hj+F3NCAMIhrs8tAUao000jv2MalmsTpglCP6kQUdUis23ZTfRmvlmo4
         gB316zHhWsCwhN9RS7jREmbxEJRiYUo6k4XHy/zXzIpbPNDb8Ucskg3w8x7WlYt88lfV
         IzQw==
X-Gm-Message-State: ACgBeo1pfMLTvywQ33Ah53ABhE9JPcazeTHN/8fz/MDR/XkKS/7PrkJE
	nkJa8W0CeruwZLI6av9GWQ==
X-Google-Smtp-Source: AA6agR6SitkaJDU9fxs/PoyypEjRtrIRm+X9J1OjRamGhN+UfpSsRZky+nrmJnLwNAwcNtebknW+QA==
X-Received: by 2002:a92:cda3:0:b0:2e3:e214:5fa5 with SMTP id g3-20020a92cda3000000b002e3e2145fa5mr9293291ild.306.1660671341354;
        Tue, 16 Aug 2022 10:35:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f28-20020a056602071c00b00688b5bd70dcsm1081734iox.8.2022.08.16.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:35:40 -0700 (PDT)
Received: (nullmailer pid 2427019 invoked by uid 1000);
	Tue, 16 Aug 2022 17:35:39 -0000
Date: Tue, 16 Aug 2022 11:35:39 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board
 compatibles
Message-ID: <20220816173539.GA2426958-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-5-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_103542_699909_EAB6F652 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, 15 Aug 2022 00:08:07 -0500, Samuel Holland wrote:
> Several SoMs and boards are available that feature the Allwinner D1 SoC.
> Document their compatible strings.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/riscv/sunxi.yaml      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
