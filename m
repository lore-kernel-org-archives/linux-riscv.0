Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07888C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDTWnZAdKJUS6cCwc7t0Op5w7AmpnJ2ZghQ6WF9R81A=; b=llHsEcVUmKzBk7wxl4TravxZre
	eHZLmFquFhx8BRHOHa1VeFG/V+oep3OY28Sg2mkd45ZF945MnZ05kYrby0L/C7zx3YWe35JlKxziP
	tnrNYVC4bzuJ7D82HglqQnVkWAXpq4zr4r5oQMglS3ug2pqn5sqSBSCO8o3cg2IEmqq51BFT6F1LY
	Js45nX0gR2qjc0YMh0WLG9TIn21i21amMPisAfh8SiUco2NvgT6tJOE6LTTWNoq45SyclTehSEUE0
	s21pueV2wgkr9e6Y94cxQ3rBrotXbuTOS1A16BOMQGrKhIP9a/d5ASl93qWXOxyd8ba3Y8XSctpQk
	Zm7MLqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGCb-00320W-Ps; Tue, 24 Jan 2023 10:06:53 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGCX-0031zV-4Z; Tue, 24 Jan 2023 10:06:50 +0000
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MmD6U-1otgns42Vs-00i8Qx; Tue, 24 Jan 2023 11:06:29 +0100
Message-ID: <45528830-d59a-4c8b-5b76-2e683c2c6964@i2se.com>
Date: Tue, 24 Jan 2023 11:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/12] dt-bindings: serial: pl011: allow ARM Primecell
 properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
X-Provags-ID: V03:K1:93ulo0PlqXqG5/52B3bZ3mfpX/fbI2HdhNtc3AuLxgKQl2dxSyA
 /kJkZ7NeRKreYzG5ax4gsYEQSTwH8yygbh7vEtHYYFwTpBZPdev84Mx3OJaAU1mPR2u2MKv
 vnOjns7+asiWML/aEgPvFrMy3n7cCAB7qWD90wKMTlXMsTG2OvRrP0vJoFgY7ANNIySelYu
 fM48s9RMBQWREZhb7cuBQ==
UI-OutboundReport: notjunk:1;M01:P0:VczEPCxySYQ=;U0Lzc/tH6qc3i8FdF6E0O/w2p33
 Rf11TjOB+akTwm0k3YDF/CofSRH8x/BDseAI/U/Tn594gBt0St1mGo09JEYietjXutJGqAa38
 zaL10VqH0zF7IKZzZ5Z1m08FP08Hku7dGolSylwNAaZ2y1rLGrHYqFyc+M37tlOd4V/KYz/s/
 yPTfVxC1z8FodPfbMSQcVSl+rUIPp/vGCjgLT/ut4XDlL6w+TK7v/HFgJl0sHHVNaieHwS1Ea
 b4NV0O0fSO7293v0aENxUFLcK06FbqeaifKcoESN4aA8zQAFHfrYcQMOIEW282GMu10cwpWFd
 AdBAUt1TOyQGva+5yTnreOJjQuxcR5RsWNwO6OIj7FVzwe8OYZpcfvtzWiyAQPvaNDlZTFXOZ
 4x9WSxOjyQMQo1PyKhAUMTtuQx85DunFFoRMThVzMM/6QUENiZuW9Rcd3PeP5Vnc/bgLd6rbl
 H4jigRxjDGgJuKqrKb5GnE23xpYOgwb8v4NX72tbbq/9P/kyvziwUZFOyeN/pDyt7VDJDlByy
 jZKE/3ERTx1japcd0XrLKLJAhUfA2UrgguOdT1zBQZpe7Nu3Xsa0vJSz07Orp1L8GV41dZTOk
 57XR3M44hao1bm5JYn6UzhqkyhT70Zi3Iy8m3UNpsTcXFBzpT8t7SEoIryrsEG4qXm0djOnTI
 h58bXWDP2g/fsSCP4wz1Hu2KLbYyzj7GsP1bgbwh9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_020649_493318_BC31C54C 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 24.01.23 um 10:19 schrieb Krzysztof Kozlowski:
> Reference ARM Primecell bindings to allow typical Primecell device node properties:
>
>    broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
