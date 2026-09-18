Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0282C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPR5OJbsBVmmVllaeCEOz2i4r8ygX1DrBnPkQEi5qiE=; b=Apryc2FlI0Vd+x
	QuIdNtsgHU4NyjwJ5R7bSm9Caek/TTeZm73tYk9f+/NeVOXMaJwF2sf0svnvm8hIggCT5Zftzpn35
	5AMBYSgFSaH7knQ1RUgHMVhKNxOYBUV6U2nhnWJaMBS9Q02s1ixzsxx+mcMyTO6Q0vZxmWTjddhxQ
	L6m7CpB2ra/RYD8KBuu3RSzZ320W9lLVhlTzp/tENlpLbc8nYQ5BPeBSoP/FO/QzzU8FnDGRauzKn
	Epe+DtAImpnTnOmhF9qmSyfR8bO8uSQbP7vliCDttOT9E+rBnu/E+hVQWlF9EdTzdmXrZPNkPh9rE
	Ddu9mxZJ5gZtfF/rqGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iAi-0000000FhpW-3fyH;
	Fri, 18 Sep 2026 23:39:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iAh-0000000FhpO-2L9Z
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 914646053B;
	Fri, 18 Sep 2026 23:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DED41F000FF;
	Fri, 18 Sep 2026 23:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774750;
	bh=Gzczy9Oh/Ctdwjy86C+yXfHBllDVWWkUhPIAU447dO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nJZwv+BFbzCoE1zegouQhnbxI2cUDm7aLsjAusRLPTrOEv07wWyCwiQrOc8n3Thq5
	 SqLUTStwImmtB37FjJVuFpZ3epW2hgwiBjkotEXBrm1Ie5pGHH5NSIvcF9LmJ9LbNj
	 yNJsGvoIvzc3KNY4MuPWybXnXusR/w51+6NIQT0oAyvEW+HHR1GjOPfh+VrFWR1Kb2
	 cvO9hIPy7OvUL9vLggPEsDhiyddaCYL+uqT+esi4pP27zNdxzmTIeDFsLo2h593xSz
	 vNLp/ywP2+F2nX968ilS32gS3haupyRRzPw/xawEwqCaq/5+SW9Ynw4kInIhvvge4w
	 AqH5Ch2G6DpfA==
From: Yixun Lan <dlan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Date: Fri, 18 Sep 2026 23:39:02 +0000
Message-ID: <178977466389.1115729.2520600398672212403.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
References: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
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


On Tue, 15 Sep 2026 11:23:16 +0800, Troy Mitchell wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c37ee906b45bc06782fa1b69f3a53bace67ace66

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
