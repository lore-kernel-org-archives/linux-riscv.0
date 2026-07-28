Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC298C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maWblVofLSvdYtO//7317FIeGtDq8ok84daL4uXThig=; b=Ii/DESoXz42y4t
	rzP/LT+AStqKnSTYalr34zQZ7OHZgN3tun+BhGNAXXWbb/vgOz7fpAZit7Dex64cKkJlaJbmT4Zvy
	Noj2tS2PCNuJE4KkJo3VTbPM3OvsWEuj/JoJFjdLLDFpcdfbIVpnYOlKWubSNCGFAuXSBm5MclNXc
	e0xdSJYAJS22MDNuT02BV7YvV5K3zCmXOUiiTqVnsKWpKB5aB4+TQez+zmxXjf1LseV0DhkUjxnOd
	tE/hR08M27z6WZ1YXwLglQvUnJNTsjy9g4/UVu1DIGV6sLB5Tp8ss/b5PuQvlJsThkTwH+CK0wJLh
	tNTOnzjAZqIzUEMzQO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog5m-000000055gY-1AeI;
	Tue, 28 Jul 2026 11:35:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog5k-000000055gI-2rnk
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:35:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51A5B60AA2;
	Tue, 28 Jul 2026 11:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C258D1F000E9;
	Tue, 28 Jul 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238522;
	bh=axEZ2Aob5cBDcWuDLyKoSqcIBQS9SM5ZIXUN2NCp+T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IexCSttaoO1o+rsGRngGTaMZY9Irv02It4M3XzJdclIu5U/CKjtK2RjlW5yIRVZj1
	 N+N86u/mqZ0OovdYbsuvCkn5pmcqcPT5vhkTJ8Jcmo+ZOW1NDJAbbASqGRgX2DZqwO
	 aeysS/iHKo03xgQyfhzJwz60vAOFFwWIdCbcO1K5RMn+BFutgrplCAq2iCYqIaJHgK
	 TPzIcNFq1PH6Um2D2r7C4M8c+7IE75Vo3Yjd/jhCr0LegTha2ms71y5GHyDCEK0ib5
	 KCun6JpMMakJZCM40SoMz/YWPn/quZUWUx9iSHy2X4cDquU0eOTjGN8yb+DUHEqiL7
	 ZPm1knJ6XrXUQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
Date: Tue, 28 Jul 2026 11:35:15 +0000
Message-ID: <178523844266.623919.7131430665750899115.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
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


On Fri, 10 Jul 2026 14:33:12 +0800, Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.

Applied, thanks!

[1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a225e19a4cc4e040ca0389cf0bbe209c23f5c92d
[2/2] riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=12b0d602e8642297ec369eeb99366d37c8a3a120

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
