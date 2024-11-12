Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB0D32D9A
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XtI30BXIzhzlG/0au2JEh0iim6Mmnp8+dBJpXh2Ldc=; b=XJ8w4HQtsOhRKJ
	T/ffUF1hEQzcxSunAJchv3DvIpTiVCZmoW50HNMyLBRJp6+Y0wVCDgTVTaRhGvfhU6FRmaz5jsHpi
	bSpo+sxaH3cAq51ddGx2puJcETSidNu2xeWyQHBE/ffu5C2prsRiZm8Yc+SMRSauV0qO/H4xWTENz
	Q41x6hkCvkmNnibp04pQlHBS7ydT8f/TIJ5cXE+vOTYLJQY/ly12jodEs78CXFWrE0Xwo2iuo6LRz
	KNDWKSk0JHOze4NgU6mCm6xrWLQ6e2BH4IaKmgVwO6OXJNR539/WKKZY3AUT0W7lKLo1x+4I/7a7A
	4Y+c1K1Zdojtm6qVmPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApQN-00000003IGv-2lE7;
	Tue, 12 Nov 2024 11:51:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApAA-00000003F8O-3Mrk
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 11:34:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4314b316495so46054205e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731411265; x=1732016065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUe71YecPH7XQ8UJJ5yU95TDCXx24YG8e7+/RrAak7Y=;
        b=RrcZKdnWprdn5pHqx6LEDNjUvwCDOZG53m5NZy8WdImV9n684eeGAS81/t4O5JR8nR
         nrJsZ7IQqueeCbF7pIF2FwZ7HZg8hyM5kHK234AEv4XbxmY+a4RXaTREwhzyxuwR4Eo9
         wtkOoT866LGZ5O1E3NC0A+Mkl/qyfCmjBw2tLwp5uZmT6xz2JwzjCQsOZik0Vw1r0L2a
         wM2mU/lfT18bLujJnCZJS6qqLrIE+fJsxuo/DWLU2gbpN7GKqWK0h5GyoNOm/28yXmOk
         leiaq8luVs+POXQJuOrxl6/P4gPY6lezGobS977uRss08QPpmHvJayuCx+6sbFd4WMXi
         1Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731411265; x=1732016065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUe71YecPH7XQ8UJJ5yU95TDCXx24YG8e7+/RrAak7Y=;
        b=Jqu8QKKvEV9/1J/61M9n7V94l8jDkFawxh+j2XTnOx4uA6mX3e5Np8a5o2XOyD2+FO
         QiKGnkfBWChAWOMqdq5IPJDXtPp3YOAnW+1JG2IoqEQ5lcDkWjsqA/CFaXCPJZUlHruE
         Sc4zNdY9iaELq1KROih6FJaSZNwkUpaXKu4QpgOPhG3APZWKCjzgI1b+49Se7Wtyosr8
         PxPXRJJVZ+vaBH0S/qcb9fIJgcQWJu7yUi1IGk/n2Ned4Va2ECJwrjd28t7o6DwjeFia
         k6EVICTKDclvicVvriLJgi+YmoiLci48NTWeXJy1UjnpQJ+mfXHxSitPPnn0bQpfKcYZ
         8kRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1xn4eP6WQXJlRN0gNKmSJWJbdY7Ew7JcaMoyAFfniG9vF1c5wmO88NmOZahgXB03FxqebiAW5n2UM0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOK4cJn5GycnaL5Oj2N3yYD013wqSIJzmKfNySzHSgVtd87r30
	pmzlLvN3tmo3LBrf+D67m0l6vhaivBvE6sWrTRaBPhWk5o22P42pZSBiJE/+k5M=
X-Google-Smtp-Source: AGHT+IH7M/UX7fkmVreC1luerEEXE6GOHNSoZB9sCqED65rS6AXsEUNqfA2l6fwGjpmBaETaxjbK2Q==
X-Received: by 2002:a5d:6c69:0:b0:37d:94d6:5e20 with SMTP id ffacd0b85a97d-381f17261d6mr14681736f8f.4.1731411264652;
        Tue, 12 Nov 2024 03:34:24 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe9bsm15071138f8f.35.2024.11.12.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:34:24 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
Date: Tue, 12 Nov 2024 12:34:22 +0100
Message-Id: <20241112113422.617954-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033427_087955_121D009D 
X-CRM114-Status: GOOD (  12.24  )
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

Unfortunately, the wrong patch version was merged which places the
put_cpu() after enabling a static key, which is not safe as pointed by
Will [1], so move put_cpu() before to avoid this.

Fixes: 2840dadf0dde ("drivers: perf: Fix smp_processor_id() use in preemptible code")
Reported-by: Atish Patra <atishp@rivosinc.com>
Link: https://lore.kernel.org/all/20240827125335.GD4772@willie-the-truck/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 391ca1422cae..1aa303f76cc7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1393,8 +1393,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 			goto out_unregister;
 
 		cpu = get_cpu();
-
 		ret = pmu_sbi_snapshot_setup(pmu, cpu);
+		put_cpu();
+
 		if (ret) {
 			/* Snapshot is an optional feature. Continue if not available */
 			pmu_sbi_snapshot_free(pmu);
@@ -1408,7 +1409,6 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 			 */
 			static_branch_enable(&sbi_pmu_snapshot_available);
 		}
-		put_cpu();
 	}
 
 	register_sysctl("kernel", sbi_pmu_sysctl_table);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
