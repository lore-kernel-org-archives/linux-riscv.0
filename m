Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6684DFCC9A4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBY2dI+N7s8ekDmPgravVFjPpPyeRrR5wPTmUUWx9p8=; b=BPOlti0rsWdYzw
	7P0ru+Zz1xqZpGst7dkikrDWr5oddlCeY5DnuHefB/N4YjD4csJldxyNJqcZKtNGzfhiTULLgxjai
	Wj8eX5Is33a0ZLR6wxU0TAb6GDVc1dAZhGgdYAuRvioCQmRCtw9stkr6wauAqjy+/zBRVElMg4NCI
	NkG3S9Q1oe5Mr5X+cG28uYukttOzTDuRmrbNy3km1e9XK4CJWZzlJ/NN+Ejt6VnwVhYI48VGGGbT/
	aTpzPpJoZeoNaucf78J2K4giJYcGTi9C62EuZaDJCQBvx6j3zsFbv9+FBoViR+T+4f/tP0k/tIa3v
	EYIdAlhea6wHMRAOzcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzleu-00000008Rtm-0S5d;
	Tue, 10 Mar 2026 01:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzles-00000008RtO-2xxa
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Mar 2026 01:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=; b=Co2W2615ACifBDW9Xp9IBI1Gio
	Ys7+zn5ZgATKFIjDhIywblERfJi8PYpdHi35jRDrQy/fowvnKxF3JVj5O0HtVuLLGddbpX6c7LtTA
	UA95WY9JlmJTVi0ygJ6WtOEnriKDI6A1BZwZV0z1wCTKSBo89PQuwCz2ix01p7lFce79BlodD71mj
	/4ZDFuXQrvxg8fc2lGXTWMlQprwAq/oWBtLvlr7TU5doJC+4hYOg93tj2Cb1UUUp78pUlPR/jbSQi
	mDA750Nvu0OBUvP9fS0lm6Xn7oK5SyCJtpjS8vWWKnPcJXUW99viDS2JD7JI0HnIkV2ekl5FCoJPd
	VrnXyXOw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlek-0000000DSk3-3rOg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773105182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
	b=YKqpgBRqzU6/woYLWvlnaDi48LqZXMvagw3mv3wZaH3qRByYY+qpfCc89h6QrMjttghwEr
	E36QisgUyR+a8xiodFb5SK6LQTRLzfI1N0T2HbTq+yPNKoX7NANAzUXlijCrng0ceKFmrL
	VU3O7BHLMx4IZqdnN/LLK5so2xMlFzs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773105183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
	b=Tt+I/dLauk0iTXqVx5JQCwnwujLTYZBB/gZd/J2655tM0qCC6zH5/v4u8UQX3XetND0ZMo
	013fPZn3orOvKiuJ95/PD5xmzJYZ/NLJc7XitEUL5kgAXMYkOP7eop6ph+gIpBahiWhyc6
	TCEX6CHP7j4gBrO9zc3erc6LNd87aFI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-v8j3H_QUNsO5qVD_XJF99Q-1; Mon, 09 Mar 2026 21:10:47 -0400
X-MC-Unique: v8j3H_QUNsO5qVD_XJF99Q-1
X-Mimecast-MFC-AGG-ID: v8j3H_QUNsO5qVD_XJF99Q_1773105047
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899f757514bso577687796d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105047; x=1773709847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
        b=mR+7rRbulJoBlua9eGRo16QN5Ty22qSJXOpOD+Dnv72pWPtgf00pS8NgvIcBUGxHhe
         3MoY0qqnbCPtr2pXERrLSbaBdO4p05RLeYowrvUkdSU7/vTM/WwHJ80kh6Bme4svgWv3
         UXMhKxQJe+iuLAOjY4WjMLWugGUjKIglNQg0l0wMuLkxR6BjXK5dSfbeicKY7UyHAT2L
         xBdNYKLGNb7+Hg7T4D2DpOsCmlJaBv/UF+NwtwrcFpRwzh4llfvx7q5glaShOwzovtiC
         1jj/8Vtj41mYOnMDjyafp0aLK8m/but1Vvxa5vRlDFR7DpJvVZhY46fdfWwPq7FLWaKN
         nrEg==
X-Forwarded-Encrypted: i=1; AJvYcCW6LYg+ZQ2dOJnquTZ7rcyS324QcJTLDd5Ub3kxKsLlcin89lP7ENQ6xVEsMzWvwAMOa4ZOF4c3GbaErw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFZDA52TWc50GOSUMaYKH3XxIPCMxTOfKg7S/cx2JJIhtbO7u
	+64cZyJesgg9u5aEO6OsFaTIL+vzqlHei/kWtvdWY0V0xJQ6ljYw/0FqY6TravsA9OEHMV48kRo
	AHiYCA+a2A1GZVqrBUydShb3DEYrv8qhQSXaJ/cUnShg/tHxxuQ20yeYtGjAGgTlxLKE/8w==
X-Gm-Gg: ATEYQzwEWmuXvApTj0mF4tuD7PKavaI5EETpvwXOnBJz+GCieBYB0uGSTCPrhR5HTyc
	0zGhT9vOYUN/qJShHA17r0iN7jlFty9znnWhhxTLl8bND7e+QYXKCH2kiZKKj8WlbVfgv+bcskP
	+xHxVAm6E5+O2qLzNfY9oZb2+CkDz5HUJmgGjlqAbOO4BpiObEQPL9rnjW2N3yzR2hW3qvwJLQ+
	/VWj0m3ebF1vAOJbBQfnyZI/iqVi3qTsg5dMPz9ciBx4RzVKxrvdAZPY4vwrdBCSaqNyQEG6Ljt
	ska6DrUIbJX+0BVZlPE1dntBwE0fZVUH6S3peebYbrlRQ6WbEm789ycsKcpZ36wg3bwRnsW7HA2
	wP+RzZACMyK+wavNv6rSyJZyXr+Lk4yalUNovkXtpZGa5/McumseJbdocDotUhnCXAxBlT0lQsM
	9H991P+ZfHEFROSw==
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197364786d6.42.1773105047076;
        Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197364236d6.42.1773105046575;
        Mon, 09 Mar 2026 18:10:46 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18252sm10681656d6.10.2026.03.09.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:10:45 -0700 (PDT)
Message-ID: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran	
 <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthew Gerlach	
 <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Keguang Zhang
 <keguang.zhang@gmail.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous	 <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois	 <romain.gantois@bootlin.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner
 <heiko@sntech.de>,  Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Emil Renner Berthing	 <kernel@esmil.dk>, Minda Chen
 <minda.chen@starfivetech.com>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Shuang Liang	
 <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran"
 <vineetha.g.jaya.kumaran@intel.com>,  Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu	
 <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S
 <swathi.ks@samsung.com>, Bartosz Golaszewski	 <brgl@kernel.org>, Mohd Ayaan
 Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 21:10:41 -0400
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZg0sgcKl0BHcPSDq1t5YK0_yVhLkb1pQRA-h8Ys9Jg_1773105047
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_011308_737286_CF87AEAF 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, 2026-03-06 at 16:46 +0100, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.

As Jakub pointed out, it conflicts with the latest net-next, but does
apply cleanly on the latest mainline, so I tested there (on a SA8775P
board running the SCMI firmware).

The two NICs come up as expected. Basic iperf3 throughput and jitter
tests look good. I would offer a Tested-by tag and a summary of the
test results, but I think it's a moot point because you'll have to
submit a new version anyway.

I will wait for you to rebase, then test again and come back with the
results.

-- 
Best regards,
Radu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
