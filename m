Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D3BC55172
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2cg4mqHMuHHKOPCOt5dkZreP4J+LotJOrdTlIgeSJM=; b=EMmtcrvZNCHSwU
	GC4fgHZ+sM5ElI5RKg6xo+jRDCUZYAIaW1MgjoC/qOIe+kwBC/AAFzpjvenF4oexXU3amIBbpFINc
	AZgwTGErpeT1FCIDbyu7V5jZDRrvBr6c9hHbmnrpTcm7Lu+LHjy8xvlTFVtOKDlI27OUsftoBLnDr
	DP3GlbhtxY0CrnWnvD8gPxr2MMot3WgFyvCVmw8P7rNuVoUD8wDJQFKQZNAndK6bMBhIemKDEkgUX
	lLZm6je9INgixlEyWfw+bfOkrHJJ5E15P5vibPA/L1Xit5Orf4qg3xv82GYVb1c1LZyUWZw3CMOcO
	j3QHHAfyVv3ZRXsznIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLoH-0000000FHXT-3WMC;
	Sun, 02 Aug 2026 02:20:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLoG-0000000FHXM-3wvc
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 639E56057A;
	Sun,  2 Aug 2026 02:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F413E1F00AC4;
	Sun,  2 Aug 2026 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637216;
	bh=Cv7kkTCkfbuNG2QrTaqkBnU6gtn4xOxKbQAsPbHIbXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aSr+r+qLvRf8sxi/tqA8YUNfbvdXGiOfcNW44AZsITdHAIqN1ck3tHKUJwjUyHJNG
	 J9CVefIYx4ysq3/0gs0LGNDqVgCV3ykqkajinz4nBw39adWlo4Ukkv8JV2Mp/wv853
	 KxA91NBABBVVv7Sf8bG9/2vhrjra1MIZmNsICS9ieo7gRJxTPaJwg+sBgLJXqbetRO
	 gGI09e+UdWML0M8ixT6UXKugiXYPzse91/cg2CqxeCqgfs6KpRy20ULKVe3oK9s5rN
	 15o2LmUoF2hVzsaqK0bVvqOLhwph8xSP9Eud1UzB5Lkc7aLSMBxBqCy1D4M2KPhrEQ
	 DTCpJB6+7fJWQ==
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
Subject: Re: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage for K1 boards
Date: Sun,  2 Aug 2026 02:20:11 +0000
Message-ID: <178563718457.1616805.12139797953072589045.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
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


On Wed, 29 Jul 2026 17:02:17 +0200, Aurelien Jarno wrote:
> The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
> buck2 voltage regulators supply the CPU core voltage. They are
> configured with a maximum output voltage of 3.45V, while the highest
> operating point requires only 1.050V. This means that a kernel bug, OPP
> misconfiguration, or privileged userspace could request a voltage above
> the safe operating limit, causing possible permanent CPU damage.
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b496282ee4ad07311a13489e15b74fb7078d9a01
[2/6] riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=56a77ddae794ca0516fc146f6e59bb8cdf4fd9d2
[3/6] riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ae0c38f0a24f95c8759b6b0eaaa5a0d36a7c6af2
[4/6] riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=f045253a03589b2616332560b4120e584342a987
[5/6] riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d66267c35032c46c18b675601d03c80239bcd913
[6/6] riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a65e9b73b0f0f33078b63f039b3ff64af051a11f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
