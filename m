Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6700C77B61
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2+XhC0hTyaF50WfFADe9a4GoYS5zUphZvPldcyIFfU=; b=i5aMhdzvPr9Gb3
	XqG524XGOEr6zl1TEe7Z5/ltGuD0YxdG07zNZX/avSA1OZXAvG7tqbHQPmeWqirwxwt7LxTiC0x8x
	y7sJpqbny1yti3kEZJ25f4/sqwmx30RmtvcNKRDfO3WSmloxz31985KF9gIyZNsN5GJm7DGmJ8X/b
	f3+UBmZ8vvGxXFYZGjILo7EBIj1kc2EyKKqWJAN4yehzRYXFsNg/ko31s8rEhY2aOokNaII65d3HS
	37OtNvNqUJwNdc3BSyfZ9FsbNSGmfALjaddwtFbO+/NTUhWjcV4Uqa30Ru8ulX912hYZ0uQWMohzw
	SKZ8+3USzugejeQyFwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phWSb-000Xxs-2S;
	Wed, 29 Mar 2023 14:07:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phWSQ-000Xrh-14
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 14:07:29 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1phWSA-0004ZJ-Pd; Wed, 29 Mar 2023 16:07:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 2/4] RISC-V: add Zbkb extension detection
Date: Wed, 29 Mar 2023 16:06:40 +0200
Message-Id: <20230329140642.2186644-3-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
References: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_070722_396805_B706935B 
X-CRM114-Status: GOOD (  10.75  )
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

Add detection for Zbkb extension.

Zbkb is part of the set of scalar cryptography extensions and provides
bitmanip instructions for cryptography, with them being a "subset of the
Zbb extension particularly useful for cryptography".

Zbkb was ratified in january 2022.

Expect code using the extension to pre-encode zbkb instructions, so
don't introduce special toolchain requirements for now.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index c3cdad6b6ec8..90b02d01ded4 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -45,6 +45,7 @@
 #define RISCV_ISA_EXT_SVNAPOT		33
 #define RISCV_ISA_EXT_ZICBOZ		34
 #define RISCV_ISA_EXT_ZBC		35
+#define RISCV_ISA_EXT_ZBKB		36
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4cab0432d7ef..32470119f31c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -190,6 +190,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
+	__RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ddc7cebd810..1c4392421fe9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -233,6 +233,7 @@ printk("!!!! isa-string: %s\n\n\n", isa);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
+				SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
