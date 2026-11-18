Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EE2606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 00:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c05io+cs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vix5oa89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cPYVUnNT73HdYfw9XmqJowgdUdIIQG4Y3+h2NiUnzSo=; b=c05io+csGbmlH7sxaTxvfP898w
	wffMppKljn7sOObe48PbuKleo9tlQ0/16YdOHt+pFeg/8nQ32feJnZCf6so8hWt+0E/05GDQNLHCz
	boVpN3h1RPLnCcb+SyWD9uj58uawaJs3S2y+QzNvmIAclezykniwR12nYFJlSgmslfAGVfyFM6Lc4
	P8hiB/8RqBZamFP1qiPJOYaTVq1wAJS3KBx9DTTZvN7VL7seM9/OzSBsvtQ6np7didsANTmKWTTvC
	7VE6im41fV0yVmYkTW6Gj59DSLNL6BauNHUGwWaMujSDAJEs7BOwA3pbEb4aLz1jY/1D65v6Lpv93
	CjTfANgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTtH-00000007POM-1pHe;
	Wed, 18 Nov 2026 00:51:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTtF-00000007PNo-1GS6;
	Wed, 18 Nov 2026 00:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B849F415D4;
	Wed, 18 Nov 2026 00:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874611F000C4;
	Wed, 18 Nov 2026 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963068;
	bh=1UbMEHB0WKx0u4dst6bzVbW5BKGdyKKbsda1yqu6+p8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Vix5oa89sYVH+p/PIq4YrS+tl+Q2d4GuSof4iYPr1Jes1ukCV07Ax1mT31gYyRuBk
	 KDVy1Xc7YkJFjBGk5YUHJzXhopjFDdL078g//rtk1yAnqg319z95CNtPuGG0OYycRO
	 8Wa4KGYOH0uIUrNnDpu51YSb5byQaABCxt57BX04GkSmivdOSX53foyLpW6Hir1D/2
	 Ojjfm7+wHiSWS3iuLZLjwaicqWHiDLEhCM8IKXgCSRYPXKRQo8/HxBpYGfmGkUl7uh
	 +vbQm41d1rp042Qx55pJ1nSLVSkIsdEJ9zElVuG66GwEr7i5ZiJxXGuq6KYhnQeAcp
	 dwuP02Th8yGRQ==
Date: Tue, 17 Nov 2026 17:51:05 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
    Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
    Brian Masney <bmasney+clk@redhat.com>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
    Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, 
    Philipp Zabel <p.zabel@pengutronix.de>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    Andre Przywara <andre.przywara@arm.com>, Han Gao <rabenda.cn@gmail.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
    devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
    linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/19] riscv: sunxi: describe the wider Allwinner SoC
 family
In-Reply-To: <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
Message-ID: <fc63c0c4-5b79-87f9-aa42-7ed541361052@kernel.org>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026, Han Gao via B4 Relay wrote:

> From: Han Gao <gaohan@iscas.ac.cn>
> 
> ARCH_SUNXI is about to cover the V861 as well. Update its prompt and
> help text instead of adding another option.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Assuming this series is going to go up through arm-soc -

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paulk

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
