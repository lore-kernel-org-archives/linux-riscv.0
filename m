Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF58EC02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/qCly8xkRlXTQb5luMNNRg4wkAaRE3MMiV3QU3AsfQ=; b=f/svnnNQYxjjn+
	WcKe86cMtY3xjPx1mFrtVenQRTfT6YlW2KlDVuqu3sE5BkyZaiqKQb03tgyi4YFrbuKD0f0Hg44oX
	pEAOofkvUOuOgSoVBl3BnIDPLcsa/J27jzNIUOPYfMaAElKdaFjNkswY0ZUZPdrEXjqIKlvMKqrjx
	g2C8n3qGizPOi73p5V+Lj82eI45pWxwOkI3fW2J815O6JLoQfHyOOoHcYl/8+fdwOh3G/JpVzMTda
	VrQDKr/1g3yQ2TzrPlPu1jUdGX6X7TSKfRRY7VHTdWk4kWNGV19xLaVcrsxkbuSAZWA4FpeOgWHO7
	WIcN13azQHyfcZ0rk2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5H-0000000AFIf-2xgG;
	Fri, 07 Feb 2025 16:20:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5F-0000000AFGo-1gC6
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so145982f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945200; x=1739550000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fCHXwdFaeXSBwfTQI74JIYWCeXWis7TCtNv1LZo0xM=;
        b=l9VSzVMRkFUtmwUuUXFJc62jAWonypU3qZx1XobtPYwKigafvbzZlOJFzgzfm0X6NA
         53yqt8+3dsF/Ay32lB/5z+k3H1vIyeKFVNrBaZbEEh2bW7ouJk+L35UMpo/MezL+mjoA
         qponkEuaIU7DTZL+ymmoncu2IJD6WZ3VMWRFjJkhAz9Pt4FfDaf+7QoKx4MV4JhSuO4y
         FzF1LP7lvdJmsuzR3H0EeX76DkA/dVrad8HklRUah4G9UH62tfLFxKKkCTFCTLr4QEWE
         dmkV0lFHA2iEwrinz7iN6SLUaoc/jwrUOUh8/Orj5UNARJ6ejRVsUWwBCvmDl8/WSgBW
         vgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945200; x=1739550000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fCHXwdFaeXSBwfTQI74JIYWCeXWis7TCtNv1LZo0xM=;
        b=XhkmZ3MuCtx8ZU6lO+CSvpm3LOg5/CEaDM3jh5Z51x9JnopxamP9azlcfZBnNLC4Wh
         AkRwO0spRa24kJG9+pfDYfwyJ/UdddDC0IqV6/Dqkhvj8NyA2Ur/pCUk61bbjNojhoul
         zEZALy/2jA8YBviNSTF4qFikgdWM/rOFQHSqxj2L66bFdfJKSZwGDpNKdrZ3A1dgBixz
         HK64RZ/FaX2kVQaH8Ry270qwi0bkjpgtLDVs4PtzsouBRlVp0jUJCXkR7AkoJhHN7dke
         /UXnbkZ6EL2YSz3YhaaDUZnm+5cuenptB7Egc4N1dLjhFgJ6YqC3deAQHYX/54v4v+TC
         q1gw==
X-Gm-Message-State: AOJu0YyJXJKg1s5LUsoUVAiSuiMfd9UupWbYUBs+AXRb22mL5PGAlUkh
	FyZ4cmAkcK/4/cG/G6XmgsuFUF4M1q5b8hIg2RwnDUlifqbEfb1U56qq13pySP4pKSxkuzUUKFv
	61fw=
X-Gm-Gg: ASbGncskFHlcwJYjqVS98PWCA8g8tY81wGAys7ybqD+CLncHCEqoO7Sg9K6PhZBIW9D
	mCZ44FziVtMwN360v8X3bYoE5FYHz0ElNux/VKBsNY5P3h9eLDpmuvPLVEY858mtNodRfDhTXcL
	d7Oa9L4jIjni1kurbSwQcV6EbmTKh7JpUCrgglz2QzvMPnFtHSOvfrHQZFQvvxpqWi4c67suHOf
	nfwSTzHrdp/ZgZWPT4gn2U0GwTlhnoN7MvRhcFmuNHNiG2GEWb+Iyp7rruzMrGaoJaENIWtR+if
	eQeODRp8Ktvr7XSfuZ3CbTdr8zNsgmttDwE4X18AzAC3sAdzQwZgSW6AWw==
X-Google-Smtp-Source: AGHT+IFhySvKCOlwcj4Qxz8J3e5OCL6BcBFdracdimWviE7gGpdopqanQ+HxZIazvgx44GvoG2zmWA==
X-Received: by 2002:a5d:457a:0:b0:38d:b610:190b with SMTP id ffacd0b85a97d-38dc9350d85mr2241809f8f.46.1738945199927;
        Fri, 07 Feb 2025 08:19:59 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd23sm4860354f8f.71.2025.02.07.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:59 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/9] riscv: Fix check_unaligned_access_all_cpus
Date: Fri,  7 Feb 2025 17:19:43 +0100
Message-ID: <20250207161939.46139-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082001_441249_0BF18210 
X-CRM114-Status: GOOD (  11.99  )
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

check_vector_unaligned_access_emulated_all_cpus(), like its name
suggests, will return true when all cpus emulate unaligned vector
accesses. If the function returned false it may have been because
vector isn't supported at all (!has_vector()) or because at least
one cpu doesn't emulate unaligned vector accesses. Since false may
be returned for two cases, checking for it isn't sufficient when
attempting to determine if we should proceed with the vector speed
check. Move the !has_vector() functionality to
check_unaligned_access_all_cpus() in order for
check_vector_unaligned_access_emulated_all_cpus() to return false
for a single case.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c       |  6 ------
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index aacbd9d7196e..4354c87c0376 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	if (!has_vector()) {
-		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-		return false;
-	}
-
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 161964cf2abc..02b485dc4bc4 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated, all_cpus_vec_unsupported;
+	bool all_cpus_emulated;
+	int cpu;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-	if (!all_cpus_vec_unsupported &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+	if (!has_vector()) {
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
