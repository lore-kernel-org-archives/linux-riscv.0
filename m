Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47D5C021AD
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XpPQ9YEqwRu0JbnHrpQJ6CkK7gVkMHls1qZtegjAX4=; b=lqjyqACDFA8jbG
	tPNn91Hj2rObup3gpduBpVhbnhnIu/g/6rE50l97BVpLVzyAXJulxvfYPyZ5DWTjM4WD95K7nI08i
	RfL7XI4i9K5Jgxuk8B0B1XiLhqCMOeTfc7IlGnkbYFIskxiIavFcy/MAW+YjdHbg0gq73ukOSMSd8
	cybDdItdjmIBaB3+Po24LXCuqve1DR9G/CqKYxa2t8TcXDGAjp11l1NaXELUpY2I36i/JvoSZpRWl
	v8c/me2987Qbuj34S8Fm8Urnem/xH4na8CPr0pcKWhoxpVs8h96A9VQM5rw25cvH9qENxb+ML65mW
	TxuikHkcL//A5/f2Otlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ87-00000008sxF-2tji;
	Tue, 18 Feb 2025 16:07:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ3d-00000008rxk-44c5;
	Tue, 18 Feb 2025 16:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iZeu6krTMthi8CUDyl1NRXj5ixOnKRmLYoBYxiHjuLU=; b=b8Pxa+hlyS+/K78vlE0kqLbK8q
	cvWQ/hHvvOGNj3k8R2I3d7D9ijLWH+CfsbUUL4BAXb/CrtTOqp8QCdghSDwbzCpadN8mOvL1ml7d5
	8UyDbPy5u379laIruCH49wbxFBMCYuXPLAG/e/VBwOEoOno2uFaPP21gTtRut4MMJlwY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkQ3D-00FLM1-RT; Tue, 18 Feb 2025 17:02:23 +0100
Date: Tue, 18 Feb 2025 17:02:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/3] net: stmmac: remove useless priv->flow_ctrl
Message-ID: <77f72c87-924d-4478-a9b2-0f14673e5481@lunn.ch>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_080250_006955_1FAC864A 
X-CRM114-Status: GOOD (  12.99  )
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

On Tue, Feb 18, 2025 at 10:24:34AM +0000, Russell King (Oracle) wrote:
> priv->flow_ctrl is only accessed by stmmac_main.c, and the only place
> that it is read is in stmmac_mac_flow_ctrl(). This function is only
> called from stmmac_mac_link_up() which always sets priv->flow_ctrl
> immediately before calling this function.
> 
> Therefore, initialising this at probe time is ineffectual because it
> will always be overwritten before it's read. As such, the "flow_ctrl"
> module parameter has been useless for some time. Rather than remove
> the module parameter, which would risk module load failure, change the
> description to indicate that it is obsolete, and warn if it is set by
> userspace.
> 
> Moreover, storing the value in the stmmac_priv has no benefit as it's
> set and then immediately read stmmac_mac_flow_ctrl(). Instead, pass it
> as a parameter to this function..
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
