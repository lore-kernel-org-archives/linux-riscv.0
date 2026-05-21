Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC6CD4F5E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 07:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKIQPp7NNC0hap4aQvVuRikzJWoQR8WbJN4ZAaiTtrs=; b=KbFakuYMoZgylS
	t7j2Cow3u4BSXljLBtLrt9AoMrngVSbOTCvTJxt0HH0juRAcXxSE0Zc2GIG+yO0EZTjfgnIUepcUJ
	MIRWqxl3V5ch8l28Hr2BgWmxdWXeCUev1r2Ys9+qN10l2Iw5etUHkQ2dV27uFEj1SclGwIXY91+08
	B4ufiAdlc9dXHqkUeHu6B66ZCg/+ItSfRMgv0o2+GWEUsMRGNSplRKZQWMN1BLMPx+2Lw0Z+QFNLi
	CmTMIv3EoOYie/toqf+wgLLKtQ/p9fUfJJ6nOGqmDCuDm4Gb4cNHmTvVv5mL8fAPRCcqvEAbMoDsC
	LfDI2RcxgEWxsjBZ4mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyBH-000000070lv-0izP;
	Thu, 21 May 2026 07:50:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyBF-000000070lS-0HuZ
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 07:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B83740C40;
	Thu, 21 May 2026 07:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB901F000E9;
	Thu, 21 May 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349856;
	bh=9QejERVBrMhM6mbYOWnu8u+EPjvWN3z78srTmhr/GPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDfQb128fU697N8wbzfEsy8+umqzduOuq/pYSi7ljSE/gy7f9kPbfHhewshP5ZYO3
	 oZrdP8OG/JXa1C2Oq+4Pc5jF16/izhX1tdCtlHmEwIjEbwgrlacpAX+cTfZnGerREJ
	 xKgNNpPZGNCD8EG+7YTPfBPz8d/lSHlE01DkQYGSrZGd9Qmg5i1Lho3wxODhA01cm9
	 0DpxL6dSBNuZrM1IU8A9AtLibwxBDBujUwxDUJngduhfNJP6RFV9E3eu54u/5mQsAJ
	 n+SUU2PHUcOTZRWI2VbspLFNmL3EdSwaXAIaKYXcW7msDtH5bN3VYaos8/T+/+IMMH
	 HnosktSPakc7A==
Date: Thu, 21 May 2026 09:50:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/8] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Message-ID: <20260521-awesome-tidy-tench-eeee8b@quoll>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
 <20260521012932.24163-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521012932.24163-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_005057_126543_046C148B 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, May 20, 2026 at 06:29:25PM -0700, Changhuang Liang wrote:
> Add documentation to describe StarFive JHB100 SoC System Controller
> Registers.
> 
> Add the PLL clocks for the sys0, per0, and per1 domains under syscon,
> as well as the PCIe RP reset.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 114 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 ++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +

Probably you should have own headers, instead of reusing CRG - CRG does
not sound like syscon, so these look like difference devices.

Anyway, if you decide to keep them in one, don't change your mind later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
