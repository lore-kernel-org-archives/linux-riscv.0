Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F806C282D6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkR79wiuhsu0+PIfkmWVmXvotHR7UmV5EAxnnDOMpEY=; b=kJkNlBsMTGKWvb
	BrUQZmN4DNqh7q7kNSksznYOiNzVYFci4fVvq+MbD12rG9mgPqc75e+mVNeeRHYn6Ey5tQAf1n1Qb
	1Wvm6f2AwWeb5Two3EM7BpeEjxPzcThFZM6b8vGkfduE7EL4Uu1dVQBIAhVnAnO2ghN4lBajDy8fF
	JL6NungdfFyXwQUDu6cAVhctojvlNV1wW/M8Xh0LetylN3Ia1t3U2fusu8iV0Cyx/ZlUlsW7slpUs
	kYDrkhpTF7VwzrbBAZ1bJ2PjRqyEnmlUrsJ0eHEnSOnnujB6jdZY6Yv4zFUFY0KOL9LRoVr5Hojed
	i4pkMcp0+ImlkrfFvIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6i-00000004ZgG-1xy2;
	Tue, 04 Mar 2025 12:10:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwf-00000004V7o-1znZ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-390f69e71c8so2289717f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089620; x=1741694420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=lA+d/neL0HjIX7rppyGjdcewmWAeSS0BQEymuWOMd21+h3eyT/7nWgrf5k3TLznk6F
         DD63vkAqOVRSCpvdVX1WAwOsaqHVf3Jhi4Yr8jn8MPeZDE8cSF8nchpW03hTzl7r7YkY
         oOW5WY2EMtfHwD6xFLOmDRQjmR1Y2IbhjWVdjkudO/g+3WmU29rs67+S10tf4VDOl5Dg
         T8FAlFLQ18EnqDcUKzV1AhiWQXyuzkbfx55dJPdP5sJ0KAxAkR+2hT86KzTJ9JNhNr4k
         B6m9Q+YGt317E5Kk026f7G9DtjKtxuXUU1eFZyRbHeqYZbTop9Eow8FA0TQHpLSkhNyp
         xTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089620; x=1741694420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=XLDQRKtHqUBpg91dlevJ64q+AUpwZx85zIuJ5xKKMkRZi4BJ9xPxYXB/i2PUc2/huT
         L7SL91Fc/UIkAjXIU6SiC0lDLt1OAkzLyHWkDoJT+GtF9rXv1zs6EuiUHHmpI9IFG9wB
         QCRdm1K/gI/iiUrgm4C78BK3rJwXZGTRektjSe0GzYXx62rofclFAMLE36aHG6JSI8O6
         +g7PVPsIH0EtvEEISK3+vO0iH6keUATVdYQsPyZA6eYVIMDOK4L9Vw0fNYAosBKGoUpo
         ojUp9k91O7wSLab2rlP5Dr68YZrXGM9mDbLkXWSkxuMcwkpmChH+heJOioqgooRsHGRD
         vwcQ==
X-Gm-Message-State: AOJu0YzqddKv9izElx0Z3jih0eIbZID+w1ebMq3KctAqxfxU2x37kmu+
	HpxoFG/7NtmVrWEPQRSD7nKf2S8abjWBB0ZdsnByfqRZfKCE1EgtnirGIf9pyBpeU/GCmrU/bGy
	a
X-Gm-Gg: ASbGncsuWk7Msr9SIMvNomT+sDOEZ9s8rJJ822ysqxociMKS3kjrdV82QxB9JM4ACfV
	1DWcTzJQ7CNaMhOLTn0cN5GxK4RS/ruC1nhgeYT0y0DNRl/i3FaW2MbMMvFJAo3QF2+OSrEf06u
	4CzhDtcWZO6pp5O1h9PmwqY9T8oiW62YsHcIWEUXygTfXS3ESaaHa1+/+HjTMzhzRl+GrIp6q85
	3pRSOCBjx98ik7/t/Neme4lk9NVa53aqwNUkSnE3BNGDfZ6SpP1+fupKP5OxSRV7SbhjsaOHF7u
	z4zZQCJHprKaTqNHKbdWgnqYTS1wW/zo
X-Google-Smtp-Source: AGHT+IHGl4juoP1IGvAETEutihGGilncidBGnRXIsTr2+3oea3NO/pXu/tqvOIeNlFeGq7iMlTLrtA==
X-Received: by 2002:a5d:64e8:0:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-391154af01cmr2483532f8f.0.1741089619498;
        Tue, 04 Mar 2025 04:00:19 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcbdf7a9esm21728565e9.13.2025.03.04.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:19 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 3/8] riscv: Fix check_unaligned_access_all_cpus
Date: Tue,  4 Mar 2025 13:00:18 +0100
Message-ID: <20250304120014.143628-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040021_514340_307B09CD 
X-CRM114-Status: GOOD (  12.77  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
