Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA2EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzGRbckr+anrZNxFVZROd4b3DxzLHdnsUcXL2xCi35M=; b=fdH64eAOpTZOTr
	arWuQltPn4hID3ZlaowujrrTBmV719lZwgn8fEASLD2ZTd/ihUX3KVnCW5JFR5Zzp0xCRN5dD08sD
	jGlCmgsxzUDXid0D9dO+AQiqBjKZH8FP4RyBnj7ZsqOCAgY0lhkJKn9yvqOKLLkAYNu01hh5e+OB1
	ONZIXgcX5TO+IYQc8qgRNs6VYowQNaLDe0sZTr6A3S1fLg22BpUSHKqjQxCi29SB7TBLxQPqnGAdV
	2QNUhRVFW13CsdgQk7PVItJkE02O5wxNMJol2hQSh5CVKofPEqpqNUkNZxjyNp46uAJ43iHP+Qhmg
	4W2VH6mEMII8GLjCmTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1K-0093fL-2c;
	Sun, 09 Jul 2023 11:56:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1I-0093eD-0T
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:56:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso26823045e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jul 2023 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688903762; x=1691495762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKSqDzGLT/QQIgfCm4UW9VXcHqwxbjeXId/4Akra8p4=;
        b=DNZvJCm2pUjlaiEXbxzy2ep3OGh3LZAiNUOKTvLXGJF91I6Qfa3OBdEAAk3KZ7gpEl
         +SRJqgBbPGXVHkPI+a2Y4jMPxj8nepQ4OYQq85lBFJvJG8oLkUYtqRpyMORxU5X3Co0U
         4gbMGzPDMrMTIvIiQr41P3Wefx+e+9HaNxaVdyXtdHDAVsGXxcqI0GsqiZZSBpHaaQvO
         QbqV/Wk1DaKTFs59VpnYMrjFQy60JcGOSUsGX0hqAeM0GhGZp+BLIQSbNzk+C8wTMsw7
         pyMrWYBcMGZ0FAwLzl4fGtC5myIfZzWdfyy0H4vK7bS7r1NY5bpmhqEJDrN8azpoF9et
         qI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688903762; x=1691495762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKSqDzGLT/QQIgfCm4UW9VXcHqwxbjeXId/4Akra8p4=;
        b=fBTD3T2ishbPCkMmdf7lqWh18a3mF3FsMprUqAnI2Xf2lxXd+GWarhdN5WhNp1YMCW
         3VVyQNCUkZLhOCuGyYhzIWaZCwTQUBvsRP+ytJ81w9amsZds07IvOiPtdb7X93XK2sLw
         DLRkTlUZnCH1EuKpRpG6cT6TKh8HQNIVQ3dO9+6jXaPrrQrJztn4rAsq2PxSCPU6bvZY
         ozCUyHedbGTOWa6JF4JzRaEsTK9sfoj53RskrNjCDiVAzEPDHpcxm2d/XhHMQzUCGse8
         c1TtICAYQ7/ZfViHDnVHpuNA85APoVsojiMLew1JxOVx74kfRjHB49UeSHnRipYWIn1d
         R1fg==
X-Gm-Message-State: ABy/qLYajE4eEwI6mTn/qHxxB0iKYkcHNzNM9fV/YswlihE0aekuLZkx
	E1Q5sXZMsPdVFQbAjxser4YcoQ==
X-Google-Smtp-Source: APBJJlGZ89jknqt36LrTlwIdSulS4TMjF9xiGWx2JGEt8Fr6eNlApRGSa4LrXeTbOnp5N8O7aRXh/Q==
X-Received: by 2002:a05:600c:4446:b0:3fa:ef97:1fa5 with SMTP id v6-20020a05600c444600b003faef971fa5mr11903256wmn.6.1688903762307;
        Sun, 09 Jul 2023 04:56:02 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c02c200b003fc007d8a92sm6194101wmn.45.2023.07.09.04.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 04:56:02 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	devicetree@vger.kernel.org,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: [PATCH v3 1/4] RISC-V: Add Bitmanip/Scalar Crypto parsing from DT
Date: Sun,  9 Jul 2023 13:55:43 +0200
Message-ID: <20230709115549.2666557-2-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230709115549.2666557-1-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_045604_183607_23795782 
X-CRM114-Status: GOOD (  10.21  )
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Parse Zb/Zk related string from DT and output them to cpuinfo.

It is worth noting that the Scalar Crypto extension defines "zk" as a
shorthand for the Zkn, Zkr and Zkt extensions. Since the Zkn one also
implies the Zbkb, Zbkc and Zbkx extensions, simply passing the valid
"zk" extension name through a DT will enable all of the  Zbkb, Zbkc,
Zbkx, Zkn, Zkr and Zkt extensions.

Also, since there currently is no mechanism to merge all enabled
extensions, the generated cpuinfo output could be relatively large.
For example, setting the "riscv,isa" DT property to "rv64imafdc_zk_zks"
will generate the following cpuinfo output:
"rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed_zksh_zkt".

Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 arch/riscv/include/asm/hwcap.h | 11 +++++++++++
 arch/riscv/kernel/cpu.c        | 11 +++++++++++
 arch/riscv/kernel/cpufeature.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..b80ca6e77088 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,17 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_ZBC		43
+#define RISCV_ISA_EXT_ZBKB		44
+#define RISCV_ISA_EXT_ZBKC		45
+#define RISCV_ISA_EXT_ZBKX		46
+#define RISCV_ISA_EXT_ZKND		47
+#define RISCV_ISA_EXT_ZKNE		48
+#define RISCV_ISA_EXT_ZKNH		49
+#define RISCV_ISA_EXT_ZKR		50
+#define RISCV_ISA_EXT_ZKSED		51
+#define RISCV_ISA_EXT_ZKSH		52
+#define RISCV_ISA_EXT_ZKT		53
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..10524322a4c0 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -215,7 +215,18 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
+	__RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
+	__RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
+	__RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
+	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
+	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
+	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
+	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
+	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
+	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
+	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..9a872a2007a5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -309,10 +309,40 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
+				SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zbkc", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zbkx", RISCV_ISA_EXT_ZBKX);
 				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKR);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKT);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zknd", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zkne", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zknh", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSED);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSH);
+				SET_ISA_EXT_MAP("zksed", RISCV_ISA_EXT_ZKSED);
+				SET_ISA_EXT_MAP("zksh", RISCV_ISA_EXT_ZKSH);
+				SET_ISA_EXT_MAP("zkr", RISCV_ISA_EXT_ZKR);
+				SET_ISA_EXT_MAP("zkt", RISCV_ISA_EXT_ZKT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
