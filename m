Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE7C5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykny/fDSfX7iWSgxMKRlz08pWujPonwcqOnPDkkxurQ=; b=5DVZFdnKrkO6Uk
	4rZl4hbKSjB9OJ87x/oNG6Sh3It9x3NjTVQNZJOj1L8/uYbyzfH5cNFefdh1q43TWiC4mj5rRuK0b
	yAePQlyW+BiFA46Qlcfe2V3jeoZT2wA+kbAM1oLiFiF7T96gMDHgWkZRacLRhFVX27mM/g90cHqz6
	Z9zQrOELt3pRF1SkobiG7PTCghM/7NZQejkQ9FxNhYaVTpcUSi57dJvTFXpoEBt+uft4DYQ0MctXn
	MkVMpSExAbRuKt1wzhsT9/g561enFS0O9bPj7m0MMBdX3nj/+K9894AgqPEDVInK4b3N5p5+rTI2C
	vo/0+aoB7SfNpViVEGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRP4-0000000C7LC-3Qs9;
	Mon, 10 Aug 2026 14:55:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRP4-0000000C7Kz-10xp
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 14:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FD8960120;
	Mon, 10 Aug 2026 14:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F0E1F000E9;
	Mon, 10 Aug 2026 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373700;
	bh=IePcMhimiO4bG8MZLgXj0Mzb3WEI4wgOXRrJsnP050U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cA4fOepSlxC6CBDbTfrdfIWZcYuymLzs3oq03p5izsC9edhhWk1TOkW+brDxdSeC8
	 Fc0GojCmB6dWCQqdRzy1uTe+OmrLVob2S8+uk6OMtyfUjtpAxT+NUZkfGWHbWeDG1u
	 3uowUO9PQqRAhAcQMp4goIo5Exs43zaC0enbSeJpIbNS1VPzxmN1j2UYQGtJx4H83+
	 Iakuh76SACNBUx/TReGc2PIerNLZuih0tWGkfzh0b7ZKh2OqOEvvUcGw8rqNiEOGXc
	 2iPB9L/fxvo9ohNbMDziIToltTYtJQm44NJOuoafDOMv9En2mI40wk3KrBlXlOxf5Z
	 qUBuCtVOjp1Tw==
Date: Mon, 10 Aug 2026 09:54:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: interrupt-controller: Add StarFive
 JHB100 plic
Message-ID: <178637369862.1615335.12680863675336505769.robh@kernel.org>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806122553.182449-3-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 06 Aug 2026 05:25:50 -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Add compatible string for StarFive JHB100 plic.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
