Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F141FC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx5PcLeC0+h+RRa9833afpv2TQNwIZgF9dHKuZGndAM=; b=fUJMa7p6qzgkXB
	SvCl4rC/9Lql/dK5WY3U1sia9mpWrthiRXUe7SdbzZl8JNdlC75yyBnzMKO2GcXgdbvv/F+9yqpVy
	h7rXFhFXW/ZjZChll5tL5vy6W8WonQd90m2Fcx9zB6JNbVDiXVTVzNYJv1pa3WTtD3NTErRVWL/0U
	gDxw25RrHiQE+k690poptquVJ7KAQgSVyRxoJ3D45Nz1qXNaBZSdHc7mcv7vNpJVkbeSkSnQsHyKl
	EXC/i1TffycIKfjRSGQ59JwOdOG98mux7FBZHOZUrWrKNBleJ/IeiEJE29hOLwnPNhuQncRrdUBkF
	rKGeCYzEgAQyIFcPr6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzge-006ect-1I;
	Thu, 13 Apr 2023 16:20:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzgZ-006eZg-2e
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 16:20:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id q5so8896030wmo.4
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402833; x=1683994833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=xVRpVSn8CzSugrtbdPwe0szyiwDqMkR+UEllz4W7naM2gmqv/Mjyn0tKhvPZYVFy5B
         qr7sBJ8yOjlJ7nfDYo+ia+PpSt/Cr4cMPH2Otf/r4hvuEXhldV8NkSKpARdKTc9lj0q8
         UyeAxkjzT9B3qvstiOW4L4Iu/x4tV+F3KeldSXVb+gMF5feNEXAVY/IiZUN0E06bBf6E
         MTOzvMFWYX11zNGN7XMXfnV9f5u6Sdp8SmuzAJAkd80wMkQwfswo2ikmUIHm4fLfLcb+
         OwbsxPWDKcdl/YA0HMvx62LAYuGXYdbz6xIExRTw8/ntNeRjdkzZfbQzrpdFj2AyhHtW
         QEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402833; x=1683994833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=kBqq1POgbZeYRRpW010/lMkI3oOYL3BeS5NMxjcG13O2QVB1vk1964uBYPlCfwrpC0
         Tq4mYJQ+bdZo2+v12GqK5HaeYxWB269VbQQP1+0CQs7xv9QU1hl0Mepy4RQzK+N6Hoiq
         2ZPrd2jR5X4CQcgyrutmzQzFDrXTkmsWNU85Cqv1+rBpWNp7J1Ry7553i2OP0SyBjpXs
         4PjrKrb8BxbiWzg2R5zrUE+n92tpzsFKCj5uHTPCQoWXffB+x+RgzncvJvlZmCYLgcQd
         pDSWRzXxg2JrxXm5o/oRMO/02vhqMhmBF45JLM7e0owrRavuXUTA5Pfez0fM8H7i7lKd
         ghFQ==
X-Gm-Message-State: AAQBX9f5/i2BwjfCouP1CcsJSp6k2mz86TF6gpnliViTKc3N7Rs0YlQO
	J1MNzemFZr4GbP6Ki4JnOKzfqQ==
X-Google-Smtp-Source: AKy350Zp5PeohDBdd7Xv3HthFjOkMMVG4oUVL5Rpyjw5IcUHxehnqFrVF/5LhGA4zzMyI3xHwOYFNg==
X-Received: by 2002:a05:600c:2244:b0:3f0:7e63:e034 with SMTP id a4-20020a05600c224400b003f07e63e034mr2268188wmm.29.1681402833535;
        Thu, 13 Apr 2023 09:20:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003f09fd301ddsm5004185wmq.1.2023.04.13.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:20:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 3/4] riscv: Make legacy counter enum match the HW numbering
Date: Thu, 13 Apr 2023 18:17:24 +0200
Message-Id: <20230413161725.195417-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_092035_905034_D2F89B1D 
X-CRM114-Status: GOOD (  11.08  )
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..0d8c9d8849ee 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -12,8 +12,11 @@
 #include <linux/perf/riscv_pmu.h>
 #include <linux/platform_device.h>
 
-#define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+enum {
+	RISCV_PMU_LEGACY_CYCLE,
+	RISCV_PMU_LEGACY_TIME,
+	RISCV_PMU_LEGACY_INSTRET
+};
 
 static bool pmu_init_done;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
