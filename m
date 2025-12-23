Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C419AE6F08F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D8j8epJK5Msyf8qrQyTv6aJ9QDf1u3x3U2PRbYveZY=; b=vrk1qftQtB+VLZ
	uOXSTusEvSDeIQoP03YVc3E0IZ6omka8fcR7Gy+og2y1zqIMpYIlC2BpC28j8Amcda4UThbc2AGns
	leD5ejOmACLAR7N7QYpuLRaYR4OuaRN8P28jvmxh51jWYVOY4p+BhdQQl56MwJymuWLRII1UINDTG
	OD/nRqtCbNQxbQPROg9uTw7kMgYNrSnBRtYTxdNEWmnkrHtUSLo0PKYjQHfBvvFjn1Q9iKXqoUM+N
	3d7c6/QguN5ZP5woeXY7HWyjH+EPwhc5gRLxzFxjAG+7Gu7afPxx/56YocGua3m89XOsBMuD8Cdx7
	S9hxXgcRNgavCJI3JTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2lb-0000000FYY4-2uXG;
	Tue, 23 Dec 2025 13:49:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2lY-0000000FYXP-3yVz
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 13:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 315B643783;
	Tue, 23 Dec 2025 13:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E62AC113D0;
	Tue, 23 Dec 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766497772;
	bh=LP9Z5o7yi79FN2SK/0EC/YZ6R6r1WQyV9Or8AKfEtvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEAyTQ6myK2KnxFepTTbdpaQpKGbh93LnSrNBArV/EeC0O614blICVIzT3ETZOM45
	 swJQTl7BJ9vuQQFS25RpFOenhWK2uFEOQH7U/OokTjgU6crXJWPRL4WplVevfIp9FO
	 MwV3ns8BPhryvu0JOQHqB6aNthvxov+HCDf2Tf4IcAf1IM3oAn/+AiXFTHJEeAvNLl
	 Nzu4JUEzBlO7+0rkw9mt1wpxV/Qiy5J2/pAIcgjp1EDk1dYA/8D8u4bXUeXRhmm2qB
	 CvGoshRElij4almUSa+ZIVARPsD/diRNniIB6+Rmbu95OeOPDuXP9x1mF54fulBNYK
	 t0lOWN5qEZM6w==
Date: Tue, 23 Dec 2025 14:49:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: spacemit,sdhci: add reset
 support
Message-ID: <20251223-great-ambitious-piculet-bbdecc@quoll>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_054933_009053_2FAC23F7 
X-CRM114-Status: UNSURE (   8.54  )
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

On Tue, Dec 23, 2025 at 10:24:49AM +0800, Yixun Lan wrote:
> The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
> which shared by all controllers, while another one connect to individual
> controller separately.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
