Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA728C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 00:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXEbYavn26VXKmKiuTA9kwXrRJvZ6JQjok3Tozk+0Mg=; b=cyq1xWDwcW0hIz
	WzQTnTlHXzhVIXI+yLZLerUKlI+xRg+ogYqfTsogDlcniwrbT/anaEolOVf4fE1fxRJWTUvBSS32Q
	lyUk1RwVbs9FxngCDjZSST1CWYNTNodUtgW84SL+QOr6rDMIvz8z+6btfxk1lRv4IB+RALanuzU4d
	QK45ogOod9TxJ50E5yvYTHPQwTfIs1XOhrT+z3+gKvzEnEwmdhVuiHrUfPMv0z3VBz+rvHk/rDVsY
	5JEJofyimdDjN80PbZAQsbSD4MabWUuHQddrygp7bJWuR41J7rPnbahwme3XBUldIGP1fQn0RysN+
	MHDxA68WiNJv3tUox9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HPq-00000004vQ2-2MF1;
	Tue, 15 Sep 2026 00:52:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HPp-00000004vPt-0mag
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 00:52:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 388C56025F;
	Tue, 15 Sep 2026 00:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92B91F000FF;
	Tue, 15 Sep 2026 00:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433571;
	bh=OVMWAR6x9fDMUjH1lB9+DV4vSGMK5AQu+CQ6AxaYNAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Irw5IcpdeCbRRsaMzctOGKc22Ww0JrpTSfSNkm6UT1LolN+S5bF2C4G4/iAdTz3rL
	 xt/2oyshNR9D92KowI1Tv18DYUidYsRWmydZ5vargdW0duhk4p4VqSPjFiH20XdzZQ
	 pQNMjzzxnclEXjATQTr9DY97AOcM9TUbCuxSPMSU4tKXw7Ly6+LQmR5pQ1vJWDAsuX
	 /bSnmEFr/mlQq5wjDlqa90QvrttZGvQ50Mvqrf8kMwaffGf0DxuOVlxdjOyNnKlNKD
	 QGOtnvAW3Rxpaco+vwJYeSy5+7fv0mzoDv8qV4EmLp78dBHmuXrHXQqdjYGwL9QT1s
	 fE+CiMepGtU0g==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	stable@vger.kernel.org,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] clk: spacemit: k3: add CPU PLL rate tables
Date: Tue, 15 Sep 2026 00:52:44 +0000
Message-ID: <178943352203.3672070.9474321252308932428.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com>
References: <20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com>
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


On Mon, 07 Sep 2026 09:54:36 +0800, Troy Mitchell wrote:
> The K3 CPU PLL rate tables currently describe only one rate per PLL,
> although the hardware supports a wider range.
> 
> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
> support rates from 1.05 to 2 GHz. Populate the tables with every
> supported rate in 50 MHz steps.
> 
> [...]

Applied, thanks!

[1/1] clk: spacemit: k3: add CPU PLL rate tables
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d558af8ee0bb1b2e88e696be84adb93cf2b7be6f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
