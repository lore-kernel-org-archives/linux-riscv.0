Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7646C55172
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVNgFPDFEEk7ahqFYpRBQmK1zxdp/EdkrQ0EV5M2Atw=; b=mKLadi1UZbbF+x
	/qA6LhcKPT0fRnoQvHCxg1RCAnDt6DuKCz0GQSIh/ckoHLj4ejeoLPwi4i3NBxbelL8HpqW35alkK
	5AMWrXgy22m+8H+6E6jjDqOzSnEWdtxARdEyfNGqLwkHCD4m/A42K0i451dLKAnSGu5o4QnnSmcn3
	WKFhf/RbluqCYCdE6mdnSkmwV/qLUDId6IpSM7tVBiMEDK1OAqcn9S1RoJnPh2BjipCR+5gRJ4a1y
	LZCfh+sZTmgn7ICgdye7aM2IuJDDEkVrCzBl6D7mIuWMt2h8AvLCnGasX45OsumDs9AeKXlJAS+WM
	OwIt/wo9fzmKsmINk/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLpj-0000000FHdG-0xYD;
	Sun, 02 Aug 2026 02:21:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLph-0000000FHd4-1B8S
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:21:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88E116057A;
	Sun,  2 Aug 2026 02:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F261F00AC4;
	Sun,  2 Aug 2026 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637304;
	bh=+qkDxw1M5h2ctJR13O5BI4kM8CdztxYtNjq1b+Maeoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KJtvdwB8UbvObstRE+x1s3YDw09r92Iwb6AKvLnEiAadYemPlB7JLQ23ojbD8omsM
	 h9utxB9KMY1h1Jtr6QV7WSaXfBUPROkGnZUCmQJfPOcn5cUkqG8fT20i0Ey5LbB5cq
	 z42x6ecQpJJJ0F4/6QkrDiQ3cQS40POo6sP48Yw/UqLZaPl1RG/thQIPx6vIDtk+1Y
	 xRUhsvK5DtpyWVOX0xM5M/pPV1Dob2982fXHO9AJ8VgckNN6akgh+X4CbLs8fHEjR7
	 7aFPFV/p6jSIutaoqreAIQx9nAVrofKZLW2IAU8uyAogsdBaeDBkCVgaiKgDDbqNgf
	 a033t2hNM75zQ==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Sun,  2 Aug 2026 02:21:40 +0000
Message-ID: <178563724174.1617015.10811694726448141667.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729160749.1621415-1-aurelien@aurel32.net>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
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


On Wed, 29 Jul 2026 18:00:27 +0200, Aurelien Jarno wrote:
> This series adds cpu scaling support for the Milk-V Jupiter boards.
> 
> The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> 
> The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> the common part, i.e. everything but the model name and the operating
> point tables, in a shared DTSI file. This file is then included for both
> K1 and M1 variants.
> 
> [...]

Applied, thanks!

[1/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e273d298b74ea63d5d586bd50240f919a9c33fb3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
