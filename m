Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0434C02187
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 02:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sYBEDXGPwFgvFvsPs1HJbetOZGN5vp1aU0QX7vNMzMk=; b=uv5kVgYizzxvHQ
	hBZoxXCjRUcmeqZSOUtOkqJBVOQZDHQ0OTRBws3YSQ3P8n0Xz4brubWfvQSMCZxhC7ZJkTxei4Jvl
	K8uqkFDly063SZiASB07X+yj5bIBdc2fbzmh0twLo/brG3Bw0w3zCPLmmDRsKtxcW9TqDejosOYwR
	SA5PJGN8OK86BPKJz/ID9kE04GQuhxz3BbzuXKe2PPHefNMFRVjmiRePgiwFnOpxFJOMozmgM1RAX
	SBdMtBmHVTpybAdqjkZrW39UDEFAZQewYfHCP5813yi28Byf+QYAkw3Fx7rAUr4xqPD0dpzE/9whN
	t8KzZtH2xYLSox8fjM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhKC-00000004ZEm-0qNS;
	Mon, 20 Jan 2025 02:15:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhK9-00000004ZER-1ZzC
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 02:15:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so5030038a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 18:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737339332; x=1737944132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ArKolxz3XHUBkmd4FJdZWMsFKG9Clr7/XZ1aHt7pho=;
        b=EIO5OH60pCyQ3GeCDsIKFsEC9ElbnqMBFZFkjPTEFo/wwYMSvtKre99W6hKgFc3Wi5
         98o5ht03ULNC5zpIaI86ir6nsb3j7V4sHYTca2lm18/Le9sn5/gjGWiIp2XJlDyB5Qbq
         sF4abhErtnV5qkBLIZixkjrCRZdoOmsdctA3jBNh4b1+cvMlzHaiDzZKzAtTwk7o9zCZ
         L8ja+SXLHBk8x7Yy0KN8M7/vy3ZtMB5vXfbdIAZR4QZouKSzuwDDBo6YlOyLsWkM+2Tc
         MH16Dvtgcpu8p7y2JUuCFFNHJRXiV97I2y0+lFXsu4lOYaIZFOm7IBb8OtXMjleYKUva
         nUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737339332; x=1737944132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ArKolxz3XHUBkmd4FJdZWMsFKG9Clr7/XZ1aHt7pho=;
        b=Y/nvWyxspL7e7V910s+iaG/hkTyBG03Wgf+uYlj9DLtK9yyVycXKXs7maYQJ4AZa5X
         bkYSPPuc/JncFpIByn/tcENymHGeBDpGjGha5v3dt16jT6Zcf8C3Xpl9WQz3UAy2W486
         Mf2ehgLTpzzgk4nir0D6adxw5LkeZlgQy2zD4l484y+lf5UV2OWgdPFbhYCD0RW2tizo
         maXdOOYvFRotJ9QMGPyyxtJIa5pTR1Q7mjpzApMsnaqXZMFadizFEJTB3DwjGdfifagr
         e3/MvaWZrKtzJDei5ZszcUOe+PA8+JdKT1q2Mwi2NpO3mEBFe6TszxP+D8F/y5Rrkm7N
         DsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz8vM4zemoKZHV5zWZrQJcoVzpCkgyVW3D6ebXm/gp8H8yhY3ppAWc49qtyyKYWQ8tyqa/OUjWlxwp2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+vtSREtnj5jnLa5QWESrmcEqFlsMu1pRB5hwNJgiAVH+RtzaR
	AsUzR0WZDXGofkR9sdGkhaEvL4z9vQvExQ2wtEJTuNy/dsQrCZ5y
X-Gm-Gg: ASbGncsY6t6MUbp8I0zL1NaSgzCQeJcjVvBt1FurGoAHDUw8peOEMcL6pHLgcwBQNKk
	9N9wmpqwfEo7mziZzjLsUoG47cskylfFcKVFacE1FAXU35dv/S8gF0C7DhrgikvKbyuG6rc0bAg
	elG/Xl54bYQUREKJaeBPISihc6oPC7FFxgG6wRZ5wPO2l7cxPkjwotfiSymKLsEbxR5sG7gmkGG
	zgu2uO+usjAn42BIhojFHXddAJ1kklhMrBfomUawcDuq/UKXXRwK8bYuc10rH7v4sMMbBYgD4Ut
	99g=
X-Google-Smtp-Source: AGHT+IGU31dexvUtZPjGq5T24uJf3cCQN72PmBfX5+N9oBJzz0EmV8aEe/GUADGWhO+tWC4KFSSYxw==
X-Received: by 2002:a17:90b:270d:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f782ca5d86mr14974921a91.21.1737339331964;
        Sun, 19 Jan 2025 18:15:31 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.64.60.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a28asm7068975a91.10.2025.01.19.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 18:15:31 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Chuanhong Guo <gch981213@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add Siflower RISC-V SoC family Kconfig support
Date: Mon, 20 Jan 2025 10:15:13 +0800
Message-ID: <20250120021514.125455-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_181533_424182_CE5FE0FD 
X-CRM114-Status: UNSURE (   7.53  )
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

Siflower RISC-V SoCs, including SF21A6826, SF21H8898 and some other
upcomping chips, are RISC-V chips with T-Head C908 cores for home
routers and gateways. Add a Kconfig entry named ARCH_SIFLOWER for
them.
Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
for its driver.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/riscv/Kconfig.socs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450..2a700c51594d 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,15 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	def_bool SOC_SIFLOWER
+
+config SOC_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA if TTY
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
