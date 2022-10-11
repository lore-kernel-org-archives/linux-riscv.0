Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C772C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfxgS+itMSTiqIsOITdM5ggTqetj5utc7k9GniDPzL8=; b=lXtEHDjm9Yfm2H
	vYRF4RzqfaGS9TO3iQv7/lRZf6lDuOaQnY51TdRXyjwxE0+8pxZad73QT27UWSsfO3qi27LC8Tr3y
	0RovDP0Q8FhUxhS71GgL/3RB4K2SCfj+mjpM9VZzb669NxCGx0t/fjTm/TaFCwDCasxueWg4jKiA/
	EKmO2f2f7cznYWbJOwMZ6wbYfhNmxQ3GHGcnEWsPr4rqEUi5O+ptCVRQ6JIxwecTacfDnhI3whG8K
	eq2YcEyHZW9AGbnX/kJlZqZbgA/oe/acunAGPpCyvJYWgx1jtJ24ZSUp96WrC/LzqlLLhvCp2muuq
	lCvtkJFELUmsJh1yXHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJOx-005NST-Cx; Tue, 11 Oct 2022 17:50:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJOu-005NRE-Ha
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 17:50:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id a67so11857820edf.12
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utPrbE2BVpHRFeW5CkjvteB3YQtVT8Yss/hrJKsa4ds=;
        b=Fmu1aHk/J7PoRiXS5yduxpI3iTB3YV7jq+GVOm/wWDNsVrlQ90G/SNxQYWauNZMeuA
         T/Af/8ZIKpE6ZVGaCoxtb59s2n7LA1nff5JG03qdleZIen3RjyaI/Jlk3me7Q77PPCgz
         OZybzPZJE4jzPUwb0minf6xcziIgd9z7RsneWT/LZiVmDvBlngaHqXZ45DJEvfoyVqP+
         24+3Ge+3Oo/SgSDH53LA1tHxWC0mJaY3LiL1vpPDYVI6T1BZANYM63bqEp4HBVv6LnCo
         Ql3Jck8EfDEXuv3N0I6Obgwg2UMzj5whwYoZ5kDqj5cSms0prGmCRlhljdjQI2EB3v0r
         EC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utPrbE2BVpHRFeW5CkjvteB3YQtVT8Yss/hrJKsa4ds=;
        b=AGNL9lxiWz34SOO3vSh5K4enQ/W9QTFPbTRh1ubycUc8+ZjhOlip2HO5rpARIFqmrD
         KZb7I6bx00DJYsQmAy0QBvY/oKgRaHsvIgaXL9pUS/WdzvFve+o2SgWA2bWpd1cvIpLt
         9mUfdW+iRQ7GqHtJmvDd0uZhwS4S3EyAorNe1eN6Ik2gOz+nPw1AIstxX6ce75cD0LOc
         fiIdoU16bPN/8L3O7pDlQMNtAqFms3xQ404a1o4X0s5xp+TxfSotaJk4tKrOFJb/EnKS
         rQMZ83ij9rmnwTLc/JLEeyvD93djsF6FmbCOyyf6NY3lT/LT4VndmDQgMwVo0Sj5rYOB
         NW1A==
X-Gm-Message-State: ACrzQf1XEzc/hFwWzXMFsJmnzVA6eB5gMpF0rebHR5ShYkpiuz6e3817
	ekCtPLZL1gJvpNK9ydRuBhxU70wcJUcpug==
X-Google-Smtp-Source: AMsMyM4iF7JtNbWsxFqdpKcpXybVYArSNuZeDz7D8SSkLYBl/uMSb4CdgAeYTv4Xbmeaiz/HXACngA==
X-Received: by 2002:a05:6402:292f:b0:458:e447:5c with SMTP id ee47-20020a056402292f00b00458e447005cmr23149616edb.286.1665510641703;
        Tue, 11 Oct 2022 10:50:41 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b00770812e2394sm28438ejy.160.2022.10.11.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:50:41 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] RISC-V: Fix /proc/cpuinfo cpumask warning
Date: Tue, 11 Oct 2022 19:50:40 +0200
Message-Id: <20221011175040.1782772-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_105044_598836_E657557A 
X-CRM114-Status: UNSURE (   9.95  )
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

Upcoming cpumask changes will start issuing warnings[*] when cpu
indices equal to nr_cpu_ids are passed to cpumask_next* functions.
Ensure we don't generate a warning when reading /proc/cpuinfo by
validating the cpu index before calling cpumask_next().

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>
---
 arch/riscv/kernel/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4aa8cd749441..592ff065e09f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,9 +166,12 @@ static void print_mmu(struct seq_file *f)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
-	*pos = cpumask_next(*pos - 1, cpu_online_mask);
-	if ((*pos) < nr_cpu_ids)
-		return (void *)(uintptr_t)(1 + *pos);
+	if (*pos < nr_cpu_ids) {
+		*pos = cpumask_next(*pos - 1, cpu_online_mask);
+		if (*pos < nr_cpu_ids)
+			return (void *)(uintptr_t)(1 + *pos);
+	}
+
 	return NULL;
 }
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
