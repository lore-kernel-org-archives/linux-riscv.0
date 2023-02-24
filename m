Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA27C678D5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDsTgCtttmg49I+B93yscgx6LY7ztGRECQcFoSga8Co=; b=mVK5tR6yTtgny9
	4gSPHAmIjIsYdqSkCC+uFiDqjh8TcuxBO5Pi6vhNY1ZjpuyrcWkFWePb4W5IKLsyXoH/DH6e9eqOf
	E14yqL+p6OKyxUjW5zE57Joo8BJE5uvtwdsQpY01RKeiZYk75ndS3vh/WuWbOfy2QqS4XVwYj4oIo
	LQczk8a4d1RUp126xOa/sBIVEp0wtY94hwN7Koyjhj3Qx6B/Dusrkp0ovPmU0IOCJpxEfwoqqLQLS
	S5Blpg2gBDwEb7NMSqeC+iucqDTEFIkaZPibujLLcRuBGiNz0VwuNn7GsVhQuiTfg3d4BWDfcedwJ
	A6itjlzkvMvxX8YKv2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaH3-0030dH-MI; Fri, 24 Feb 2023 15:46:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGx-0030aD-3o
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id az36so2112403wmb.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8mSm1K1TPXfzAEsHWNA1iVbQxPviotFqESjhcwbXD4=;
        b=OikGxbxFCpJHKLIP/j1zgCHpWrgVLC002eDKqk+B/ZCZmgug275aX8TodPCRCp29Sz
         hp/WOca6SvgeTxsCGPK9o47YToz8dZ2JJSKqECVOp+BtOl8xzRg7933FSJWCiHNjxZfF
         nWlSs4yRTxA5ciMoPWdw4gkYlAjkYDJJL7MWBoh5UDm2Au2Y0JWq3ELPuLWnUxk6tTPw
         Oo08CjOlepENhvzxsH0231idRUh80Af7oSoEmuYTaEqH3vOjVp12EmG32SPzL55kF68z
         Zt9SHWNbcBricE+mDvN2lQSFzfoPjwuhAPQCHK+JgF1XVURDitUwcZhwMIioxrLcbniC
         pU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8mSm1K1TPXfzAEsHWNA1iVbQxPviotFqESjhcwbXD4=;
        b=p1SN26rZk7TgJV0QCfOiR96PcG6YoKyDcH546ckobECJrD2wi+WgI2u4lTuNRImrI9
         X4BiQdt5GIt2IoDbhAHBMu6cYxiFbHK5M2nnC0bGWtcTmHHgbtE2FaDAty4Zyjw0x+fw
         j9/gHc2TtQIusKSxVF8N8U97LN7OJFRWpq+XMtA1oZVrBLFzsnzxIJhW6DUwzok62iTN
         0odIW6kB4HstkjoI7SX7kQl4+OCJgP3MMVBhYSpJCtttT8LevCng9tRKgpP6pqwVGh7/
         79gXMyKqim+u7/LWZb31982yu0bvVXHRT5v52pTTY7I1umgYqtdOmbnNZm4+BqJz3hlL
         0Cmg==
X-Gm-Message-State: AO0yUKUC/j3Afsou4GA/K4PTuyJn6pZwH4nHqs10Hb9NUczFZEpChrh0
	EnjTuMDtyct187UUKJoVjQDb5Zm/l163ImXf
X-Google-Smtp-Source: AK7set/2F10fpE1Gnav2X0NXTG+NhwIWweza8exgxsVxX7zMf9guB+iasNkg165HJZsYlF6NgjNuEQ==
X-Received: by 2002:a05:600c:4d26:b0:3ea:e4bb:33ef with SMTP id u38-20020a05600c4d2600b003eae4bb33efmr3381951wmp.9.1677253567273;
        Fri, 24 Feb 2023 07:46:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c210900b003e2243cfe15sm3148832wml.39.2023.02.24.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:06 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 3/6] riscv: alternatives: Remove unnecessary define and unused struct
Date: Fri, 24 Feb 2023 16:45:58 +0100
Message-Id: <20230224154601.88163-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074611_182918_854E9C84 
X-CRM114-Status: UNSURE (   9.10  )
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

A define and a struct were introduced with commit 6f4eea90465a
("riscv: Introduce alternative mechanism to apply errata solution"),
which introduced alternatives to RISC-V. The define is used for
an arbitrary string length, specific to sifive errata, so just use
the number directly there instead. The struct has never been used,
so remove it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/errata/sifive/errata.c    | 2 +-
 arch/riscv/include/asm/alternative.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index da55cb247e89..69dfb38e4f06 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -14,7 +14,7 @@
 #include <asm/errata_list.h>
 
 struct errata_info_t {
-	char name[ERRATA_STRING_LENGTH_MAX];
+	char name[32];
 	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
 };
 
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index b8648d4f2ac1..3beef400a971 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -6,8 +6,6 @@
 #ifndef __ASM_ALTERNATIVE_H
 #define __ASM_ALTERNATIVE_H
 
-#define ERRATA_STRING_LENGTH_MAX 32
-
 #include <asm/alternative-macros.h>
 
 #ifndef __ASSEMBLY__
@@ -43,11 +41,6 @@ struct alt_entry {
 	u32 errata_id;		/* The errata id */
 };
 
-struct errata_checkfunc_id {
-	unsigned long vendor_id;
-	bool (*func)(struct alt_entry *alt);
-};
-
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
