Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB38C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=16Aa7eglzjWFMQG4vcJq4O1OACiGGzFnffTh6q/VvNU=; b=hdcrP/Fe7ef4/i
	0DEue428hBCAvXPnjOxrg9wfkqlY1Ymk7+2OE1hV5xuigagrmr8VT8/e+RTmUZwLRwHDfmxd6MZbX
	f90mHpCuWoq3yt9nGUxWbHVxzUhLBYMpFqTNX2Wn4wHedpxYF2wZ9Mgtp1lyN83IeAqZWJPLvFzaO
	zpRVFTW3HGVS0kv/1jpAIc5M0fGCgIV+em9xTYnwcZ54b5tdydst51C7GlTd2bm1AUsS3HgAHCx4T
	ny2M0BF7asYuTFM/U3vJL6/P+P8OM/ubNjOn0rmgttBO5WcvNVwZpMi8SqLGuAsNoGR0tG3ruecBF
	0ONbykTXLiAfjVPU6eEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdO-003cWW-1Q;
	Wed, 26 Apr 2023 10:44:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdJ-003cQk-3D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 10:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682505861; x=1714041861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rASUDUjAMobSHY+COftalHdmixChbCCB8oDf4dP/C0E=;
  b=M3b0IzvLutf3lslG8xRpAPFhUmre/dOIlcI/6cFZisbqGc5OkWftIszg
   qU07YuR5GpfJ5CspQojRvY9QuBzBoANrPFpXL5BuQUOo+21H9A4aG8Jjm
   N5wAK0HiZXGW1EdVXnXt8uRnAW2yawnyw+RVYVA/SuogS5HjXasj5nY5/
   gesA5ZyU4Y75vQqec/yfVLHuQCB1u2/tdzJWa8LXibCxzWC4n5k48EpyT
   wKKPOuzrJ99vGJcbU6ppyrkv9WuiIbCNP58JHmQSAS76YjYqduHz5xp6y
   rMS7PcleKyH7swTwVpn2welXm0RzPwa2k4kHb4mFs1MuIHnzRR8LTtPPe
   w==;
X-IronPort-AV: E=Sophos;i="5.99,227,1677567600"; 
   d="scan'208";a="212354507"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Apr 2023 03:44:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Apr 2023 03:44:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Apr 2023 03:44:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin
	<soha@lohu.info>, Hongren Zheng <i@zenithal.me>, Yangyu Chen
	<cyy@cyyself.name>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 0/2] Handle multi-letter extensions starting with caps in riscv,isa
Date: Wed, 26 Apr 2023 11:43:23 +0100
Message-ID: <20230426-satin-avenging-086d4e79a8dd@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rASUDUjAMobSHY+COftalHdmixChbCCB8oDf4dP/C0E=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmeDJ7bVm6b18rGoHN4SY74xpTnmy3/PuNjiZpenZYlGCLC /PBqRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTAG6yGiPDa56oc9+OxpwNOviC1fX8nQ 1Ljt++GR2W7qz5PGPV8SRtZYZ/yjXF3XMX7K+dU51x+YGvuUzoxJnp68ssZF6Hys2341rLAgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034422_309908_0FABB61C 
X-CRM114-Status: UNSURE (   7.83  )
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

Hey,

Following on from [1] in which Yangyu reported kernel panics for a
riscv,isa string containing "rv64ima_Zifencei", as the parser got
confused by the capital letter, here's a small change to the parser to
handle invalid extensions starting with capital & the removal of some
inaccurate wording from the dt-binding.

Cheers,
Conor.

1 - https://lore.kernel.org/all/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Wende Tan <twd2.me@gmail.com>
CC: Soha Jin <soha@lohu.info>
CC: Hongren Zheng <i@zenithal.me>
CC: Yangyu Chen <cyy@cyyself.name>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (2):
  RISC-V: skip parsing multi-letter extensions starting with caps
  dt-bindings: riscv: drop invalid comment about riscv,isa lower-case
    reasoning

 .../devicetree/bindings/riscv/cpus.yaml         |  2 +-
 arch/riscv/kernel/cpufeature.c                  | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
