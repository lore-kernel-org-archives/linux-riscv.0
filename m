Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07FEC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAWKVcyRQzXuoXBeXLlEth9AiFLzMYdMwd6JbJkYM4A=; b=g073Xvm2JBJPkR
	N0xQ55kJqmrXQrCSApEwKpejJsvbPFfp5I+6ObwYbQgxgaHb6wW/zQNkRGCCrzGVgaLq9x/vulYb6
	nGyTpeql0p7+E1ipRH1NGrgLTkh43XYjTDYTMK2PbvtNftns+gvrIMO3bwlYtBbe8FZj65iYEQVZW
	8Tyn2Yg1O2Fo4s5tCxSMHHFJxfnkfjO6MfpUitBy3DxeiOAgLwATe2+36QYAIq/7R72vLW5LRYUPR
	KjREV4MIJWbtBNDL3h+Uf07DgqLQ3kT8o4SbHR1RWFHBCHU8xmw8Zmp2CEnmfid3yl1yiO04/cheR
	mwjwBCDOn/XJNOjF8aZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4m-00000009i0s-0c8W;
	Mon, 12 May 2025 14:24:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETW6-00000009bzp-03ni
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 13:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31FF4A4D497;
	Mon, 12 May 2025 13:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828E2C4CEE7;
	Mon, 12 May 2025 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057704;
	bh=DNYSN+ylh/jXEnA3iZxmH6KlXH1W+/6ULPk8mmvd8G4=;
	h=From:To:Cc:Subject:Date:From;
	b=GHkm0veZOZ/FoxV80eSVOD4Kew8bfqr5GdmoxS/810uPy9ujlUa8EGENgrmkaMOL1
	 kZzz69xN6IV7bnNhH5PuZAtG1D153oaqfEw19buthRaEpsb/r8Wxx3CeM2YVjUy9VV
	 uFwHVjt5Q0BpZz0NLVTjpw+Oaihzm3q918W9QTMQpFj1ceBtx/x7SbTouvpR8Zetn3
	 TMSwMJHoKajnAm6aP2XI5b+IQ4cADJyyiNsQYnKYX/8KT6os5fTk2tLyxn+AtBAo0H
	 8qNEySIyqllucoYVfnVkgZ2GyfYS9SbFpxJWeBi5mLM1m+DntkzNEAGZ5WRhq/7s5O
	 Teq/kSXUPCSng==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] Add specific RZ/Five cache compatible
Date: Mon, 12 May 2025 14:48:13 +0100
Message-ID: <20250512-daily-saga-36a3a017dd42@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OdJgFJtV7rKCQc1yIMfDPlfVFN9LSEtX5xUnvHIIr74=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2T+mLgdDxV+fTzLfIZ75BsxlgCDvnsH/LaxnP3Re q+Xeee3jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykVYiRYb+CoFo/yyb3l5sk qrWuPV91Ou1CYmUXxwHnnONmNy2SAhkZvjL768y5e4Dnz7b7LFPfCE7yOxez5WrjGgmGJZv1f/k 95AcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_064826_117496_A7183904 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

v2: add "-ax45mp" to compatible string.

CC: Ben Zong-You Xie <ben717@andestech.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)

Conor Dooley (2):
  dt-bindings: cache: add specific RZ/Five compatible to ax45mp
  riscv: dts: renesas: add specific RZ/Five cache compatible

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml     | 4 +++-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi                   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
