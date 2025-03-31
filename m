Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD330C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eyc1oBuyUW70MECrNU07j7dU0aRNnc54P2WT3b1nxzM=; b=kBDV2GI9D4mGFm
	WESd0q8aFFEDbKeIbZLX/QhRSnFpJXj1B51xdS5gN0RQOagM7fk4oN9ivg3rMzDloAYbHBXbUPXzv
	nRN52oqxnOPFSA+wIlfY810rVN2VAN8HT069MitO6KoQ9r2gWADdFBh4PANU3cZUIcowSNNxhUOFI
	CXHyFOoysoQWAo1LqlInZfLr5PWjcs2XICnuXkflLxgLpCapadvzHkh1WsQYexmW+N73/FDp0HM71
	+tX0WfEWKTCMarw99nC6kMG27o159WQEDKULA07qu0cU50PmrOV4DpY747JLBSutLig36TXS77D/a
	yKgQlBVDMR8QJv+Uhw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzK8r-00000001977-1l7U;
	Mon, 31 Mar 2025 18:45:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzK8n-0000000196n-3snq
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 18:45:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2279915e06eso97240185ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743446745; x=1744051545; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHrYmzqXypANsCU2if7f8K10Wh3Cm6dEuo897D8CcJo=;
        b=WV9VOfBYq7s6a/konm05E5Z4ZXZHUj5nrfMfJGUrPy2lqJmk9eLnQIl6+M4sk9F3qf
         fxR4ikVWeUbBuzxxrf0s2t/xXuqWUbewxtl115cL1mXFjmTva2N9mwzpSrxeuuJiWrlu
         Jge/DBJ0arVv/lNiqD8FGpOjU30VjT8FE4FIAKpU6oPkxxTc2/qvvin/JJNpYi9rr8Gy
         t6y9qOiYhxH2NF7gJCw9O1dHT3PkBdArrhudF3Mmuh7rQucZ6VG4ELLwX3gMK35/R3rY
         CLGXUEsCIRuWQ45ZzNOCdhC5QcY12AlAgcXTfF5rssqfpj8grFKjGdOLfRHnyJp2ce9r
         kYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743446745; x=1744051545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHrYmzqXypANsCU2if7f8K10Wh3Cm6dEuo897D8CcJo=;
        b=nlMP0rDzu+g3N1JdyzyB5Ej+CWg3fa4LKRbzOn3UB84AlbRoU/jX4u/vX+lQ38JWF2
         10hjl/8ZrPkO4avhPNjkSDqiIfA9E+najrqXIX2mnph2pJXI2TdF/MVVV0nlj+bRI74T
         auyrQInJBNRv2mCqtzvl5qi3KK43VI8LWIK7DmkGxGFcnNtiqPkoLNw2Ow1pqEerXHOG
         NSmaMhsauNoXvDAbXTlIRP5iYb3XKi5BjhPBP1AoBI9quKIz1wsT+tv1MH7Cny2iETQ8
         Y3CnDXFtOO14JgmL6WKKuyJJKVfwA4J3S/r+Imy6a4tYSJDok2fFF8GZJ4Y9+1ltGjmG
         feXQ==
X-Gm-Message-State: AOJu0Yw0a9HtQXPyCKR+QcyTUknT/w38G7RLC1aSK2qJJI3HKrh3NF7e
	+PMtpw3x0Xa2UlafPYJJdE11JoJhAqaohd/t6FUQ2zdo5URZJPv9krDNjvtzxdo=
X-Gm-Gg: ASbGncubKxXx4I7NGEui12G8emDLgneLIQUD+Vamalf5uUaEg681KIQ9Br96la9EQXr
	3EhSndo5Hxa6LPFtq3tTtoe6DgCY7OOhk+oWwCCw5ZBkeUQZPbW4tE+RXEeXet/EXhg4/MTBgQt
	0M5Lhp/lk2bfhY1a23eGnlQ5nIVw79TvTqBmE5dKghRXGIpRCDG1LoMhSIWSACrl/jSSK9thv7W
	pU/drSHHBsjXR6AEQoyOFSBpwptfpP6uWQ+cejByMxHoG7WDimdEnXDWRgAgwr5xwmydGacuVzv
	JDGLl1qvCFcdVkqiTB1Bl7wXT1wsVo+974DlxLI8AMt5ebh4kim0qjbkQgnk
X-Google-Smtp-Source: AGHT+IED09uEsRGdj2SUZR762IRHLQrYNjp5KLiarmzKwBbsgEsQtwu3RthuNqrzAq2XgSdkiFKgiw==
X-Received: by 2002:a05:6a00:2181:b0:736:a4ca:62e1 with SMTP id d2e1a72fcca58-7398037c626mr13160155b3a.6.1743446744652;
        Mon, 31 Mar 2025 11:45:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e1f8c1sm7517353b3a.53.2025.03.31.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:45:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 31 Mar 2025 11:45:24 -0700
Subject: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
MIME-Version: 1.0
Message-Id: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMPi6mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3bTMivii0rySzNzU+OT8vOKS+Lz8orJkXRMD88Q0wzQjE1MTQyW
 g7oKiVKBSsMnRSm7+Qbp+rhEhSrG1tQBW8CV2cwAAAA==
X-Change-ID: 20250331-fix_runtime_const_norvc-407af1f24541
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Klara Modin <klarasmodin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=4LXcETtt3K4/rh+TAivsKHaTWupP4hxrvamLxJXSmt0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qrRxfy5weE/d3qKX+k9f6hmSf1FRlSbqc/5MtfJinyO
 clv/9WlHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzkow8jw0bNEq6MrY3zb182
 DtoW5vj7zcydNWt4jCu5P3xXMdnkv53hf9ahw9e/Myfayip9bUoxZI3rmrM+a9n0DXec3ifwf3W
 8xgQA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_114546_234198_277714F8 
X-CRM114-Status: UNSURE (   7.54  )
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

.option arch clobbers .option norvc. Prevent gas from emitting
compressed instructions in the runtime const alternative blocks by
setting .option norvc after .option arch. This issue starts appearing on
gcc 15, which adds zca to the march.

Reported by: Klara Modin <klarasmodin@gmail.com>

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: a44fb5722199 ("riscv: Add runtime constant support")
Closes: https://lore.kernel.org/all/cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com/
---
 arch/riscv/include/asm/runtime-const.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -56,6 +56,7 @@
 #define RISCV_RUNTIME_CONST_64_ZBA				\
 	".option push\n\t"					\
 	".option arch,+zba\n\t"					\
+	".option norvc\n\t"					\
 	"slli	%[__tmp],%[__tmp],32\n\t"			\
 	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
 	"nop\n\t"						\
@@ -65,6 +66,7 @@
 #define RISCV_RUNTIME_CONST_64_ZBKB				\
 	".option push\n\t"					\
 	".option arch,+zbkb\n\t"				\
+	".option norvc\n\t"					\
 	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
 	"nop\n\t"						\
 	"nop\n\t"						\

---
base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
change-id: 20250331-fix_runtime_const_norvc-407af1f24541
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
