Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18580D262AD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zCXfbjDm4/gl9NzLuBezJU0tIuDHrX1Lg5f0xftk8g=; b=z9xPlEWAC4cCXr
	bOtNd7X97zY6ZJgOi/tK3ZjvypiSX9/As9RFoc9j2kynQivxih1MDmzcjojuB+XKhjwejgT5YsDL1
	cudPldTTe5sSLo8SMAKO6wl731e1ApI5/EsJykdasGzhuN3jwbShF2f9OcPrqtqNS8R7Q8Dl3rRf+
	8GwEnH2p54BZ+4Tgzfm384NmgLXAeItp92HFo/qlPQqvIfNEuMRbiOed7lzezMDlGoBhh4/LDq3ZD
	Gn+QaC2Taf1NsJxLltAPEPU0sL/j4xh15uUSuOx+a5GEQm+LaqBmBN9K584eY2Cft7cxG9E12ac3/
	YxjzrxdI4W2l8+tOVaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNqS-00000004mSt-2ua6;
	Wed, 21 Jan 2026 02:21:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNqS-00000004mSn-05uR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 02:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7F66011E;
	Wed, 21 Jan 2026 02:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820ACC16AAE;
	Wed, 21 Jan 2026 02:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962078;
	bh=j7waV8NWZBtuhNIY6TrRP+nVW1vx7BHTzf5Bh5U439w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0dT+DvdxyNk7sHMlklvwtNBRATnVqp+LcOt79ZRKCFlY2stWywHTziP8aWB9Tp2P
	 QddRl1zKRfah8ixukRdy60c3nLahYvxjnqhDlo1fC60rJZNlPLFCIF+/205iDc6B1V
	 S7i9gSptjqviHQX9WTB23Pt4BsRCtkZxi9In8Rvn6QkawwrAT8u+I5IwDdfG0GQs8B
	 PWB1bOJpBT75zVhW/G0uzPnSAH4+j3PBkHY+dTqmvMQOhNzhHh27Iyinnxt4Msn/FI
	 Q4FihIF6uKe0BoeFWcCGn1ZYKtDX0ichSb/SZTVuBQuJP12mM8OPzaqgwF/FP2lZ20
	 BW8/IlX9ddLFQ==
Date: Tue, 20 Jan 2026 20:21:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v5 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <176896207692.1787158.10124540284354506229.robh@kernel.org>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116043746.336328-3-zhengxingda@iscas.ac.cn>
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
Cc: Drew Fustini <fustini@kernel.org>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 16 Jan 2026 12:37:39 +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v5:
> - Dropped the requirement of port@0.
> - Dropped the if clause for TH1520, which seems to be not needed because
>   of implicit DT binding rules.
> 
> Changes in v4:
> - Added a comment for "verisilicon,dc" that says the ID/revision is
>   discoverable via registers.
> - Removed clock minItems constraint w/o specific compatible strings.
> 
> Changes in v3:
> - Added SoC-specific compatible string, and arm the binding with clock /
>   port checking for the specific SoC (with a 2-output DC).
> 
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
> 
>  .../bindings/display/verisilicon,dc.yaml      | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
