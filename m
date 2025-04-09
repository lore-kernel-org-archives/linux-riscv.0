Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8912C369A4
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6CQ5tvyKikM5EntaF3o3HthqK5KkAu9PKUY6sQsw3fU=; b=NPOlhOvTDPBZEG
	YJBxK4PEUf3uP3i4Z3QPCFCDCOskqHuHfoxsWHysn7UfP3Y4D4z3Dv7dvRjF4t8LFo7uVwmElbWYe
	n640nzW1y3Dq4OgqPOjTsrGhs9AWjgRZQcX+aOEh1G3iPjkcTy+f+j/fR2uqUMNhmQmlasoJjK6ok
	QhFqKJmD1Xt4IPlEh76TgMBjygsfVtuOcijLjhX+S6FJEGSaLQtza4rthTSjkps3EjWxXhuW2h1y5
	bdnf5OWUpax96pM+ODcP7+oQyEMgw+O1EGrR6jLsr7IJnEAd6LmhgOAV8PPdW1YrK+xO6HueIi3qz
	AULGl2n5BzAIFFvK+MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XWK-00000007iuj-3OMR;
	Wed, 09 Apr 2025 15:39:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XTx-00000007iN5-2YSY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 15:36:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39d83782ef6so602205f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744213012; x=1744817812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfUM5mGHhpw8hKZuwlrvDlDzAMvYd8UqjjsU88J1W0w=;
        b=alLNr4ym12pliDRDl9fhkhuIhWpBAbHHMSiQDnG5LDP21ZVnyXOHXQ+WPFA0IK9cf+
         LQTqjGRjCRIM1TXrqghObqy35+VA4uI2y+xmp2XrxLcnLb0stf/lqhJh4/yCsiigFdNV
         JkypTnA8dTQ5ly0u/qcSDKisBTx164vyxQeks4gMVUDfgS7GWbKtc8o8S7qqPRJpMgH9
         VnQ/CbWycfQaJeyUDU6e2KIFWdPL5GWRBARcxwplTK2YJ6thBWvV3tKS8ohRfYqmY1k8
         jVqN+0gDHC8XOOTaxV8WTOVb0bm1InzQdQQT1VXaVBU9ceWP+xfn92949/Fl3KR3GX3c
         nwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213012; x=1744817812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfUM5mGHhpw8hKZuwlrvDlDzAMvYd8UqjjsU88J1W0w=;
        b=VcwBM70Z2Ro9rqbJisyKClXux4Wp5w5/K3aPZxYmlLaaXZ6QiXuVceP2FSutqblh2T
         v2Mue9/D0bMNauu9eWoKS0vBlbrqVewVRXBBxbGK9uVU2+eWRCifwZlMxqy5RLS+iU6Z
         PM9gO1Ia2ZJwHkV6vIoc6XXR43/BrO4sRy7q3rAYzCH7DRW1tvx466unMCQkKhJXrstQ
         YVbnSGyTCd5zRE69KBupjNm//yqnqVuI/SR22Z5KnXDQBJHVlZVqa8wFZguwMs3ncksP
         t1z9mUAglEUKnjooAnJVq+GR2VwiX0jJ1nfsOkRgo7gCUmM2HYVM21Hap3uy4o53nLH8
         zMwg==
X-Gm-Message-State: AOJu0YxTblI8z4hQeOsT9DUqONJl00RtW7clFI4CD942bUPW4J4520Nn
	vNqLjIt5fUgY5W+Wos+NvTZ6MYXSb6MXiXeD0bKSBC4lyMJBoGRDKkbTaCpnHfAy5KBXqwd6btM
	u
X-Gm-Gg: ASbGncuxy9sJTFRZk+gpP0+5QluitkGHQhrIfSRqvM2y01Jg8BruoFhJvLpkA/SeRZ6
	pSlrr0GqlNfkaKDWDMw6mrI2ahmlw3khir+bwH5ZWozwNYz7t0W1qt8e25q5jDagHtkihbnyxml
	DHmBMqLZRM0EPznYNHCY6lPyIxZmhzjIMVFk4V0iMiKNb9aoFOfWvjOpXZKNN6LQraPeIcEJ1h2
	MCzMWKP/ndCsw81xO1FRdq4PTaBPNZ14Er96UxA/yCkqDVJpkaDYrzbfSwXp5P+nZ+klQle5ZBv
	EccOSv6K3qeUHwgRXSA1GQfg/GZ2
X-Google-Smtp-Source: AGHT+IEHd1ox11xPN2snB8m+aQ/4eSxd2QCdR3SX0Uzkhj5FFWGu2zYPXfDx9gyBtnXRt+W19GbChA==
X-Received: by 2002:a5d:64cd:0:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-39d88010b83mr2806725f8f.28.1744213011831;
        Wed, 09 Apr 2025 08:36:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cfdsm1961634f8f.76.2025.04.09.08.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:36:51 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	geert@linux-m68k.org
Subject: [PATCH] riscv: Fix unaligned access info messages
Date: Wed,  9 Apr 2025 17:36:51 +0200
Message-ID: <20250409153650.84433-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_083653_656632_424B6EBF 
X-CRM114-Status: GOOD (  12.20  )
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

Ensure we only print messages about command line parameters when
the parameters are actually in use. Also complain about the use
of the vector parameter when vector support isn't available.

Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 35 +++++++++++++---------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 585d2dcf2dab..b8ba13819d05 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -439,29 +439,36 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
-	    !check_unaligned_access_emulated_all_cpus()) {
-		check_unaligned_access_speed_all_cpus();
-	} else {
-		pr_info("scalar unaligned access speed set to '%s' by command line\n",
-			speed_str[unaligned_scalar_speed_param]);
+	if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
+			speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
 		for_each_online_cpu(cpu)
 			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
+	} else if (!check_unaligned_access_emulated_all_cpus()) {
+		check_unaligned_access_speed_all_cpus();
+	}
+
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		if (!has_vector() &&
+		    unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED) {
+			pr_warn("vector support is not available, ignoring unaligned_vector_speed=%s\n",
+				speed_str[unaligned_vector_speed_param]);
+		} else {
+			pr_info("vector unaligned access speed set to '%s' (%lu) by command line\n",
+				speed_str[unaligned_vector_speed_param], unaligned_vector_speed_param);
+		}
 	}
 
 	if (!has_vector())
 		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 
-	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
-	    !check_vector_unaligned_access_emulated_all_cpus() &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
-		kthread_run(vec_check_unaligned_access_speed_all_cpus,
-			    NULL, "vec_check_unaligned_access_speed_all_cpus");
-	} else {
-		pr_info("vector unaligned access speed set to '%s' by command line\n",
-			speed_str[unaligned_vector_speed_param]);
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
 		for_each_online_cpu(cpu)
 			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+		kthread_run(vec_check_unaligned_access_speed_all_cpus,
+			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
 	/*
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
