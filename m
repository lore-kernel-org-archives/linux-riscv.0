Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2613CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 04:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/mF1A8o7BYpN3BAJPWmO12x3aOO2VXj+2P35duYnxU=; b=kiNH0qaj3FCOAR
	Q7twMdYFU1YG5HksKZNc4RM0zajJsiIO599UkE4KPQXu8ihnsdycBnRGrPTikez6lyFiC3ckjV022
	3kcEkKYSApLJ5RoBi+lTcd1j24UpbvCdNmYhxCoI/Y0/tJf55nkprViys378IyOjCNItV7S6PHEkf
	0q8KbnyxQKB8k+kzAeKLbUfTl/eDmMcs9sPvuGt4RE0MAA+LJoWlsjhXo5VjJN4Wcc4XPnxsOaK1L
	4NnxImrLMA+hGx5OQ7K4J0Lx2gaCngyQo9pJTI84cDoW/8rAfYQ2XYJrkoFu01I7F7uYREctycTgb
	mSv5jfhMrzuYgqiEdqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrU-00000000536-271G;
	Tue, 19 May 2026 04:15:20 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrS-0000000050H-0P7e
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 04:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=LHwopLNH6+0n7dTSPaR+y20Y2iaeT0pnt+ZZ6F9ZDBs=; b=A8mZW7ubbr+bLe4+DH0LMbRiqj
	hbsrwqje7gspxP/hUukuZyiD92rLRMo+SEizhBg24YHTGOv/sS6d7jEI7z49nDG15w5ELenpBHhyX
	+NihrYwxfnfko6Rokm4GCKjiFu77hAxMVyiWBgFGklzyjRefdJfcLZs1eKpiFBjT7va349fMg6kCN
	exH9Ye1Oh+pChjLrPROaBGGEya/lDva2xfX6IAanCpQn/0cv1z45pEKR3rNHvZQiU7QHIh58u3+mu
	dF0N3hJuztvioTZltTmN9twZFzReuKFa0uVkWlXWy1JYdlGFPYFZGgN6yiTh8m6rOTjQGxtT06uap
	FjTmaKPA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrI-000000032lx-2eD4;
	Tue, 19 May 2026 06:15:08 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 5/5] riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:39 +0200
Message-ID: <20260519041458.3287843-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211518_139492_231D4693 
X-CRM114-Status: UNSURE (   9.19  )
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

Correct the uboot partition node name to match its actual offset.

Fixes: 2829823956f0 ("riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: new patch

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 0c13b7a401c3f..4e5f5dc69d060 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -412,7 +412,7 @@ env@60000 {
 			opensbi@70000 {
 				reg = <0x70000 0x30000>;
 			};
-			uboot@a00000 {
+			uboot@a0000 {
 				reg = <0xa0000 0x760000>;
 			};
 		};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
