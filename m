Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDFCC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7D/RDikArNjTWUGzpVqC8bGLllpOQ0+gW2gwllEwvU=; b=s7Iql/ocJSpkRA
	K1GH4E8U6bNHPCgXwCuWm6TDGF5BMLkBq4KrZQKRHUxCd/oV2nwhAb8A3Tk8rNn6GUAe3Og1N80qk
	9KsZ0ECjZ6d+dRAnlPqk9NkXjxcx6+YNTc9T37ooSmK7fL6ZBqa1JgLezjc2Jx50BnPRP+GLuc3h5
	DFs0rEYouUxDiDfcXtiN0dTDN/g4iaSD/jM6chccZuaIF/Pzd9JrG5kUu9qVNg6X7+agqUqW3EFKT
	akSLQxI9roFNrnvMJr5RjjNaFtuhkjc6CIBusTK5RTj7X4kgvVdzF6EnXqDmUYYZjXatiuyhBijzr
	5iVGs3R4kivI/UNZGYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLm-0011ba-Eg; Mon, 28 Nov 2022 10:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLf-0011XF-Uv
	for linux-riscv@bombadil.infradead.org; Mon, 28 Nov 2022 10:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gpZideTmW6RFejxau69NYaH7B1nORCae8pv7Wo7zvSA=; b=QdxIrI7+eyv8b6zkuPzAzrclLl
	4CealskzI8UsTVISF3GnCPUQ1ae5zy/zovUGpI6ZSSXMrmqk2T0Y24PPAxMy10zzOmLDNoVWHvNEv
	jBExuJBUy6ehOBrOyv/0Ou1zksQS8DvfEFNwjaP52necmJAfdtpTN8GQOw90T0RQuofRkrMHVEZMQ
	b8sr8bYyKByDGb2zupM2Rhwb7dUzgh9HMMpMoPY0gLTAGcFt+bjZ/3EsejcrdOaO/5zJc3I+kf+6z
	pLytFhY7nnKtBH0PA3CUv1pPeyms6PfaS6SE17Af2VRZvgM34sT7PSCSJUDNeBCpiX5t+OJ4ur0J8
	LLXC0SeA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLZ-005VXp-DY
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:48 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLV-0004Xi-8y; Mon, 28 Nov 2022 11:26:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 09/13] RISC-V: add rd reg parsing to parse_asm header
Date: Mon, 28 Nov 2022 11:26:28 +0100
Message-Id: <20221128102632.435174-10-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_102646_199969_340AC902 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add a macro to allow parsing of the rd register from an instruction.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 1caed8fe5204..ef4b1c18cbdc 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -60,6 +60,7 @@
 #define RVG_RS1_OPOFF		15
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
+#define RVG_RD_MASK		GENMASK(4, 0)
 
 /* The bit field of immediate value in RVC J instruction */
 #define RVC_J_IMM_SIGN_OPOFF	12
@@ -244,6 +245,10 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
 
+#define RV_EXTRACT_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
