Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFEC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xy0OUV5dSnc9Zl2G/ZMRC5NAcPEweOLUa/aR+ZBk9lw=; b=JBL9fM5cHDQJGY
	TN8/IGZh/N5cEVgUidudzvuRW5L5GI9DjR4QEcKtW+EmqGuPXtYW1jjo8q7sW76ZhkXHBRLZhAPkZ
	ZAVoIvvYRZ7uVuB50ltFLh2MA4x8BCd5gQu+Zr4nfH7tTwT359zRMkx4LlM6p6E7rrBJZSvA0XSpQ
	cB30K7vjV4jx2JAJFUpkEVah/nepEopMKDPAb1MctNudaRBb2vxrT6vNW6FBkmusCQIhuZoZc8B2k
	jd63ww30WxRJnQNynzq/7RA4T8M56B85pPa2rb43s+0mwamsHWzQYCc5z6vDPLoBo5FjOGCDTOSN3
	MkOID5qhebDs6pEQeKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0SP-005KzQ-N1; Tue, 16 Aug 2022 17:34:25 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0SM-005Kx5-J7
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 17:34:24 +0000
Received: by mail-io1-f47.google.com with SMTP id q74so4724296iod.9
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 10:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=vNdSUDIuCoXELlH9XMziCohsKXYqhqiaV6prSiBstnQ=;
        b=QZk435/ijOtoCXpYLc3BYtspBIZbCylMNRJz45dIX9sdffISrws8JjKjUK7Vnl7PqT
         mrVvS9P4di9Nbgy00jiBtWnhlqDWhsnhbdMMWFkTSqFoUH+uRZk2f4O77oyyOjXHzl50
         eNtPalRT8jVKxuPmRkRDi5c++7h/YskxIF9lCm/CX1eLUaGIKj6Usaknq2bNKYVwKoUf
         79M1AH/QV35hKvqN/1WUoiI6F0/JpxUT0vBpTen2iJj1nKxqcZewpHhq6OO6iOPF6Eht
         JqJHeBHN7BY4QQDatc81h5dVyJGTHk3h1gSYL0cfh9+yRbxqZ58/t5K6DPFrPoZsuEvP
         kaTw==
X-Gm-Message-State: ACgBeo3N58cWFdWmpJxCV3q7dFpWPl96ZV9Melll8kltuSIPN514ln1E
	+jiEKweHYkERkYnSOUl/MA==
X-Google-Smtp-Source: AA6agR5x+GlJ3IuesfolxVkxENyVw8nMHypHsYHjBlt7Y2d8nb8vjeQSOsB8rWSXq8mciC32FhkGrg==
X-Received: by 2002:a05:6638:16d3:b0:346:a4c6:fcc6 with SMTP id g19-20020a05663816d300b00346a4c6fcc6mr2674535jat.147.1660671261318;
        Tue, 16 Aug 2022 10:34:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b22-20020a026f56000000b003436da41c78sm4600918jae.76.2022.08.16.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:34:20 -0700 (PDT)
Received: (nullmailer pid 2424921 invoked by uid 1000);
	Tue, 16 Aug 2022 17:34:19 -0000
Date: Tue, 16 Aug 2022 11:34:19 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/12] dt-bindings: vendor-prefixes: Add Allwinner D1
 board vendors
Message-ID: <20220816173419.GA2424864-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-4-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_103422_668177_C5CB8FE8 
X-CRM114-Status: GOOD (  10.23  )
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

On Mon, 15 Aug 2022 00:08:06 -0500, Samuel Holland wrote:
> Some boards using the Allwinner D1 SoC are made by vendors not
> previously documented.
> 
> Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
> ClockworkPi and DevTerm boards.
> 
> Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
> the MangoPi family of boards.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
