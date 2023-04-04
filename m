Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745EBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBltwBxHZvx61YY4ii9Jx0RJ5EXlLNxp8nM4KJ4vp/c=; b=dAa7dO10n0Ib0a
	VurHRU2VHUPxUwAsKOhUqkrcEvURJ4IhvEFCFpjCE1i6VzNHTl8WU61UKfZDKKxSPD1dUptyu046C
	598mGHPTrpHWDbOxfXJ6gNvLkO+nn8vf5x0zC/FT/y/6c2exmKjQMv6eymrpj/Qsg70RsOfz24Cnc
	3yGRyGUPnaLzaa13CKpVHCNwnT/07Ma3odrChjLI3FcxIKQfmmf0czxT6tVkrHewwwsmYYBnfCJeE
	WGYH9cMFJOS3BTHMDrNuUdnooqe0iKRzKYZzf87EbrWC8WLYjgGIAx2P9V82C9MBYwzDf7aRzhN4o
	XxXivEgue3VxCp7am5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk9J-002KlK-1D;
	Tue, 04 Apr 2023 17:08:49 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjk9F-002Kjb-0i;
	Tue, 04 Apr 2023 17:08:46 +0000
Received: by mail-oi1-f173.google.com with SMTP id bi31so24702656oib.9;
        Tue, 04 Apr 2023 10:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680628124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaNiABUcvVtmqheZOblHu0qpT7KFyONMzcxJR5viS78=;
        b=bf+3FH99zqZpSUf7pYtmGiXIoida6xcEfA9CYyT6EZD/ZKWSnHyoeK9lrvsFOScosb
         Vq3rTY3ii0Hro+aKJqhUKPH2RiwhMP0NWQVIsWKvUepsMewi3RXl4pDXziCamYqd4pve
         xPWlE3qsuMB3XGn6hpglCkdfOowPjy/pFS0Q8jsV5o1Y8Bw+OLTHVxEuDHAV8kwoHL42
         lzncHhogq0ynpVWANucoQyCLETBBWUpHtd7j4vmxAEsnKtAicw8oePANmC7ijZZC0rx6
         7Zk03jsuIeiUWnON8PT5xGTgL3e4gKi2cJILG/6VeM7mvkXsGLyrLxt5kdTaR8FR6t6T
         WGmA==
X-Gm-Message-State: AAQBX9dBCMTEnrhw1jMbr2+4Uk6rPRbbUB4xfNW8QFPtoaxBckTrLkJQ
	my8AT8GGAJlDN+CfFOjTqQ==
X-Google-Smtp-Source: AKy350YfBZrfqcW8PEMfVNBBRRfK7rLxbfeh5SefSwbtVkxAw/f8hlOJB1kpUb6wE9T+az73emC35w==
X-Received: by 2002:a05:6808:c8:b0:384:1e0c:fbbf with SMTP id t8-20020a05680800c800b003841e0cfbbfmr1455403oic.40.1680628124037;
        Tue, 04 Apr 2023 10:08:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z127-20020aca3385000000b00383cc29d6b2sm5358287oiz.51.2023.04.04.10.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 10:08:43 -0700 (PDT)
Received: (nullmailer pid 121579 invoked by uid 1000);
	Tue, 04 Apr 2023 17:08:42 -0000
Date: Tue, 4 Apr 2023 12:08:42 -0500
From: Rob Herring <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Message-ID: <20230404170842.GD49361-robh@kernel.org>
References: <20230322173449.3970718-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_100845_261130_1E24FC96 
X-CRM114-Status: UNSURE (   9.62  )
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

On Wed, Mar 22, 2023 at 12:34:48PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   | 4 ++--
>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
>  Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml   | 4 ++--
>  Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>  .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
