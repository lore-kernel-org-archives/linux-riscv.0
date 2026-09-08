Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C2C79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 21:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv8gWCjsrAeLM6D6Ap0xi1wKiPOvIyXYUJ04kBNsFnA=; b=Oj9ir5mtSdRtV0
	Vku/ixoAtV+Ru7eQc0bg540ycuJMSfQ2M1YVi4Kyz3M3pEvdLvOM+sjSfh2ckvOT07TAbkgqlvcDD
	9FFb2HpCXPeqAmHhhPZQ0rLFrc7/FgXTbnDR2Hx2uN0c8yTBRMsbIp4T5OjFmDtpsFKO517qdYkCz
	R6e1yp/3pPk4htQbpOxdL0uELj2A//Ln1Fg5DHLVWqUpcPZzz+m0YpdlX4CCXuHdhc8GmCh1DKcH3
	GLcxXoF2iwVte6SMtHm8/tKR2l4G4FBSYAB7eMkr5y/aHnQYnd8uoMGTVxOOWGpW1vYJpcvvyKptC
	izEVbu/3HhZ0BDKPfRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43L1-0000000AJNN-1HkA;
	Tue, 08 Sep 2026 21:26:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43L0-0000000AJMg-2Fad
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 21:26:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCEE6414C5;
	Tue,  8 Sep 2026 21:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA531F00A3A;
	Tue,  8 Sep 2026 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788902801;
	bh=r7oXq7kQmvGrmahMesk9V21u+Tvbyn0bdt0fECmuQw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XcifVot1V0tarr2602NXXFI0SYUsusVKlimRqu/6B+nq9jSyBxoCgQZxbenS1BFJt
	 thOcBOQhQkxPfXMMIxX+xk2sdEZOb5eHcB7pv3uL2D7uxEqs5FghpFH+lySBTlrBYz
	 6y35N/UAgBk/WSrIxc38+I0Wly+UW/hGDc0ghe7Bb8qCFf5LIc4lz17hXwKXQ5q5OT
	 L5nEBNyInARoqc8Wf6ZUi98/kg8waQmgeu5SLfSacZsp4IpXMCKXCBAexL1dOKzslu
	 jPZ5kLnBmde7mVwRpLxM+wx+3SFWoNTGOhKdoiEIpO6iwBTEGGTZa5mPg72F8JKret
	 3bcB1oyG/qcyA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
Date: Tue,  8 Sep 2026 21:26:36 +0000
Message-ID: <178890272613.280426.9372174994457180272.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
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


On Wed, 29 Jul 2026 00:40:15 +0800, Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits = <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) = 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=01e2f07c44fc46180bdb10e70506f8acf44a53dd

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
