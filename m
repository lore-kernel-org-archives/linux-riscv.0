Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4727CD6E79
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5h7LGG8JJIg7Z8Z8x84CfWJCDK8xO+qUAC2TFgFcNE=; b=LsemINK81wXUgF
	MjkMqBBYNRNahuLt56JgENMrBejIWWaD8dN++yi2BAihJRoM6k2gGTWXVQNQrS1yBcss+on8EdMAw
	UHzOwN7kox5/slVCktKf8vQdy2TmNghFCelzqS2iTknvx/Hn3oh5xyEtjXa3jfaQEk1iR692JO33Q
	SHHbLvC1W1WipFD4HsZ2hGR3OZEAdormoFJSKmEdBKX3Js5Cn/PeT2tfEW4p+7mGelkNTmZTeiJPN
	zDFO+Pa8kP8mucudQgsyOAj90CWZK7Esfx3mw48y25gq6Wh/g4z8Pri6oB4A5VjYctR/PDg6ETy0X
	kRvnTWKqt1mStViIU/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWn6P-00000004fTQ-3qW6;
	Tue, 09 Jun 2026 03:26:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWn6P-00000004fTC-01NY;
	Tue, 09 Jun 2026 03:26:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96BEB601E1;
	Tue,  9 Jun 2026 03:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B731F00893;
	Tue,  9 Jun 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780975566;
	bh=DTwyV+49fLCBDx2v0KMlJ6TqGe0qDGgv9OAfvSH0tYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFmxC3RkKrUAh3QAMl5gVzb8HdROjdH5oT0UbWEJI/omLbuPjezupcvYRxHysTALW
	 PwBym09KYsmIImspBm9kvoe39DehTn/5wtF7q1Io3gED0Cnmmlvjb8E2ctQSAEz04x
	 S1jJSWnl+tOFBaMa4X8sI12BBltgG1aA1kjT9IIN/BxI4czNurrj8HWr6lzvroPith
	 u4asF+F3VomimsF7xgZzwEF0OOZ30gNyvRVyJwKN8Gk5Zh/sAgDNGWVNEACoAeXGnQ
	 ydNvQXYNvRuEnUaMI6AyrlDvqlBmnbAsReI7IN5Gap0o4bCQSzO/kz+3QF/vogd6Is
	 M56LbLVzROnmQ==
Date: Mon, 8 Jun 2026 20:26:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 01/12] dt-bindings: clock: thead: add TH1520 MISC subsys
 clock controller
Message-ID: <aieHzC76oys5ejWT@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
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
Cc: Michael Turquette <mturquette@baylibre.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>, linux-gpio@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2026 at 04:16:59PM +0800, Icenowy Zheng wrote:
> TH1520 has a subsystem clock controller called MISC_SUBSYS in its
> manual, mainly controlling clocks for USB and MMC/SD in non-TEE
> environment.
> 
> Add device tree binding for it.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../devicetree/bindings/clock/thead,th1520-clk-ap.yaml |  5 +++--
>  include/dt-bindings/clock/thead,th1520-clk-ap.h        | 10 ++++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

Thanks for working on USB and sorry for the delay in reviewing this series.

Reviewed-by: Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
