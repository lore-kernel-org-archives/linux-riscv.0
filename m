Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9244C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtOdl8JE6hAjbawCVJ/ji5w0grWYYrTjx2K1FIkmDrs=; b=KG/8gljzdP1j+x
	BLbDtmIqUm/ebiBUTLbvn9ciaAXlQptxA63E191QoqN7WMBD4adPKV3de4pyNzjIl0HWfnjvLi5ap
	Wj9PfS8ZarBOkQGqhdjpKzLKhGqdECijpSUfZn3xdtjLFvp3udGldiudGVqa7ayEv5hsr0xTu1qvL
	YI2fpM5WIFeUNzhUtPLM5ggqg6t2HQ7ADROSd1EyRluafQin69D/W6HGxk/8Bnxj03LJzt5z8v3ZB
	GgKPiA1ZTX4MPBneE5YGpbxe9A3sfeLhwtwnaVvpDfoqoZ28myWysAWJWvrICW7ItHTRMLx6h975A
	8WdPjaHgL3g0EShoX0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5sg-00000008LL3-1Q84;
	Wed, 29 Jul 2026 15:07:38 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5sd-00000008LKL-1ft2
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=3nno4RIjepssL0babb4nLq1//aOFhCPGzoSYoFo6RvQ=; b=YigJJK8klIBdzXr3gct0pCuRdf
	o//2LSjGN4pKSSG/Dc2j89NT9+8vJZXl8Gh2MXkqEW9GlRU53xFidPpkiL+1ZxzVMYdTk8GIGFP71
	wgE7RwUD3qyc3AdCS35e4i2tUcELo080dueJuB8iq19F+kFfl15EL3jqX6eUBAXPza5cmv4vUZGwH
	CgzolIzJlGQv8lu/nXF7jEGc/mZFkqEtrhG5nJkWmipGsZPG+3iGsRCFj2dWiBI7wb+M7tA2RloKR
	cjC4uzbAe7RFBwmdlu4Nv0+sJpJRCcFvpbsoyicnXvv2R/+jewW40zY7D+7VJD+snlhLTUjr79RYp
	7YGDntYQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5sa-00000002eB1-1FM9;
	Wed, 29 Jul 2026 17:07:32 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage for K1 boards
Date: Wed, 29 Jul 2026 17:02:17 +0200
Message-ID: <20260729150722.1598630-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080735_462579_51E3A854 
X-CRM114-Status: UNSURE (   8.32  )
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

The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
buck2 voltage regulators supply the CPU core voltage. They are
configured with a maximum output voltage of 3.45V, while the highest
operating point requires only 1.050V. This means that a kernel bug, OPP
misconfiguration, or privileged userspace could request a voltage above
the safe operating limit, causing possible permanent CPU damage.

This patch series set the maximum regulator voltage to 1.050V instead.
There is one patch per board in order to ease backporting to older
kernel versions.

Aurelien Jarno (6):
  riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
  riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++--
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
