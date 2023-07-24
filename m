Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C7C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 18:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=twqUX68mLqQNlCr+QLz1fAuXrOSaD933X4ypleyNBsE=; b=wLSuEGURVjWaVn
	OAGFyKNokDIrk4Uk+z/dHNExyP0qzvN3eUQVidd+8zyK/C4lEf2JDrH6+dEtaYKyCDMQV4v2k/tIP
	j1M+h1up+u7KL34cFDmsosM14XN2Zp5iN+W4VsUU+/yWF/vuikpvNzZC9m5FvUmzZ1GeCv5eb5sG6
	oVMq5x263ugLZfGMA3l/Wlv/NmiIf07uxdu5hw6vtkcYHtEsnY+mpc9AY5rf82kFZ6CZf7PD3i9BB
	Wd3CMHuJny6Jm+wSZ9pH8wZvMj9JCDxxmxo6Ca0RIQDGtjGtHTLJJiLoRlx2TsY91ZCsBoAXnQDi+
	/8ZxD4j0kSRL8j3pBRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0Bn-005Bnu-04;
	Mon, 24 Jul 2023 18:21:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0Bi-005Bmy-11
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 18:21:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666edfc50deso3006172b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690222899; x=1690827699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUjvqdRzTdfDkwicizCwRYFy04Vl/AY1lqkB/hOCjo=;
        b=br9RkcEvcXtV0Fil4emk4TsED2K9yy2SzHENve3KeNHExIgHdCbjnC7ECrSJxbGkss
         IXu/FL0dtAPTyX3fc7pdybmCRarz1i585iMUk1BPPvhaZtAAwZE6uEFtx5yd9Vh43MS+
         432ztBbXleTVkWeyoX3Tc3juGLyr7Sb6cq4iVADmVSRKoKkB0zHB8x35QWgNX9xNYfMM
         iRPJzwjK/0KUEdZYXxkCea0gHJx2VNoJDgjKMVnNmKsTnG7gwEdLiujzmsl3xuwSzBDe
         ObPIjRoN8rYKPf+nV1MFbUloIZSKjqx8Q8355INOVgvYkZgMHKXccf4hCxYtfyygE+bf
         PMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690222899; x=1690827699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUjvqdRzTdfDkwicizCwRYFy04Vl/AY1lqkB/hOCjo=;
        b=BcG3GRjzch9M/bsmVNmlZXp/exdsGYIRgwQ6P0GcUvNwB/skbeWzYMepqEeN+zrOxc
         qpApci2GhnMkPK0Md9H1+pkAxCSe4j9YNrFN/BUdlKp1pjN+HCCvsLT+f6FbyfIFE38n
         ++UI0LVa/8C0EXC/xfnQWgcbmf6L9zdjkrvVi+b8Hd7CagQGwUYV2YNbWBeO4Cic0UZF
         33IUkOE9WqrCN2t2jyHrWv4H9EC98xsNqREclgpDO/bOUY5As+T+LF9Q4nz57Q0tolJG
         VzH73EtCDsIwDSEEoqHOpQ9HKAQA2gaEuA21hflfhqBE1anG6iVxg6QduDDCv+A0ykyY
         71ug==
X-Gm-Message-State: ABy/qLbpgL4H82Ck8MSHzAR2yfFrVvyLYT0iOub680NiWJUFcWaK9wtM
	kFbU7U7bT4FfWNko+JbEF0E1ng==
X-Google-Smtp-Source: APBJJlGkIVhru3kteceAqIxz/2TdYmq94CKwcauG2anD7zgAdek+sul734EOBuPyGbjhwmrL16qKyA==
X-Received: by 2002:a05:6a20:6a11:b0:12e:caac:f263 with SMTP id p17-20020a056a206a1100b0012ecaacf263mr13293078pzk.20.1690222899380;
        Mon, 24 Jul 2023 11:21:39 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id g20-20020a62e314000000b00682b2044149sm8007620pfh.4.2023.07.24.11.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 11:21:39 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: change TH1520 files to dual license
Date: Mon, 24 Jul 2023 11:21:29 -0700
Message-Id: <20230724182129.843687-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_112142_612964_40DD6C81 
X-CRM114-Status: GOOD (  10.73  )
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

Modify the SPDX-License-Identifier for dual license of GPL-2.0 OR MIT.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 2 +-
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts      | 2 +-
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

Jisheng Zhang and Guo Ren - I thought I would post this patch based on
the discussion in the thread about the BeagleV Ahead patches.

Message-ID:
20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com

Thanks,
Drew

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 4b0249ac710f..a802ab110429 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index a1248b2ee3a3..9a3884a73e13 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 56a73134b49e..ce708183b6f6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2021 Alibaba Group Holding Limited.
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
