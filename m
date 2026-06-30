Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C47C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 01:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsSI67WW8htG0E3LNhnOvmGWVywN8XumWSwsUAStAmQ=; b=e/x0Z5rIt2rhT7
	zXny7aGOWgFUa4TN0rh8bfEL4/p31JM41OZTwO/hNtOlB35F+j6aGRH3KUkmst4DqRhX42/SbrszU
	i99hGLl2CCU198xL62VwGxvbsicv5YOPZjHM7xtMM/OKrDz6A8oqlnMo31KD0bOFl0/hgXmN8xIyM
	yooGvd7aEvkdfRs2h2shhu6u7H8CowMkBIV/wP7F3IKB9n2OTIxpp6ZHC3JFKqXzYz0Mv1W4U+vFU
	er+c8CYmW36Faiy53Ki42V54+jWJs2wAjtW9qLIoC1OKsvT8NvSKedWCplIQMt28wgPb2N88IKyBS
	HUJ7fjV3Qy1zSoiAS/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN04-0000000FdYu-1JhO;
	Tue, 30 Jun 2026 01:10:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN03-0000000FdYc-0XZB
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 01:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5A16600BB;
	Tue, 30 Jun 2026 01:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D281F00A3F;
	Tue, 30 Jun 2026 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782781852;
	bh=piL7uN1ZN4RlJL7pkxygfd5s2i0wytlnszFqNwAYdvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fBR8u1vG/hhVoLDclrWJEZKZGurbJNv1CVj/sLHCVesVCBeOZbvXBws+yRsX6UsK2
	 nSKx8sPmIqtNT90icN6N6EdMltg08yeGPGzMPTtOHDJTJ3MZAuH2lnqjxLmc9y44E9
	 DUEFA/OB1125HkQM/G3ilJ2q90ApuRX2DYIaMyTICrwe+csfTomo8xCbysn/kgV5EB
	 0Q6Ll2XrHTzG9npOsdry/TKbv7owlUdEAqMm3BpMQL5xnxlsLeXNbsOpI8iQ2ieHup
	 GOc6REQn/GW47j1gtfZYvGbjHFwcLnwFwdt317sTKEExYbMZNJ1b0HsZAMSHi6aX7B
	 yLC6Zp0EKOTMw==
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Yixun Lan <dlan@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/2] spacemit: fix USB2 clock and reset
Date: Tue, 30 Jun 2026 01:10:44 +0000
Message-ID: <178278137140.759782.6011015469413398398.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
MIME-Version: 1.0
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


On Mon, 18 May 2026 02:58:35 +0000, Yixun Lan wrote:
> In current code (v7.1-rc1), the register bit of bus clock and ahb reset
> for USB2 were wrongly swapped, but this didn't cause any problem, because
> from setting the register bits perspective, the de-assert reset operation
> is effectly equivalent to enabling the clock bit, both of them will set
> value 1.
> 
> This issue was found during suspend/resume test with vendor's internal
> kernel.
> 
> [...]

Applied, thanks! Queue at for-clk-fixes-v7.2 branch

[1/2] clk: spacemit: k3: fix USB2 bus clock
      https://github.com/spacemit-com/linux/commit/51ed53630915c9cc290036fe4f430849e23bbf8e

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
