Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8367C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=df9oYsHb2Bz61+LvgIkn+XvAVNv25QwH7aaVo1vJZwA=; b=VjTsL4yFhUlrnC
	plXKimANfpxmiCyPS48QomSflJp3NeYnAVTNqryfHbRPsP0wcSFEog+FrtgTSQ8MiX6uycBPyjByK
	KVYo8gc30gN6lbCY8diEpsuUihRRrHBAbEoSZrEXbx9nENX6FQLqJYTeBDZnFmYzfRxDMrmBk4kKB
	Qol6vihKoWqARvUk6Rhbeptp+9D0iT6kbiLd9vzY2HUDu5vtLV2uA5uI0h/8IyVN4I+9h5SuQrL1E
	BpSetmMvzrGmysRml/S9yHPy5Q90/OGcZsgGVLBl5oKn8QKm4tYv5jGmJTLDllK04oNKE2gGjrpqJ
	6/8Ybg22Etin3nXF7/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ZGb-009U1J-2p;
	Fri, 10 Nov 2023 21:42:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ZGU-009U0b-35
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 21:42:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc58219376so22598215ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 13:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699652521; x=1700257321; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=e7ngW1LCsowvE5Rv4ISLN9pQON0Gdkso3VUKWqRYMi8=;
        b=BK0vJdjmcLEUofWiw7LHwG/ikR6bQ/WlJPNSETgtS1/XzDXpIX/niJBbTrjQD9cXOO
         8GGRujwCzbgXSO7Is3dzNH/U8j6LXR/D08A5t4xpQS51CFIacLVmZgpJvMvOtH4AMEix
         uNOJC/ZJyvb57ztUcsOnWGgBxn5nIPYqZVExK5vt/RyPKbPXvJ6VsHHCo8DtlXf5/+DW
         9eeSjCG4gGL6Br4l3VWU4J9aS7yPGx19oaC7sgF/x/palfe9+Ub7eCzUpGnGcZeZ3d4Z
         RP2uk/K3gYiHxteM5Mm4yhHqA/SXsYEl9gkP3OibJDBG6tyvw8xQmouhyZQK18Pf0U9v
         bz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699652521; x=1700257321;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7ngW1LCsowvE5Rv4ISLN9pQON0Gdkso3VUKWqRYMi8=;
        b=q/W+dvTfi3ySWw2gV53d2h6Z6H6Rw7j1UcOSsEt1K4gD1hvoMrV2QuegbSI5ElVVQk
         1qpDvhJKiIN70yb9kgO6IFax5X7bYhoCjM7N3j4WOIGxek9r5JRILez+oJyJu6+hHoBz
         e7x/ZuZsvCJQTnxd/lVZkp9+H7eeJiGUz7N1MP2mH/CC29EsWh01ooUIpGzEZKdJdRXt
         hl38iNjiq1GP84OR8sAx1lr+LYrXazKS6thwWefep48fUmUDX3+xzs1qP/j25n8HYWq0
         boiXLqPLuCks6UlcfYTakjYu/JetOvPZ6W2Dw7W+fivwIiMICA3rKmsyRh/uiSDsJHli
         Osfw==
X-Gm-Message-State: AOJu0YxT2j5KCLs6bO/E9jt1S7gmiCu+QjkZi0x0zOaj0dWFsCGG4NcA
	D8/qNXF3Ay/jKtDLg0pp4rWDAsJ7k6IoH1WN8zQ=
X-Google-Smtp-Source: AGHT+IF8MG8BiNXFCNKCdqPYdVGlMaMvaFvnL2dUjSE2YEsRSxASqqj91G912Jg5PpGZdpAhYWn4HA==
X-Received: by 2002:a17:902:d70c:b0:1cc:5549:aabb with SMTP id w12-20020a170902d70c00b001cc5549aabbmr617128ply.30.1699652520512;
        Fri, 10 Nov 2023 13:42:00 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id n23-20020a170902969700b001c74718f2f3sm103666plp.119.2023.11.10.13.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 13:42:00 -0800 (PST)
Subject: [PATCH] RISC-V: Remove the removed single-letter extensions
Date: Fri, 10 Nov 2023 09:59:03 -0800
Message-ID: <20231110175903.2631-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_134211_353393_A5D23F86 
X-CRM114-Status: UNSURE (   8.78  )
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

There were a few single-letter extensions that we had references to
floating around in the kernel, but that never ended up as actual ISA
specs and have mostly been replaced by multi-letter extensions.  This
removes the references to those extensions.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 6 ------
 arch/riscv/kernel/cpufeature.c | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index fe6656af967a..d0a5804c7d78 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -14,19 +14,13 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
-#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
 #define RISCV_ISA_EXT_h		('h' - 'a')
 #define RISCV_ISA_EXT_i		('i' - 'a')
-#define RISCV_ISA_EXT_j		('j' - 'a')
-#define RISCV_ISA_EXT_k		('k' - 'a')
 #define RISCV_ISA_EXT_m		('m' - 'a')
-#define RISCV_ISA_EXT_p		('p' - 'a')
 #define RISCV_ISA_EXT_q		('q' - 'a')
-#define RISCV_ISA_EXT_s		('s' - 'a')
-#define RISCV_ISA_EXT_u		('u' - 'a')
 #define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7aeba01dcfd4..bb0d1f242f24 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -158,10 +158,6 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
-	__RISCV_ISA_EXT_DATA(b, RISCV_ISA_EXT_b),
-	__RISCV_ISA_EXT_DATA(k, RISCV_ISA_EXT_k),
-	__RISCV_ISA_EXT_DATA(j, RISCV_ISA_EXT_j),
-	__RISCV_ISA_EXT_DATA(p, RISCV_ISA_EXT_p),
 	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-- 
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
