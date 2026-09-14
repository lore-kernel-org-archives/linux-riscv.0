Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D05C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHHp9q4uUR6MGbRUMQfnkW7epNuMyT1orxg+sy+ihqk=; b=bkwEhlOdN/2odm
	3OKS5Pds4J2C7IB0TwCdlkhDWUpinlUgW/E/x3+dV4JlRVaZMGB2gHXjqx+UhOfmyt/k9R0XAFR9Y
	72EruH+qSatuWHpahzBPHmOBWizgbpGyGZKuvQC8pUtgJYflGGva0B3UwO896JLgWlyXyjr9NP/gA
	APNtrIkGnwwkuAcmKRgVaq353L2VAuCQRsDjF/XM5s+7igJHEPpRQqPhLUqZ3r0tJs43eZpHAGnwh
	ycbzCciXWFEUMXCIv4RG/1V9+HCMJU9NArvnkAnDGSm28WO0fAe2ZIAdiDDdwp9aHqAI+i5HyktbY
	MWDSYWIP8edGWJ/mhpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AP-00000003smh-1EDj;
	Mon, 14 Sep 2026 13:56:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67AG-00000003sfp-20Dg
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 978636020C;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4533BC2BD05;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394167;
	bh=NpwJIzzpHmKVMpGC8mQxI88Y9BcNMyyRRDBxtKSmyTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UrE7F281X8zYPQ4AGzp0JkRCCEWh7E6YyJ4NgebLTtQAFIzfw27Wl15fbsUy0YM0x
	 VvjPzjbKDte0TAU27tqqq+g9nMt6r3Fu+Ax15PfOmtIXElRL4m6slxGDQDVyVj6XGy
	 B9Arfh0FDA9OuD4KkXwnR/ecjBsV+IcVuvzJqkqG8aQYBK9IdaljGwJyfRMwAWLeQA
	 pvEJeyUnKQ1uBv2CE7pE1twj5qe6rqDv/SLvIvGYhYfJD8CxmzbTNnoRl2In/luHSI
	 dgMoxcnTyQR8jr45AlJ2mIUDSY1h5gzGlPyxsHGhWmPaA6VFK45ifqe00CZzRcBfbo
	 PGo0u2To39+2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF63C88E78;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:57 +0200
Subject: [PATCH 9/9] riscv: defconfig: Enable GF SoCs
MIME-Version: 1.0
Message-Id: <20260914-p8700-dts-v1-9-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=643;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ckrLYxO/o55vtvQsoEYaC2ibzDfEj23B4ST0fzSv/OU=;
 b=6kklmDzo+zlV9/ocsf66KcL0PYcAytiTWmKOWykSPgWKwfy0umiG7jFG5AguVWOHwTewK8bLv
 VsnxyKh0KoBCTqTm0/kx/44MMpXtIYVOGx1dMpOmQSIAVS4sNqYnn1R
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Build the MIPS P8700 Boston dtb by default.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..eeac96a0ec878a2d0aa0887d7a7ce71207774a23 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -25,6 +25,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
+CONFIG_ARCH_GF=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
