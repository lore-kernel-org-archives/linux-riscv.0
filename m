Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB6CC3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiRDvZj0SijcyhRH83dwvSn/sFKzDIYkuXO53ZhyuPM=; b=x4iu8w3V5nhhSB
	HFW4Y/TfRDMVlT1HvxwtoV3VnHwPQc8uRSYbXEpCE94s25FeqYOxiwGL5JrYOk+B4aetyIYP8m9jk
	uGIdg4aXmKJ1toQ21TOKfqGPELpDjCbkFlBYWc6KcMw4kA2kk6I+lRKH9mWoZ+e43t+TVYOADCxRT
	6XQdQVIm8+gKhJ+JFryDVmKoF7ngL7luCCbDREQE2C7e6lCQk+DDqAPeimKBDLSf8MQa+0EvMKESp
	DYeR6xp9s3AnhGDvGNkmFeboOITED5G7feNawMW/+bpaGGpPq5GfzVMJpYSeOQh/4oFSsQfYCu4Q9
	GAygVVXmcZxYDy+gEmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuP4-000000018Xn-2giY;
	Tue, 25 Jun 2024 00:51:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuP1-000000018VO-0qhx
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 00:51:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f9ffd24262so22663365ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 17:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276678; x=1719881478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbZ5afsJ9snzdZoHI92IYxp4PE+4CuBIhAjqET55SFU=;
        b=j9zVXALDhBPYYNRNgi3glqxo2j7Yr51hep+4DSAbUuv0fIRGcqpOM6shNIKz0icdc4
         36upL4Gyu/7LXZ47iy+wNZnO9J11KQrAl5YcIvv88WarO4qwbj4GoM7og6EHM2DGtxvc
         e7Tb1Gh0ZxghqBUnr7OiZAHmQgnUIycEdanSpMBBCp5HV7YvLr5PQ9GXKM5kTMJWmKx1
         4bQwZa+8KgB9yqZCOtblGrAzUgTHOOCq0M8bPbzzx44uKBytjI0TwhuPJKPUetKAhuyS
         4GyITZg8IHm89L51J6Q0BtzUWsgF6lqsmMmFMhhTImShlRCJQ/gyyqshqJjOmMi9ZJzL
         fNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276678; x=1719881478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbZ5afsJ9snzdZoHI92IYxp4PE+4CuBIhAjqET55SFU=;
        b=W5Bdrzx8d+TDn/FhIhTf9Vg8JZjGHxQeSVeI80Bqv8vKsF97Y9dasnucBMjA2GOmwc
         GR2Qu9MuhQ2mPKCDJhzu4K5j9uKqsjBV6WZSUqanXA1tkugMyuZcBnbh0Da/ZFqLHQvU
         ua8D8XHmLVwzGahR6yAM9D4Oio5UIOM0FKr4MZkxUpTHbo5r1Q1QaQHHZz+G9a3cdIW/
         yg0EsUlT62rcP7KGEPpG5nC28cKzBS03g2aAYV1voQeUradLeT3LW/qP2mQHQ1AzVg80
         QFiVQmlW/ugQ/aaquKWXgtkMAsLnEqC2eepsIoHWKLs9hYLSUYwTxqWI18dfXJ+Nou+K
         5KQg==
X-Gm-Message-State: AOJu0YxtoN5ZnfKqMCytcW/W0R/E2ssJvVAr1f7SR+lfzdUn5kw8X6kV
	7JQT20HLqYrNbF5q8XaoCb4u99YmCEw8va6Zz63WRmRo5mINNWsaH5jta1tigDUzPqfdNgXCp3u
	k
X-Google-Smtp-Source: AGHT+IFrptaOTah+yZVkTRLhwy8L5y0nIsOmh0E3MizJhpkRcr8WQrdivG0Q840vHNP+HRAolE2fNA==
X-Received: by 2002:a17:902:cecc:b0:1f8:67e4:397f with SMTP id d9443c01a7336-1fa23f227b5mr66212145ad.7.1719276678136;
        Mon, 24 Jun 2024 17:51:18 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:51:17 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access speed
Date: Mon, 24 Jun 2024 20:49:57 -0400
Message-ID: <20240625005001.37901-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_175119_289029_AA6DC8DD 
X-CRM114-Status: GOOD (  12.88  )
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

Check for Zicclsm before checking for unaligned access speed. This will
greatly reduce the boot up time as finding the access speed is no longer
necessary.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V2 -> V3:
 - New patch split from previous patch
---
 arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..329fd289b5c8 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_cpus(void)
 	kfree(bufs);
 	return 0;
 }
+#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
+static int check_unaligned_access_speed_all_cpus(void)
+{
+	return 0;
+}
+#endif
 
 static int check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	bool all_cpus_emulated;
+	int cpu;
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
+		for_each_online_cpu(cpu) {
+			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+		}
+		return 0;
+	}
+
+	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
 
 	if (!all_cpus_emulated)
 		return check_unaligned_access_speed_all_cpus();
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_all_cpus(void)
-{
-	check_unaligned_access_emulated_all_cpus();
-
-	return 0;
-}
-#endif
 
 arch_initcall(check_unaligned_access_all_cpus);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
