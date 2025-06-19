Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F806C71157
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 02:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5M2gxEDXi6Nb4M1P60tXVPjjuiYVVFrySKl829YHdE=; b=zWUJKZeFRy2Z1L
	ZOJiotyAbBE56y5h/E3RjBDGbi7KoZZGcP3QuEMX+etMv4LsOzgbqCPTOIffn/q/PqzSj6ln/zlTb
	vgvQYJeca9DBmkvF89XBfqCjut+wl+Qd9hDdcZYWHYo61HIgLTANZcGbetvfiRGcoF8JrsNjXY5hD
	dS9/9ja1yCAjjkHXl2hwPk6vLzQQGedVMrijQ+30VBR647YIk+h1yeiue/bFa8bb1BkA8xRtonVJG
	RCTV1c4FfAP84lKv/YyDAZyXuoqHtky9WGOYs/DCb0iKiyrDpAbxUGqn7Cyqlq1NrX6Q+TVv9tKNs
	jmdUiKcMNz+6/ljs/Orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4tN-0000000BnuP-2ccU;
	Thu, 19 Jun 2025 02:20:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4tK-0000000Bntf-3ik2
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 02:20:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-748d982e92cso153325b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750299638; x=1750904438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
        b=zZQnOwjGnYRxp3A7GHy6siAtGFKAqkI2BtoSpOXxkRMiGx2UxNixtICD1GjK9ZBu8A
         9a9T/PJSQjlh/15ybChrqFFD/Wou+p1fUqlzoCcHhrplQbVON3RfBwrMWymaTTfyeSoP
         elUBHwkr5r7VwMJA18iXq69MTQ+YTKWE0R4P4QzQMHokFrl953QrUeJ6uZ0YR3/bOy7V
         hMEhDIjMkYhe5v//bZc282um6s7Foj4Qy7Ip26EJTUMY8UtNw88XBIk4etsY6ozsxn6q
         62wVMHGrmiWa7d3KBIz0CCrVKJSBWKhjJE82vtpgzWlxlfGkqHLEYvGIN5cH8WYxJ0cq
         MP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750299638; x=1750904438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
        b=jVbjpSI9gQTAL8mHgh2h6P7t/OzWzdnkTmuoCF08g7u+7urwtLw2bns3rEG7aNynIC
         cqXsL8ekd4sRslU8F7bsIF+onflb2WEVD5HTlCtlauFwGQaexdIujqYUUmBWDDHv1G5m
         Qd/Ww52Sixc4Beg1oLe1dULBQh1YwEEhSPq0yvKlffqsHV4vfCKIeUh99+11XjmJz9Fk
         8WVBJt79UCp/nPUm+wUmMiL7rQujvkx1Au2wLPyshJk1Cn86FrTc7yu8HsSHsJ/jho9r
         9jQmE0/LTwY3AZAFlEs/Qv5DtnqEJ5K8d07iKgsZnwqxZtp9eypr+bfy7Mnn/5+YkV4W
         r3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVlFp+sLVtaPKh3nGj8qNrH+I42dnRmOYTWX6MPvTFrFdMksPo1uzzD8zyIrHiMXrBnvaIjIi7Ch4YehA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX66b746kCwLWeS9B9LS01uwHbZyzFy4LJnbIgL2a66bCLfUux
	ytjVjRXs51Vk/GcAhT0xFebLzn/66cdQcD2HzIuWDg+Bdbtttbw0Ogh8Y1p8Bhy7Yoo=
X-Gm-Gg: ASbGncvQlOvt2rgstBSQA+NWvysYyVSU0VSJmGF1JnTBmILI71pLaRERgGs7hvs3UYv
	/ww+RhQCi7rbUQ+vcDtMHc8UvDFSPlvB4t/3+SZca+lLTkpsHCz20qCqoB9rCG9R/o6ro7diEun
	cweec26WU5QoDbBI0afFl9Sc2I9nZ+RICSrdMZ8MvxFrPGOOTma9DaJpVnsYQQi6ZM6vckdqnhb
	2tXQZhRN0o5x0QBI/D4e6h4h9Hziv4ImUbaZ7jHkRXQUD3XQPzkeaQtJcNqdvFPWFKa08+aCyZG
	/sNlwyUXJ90XnSFqTtoVHLqFnPx8q1CvySHyo4qEj3mvjaflIU7W1CmWH4v63pCtpHMisfQ=
X-Google-Smtp-Source: AGHT+IGjSSZuolaUpbJOSDgxdNJ2rz6g6jIUWqfE+ln3NvBoOq+EqOxlPwszxtc7pzssoDHlu8HO3g==
X-Received: by 2002:a05:6a21:62c9:b0:1f5:7366:2a01 with SMTP id adf61e73a8af0-21fbd6925a5mr30398731637.37.1750299638092;
        Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31c84be11fsm2584945a12.78.2025.06.18.19.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:20:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:20:35 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset
 to AON node
Message-ID: <aFNz8/m7q4T2qSHd@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192038_925574_85118824 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Jun 18, 2025 at 12:22:12PM +0200, Michal Wilczynski wrote:
> Add the "gpu-clkgen" reset property to the AON device tree node. This
> allows the AON power domain driver to detect the capability to power
> sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
> driver for managing the GPU's complex power sequence.
> 
> This commit also adds the prerequisite
> dt-bindings/reset/thead,th1520-reset.h include to make the
> TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
> dropped during a conflict resolution [1].
> 
> Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d63072a1573431e51893 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -234,6 +235,8 @@ aon: aon {
>  		compatible = "thead,th1520-aon";
>  		mboxes = <&mbox_910t 1>;
>  		mbox-names = "aon";
> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		reset-names = "gpu-clkgen";
>  		#power-domain-cells = <1>;
>  	};
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
