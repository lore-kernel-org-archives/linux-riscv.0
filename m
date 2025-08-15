Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83F3CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6j0eULSQduM3Zj0qevWgO0EMsRfoQV0iZeh+4VLvDg=; b=E9QOkgoWZhA4Mm
	nbyPmVGviTClaMpqjPVQ6/zYs194Fcg+PMcfQewCSLVjLRY/cxGyNeUnixC1tw+GyyxUo/GjNQkT9
	52Ehaeix99gbzMJHJCCP95BwrlC/CvvPE8DBhMPYA9nfz0Iyag9SKG/l5pYxjGbLwaT8vZvHIAE/a
	XPl8ef0JlRwdgtRKiqMErifSSicdQl+CIKe5N6rhPNskI1BBTCL+p0Y4cPzouwQoUgAJnLWn8kTd+
	kdm6GDZKR24KKb3kX1eVBt8KKqZy6JE/+Z+sMQ2iGXmnzxWOAdLSnj7x8C7XyRZJJyZwsOoEOvYk3
	pAIa0wJvsGwb2A+09zAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump58-00000001lla-21Mz;
	Fri, 15 Aug 2025 07:42:34 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump2h-00000001lSx-0uAC
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 07:40:04 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 700BEB4E004D;
	Fri, 15 Aug 2025 09:39:56 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Fri, 15 Aug 2025 00:37:20 -0700
Message-ID: <20250815073739.79241-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_004003_401991_5BF65938 
X-CRM114-Status: UNSURE (   6.14  )
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

Bring in additional downstream U-Boot boot loader changes for StarFive
VisionFive2 board target (and related JH7110 common boards). Create a
basic dt-binding (and not any Linux driver) in support of the
memory-controller dts node used in mainline U-Boot. Also add
bootph-pre-ram hinting to jh7110.dtsi needed at SPL boot phase.

Changes since v1:

- patch 1/3 "add StarFive JH7110 SoC DMC": Rephrase commit message and
  description, drop min/max items and list with description instead, drop
  legacy clock-frequency property.

- patch 2/3 "add memory controller node": Rephrase commit message and
  drop clock-frequency property.

E Shattow (3):
  dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
  riscv: dts: starfive: jh7110: add DMC memory controller
  riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
    loader

 .../starfive,jh7110-dmc.yaml                  | 73 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml


base-commit: cb69daf085b5974fef2df9789f8c1b35e78e7913
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
