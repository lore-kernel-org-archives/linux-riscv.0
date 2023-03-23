Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7ECC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A/jENjJm5Z1Bhdu/uLpJZDL9AruKpzo6w/qmek6JN6g=; b=oWK3OBR8rR7uVM
	pYyK4FyT6918rdTt3BKvb5R9EvlUIyjTdD90Btl0++foz72bcDA4oLK8uiUlw3bxms2pBtnG/fcoE
	BaKGArc1EMbtEfFopJeXMMOwUoA6lkG+XtZjihsfzoWl2iyWpAsRddjo6AqEZlJ4vD1Cz15qu56FA
	HuAfoN1l6VNeQGKcu5zY430AdUPt7ZBnuqm5LkZ4MD+Kxb5PRFwPYL0DruyKHaJIgTn4BJok1UdJ8
	Cet8S6gGbv6M7KhX8myVMwSOmmh4sW7z8/sNGFLVkaFgio9VcCzQhsZBr6HWH9bz4UhLZ+NTCm3Jj
	Pe5YVHhmcXAuTfAA/nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKF7-001x6B-1r;
	Thu, 23 Mar 2023 12:40:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKF4-001x4P-1g
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 12:40:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id kc4so7538928plb.10
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l22jS9A4e1C/PCC1oUu93RwDdLyt3Y018WPXLhkvBHA=;
        b=jo/4TaIRmx15peiBHkAs34j7i9MfuA6ulwk8L4eFd46BeEq/UACAl7ur4XobFxYxqm
         vYPhTQupqDgk//JXCHYIgtFNcRNgK8984bpEcAj4xT1/i0Uidlb2VnhSI5X5+zeBMGoX
         QhqP/YfqsVQnge3umd/k1jYHGgonQ5rdXwZscjym6MvCLlVn3wIA99RY54buU7+m174Z
         gWF2wvfRgzPkA+dRhoWfOmJpuq9jiTVZOlz8Lo6mNlYDK4f0D+jsE2R45NNHyzsv2x+n
         O34PLUM2wS6fMAxQWMsHNzIoLNqNdta8fpGCZlnYPnz1xy33N+AgFXveeTkX+aQV/K1/
         oQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l22jS9A4e1C/PCC1oUu93RwDdLyt3Y018WPXLhkvBHA=;
        b=u9GBT+dEg2j3IlAqSfHdyDoqmZBvNhxF/Ehv4E68flyzZjzqExD/w7scZ7EjF1CiKh
         wtyIDdxgk6sbV0ePyvZkOHOAn4Xny1/UFN5H70ujv/Fay5lZrmS9YsZiM/9NerJ/bfB3
         PoP4kLEdscoMBs4ANuHrx5GYN6wncGLrHdmRT8o3u1nmOhlQpguiE66qjFhSwpfJ31vX
         3nBoia3HtREHu1/EM/q/UL4FZkX8iC8wMJ9OQJkNge9zCWQ6mp3KyYyau91Gr7V28Tuw
         yZENUdWQBdKfBguIER+37E7DXw/lO/pn2JT3RYE+8YvHKZHfbmaXNIbbSuSEXJCgZBce
         EAzw==
X-Gm-Message-State: AO0yUKX7U6viGlU2u9l6I5a1SXQkKRKp74sSHSGKf0ztoV+CSWckltgg
	BqkyCDEEzyrMA+RkhY5ts20=
X-Google-Smtp-Source: AK7set9Isx1m4iVIIeq2lRufLyOFJqOrT7oZL8Y87oohW5hymb0XXvr7/mDzkpyIOwAWmhqDS/a4Ag==
X-Received: by 2002:a17:903:2301:b0:1a1:8fd4:251 with SMTP id d1-20020a170903230100b001a18fd40251mr6415378plh.55.1679575226931;
        Thu, 23 Mar 2023 05:40:26 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902744600b0019ac23cb6edsm12219749plt.181.2023.03.23.05.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:40:26 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH V2] riscv: export cpu/freq invariant to scheduler
Date: Thu, 23 Mar 2023 20:39:24 +0800
Message-Id: <20230323123924.3032174-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_054030_554880_0F039FD2 
X-CRM114-Status: GOOD (  10.37  )
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

RISC-V now manages CPU topology using arch_topology which provides
CPU capacity and frequency related interfaces to access the cpu/freq
invariant in possible heterogeneous or DVFS-enabled platforms.

Here adds topology.h file to export the arch_topology interfaces for
replacing the scheduler's constant-based cpu/freq invariant accounting.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
changes from V1:
  - fix the leading underscore and tidy the patch up 
---
 arch/riscv/include/asm/topology.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/riscv/include/asm/topology.h

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 000000000000..727e8d163a3b
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_TOPOLOGY_H
+#define _ASM_RISCV_TOPOLOGY_H
+
+#include <linux/arch_topology.h>
+
+/* Replace task scheduler's default frequency-invariant accounting */
+#define arch_scale_freq_tick	topology_scale_freq_tick
+#define arch_set_freq_scale	topology_set_freq_scale
+#define arch_scale_freq_capacity	topology_get_freq_scale
+#define arch_scale_freq_invariant	topology_scale_freq_invariant
+
+/* Replace task scheduler's default cpu-invariant accounting */
+#define arch_scale_cpu_capacity	topology_get_cpu_scale
+
+/* Enable topology flag updates */
+#define arch_update_cpu_topology	topology_update_cpu_topology
+
+#include <asm-generic/topology.h>
+#endif /* _ASM_RISCV_TOPOLOGY_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
