Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC43C46CA2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iiGRUzoc05zuyoTW5wq7Kcehq5+4hysmwzfWUTu6/kk=; b=gDJtmf1o2UDKU96jzKFmdC0Lig
	t2yPQH6Sg6Mg1ch2rcHg9xlXd5UY5dpuJysLg3cA1w2qsSAOSYYIb4s1b7wR8WfdGWYe5EhuepRlX
	9IoSAVfTUG9CLyJVovAy2bZAedRD2XdEWD+07tZQ4f8KeYAvR6jup/0YiOAlwVyILkkrJ/5PuXqH9
	k1AADivzsf3fDLUGJ04ndp1bJ/X6pAhFu0LNIlggbw3nnFML6XJD1NSc+RnL9ATFDn7BOgEQg90el
	yKchMRGAy7bnISBMIEJsml6ibmzz8tP+hiGl5yo9gtD5iaEXqIKDYz1SorO1KKkffg4rd1A3XFEGA
	JChACzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaV1-006dZB-36;
	Sat, 16 Dec 2023 19:38:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaUy-006dYY-39
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 19:38:58 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 37A443F2C1
	for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702755535;
	bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=e44+90stt3l/ScDqFCt0bG6NKsJ/Mnf+Qs0a7LWfGhTtdRmu9YGpDJolyJM3eGWXo
	 rOxrY3DDdfuQAvS1nLovn7rvG1rAMVzOxjAQZU+c0hx/T4BtYt0jbVhtdtMnFr8dqM
	 x0wLuYK/sRWNlKG/GoHcnrDde5ssJOy0br3+r/RTtTWilHxhRvbmZ1u7ksKz80DAAe
	 4cNKdTvknaVdPmg2jo8O8vvDAzKX3qwm3lRVCRUGyLYJs2mdWGRsZSkL18F+pZCBdt
	 xt/wSVBGSPEMHxCTMQL61lkX4GcdlAwnOv/+aUnx1wzjfjW7Noq1VwmrL5INZCoqEi
	 uiiCOMDE0NSlQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425d3ed72f5so29194601cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 11:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702755534; x=1703360334;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
        b=LOzyPcC/Xv0l7ReZUZQbVfQ0MyoHbh4UEHI31K4xI7kkqjeDKsKm8FagFkp4zBuY3F
         ZAU03HF5rB5rCN048MbLLS1wPzdvYNYC+yWG027j3qXTg7r81kY3KMYDXvJZzUS1fmXo
         C3QDyCjzzgH2reL2M8EPLI7CQibGcE/U2g5xu3k8NMnUECkPc9BrTaiRI1ArAydb4BTB
         T/+tVo7iqWA0dEXItBOfg7iREyoFq1nunShfjmA33TD5bRVkzptycDCVkcpR0RlpeR75
         Lfcyn+TfLtxMzTaoW+htzjOq9B0K6GnQniXStvYcA6sWIy1R8367vuiStts6JIGTmq0O
         eA2g==
X-Gm-Message-State: AOJu0YylfTqM4KeuswR3gsxYwGt8rYw/L1ksd+2JDpo262PASJ1yjIiH
	LUPS/ppcbh3NSTg7cS/UHMz/uTAZWzsP1zaObhJMqOQCmE5D2hqx4cKsWAyYiKHZzmRmj/hje9a
	okr9a/qD+3jasySmUMQI4etGyOy9oIcoCp+f4RvYblQrnl1kwIUttnABkFi1VZA==
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id t8-20020a05622a01c800b00425404318bdmr20333340qtw.112.1702755534006;
        Sat, 16 Dec 2023 11:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkdKr9ZA1ECc64gwyj30qjy4snj5vZUkODgrjSVIiFsMAP3aqvVWnQrSXJixVzRgLW2ZfvbY5zJh4SCWF268k=
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id
 t8-20020a05622a01c800b00425404318bdmr20333325qtw.112.1702755533644; Sat, 16
 Dec 2023 11:38:53 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 11:38:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com> <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 11:38:53 -0800
Message-ID: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] riscv: dts: starfive: jh7100-common: Setup pinmux
 and enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_113857_401954_008CC8FF 
X-CRM114-Status: GOOD (  11.97  )
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

Cristian Ciocaltea wrote:
> Add pinmux configuration for DWMAC found on the JH7100 based boards and
> enable the related DT node, providing a basic PHY configuration.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index 42fb61c36068..5cafe8f5c2e7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
>
> +&gmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy>;

I'm not sure if it's a generic policy or not, but I don't really like adding a
reference to a non-existant node here. I'd move this property to the board
files where the phy node is actually defined.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
