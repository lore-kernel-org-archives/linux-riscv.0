Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B53C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD6tZTu7mHG4STAf9AXLdzM7otdiqd1tqQkiiy7t09o=; b=aJWEACX9WkTZhT
	RkesszrtrpmbZSHmee8TI7g1hk2E+7zdfs/zEBXKR2CpGCvsG7UlSrJZAeKBhNwdEw92iIDfNLuK9
	0nenrl9cxZUJgYNe0PQyuWokmM6yBFZx+rCRLlFnMmZhdHDBqlPERnM/IAga1t1bIdcEuhrFVfa6A
	0GxLsuAdBq6kVEhVHamTSxodgm5OnpoL8JRPSFLIYq62HHl6sh/iHbk9mAueegsvYIRTxwyfJWnXB
	//2DyeeL9RwEMeKmKNjyb4twaW5szzovs2uB9lTAKj6FidTKp3IOLO2Gyl1HXAgYmXzeRMkImXxjK
	qMlKKHrzfZJy9J/Aj30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrT8-006or6-Ri; Mon, 14 Mar 2022 20:39:06 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrT5-006opL-Ax
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:04 +0000
Received: by mail-qk1-x72c.google.com with SMTP id h196so13838698qke.12
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=J1u1mo5RTmgXNbrfgwFkTpTBTCeG52RUdgQLYIOwlkQUNknzurIy6+GGvvcZXSWiLj
 258uDYkHGO11XTf8680JctynowTt+FLeqeGfy/ic1OP1weDl7Y0vYg+Ztpxl8I9lJoh4
 +6VB2xfNOq2j1lXC+uvSbeNWsEII1X668sYtnPAIIOPfDTItK+mxrg0krcuPqpiI0r2j
 zq81+lWc1U+Jj70SklpzoXnlFdQ9Nj+w/dTSSobJgYtpzmw6pzFB3maNdWQqej5UxR1U
 y9CNXLH6DHZnZelBEg8/HTIjMZSuJpMfwEv7niu2i8l2J+yZNLWqrR2uNUvFFmXToFfT
 a4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=zXjoHF9s9KfC8JzrX3JGoM39vWwc7lQkTpb7aQ388WmSYPK1gnjG/TqqJtevfcktaa
 dQewT9POnl12ZcnkrpH1hha1CqQK5fkUYf8Bi8OigNdrd48p1M1msp4vRg5GFhOw4+zC
 hvoZjCl6LrnD8PXu2hi6dNOOosu8sjeM7bmoolXEVDoEeJPztoCb2j9vOai6I9lG/daC
 +vbxfmpy9Q2EIA9XYqvh1A3Be4E96AG9HAHAgk0bYGFlrxrU6UAbWTUyTzmA+CAluoeQ
 C1RdmLpuuviYOBoXWELoStPkKd7AEW1DusgdZSLtuthMDWzIgCHMwiREa1DEs7wz92ds
 J6GA==
X-Gm-Message-State: AOAM5323mClaQfVaB3Usk5AWSSWZclbPzMa6Zpn3nGLNmCLvLYdum+F7
 Pd0lRNWMH2B9Kf+qRULY9caHIQ==
X-Google-Smtp-Source: ABdhPJxrS2xKMXQ+tv4b7WMBRUbarbEhVo8VEZIHtn5sm7hXQlKPDFFUdcpLOluZu44tq7mq8ulN/w==
X-Received: by 2002:a05:620a:2584:b0:67b:3209:96ec with SMTP id
 x4-20020a05620a258400b0067b320996ecmr15883646qko.755.1647290341311; 
 Mon, 14 Mar 2022 13:39:01 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:39:00 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Anup Patel <anup@brainfault.org>, Heiko Stuebner <heiko@sntech.de>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 1/6] RISC-V: Correctly print supported extensions
Date: Mon, 14 Mar 2022 13:38:40 -0700
Message-Id: <20220314203845.832648-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133903_400643_9F95F911 
X-CRM114-Status: GOOD (  13.45  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This commit replaces BITS_PER_LONG with number of alphabet letters.

Current ISA pretty-printing code expects extension 'a' (bit 0) through
'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
cause an issue in practice), it will be an annoying problem if we start to
use those in the future.

This commit disables printing high bits for now.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..dd3d57eb4eea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -13,6 +13,8 @@
 #include <asm/smp.h>
 #include <asm/switch_to.h>
 
+#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[BITS_PER_LONG + 1];
+	char print_str[NUM_ALPHA_EXTS + 1];
 	size_t i, j, isa_len;
 	static unsigned long isa2hwcap[256] = {0};
 
@@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
