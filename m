Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81206C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZ7sV6yoiGDKdfmL0AZ9ZGRdRaGk4TFI0moaF30HbKI=; b=BdekIEcfTd2cl0
	yDDbffcM14f8FB9/p64+ExrXhCsXhpoILcWGhmQl6chb38NYzUaOwB5hNH3s22WZxEmOHfgFu1TyY
	AVp+TNnNROp+pz/8zurAgubLN0xTY+Czh9jZ/xnH6odrWlV/uJqCOrwWm8RZsrErvlZNcegntlodz
	7YWOsPeoMI/yUHjNjsBR16BcR7x4Ip71Y3fHFlZ+6Do4L+wMfpE4i0vYkd7nCNN4mDGwebrILETl1
	+IH72tfeX2Idghnp/AcqDr0dPfELPdR1LFu7Z9cDw3E7oGdft00WNLIhd1/pqViD2PojZgnSMQltt
	ebWXfIA3ERQzQGH6+FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aF7-0000000DlHN-1wL7;
	Thu, 10 Sep 2026 08:34:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aF6-0000000DlGY-1nrY;
	Thu, 10 Sep 2026 08:34:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5F10600D4;
	Thu, 10 Sep 2026 08:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA041F000FF;
	Thu, 10 Sep 2026 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029287;
	bh=az0kiZ6Vkg/DvTV9UcQQ1SWFv3DTv1KIes24E9gOO0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EC+u8d71j2WycnMf8Rx/Q+VbqSCS2snfakFw7Cm7u1f/m9J/4f4/CihF4SEm129Te
	 GsZmSY8hs2YqP3NDSZ6eq++rS8Ozr8UFNxDeaXWL+y5Un/mkNlEhL7bNu4/FSwxbnC
	 AaV8kLEdS8ZiMcRlHDMrdIFTvu03KkrI8jlDGA5LsaOu5VMBnBxOSpFHiiigBiCaR6
	 K/ngYO1NKF+oOSzx1pup3Pu3kFmELfMeSRcrHjE3NEix62oVqfQHdXaeqO07YxnXIB
	 6jQmir41XTMnu8+XQGTg87PJZVoFZDHDVBGU3GMhUcLcKHK5DzZwebu0JDarbK+pFh
	 BYln0KM2aPhLw==
Date: Thu, 10 Sep 2026 10:34:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
Message-ID: <20260910-amorphous-vigilant-jaybird-d65c4f@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
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

On Fri, Sep 04, 2026 at 03:27:07PM +0200, Michal Wilczynski wrote:
> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>  1 file changed, 1 insertion(+)

And this one must be before patch #5 or switch in your patch #5 to
compatibles-style for children, instead of $ref (see some recent
display/msm/*mdss* bindings like sm8750).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
