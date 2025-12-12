Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B90CD59D8E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wIVDioafALf6ntCEtDBGhcD8lVpmqIDPnApcPl5P/ag=; b=Ny5J1xt4phjtpy
	YffgGmpelB1nptUxgEjPCebBmNI8ItGp7cEXfdqF5G8w2vGS7E+aK/9YG/Q/C06z/b6sqI5k5Xd5B
	D52u7/oauIR37qEDKSalgLY2WiwUCJNCpDX9jVzRWXdh+bV3C8tK+CNB5RsuoEwGmumbOkaNK++6U
	6UQzNsHMAujc0sUv4HzP9/aYiVrP2sAPNLEuaDZ6/NIm1K5HzlFG3b8lFX2e4H5pURsA6goZp+i5K
	s6cSWf9BuE+sEOGrrHv6bghsshWxwtvHG1IpxNy3nSsCxAbq5oEpbW/XtkMmNJDHT40/0jSHcn9Dv
	eMytUYu21YQ9B1cGFiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAZ5-000000016kr-2iaq;
	Fri, 12 Dec 2025 21:20:39 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAZ2-000000016kG-2eBA
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 21:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1765574405;
	bh=WQDdYwNv2snvRGevd9vz/rtNBkJTH/PSOizUMnJriB8=;
	h=From:To:Cc:Subject:Date:From;
	b=KCWinTeDqTI5SGpmD6CRi0NDayJtht3TxcIEYSUZEbWnPAUeL+NUbR6eHHxAfC2o8
	 5hMAyH+WNrwhyyNiPlNn0rRV7YOiKzz7BfR1JfAuqR+SamZhfhQlfM5kOqcsSVOhid
	 eY5QLN9ARapYNOLNVi3743vAm4A/i6d4pHMC/jU8cBDlhr7iBXd9Do399KK9FVrBsm
	 AvOvIRHvhEb+tDU0lQodK8DGjXd3bGRfSpX4AkTh3qaB9BReJNtoVLj3NNzGaPL3zB
	 z37yOAn5Mqk89yTsCY+Ya3HiaUIaYKda6EZVfUursQOZg/dJ/xZOZncktND4DFWTRs
	 PTMfx60wCqNVA==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C96F0B2213EF;
	Fri, 12 Dec 2025 22:20:03 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 0/3] riscv: dts: starfive: Append starfive,jh7110 compatible to VisionFive 2 Lite
Date: Fri, 12 Dec 2025 13:19:17 -0800
Message-ID: <20251212211934.135602-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_132037_156170_5B098E10 
X-CRM114-Status: UNSURE (   7.26  )
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

Append "starfive,jh7110" compatible to VisionFive 2 Lite and VisionFive 2
Lite eMMC in the least-compatible end of the list.

Appending "starfive,jh7110" reduces the number of compatible strings to
check in the OpenSBI platform driver. JH-7110S SoC on these boards is the same
as JH-7110 SoC however rated for thermal, voltage, and frequency
characteristics for a maximum of 1.25GHz operation.

Link to previous discussion suggesting this change:
https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Changes since v1:
- add "starfive,jh7110" to dt-binding
- revise commit message
- split dts patch to patch-per-fix
- add cover letter

E Shattow (3):
  dt-bindings: riscv: starfive: Append JH-7110 SoC compatible to
    VisionFive 2 Lite board
  riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2
    Lite board
  riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2
    Lite eMMC board

 Documentation/devicetree/bindings/riscv/starfive.yaml           | 1 +
 .../dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts     | 2 +-
 .../boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts     | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 187d0801404f415f22c0b31531982c7ea97fa341
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
