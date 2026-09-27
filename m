Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385CEC98338
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pnc3+WPn4tZS6V57SN4ggGkv+V51K4jIeqafSgSoySk=; b=Qfdy4lHEIUEJ7Y
	M9ZUJZqQBV/KuGVrKCSzGeP7DjAN0mRWKMfsIvf9ybgS2r4IDxmH827gcrLsNrvxKW0rpzd9VN8Lz
	rZjQHIid5ceRc81BQaah9Vqtr9sg+t27hczewBA8wxXsDTB2KFGTnrHgCWJj6zy2zUNGS6EYu0YAn
	8WocLAu0bS0cJpU8SgVsrQYqHIq7RKXwhcgN4fAXN73GT6Jo0sVMJ34PqWA6z6VteqpMMkqlfiG+h
	437/hGGnPXuBgHH0zOoLinQS7m6pNx5XAzQEOGiIvMBS35jVRafasopvWbrGWLJ1nPomZqn9GQTDb
	dAzHMg9wJ+rUfbAbU5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsrZ-0000000Gf6F-0kx5;
	Sun, 27 Sep 2026 17:40:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsrY-0000000Gf67-1ljF
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 17:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31EB360052;
	Sun, 27 Sep 2026 17:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1651F000FF;
	Sun, 27 Sep 2026 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790530829;
	bh=rRicdbRpdSMevJVjz0k9ySyuClDHkZPdx7+N/XrY8Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A1QS/gdz5FrsJEDgePvIQvIDiUwOEyInkviYgzx/9+hBfEeEc8pymb8o+pJY1M8oh
	 8L0mn5VXjz0rWJz5/UwLUUXb/SOl5vHH5zt5WYu/qCbnMy1hN7ZYmhzLxASav1oooc
	 NSaiVY0Hmd3Fkm59yFY62+rHFC+ItPVWukVFAtNZROFPRdjIebaAGK3tCpAzVq2Ltt
	 Tc3WZ+BzimCSWOaWfZBaGrAi+1srwhejw8DkcioK7Jg8VteKRiy/vEC7GBIDRwI3Zv
	 ULcVnZ1fJawAVCzy9KKccZM+cgPp7qHitVH/Le98PXnIaXD1P4Ii525hrYXoh1W58g
	 DucM6bhq1+FWQ==
Date: Sun, 27 Sep 2026 19:40:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, netdev@vger.kernel.org, 
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v4 17/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-2 clock and reset generator
Message-ID: <20260927-wild-modest-goat-b79b3c@quoll>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
 <20260920120044.194901-18-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920120044.194901-18-changhuang.liang@starfivetech.com>
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

On Sun, Sep 20, 2026 at 05:00:39AM -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-2 clock and reset generator (PER2CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-per2crg.yaml        | 76 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 57 ++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 17 +++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per2crg.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
