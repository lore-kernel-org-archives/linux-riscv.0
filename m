Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1831EC83F2B
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQKAWFNeUSCxYwGtwps5azmm6BUGvwJblxYZrqtHSE4=; b=AkJnasUMOvQ5w0
	QH3+6CmGWWt2HdRg5sTXP7pUsXWVtAK0I4gJ9pFmdF43t6olKsd3swU4kbVMQANdzt/KIajy7liCh
	rrvPbgbTrwdxqUXpbVxr318+4AOBDt7CNHIpdjH6aaszIufW/9ewgne+4GfN6ykK7vzaQOn9EIORY
	J0l0gzY+rGKQLpaRI4ClVQZ5opxnsEd7BBmRiu4oZuZHVAn75Rj303i34BZ1b4zSlEn8pOPAM8dxX
	oSxEQbfvREUv2RXERbxAlJ6L141FflVS35MhkP6ZKYL7c6S37WhJJJFJC6oMS99NEVoR9mbN9lQst
	V1w9yviz/p4OtUh1UN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbIT-00ElLw-2n;
	Thu, 31 Aug 2023 06:36:53 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbIQ-00ElKQ-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 06:36:52 +0000
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="174568736"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2023 15:36:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F0C4E418875D;
	Thu, 31 Aug 2023 15:36:39 +0900 (JST)
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
Subject: [PATCH v2 0/3] Enable 4-bit tx support
Date: Thu, 31 Aug 2023 07:36:32 +0100
Message-Id: <20230831063635.2816-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_233650_637714_A4283725 
X-CRM114-Status: UNSURE (   6.16  )
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
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 44 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 4 files changed, 50 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
