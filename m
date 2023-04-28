Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A64C7EE21
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WX8uGZTmqXtDyoVRC5ZF5uhBL4DGFfcvSdzXXbkIeMA=; b=0/j8vp8QZDjtuw
	N9wyvTTugGefDjick5rn9GllHi5oA9ZyaAY+rkoGXtlb9fywN0mnYOYcNanNMtYlpYbRbItYO05mL
	Hw24lG7gIbCtDwEh9lse68F9jAYe/0mqCjDx05gjv8tS1dcpGyE5HlmZNAJJTFiYSOhQR2PEdt/Tl
	AnNX1I9g2r9GtKEGYFJ/SonqmQhd6YTRzeNoHAcoKqby64+/fooR0SbmeL1P/7U3Qx/Z609cab2ha
	0GJYRau84lLcBen531Khw1AJSIL+dwpCT3FV6MdAHE2T9yzYleJMgH0/0/x/ZPlV/VfCdjqksaie7
	+uNB08c1uJycGX/8Gkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQH-00Bb9I-26;
	Fri, 28 Apr 2023 19:06:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQD-00Bb7h-2d
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 19:06:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a6715ee82fso3316055ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682708780; x=1685300780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sje7w9+fB+EH+MGgG1/UMH/D2qIYNdlPqE6SA4WS6wE=;
        b=pVZ8HJMgQ3+xH35RV27J8SoRUhfsr98Jkc7MmLi6Bgcfx+F6nTPr35spG+gI0r8vME
         7n5sAbd8B17cb2joGxEXMQOU/5+4UGqAgpsR5DH/ha+9kFGodY7MhwFoZ7LdIPC3YwCk
         MaFcWYCrH21MaVVGd1CQmwInR0iQSeQPuAfEkilVt+X/bRn2BuRvpPsbxY5vFfgxxN6L
         xkAEpscd1A4oH/sLbHch/BYMh9e8vc00OA8w4kRnQ0h8k/t6kufFuf4gsX7SkEF8srUp
         TL4c3hfx0Qw+k/rGR5dKZ+uAB9J12TaSu9C7daravYg/Ddo2LLF1AsdL+BPSRWCNrCM6
         g/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682708780; x=1685300780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sje7w9+fB+EH+MGgG1/UMH/D2qIYNdlPqE6SA4WS6wE=;
        b=eta+QG++D1OsWC2Iqbo3+5ZBRLc8qvu7pufLb0NbcJWuP399me+EcSMwbFA5/UGw7j
         qxEWQoWddCnen/NAJiWA8yjfNapVOJXcC6nrtK3hDBL0vdzvptzytY/4LvJv5iYmbACC
         FXq2fCIDrrEbqlgCjQvcOpuaK2TKaBQ5It/Db/tw7rRIO1qG4NVJW35JVJwifaT9BXOP
         7Z+QfTAnmszps3Ij/hvGWIniC/SpzSh02pHbC+mDAOPbxv60WBNO8jetfkmWZK5fvch8
         j4swZZkwFfRyGZVlEFEg5THf6wzagfp4WQpI0NHMUxQo10ovh4v+5tw/65EitGYd4WE9
         410g==
X-Gm-Message-State: AC+VfDw5D0gZdievwrvckHEVbo3XcIk83RDKoe4oYX0Yub6SVYPDAVoo
	eMscAmkihLOKwF8yD1wJ2k1n2A==
X-Google-Smtp-Source: ACHHUZ7QWo75WIrdyvyPauWX13WT4/nosdMHz5KIWESIS91E35ZRIbR5lIwAnVKK/fFCxGXw2g3xmQ==
X-Received: by 2002:a17:902:7208:b0:1a5:1b94:e63d with SMTP id ba8-20020a170902720800b001a51b94e63dmr5691012plb.65.1682708780417;
        Fri, 28 Apr 2023 12:06:20 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm13580733ply.269.2023.04.28.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:06:20 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 1/3] RISC-V: Add Zba extension probing
Date: Fri, 28 Apr 2023 12:06:06 -0700
Message-Id: <20230428190609.3239486-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428190609.3239486-1-evan@rivosinc.com>
References: <20230428190609.3239486-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_120621_853698_8BC87767 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the Zba address bit manipulation extension into those the kernel is
aware of and maintains in its riscv_isa bitmap.

Signed-off-by: Evan Green <evan@rivosinc.com>
---

 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 9af793970855..fa36db9281ab 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -44,6 +44,7 @@
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
 #define RISCV_ISA_EXT_SVNAPOT		33
 #define RISCV_ISA_EXT_ZICBOZ		34
+#define RISCV_ISA_EXT_ZBA		35
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3df38052dcbd..2f85b1656557 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -184,6 +184,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 52585e088873..1a80474e308e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -233,6 +233,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
