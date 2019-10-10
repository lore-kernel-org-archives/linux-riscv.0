Return-Path: <SRS0=2rL4=YD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F61C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 21:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 545F4206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 21:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSkvDV29"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 545F4206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROOpkmTv3w3cr9qE8hRjtyOYE/RocpbOoGlxmZ91jxo=; b=QSkvDV291a7XdK
	cMhFckE2tSanSrPyQh7jnhTlp0qkMiA/dDa+OQUaclVfTdKIYgxdNVYQH46x9e4uu0M2vSpWEm0Ez
	KsTsizEGZB3EdigohN1tEvlzg+ujjpZme/gjT/zArBZ+ScM3akUwtrIWAUggdGjSaFjvFhqIKtERy
	pxt4bpRVXwdDKRdj1MTTwqNpx13/wQZNrdABY+NqVD/F9ZHa0EJfXIIeHIN8fw1S8iFlnHgZFFdKt
	oSQK8Ydi9U0KYJZNVWC6rQMjMg4x+mv6Gg36e6ke4WnQVwkh9FhaOjnaVBc1u1DL4HUgoOPp0QRyq
	v0uWKujDcmPt/wuQFwUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIfv6-0005AM-Gw; Thu, 10 Oct 2019 21:24:24 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIfuW-0004os-GX; Thu, 10 Oct 2019 21:23:49 +0000
Received: by mail-ot1-f67.google.com with SMTP id c10so6182351otd.9;
 Thu, 10 Oct 2019 14:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8fsaLFcYDAROH9HBoKC5Vafqp1MCH4HA/pJSglSZ4co=;
 b=Ikr8y4tahww0r7NdaMKm/bIUoy82koYjlEOmrlzoedKPc6BJKfHyXmhNjoDypSueb+
 MRYwi/haqAjrfx0e5+YXUH+XrfVjFBaYS/Tpm2NnFzw0lsiBmKS+UfHB2CeQ+ZdbEEbx
 VDcYQJ+UX4TqwSn/qH47+iYYTy9UBa2bE5so/umDIjBk99Lv0+VOqdax8PAMu+Tpkw+9
 XoC1wJYcaZFOtbD0f7zKEB+I49AgbEgQNxueI9MHB3rUicQjVwWI4YM7razd83rzCcu6
 M93Q/0BzqFAUcSWoZbLk5MsgluQqnZxKo5VNZQQnz69HRFTT/vFZ15CnJJFsk0oVfYXt
 cqVw==
X-Gm-Message-State: APjAAAXq3Ux7zOa1CU9BSCp9sfW0ilMU8T3vOGgx/d/XDekWcrLLpnTJ
 hbUmQRSKpBzPcCFQIlF0rg==
X-Google-Smtp-Source: APXvYqyIyxVe/QML8xBJW19srjEWY1fzMm01BIPfEyxogOHEBtnRrO0q0z3M7piA63qkH2laitZG7g==
X-Received: by 2002:a05:6830:13d8:: with SMTP id
 e24mr9348918otq.42.1570742627232; 
 Thu, 10 Oct 2019 14:23:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v132sm2027358oif.34.2019.10.10.14.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:23:46 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:23:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: memory-controllers: Convert Samsung
 Exynos SROM bindings to json-schema
Message-ID: <20191010212346.GA7896@bogus>
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918173141.4314-4-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_142348_549724_71DB2627 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 18 Sep 2019 19:31:37 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos SROM controller bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Split examples into two,
> 3. Fix pattern for subnode name,
> 4. Remove checks for #address-cells-ranges-#size-cells,
> 5. Add "additionalProperties" so the wrongly named subnodes would be
>    matched.
> ---
>  .../memory-controllers/exynos-srom.txt        |  79 -----------
>  .../memory-controllers/exynos-srom.yaml       | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
> 

Applied, thanks.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
