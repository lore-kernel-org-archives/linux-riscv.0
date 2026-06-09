Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A6CD8C92
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 05:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLJ1ar+3BQTq7yOoQuuoN7CdkLAsKNmZ6ADEwsWdGwc=; b=45myB1PWQ0vuAj
	nMi3QoKpCiYUTYibGOgh1RtOVhAOYvQ8YMo+tyKwqByWEQuTj+/Im9vD4ND8AOQ0khlRb3ortgpFj
	Hgo+j4wN2NXBn1xk2baOt3Jip1n32N1qHGH4hQKT9WiunVgsqBbocwXtN427RKs/FbAQuiWW9TDI7
	gMub42w3Is03F7Tk4ukCRyKPPNYW9G9XCYmw4saL7SSejLP5hVkHfUTo2V90o0IsqmpmnvjRYE6pq
	1m0n20pACxvIQmAdKvfmZnuibp5XkfpT3kqfYrH9iqZP2nT2NhG9FLDsHzXMMh+M0osERvYizInr/
	PpghnRIv8IFLohg5Dp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWono-00000004k98-3dQC;
	Tue, 09 Jun 2026 05:15:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWonn-00000004k8q-3OZP;
	Tue, 09 Jun 2026 05:15:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A1FA601E1;
	Tue,  9 Jun 2026 05:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B518D1F00893;
	Tue,  9 Jun 2026 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780982101;
	bh=/mWiyJV71B6TZ8JXu6VdyFVLqLGyT2eKcg2M8VPgZzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POEG9hwKBWmaw+Vc4biZ0wBtkhMqw8sNzWx4GqsPAmgQrO5zrCtTUmr7xXYQB0LGs
	 eGNpccNF0PWSOXBqoT0Dq9tSPWEbe0i/We4X1MJo5cAs3zCOCi4WBKz58C3nLchCS1
	 bNzYUDm/1lRyQKh4HUy4iYtg33CK79DFFOmGKq3BZ1M/yX7Y+frpBoO7ynxX/6zKi5
	 RqElCxNNmsI3YOXEA5AnrXaiVoVJh5QAfY42XCrDlYCwtf5kP0iXl1AgJmiAJlgbIr
	 Q+VfDBo3R1LUC8VWLk3jxa16869D/OZ30gfLZmwYenDmJzrfnRBasHKePoZ2vE0WHb
	 pYTt9PNkWAzWw==
Date: Mon, 8 Jun 2026 22:14:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aiehUzl-qZeZDjXP@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
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

On Thu, May 07, 2026 at 04:17:01PM +0800, Icenowy Zheng wrote:
> The MISC_SUBSYS clock controller on TH1520 SoC is a clock controller
> mainly controlling USB-related clocks (which isn't utilized yet) and
> MMC/SD controllers' AHB bus clocks.
> 
> Add the device tree node for it along with the missing bus clock
> references for MMC/SD controllers.

Is there a functional reason to modify the mmc nodes in this series?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
