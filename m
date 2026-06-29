Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD019C43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5v3gWQyOHhK2K7n4CUNvEowpFNgpHjE4Q6yPT8HCN4=; b=lnL/7RxIcSoxcL
	FOVN26wTDvH27M/4TRR2asdXiI3uUHaUjbL3K4iUiuYzEHtnZ9QAusAXumulWCRTOGp5cHdy5vTiy
	rNAzhbuBkkNWpNYGbYaWVRlu0zM7LIX0hNcp7MUl9S1bZrFm0i+MNN4SSavRrns1Dx6hZucbTYDEa
	AkdKFhXr4h5IMxXow7ZasY1aLz2o3urVCbhZ2dOQ8OESTl2qS8SR6yq4+Flpx4qythyR+KOFuWwI6
	kD0T9eLutD8sJPZtTEBJimFkGBGA+V6Hk0eTvRc7KCBNRu08lSSlfBVT0AqmdRaukbuXWEkVrj28a
	78ZAKC12CR00ZOR9+wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCWP-0000000Eouq-1MNH;
	Mon, 29 Jun 2026 13:59:37 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCWN-0000000Eotg-0hUf
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:59:36 +0000
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8de4dd10a61so32519156d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 06:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741574; x=1783346374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=GJqCYGqBlgPIlw9oxo11oE3sUgx1j+CsuqvNZLFW02OGBEKF/5u6K+6Er2PjUTGF2K
         byR+1J4CM9ah6VqpeerBdr2Z/kTvQVGyB92bMk9Jh9Nls7HlI7V6tDEfLnYpyz91pVR1
         jg0OR4F+UgYhzSNeh0X7R/jlEaDS1viY3pKPydQt/3Vi6O3vhQDK2DDzBTUrJmmSRf04
         8nZug10BSIEOR+I9mtetNXJvf9chm8JACowSSEg9QP3bReohzlUxD3GdQxa/WAj+EIHD
         mOTV+4UiBLl4yhjxz0XToqdMdeV0dJpGQEHfcKBI9o/cGCyiZ2vF5ZltFZQMxKYOmdeu
         mZKg==
X-Forwarded-Encrypted: i=1; AHgh+RpqDGaN5pK3R+I6zh7Y/SdtilgE04qx7uVJq3B/fHIe4QlqgTrfWFsIuVYOFiFrZYjKy8yN+c5sz63prQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1NkwdOhqQDok9FNYbt2uOd7mJ3vzE9kN11pNAx0TrYvj6gMmn
	Gfm59qz5Y6gtX6/YJ1eohUWp0ylze9etS0JXYCuEbbMCgIY8q95dMYZBjHVp7CuJ
X-Gm-Gg: AfdE7cluCJbWEN4ilF5iTQFHhjnNnm4PdgxK7IQ+qv4wsJtuZfZ6kojoQc/oDnLklhs
	uu3uiUr60sfLGrnLLIrY+hTTQPY8LHu/gXCL8nIlm7Ya+mlGoVQxqdzVjHpsTor8RDsYX6YvYvr
	ctvcaIH4lWKkSf1i0+DGkET5zo4tN60a4U0WYcuYsX9zX7Vyyk3xbDnDQvHOyLtVhmqwR0Y6mTJ
	Y2397s9wHaikCpycdiGjU6+jhV0uYFbBIPkQ5XcaF0vq0bKS8Y/DyvL4UuzXeROJsfoZ2yestx6
	SCP/qIEHgdY3qR8axiN4wiXvQSa1nrMD4Ej3yzRxEJJXhSt885arymTkaJlxz3GeYElTowJGPO+
	cOdHNygHLZklGKQJzNkkJQVpa3nCvTmysmGBmrvu0Ml9TvqwslqtzZ7P0FWI+poaVAVjeCcWH4w
	MNplLfHqipBOdsxxMEcxTb8PL7efuKESgzln05iznNm9sE1rorzd7xiQ==
X-Received: by 2002:a05:6214:54c8:b0:8dc:9054:d63e with SMTP id 6a1803df08f44-8f156928494mr12713646d6.11.1782741573549;
        Mon, 29 Jun 2026 06:59:33 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df82b67affsm308143746d6.45.2026.06.29.06.59.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:59:33 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51bfb91795eso7423191cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 06:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qV+Vhr0L9D73UTXx8IALNJQv945NVv0fvsogIRhp/6AbQdpx4QldJ8DQsMSCo/4nLw9ltyCpnF+9w9A==@lists.infradead.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065935_216362_80056F28 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
