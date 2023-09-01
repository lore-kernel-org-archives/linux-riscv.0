Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59340CA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OaCly720OiWRrUKoOICX1sGYbs5MhVGV1symaZRTs6w=; b=uXpcQWE1dhVRhm
	AQsse59ZjPt+64AZemNE8mamb0nNxhlh1cS8D+GJ9zZWSBcv0/stVu9JjmLVoDP0/cVZEwxLWEM3Q
	kkWE29UGhhPV3OUb8d2J3Yd4JxXPKZy82EQkKDfky7HSbRvMzw7mPIAGrgcotpG2JbsH9PIXpbB5i
	aySoc3HWVYTpoBKT1W+NVQ86wu+FRvHxWDuNS+doGDceuldXhgkujeVEE9XduorinFtNos4JlO7pu
	Ve8KI72oTydfxLWCBTg0QkD4DF0uf5OHhvIVQYbavBZdlLoSRtaLqsDz/8VfXgb9YrJaoJCQ+8jny
	KMjg3DQzsxULbnupQcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz4G-00GdYG-0H;
	Fri, 01 Sep 2023 07:59:48 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz4C-00GdVo-3B
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 07:59:46 +0000
X-IronPort-AV: E=Sophos;i="6.02,219,1688396400"; 
   d="scan'208";a="178416714"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 16:59:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3C4541B65DD;
	Fri,  1 Sep 2023 16:59:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Enable 4-bit tx support
Date: Fri,  1 Sep 2023 08:59:29 +0100
Message-Id: <20230901075932.105822-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_005945_141651_CCEBD3C9 
X-CRM114-Status: UNSURE (   7.32  )
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

This patch series aims to enable 4-bit tx support for
RZ/{G2L,G2LC,G2UL,V2L} SMARC EVKs.

v2->v3:
 * Dropped subnodes, as all pins use the same power-source value.
 * Added Rb tag from Geert for patch#2 and patch#3.
v1->v2:
 * Enabled 4-bit tx support.

This patch series dependupon [1]
[1] https://lore.kernel.org/all/20230830145835.296690-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
  arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  1 +
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    |  1 +
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 4 files changed, 44 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
