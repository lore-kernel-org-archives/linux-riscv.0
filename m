Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA108C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 00:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w2SHwvIHuX5UlJIxFLZLRKtsy5my0+9y+SekM5mPyg=; b=qN71eC+mhxnU2p
	wYGaef0BC1srgwjR7BxZt1ewwad03g4BJ3mKvL+2T5DOVRKwpH85pmHjozIEcXeeaUbx/W1BQr4js
	GAf8+PuiXMsO/mQsVzVRa8aSf6rPDxs0XyQ828QVG8Zf3f5GQyXFOA0+ubM8I+l5QaWLlMQ4AO0Ox
	UvDlMY1Xotzxs3XNVbaq8HZxj8pbGwoOYmY0s3MSHobDLcut32nOKugL5xfzWmJSR0AAZOysomXH1
	MBlcnQ6Q3HhJqOTJ5bDvuBzfUyC+4tzhY8FRBELw0htRoPOaVaCUg6xtZlnVh1moEWJ+4aMOXeb4N
	/alXOwpISRDEZYoMu76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVb-00BbyB-S9; Tue, 28 Feb 2023 00:06:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVU-00Bbsq-Vi
	for linux-riscv@bombadil.infradead.org; Tue, 28 Feb 2023 00:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aAQsChSORq+o5f3MmEy1eabKGkORP2tFSd8/vnzWRIA=; b=af25nDREvZl+5y90w4yOBmWSYj
	eE1UglizQOjMxUmWUQDRgKZkNhKGAI8j9V9gsLPH9dzN2Fjk/sGazcgsI6y+tHR1zaA42OKsUzhLP
	muKRD8Hr+NBtkfmen78xbV5Oru1JJBk34I9hZV0AoL81XADlDwvGKQnQ18mB7CYT71gYk0jG/CxOW
	/7cWI2jTWVa70i2Trrn/dC7dYIDdzl2GdJPkC+rtzfBAqrdJpvsQDR1sKPFjEyj5DQ7VQLr99Ipaa
	aP6Y9ned0pAFsDpZ67Zl3UCJ8wQw6sQMhejiEQz3nOzX2eGt3kXQRIejyLwj2tqcZqOuSqxdpKKCT
	g5DnVqrA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pWnVL-00ENgO-2S
	for linux-riscv@lists.infradead.org;
	Tue, 28 Feb 2023 00:06:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pWnV9-000552-Qd; Tue, 28 Feb 2023 01:05:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC v2 08/16] RISC-V: add vector crypto extension detection
Date: Tue, 28 Feb 2023 01:05:36 +0100
Message-Id: <20230228000544.2234136-9-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228000544.2234136-1-heiko@sntech.de>
References: <20230228000544.2234136-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_000604_387563_EA650EF8 
X-CRM114-Status: GOOD (  10.45  )
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
- Zvkns: AES-128, AES-256 Single Round Suite
- Zvksed: ShangMi Algorithm Suite
- Zvksh: ShangMi Algorithm Suite

As their use is very specific and will likely be limited to special places
we expect current code to just pre-encode those instructions, so right now
we don't introduce toolchain requirements.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/hwcap.h | 7 +++++++
 arch/riscv/kernel/cpu.c        | 7 +++++++
 arch/riscv/kernel/cpufeature.c | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 23427b9ed1e6..3701032a4df5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -64,6 +64,13 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKG,
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHA,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
 	RISCV_ISA_EXT_ID_MAX
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6f65aac68018..c01e6673a947 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -190,6 +190,13 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
 	__RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
+	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
+	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
+	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
+	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
+	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
+	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
+	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8f5434993128..4971008fa1fa 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -238,6 +238,13 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				SET_ISA_EXT_MAP("zvkb", RISCV_ISA_EXT_ZVKB);
+				SET_ISA_EXT_MAP("zvkg", RISCV_ISA_EXT_ZVKG);
+				SET_ISA_EXT_MAP("zvkned", RISCV_ISA_EXT_ZVKNED);
+				SET_ISA_EXT_MAP("zvknha", RISCV_ISA_EXT_ZVKNHA);
+				SET_ISA_EXT_MAP("zvknhb", RISCV_ISA_EXT_ZVKNHB);
+				SET_ISA_EXT_MAP("zvksed", RISCV_ISA_EXT_ZVKSED);
+				SET_ISA_EXT_MAP("zvksh", RISCV_ISA_EXT_ZVKSH);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
