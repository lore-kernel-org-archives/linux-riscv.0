Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C042CCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5U+mUr9j0+CLOBwubtzNxoiFfdQl/OrPQiEJGkNAZvo=; b=gdbI9e9NG4miEs
	tPi9zDLPdmzyqMIKHroX60W3xhsC9DQzSL4hKq37x9CL7AcGBkXyJEC7bIn332tqsILNpG7HiB+E1
	3M77MzqiUZ/vlEtHWREf2k9DlKZNtd3lf9mRg6Y+MtRaw2iRVVAS2y3tPFpGJI9x8hA+NjT8FyqlA
	gwuDoltoV31oOQPp6HG0316SEqhPwErQoQIYBjCxIazQPIglqBkADY10bS1Z1nXm0gbRNeVm89I9K
	wWbbtBPn0i8fl6zy/4HumpgMDe65+0DlbjNm/ttRZupZe9WXvBSs6fdSW4Q3iujEe/zOjP+a8KUI6
	InhYBdViliRS5RPoEZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjV-0000000H57e-1yLo;
	Fri, 07 Nov 2025 10:30:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjS-0000000H54w-2D7k
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:30:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42421b1514fso289638f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511413; x=1763116213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=j3wr2N+b6OCN87KSMQJwA/b1tCvTUF8wR270uHyTY1lHoQgsIyGC+IJ4BjEUFBA3vE
         du3rYIIG+ruOw9eAUw4XBn2ul4LGz7LznN2vssaihPQDyBGJWFHx++rF1C1PcMLS5bcV
         gR5T1/Qcp6MCpuV1U5UVc7Dmi1VrUkTnhGaYrlsACLA79Egx5AY9YYCzHbEhYhKRzZM7
         UwCeYgCXbsKDSb9S9MPcL9EV1zdfLxuRH5+HX1af5IhNgZG3RfvCBb8ODzNhOYfUKWg+
         hPwGC6KPt8+4G+iMj839ydGMCFUFtptglKtB8EaI4eQKMmoUHNncu5K95soe5MhGEkb9
         BypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511413; x=1763116213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=FT6Ct3eCH4TOdvYrAoYf6Zb964KnwXSpevpMRSEbqhYiU7PcbeJXSYkncfz7h/AxjF
         vI4QSEuAWlPK7dZ4c46ACoZ/CVI2pe2tjpWzIxcm7hqScDUBOIZbN6M0g65bhS0Jg/pm
         mYHT/wZ637ojiE6usrKG6jEgjITTAdVKyMGnlhpjWeXnUdBzqwZ8wwPeJKVOYiEE5+lh
         fQS+fRJ/rQm1r2GVxXtmyRpVyu4FAa/0t2J4AxaJieAnyFPGHn1z/IxxBy9Zs78d7rgV
         LtWLsqE92vjL10/D16OUsZSVoFEnmdlwhN3uODhBq74xgo9xd/5N1iMkkgwa3jp7cFCx
         OTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUbL9wJiVUDVLLCcLdFLfHpDE4k6JjfZFdmxslOmgSKaWihciFdZmmAqLuCOEQoIt4+rACCttUuBXlTog==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8oZPu1f3p+o/24aP+b7cgbcQQ1bsnNPK2yRoAAHK4wb1bmHBd
	bNnQywEJwhSxF5bYjaVow7sD35pNt5iKAKoA7axz/jQLC+1vMKdeNM7KI+AiLawbX8A=
X-Gm-Gg: ASbGncuifrGUbPDLVXGWxyjOlegVtt1pgufCE8AjqzJesqt1jW+CvhVVnGACKJvZiai
	bwdgO7SiTP67Md72UQa07hNwm0xt8Fi7MYiwLefvYht5qpORBdvZg3v5gfpaYzfQTRtewjeJ9K9
	5mGiK9qOtUfHNXOq6H5xIzJO2nSk+1NxPOGirTVkuRH7fq9vaKd7ws1qbxe6liOyLWYzrM7P2N3
	dIaPu9r8Oc2FkeF90FAX9NFjlPz+swodgqhHYoXLlFTmX62MYiCw+8dtk8K6q6I6IFrWKZQiMl1
	29yjMoKzSGuJOfexmm54Fa+3lLUFEBYuW1VCraGfH3u56Zx7rjvoZEXKfz9Kqbx4Swcs/rSLzlh
	W/NMhwZ8882Uopp8FZZRW15SeHpiEkxmD54lea8Gjsp20APvOxGPntDhpWMF9Q7wlIdyAJocoOf
	zXZKg=
X-Google-Smtp-Source: AGHT+IERkMxY/OdgqWfaZ7AT7DwdB4UOki9h9A7muZP3Z616/ajyEOm8UxRI695/XTN9HnuI+cZyWg==
X-Received: by 2002:a05:6000:2012:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42aefb43605mr2064791f8f.47.1762511412542;
        Fri, 07 Nov 2025 02:30:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:53 +0100
Subject: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
MIME-Version: 1.0
Message-Id: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/4v1a8QAtlU1YFnwlRQMWe0GMJqjCY4EA0FHsr43o1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDconjyIV+fTbtiiEvLmwzz2XANDPioDzvoKtm
 cu4MX5qD8GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 chguD/48PDKdlDmcnZzg7JiW0mzCIguyJgTHeZLzPIFm5p89jeT2Xw9rJg2JOadHllTnAvDXe/U
 rvDQsGndzvsN+xzFpJ61PEzm5YAScMgZDW64C34/Cog5rNgiNs3vkk1gLmgscNeF3Cna5YA+RA5
 BsXoQWCIq5UtEFkXesDvEfFmouRUOeTDINymGLKpCE65eO7kIWIQCZpYBDo6AnW06NlTq2DlOKQ
 Fdp3E4YMrkhab74JdTcn39x/INJvXk9K5y23XTeiGCMlvPmiqtmboUlQPDXdOIU3C8lUqWRkUTT
 7xxipK88IcZ8YiSyegvj+0NLjo7dDc8AMkfyOkibQMiUh/K2t0tz7bIjKXZlNxdWPVJhkqswNyW
 R0evKvs6IKV+2Q71flHCD3rcRH0yK0gW7fA59gChceGBjLKGchAkERDHwwqrOpUqNy0WePVlsn8
 rAUWS+/a13WqCZG7ZoL926vFHV/gx8tYhJhWbKsM+aXcbTkr7WgNPhL6O6LPGZg6LIPL3+052yp
 Eld9SE0yD3WZLc0ux9XwhoD9yRGy+e1dAMCzD8+Ghg/k5pxeRe7x5u5SfcOx2RTT0x4yr6yuL5d
 fGW0aKXSXdHWQw7ECZ/W67Bn6p5RJUhQVVzQNg5VS3/UwDyQK9uldBujAYSXuMLCQV77tfpiZfF
 FazfeeIRG8/+w/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_023014_591710_E92803B8 
X-CRM114-Status: GOOD (  10.63  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
