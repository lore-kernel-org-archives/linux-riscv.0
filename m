Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CEC05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qavf+nWbofZyKCVmUuffNoeJbHQq19Z3mtLRhGMWoKo=; b=M6gYw8KRXvYG/w
	ttUU3F4K9PZSIbmUHYvKyF+kD1Uh+u7tvha2dC7ygFhVQ019nHEjMzb8qF4Yt5BgNdUOtC//iiuca
	NP2xgL4T5e3gB5FtNm1qj+u5FFKnCSdKd1LkF9xtpE+UpjO9UG5NP7zxV9uPD5eIHgk4hLL9+0Jq8
	IfVoZd8n04HbczjCYD5TK3IRe4Lb7CKaLuED0yzx1vKXiuV+WtESggG0kG0Qrk5Ee5eYRcxKbucKq
	rXcBLOLmz63e1dVuyYgwiLZlxv1gMfA1cxMkCJkgcuubIFFqy3vA7gLXZNedOstSIA3R/5Pu4XLBs
	ZNP7qGi21NrPuxpWs0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAS4-00A7IP-0c; Mon, 06 Feb 2023 22:59:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAS0-00A7F3-Ov
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 22:59:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPARm-0002Mb-CF; Mon, 06 Feb 2023 23:58:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC 08/12] RISC-V: add vector crypto extension detection
Date: Mon,  6 Feb 2023 23:58:42 +0100
Message-Id: <20230206225846.1381789-9-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206225846.1381789-1-heiko@sntech.de>
References: <20230206225846.1381789-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_145904_833747_04375047 
X-CRM114-Status: GOOD (  10.46  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add detection for some extensions of the vector-crypto specification, namely
- Zvkb: Vector Bit-manipulation used in Cryptography
- Zvkg: Vector GCM/GMAC
- Zvknha and Zvknhb: NIST Algorithm Suite

As their use is very specific and will likely be limited to special places
we expect current code to just pre-encode those instructions, so right now
we don't introduce toolchain requirements.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpu.c        | 4 ++++
 arch/riscv/kernel/cpufeature.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 23427b9ed1e6..ce683dfb849f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -64,6 +64,10 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKG,
+	RISCV_ISA_EXT_ZVKNHA,
+	RISCV_ISA_EXT_ZVKNHB,
 	RISCV_ISA_EXT_ID_MAX
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f9f361285b04..bc615dbbf766 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -190,6 +190,10 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
+	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
+	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
+	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 695dfd732483..4f08b7d97810 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -239,6 +239,10 @@ printk("!!!! isa-string: %s\n\n\n", isa);
 				SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				SET_ISA_EXT_MAP("zvkb", RISCV_ISA_EXT_ZVKB);
+				SET_ISA_EXT_MAP("zvkg", RISCV_ISA_EXT_ZVKG);
+				SET_ISA_EXT_MAP("zvknha", RISCV_ISA_EXT_ZVKNHA);
+				SET_ISA_EXT_MAP("zvknhb", RISCV_ISA_EXT_ZVKNHB);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
