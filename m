Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A03E7E376
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/HnWJYSOKO7MnABME+1/ziyVc2n8dSlCAkPB4LD8YI=; b=Y6D7uoKJEPNpqe
	4hMAXmsT02Bj4Im91xznlpH23T/QoZW1os1/SAK9nrHubgNSSzQpgelnKC73eop6377BCNxnfvAcc
	Q+MpscXYpfOE6RvsLwSA6NWVt8S62VYXf5WKinu46Q/RwzV+OCEi5LWdj+/ozv9nQsQE/XG+fxit7
	JHQmQJmWrCOCmLYJW5CPsrGgqWJS5XZoN25wMRkKhL7CkefNdygW3eErICXKtN7w6xK/bP1Njr4EL
	0sWkcFBUj8niP6DXq/uSbxYAnLOYEVZsDf7sTrdKaa5rCsiPWLIkJX+xA07mxjlrnbGilhoDqXHDj
	gq36unQTniYKdmDd02/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVS-00000001vnt-3dXs;
	Fri, 03 Apr 2026 11:16:06 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVQ-00000001vmD-0chl
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:05 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-89cd8596724so22750876d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214963; x=1775819763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=KVHNtZKSBlcVvSrig/BYgMtwov7SdX4BhNYSctKR5EU2P6LM2mhpRBdib1IeLSSpED
         uczV1MrZ6dxTPXg+R7570pJsi4I3iIVnkcU9ad9uALTaNhr0V2Lhy4ZYnIdc2HHD0rD4
         +NLDhKiD99BBZ4d0EpcaU3X6fQDCfg3i5Lpkg30ueHQajSNOK3/nhMJtD38YZ7IIpPKH
         QuLnYHXnl+ZxqnL0Hd1KOx/MBkQCE9hP/WqPCURYqwN3YNxp0T+JltkSNvuWYzXEI73+
         uz1hxB4qumsr5EEoz5mieBo7cdhCRwxUfhpEELRmFqECjuKqs/UmiDpalhS7pixU0Mj+
         RwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214963; x=1775819763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=myaNyePf9OQM5sL3/oCldxcixoKjetnDJ2M9NXo2qnkeHOmlabO1WUeFu8OhatlIfi
         KnaEGjNivsdV6MJa/bhdIBgugN1f831koS9cDD//m19E4Jta+x9GYg3zEaMP3tAjbXv1
         ObFlcADrb7dLGLMQhu5cLsSfnNYquZC7FMdBxzzDA4IQm0qu/31e/f1wP2vPox1wVyIR
         Q7N4Hev6d+trPxWbkFZfRhbvZebTA+U687tViqL5mBic2yeZnutEkcLqkmNvvf7yzLYm
         /xEK2yQbCkU3AkEIaXYIoTSjXEwhljnKEEeq9FJ2zzDOuKzg/VQ2GxLvyxdNAHqteUYB
         JPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrp5NjwliunCY2nQdlfD2heHv4plbRNaaJoNvlIpMmHiuisp8gwLwBxtUeEWbfYx4PDxi3/D6ojEBv0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YypWF8idnxQnf/nUMst1TtSC6F7j7xweiFMrtmXGc8XrToF/073
	I63E5h18Dwfw+0Tm0kxBEwK8mrCn6N9Dguj0uWPDVA5zwjS2nffwXlH2
X-Gm-Gg: AeBDietkCqfcnXlp3G3v2ILRCJd3v+xZ1ibrBLXIXlV/qzWAiB3KwxxBGoCYczAvYXV
	P92+SXPkiq2MF/PJhCdks25bUT9MVgCas9/cQB5m/psawPJA3wLMBlkMlAl/bJzpRV+SUw2QZDp
	Up64/PjDh9HvjDSEoJsI8rLv23s1t7SgaAnvxfCDfY/ZVb+PGZm+JYKqip6gWFZ8fzXlV/NauHu
	c56CcJuW1cvkTS2vdvFOrfG6PiqG5geiO0OnSQWTCL/WdKWZyD8Nrtk9ZsQdAD9kL+S0A0zem9Q
	+NzySKo+LrttsHPNKF3uYzCET6uFjyLfIR7EUvovm03YhidWuIWQK2ozFtRSGPz0lNqgZcD2YWm
	qHaY36zGvTtQ2YOG9zhtaDcJK4N+jmUbNuoGy0MHk5SAsvCvu5alSpXmINktnqLqnu2Bloi/LYX
	NKBFTwVzzHnYDbxxSUkjYui8SZSfzD
X-Received: by 2002:a05:6214:4186:b0:899:f6bb:331f with SMTP id 6a1803df08f44-8a704bb884fmr39763376d6.41.1775214963119;
        Fri, 03 Apr 2026 04:16:03 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Fri,  3 Apr 2026 07:15:14 -0400
Message-ID: <20260403111516.379795-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041604_196778_2995012E 
X-CRM114-Status: UNSURE (   7.94  )
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

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
