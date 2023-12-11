Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0709C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr9vUYLFlDSFxqIMHRX4LYTyaREFHGKLAoq92x8TTl0=; b=hqZbZgAT1Wrq4W
	wPuoX2m2EI2TKnOMjpnO0JtP+rthMY0qIk/xk4h9hvgm1BOaqUmD57fBMr4RdHtDWPz+nUncfuSrp
	OtgUB4556M7H5O3uQ6BSpeJ5hCSlJJCFoThV5X/STD5uPBWS89UTMX06yELc3AqUgPN5RvKV+fOx/
	dvMxTEl2MJ3dotAXt99KUF5gjKT9jsOAQoPYhq/VG1RNIDJxvUcoIfVaZ45/4npbHrmmr4mV8rvi/
	UC3nbVnqNXT8u5WVKupA8opmpB6J0k7Eu5WFOMMZpZoME8oDpZDAAzglqgDAk08VY/THP3ufjFtaQ
	cew0DlRlDUGoCpz6P/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCl3Z-006vdq-2N;
	Mon, 11 Dec 2023 18:31:06 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCl3V-006vaV-2q
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 18:31:03 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59082c4aadaso2177836eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 10:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702319459; x=1702924259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NOhlYnm+FZkbVpAWn8tzYqB/VPDJafzom4vdukGDH0=;
        b=AJb0lRnZukMvvnXinHZnYrFYZISyjkTTXXwCoAx+/Vq5Tl4cBGSZ9D6oidyJOogP8R
         GSElA5mjz1K7ydOVHwEFyMsMorOU1RVvTDaHcINhQHShwGntbmQx+kt+5EQsneLe08J6
         rh6D1YZrMN9/jPFtJnGJLxJm+4Meh+d9MCl89ydyAsbvm0HpO7m006NpKrKO1mdlXR8S
         yaZDJaijEGmuzPoOMdARF/rhAOGtu7E5lhMJutbOnfremKXxW80cnq7w8sXGCIJK5omW
         cEylML7vSX5J5xdSN/3r64UsvVhDfKqK9OeFlVz8SpInASzoVloC8Vzz+90c1yMonwzu
         LYoA==
X-Gm-Message-State: AOJu0YwzQYPpepa5RsKrWv0/Y+hk9l0iTwkyjS4fBkwMM8PErSO8HZlI
	pUYvywQ1eR/nVJrV1pDrMw==
X-Google-Smtp-Source: AGHT+IFIL3mi1TarX0OKsbht5ruPGj6H3DQ8vegu9JVdHB14VHw1O0mXLliII3Ff4OrzWs8gVRGISA==
X-Received: by 2002:a05:6820:556:b0:58d:d525:6b68 with SMTP id n22-20020a056820055600b0058dd5256b68mr4479054ooj.7.1702319459382;
        Mon, 11 Dec 2023 10:30:59 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a4a8c4d000000b005906f420ba9sm2010055ooj.43.2023.12.11.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 10:30:58 -0800 (PST)
Received: (nullmailer pid 2668308 invoked by uid 1000);
	Mon, 11 Dec 2023 18:30:57 -0000
Date: Mon, 11 Dec 2023 12:30:57 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ulf Hansson <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org, Luca Weiss <luca@z3ntu.xyz>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: merge qcom,idle-state with
 idle-state
Message-ID: <170231927021.2664622.14216212511291629895.robh@kernel.org>
References: <20231202234832.155306-1-david@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202234832.155306-1-david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_103102_044820_E8FFD64A 
X-CRM114-Status: GOOD (  12.38  )
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

On Sun, 03 Dec 2023 00:47:17 +0100, David Heidelberg wrote:
> Merge Qualcomm-specific idle-state binding with generic one.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> ---
> v4:
>  - drop Linux-specific details
>  - integrate compatible into existing block
>  - added surrounding patches fixing node names
> v3:
>  - integrate into idle-state.yml
>  - original patch name was:
>    "[v2] dt-bindings: arm/msm/qcom,idle-state convert to YAML"
> 
>  .../bindings/arm/msm/qcom,idle-state.txt      | 84 -------------------
>  .../devicetree/bindings/cpu/idle-states.yaml  | 80 +++++++++++++++++-
>  2 files changed, 76 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
> 

I kept the single entry compatibles as 1 enum and applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
