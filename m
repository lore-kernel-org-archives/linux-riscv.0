Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B61C27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zzeu8tc6nDmAAmqRfkYZB1nAZfaNjnh58aa2x4K/IE8=; b=F8YzpndSViuW+K
	N7rnuGQGcplWtUyiyHdemwG7wXMouIjBSKaAVn1I/RvDySqVnUx3BcMuZ01sk8WC0f5NBm9wtXBny
	z6CAyKuAU8cxRE86KnutvMwBX6wfkoEsJWU0V1X1DQKLTCWLALUsYF/yGsLg4vX/6X220uYX7f1jt
	1JeXq6f1EJOSIRkx6Vnqf9AwlWPRqHiqnnwnRqvqoJiWHqydzZ6ZZXAhcAJon45Q9JLG9adEm/s9v
	mHxaLX4xU5jmhO0I+VNGkvalEKO/W3cx4t54XRp533Uv2bqMJELlwB6ByFOgWcRaFqaSSzxUJEoTq
	XTkKEjRG76IUTmp4DyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2LA-0000000CIAJ-1iER;
	Sat, 22 Jun 2024 15:07:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2L2-0000000CI6z-2qDP;
	Sat, 22 Jun 2024 15:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3251561196;
	Sat, 22 Jun 2024 15:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA65C3277B;
	Sat, 22 Jun 2024 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719068854;
	bh=FWOQ6uEddi1Oy8wHfoQsKuHKsTCcCzZHsfD/pnViTac=;
	h=From:To:Cc:Subject:Date:From;
	b=TS0DvQamfYX/dVr7XVqUP1xp2TZ7oUbIjoyz1KkXX5zA3GTrNPy3MjJJAC0A+Pcsy
	 2Ar3B+E2rQ2/PPirQA9SLDc44epwaN5CP0OQTMk/p5LP4toltVBnn4qM6u6M2gJbRL
	 2mrWfewcBFV9frySlAwT1iZM03K53ujSdMkGAALtVprN5SY4vZ99pp61wGb/SyoqKJ
	 qdfCN4RGE3nXZpgrXHghPE2AOmBNOrhRw/84E+Act8DJsODy8PqXzkAJdyI4bo8tjO
	 SqOr5vry5S0Ei9iHK4qRyKbmTtc1h/G4Ue7D8c2ctBCtv4MJqK9oWq5UqgOcTzBdKB
	 u/SkcRY1Xc+Qw==
Received: by wens.tw (Postfix, from userid 1000)
	id 9A9065FFA4; Sat, 22 Jun 2024 23:07:32 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: allwinner: ClockworkPi and DevTerm devicetrees
Date: Sat, 22 Jun 2024 23:07:28 +0800
Message-Id: <20240622150731.1105901-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_080736_802397_627EA1D9 
X-CRM114-Status: GOOD (  10.97  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi folks,

Here are a couple patches that were originally sent by Samuel, but later
dropped due to the system LDO regulator bindings not getting merged. The
regulator bindings were recently resent and landed [1], so now is the time
to get the rest of the stragglers in.

Patch 1 and 3 were originally part of Samuel's D1 device tree submission [2].

Patch 2 was part of the system LDO series [3].

These have been rebased onto v6.10-rc1 and have been compile tested
only.

I plan to land these in the coming week for 6.11.


Regards
ChenYu


[1] https://lore.kernel.org/linux-sunxi/171532213496.2045034.2645456500780291742.b4-ty@kernel.org/
[2] https://lore.kernel.org/linux-sunxi/20221231233851.24923-1-samuel@sholland.org/
[3] https://lore.kernel.org/linux-sunxi/20221208084127.17443-1-samuel@sholland.org/

Chen-Yu Tsai (1):
  riscv: dts: allwinner: d1s-t113: Add system LDOs

Samuel Holland (2):
  dt-bindings: sram: sunxi-sram: Add regulators child
  riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees

 .../allwinner,sun4i-a10-system-control.yaml   |  28 ++
 arch/riscv/boot/dts/allwinner/Makefile        |   2 +
 .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 252 ++++++++++++++++++
 .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  36 +++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
 5 files changed, 329 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
