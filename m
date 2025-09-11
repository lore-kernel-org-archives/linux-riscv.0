Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A6ECAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wixhbEdzFepjwXmw+HSh6fQHYqYeRLqh6FBMu1DvNig=; b=gcs22L/B6oUMwb
	HGA8YjO3lX33+fARL6hcyQasE6pfGRrqrNGPDEJz2I9HyoiJVXgAis+5WxJUoCEOm6mAdWRkLLbC1
	MUMZLyciLicozpyObya7HSGsCZl8wlUJoWJCPUZQFoEhfq1VXjo520j9mBMInQlIGtFr6W1O0rAAz
	LWY1ioqb6mjTPry7KATTjXpl6xkoi3acjw1uSwBesyyxXJ0HACRkLBsGFZm9HbHGc+NWNHc0xjwtI
	bHTQrTSk7NfCe22Ta3Z7z2sK1gCyZVd+7OOnQ5NOKi9XiQjQ8h9VLsAaHMSGSMsyjSgfC5/lzfePC
	aRaJEJP4Z27/ad9WMyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJI-00000004onh-0psC;
	Thu, 11 Sep 2025 18:46:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJE-00000004olG-221I
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:46:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so957448b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616376; x=1758221176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlAH/xgNhtYxUmFSrUeEXv9Zp05waRSL1IRqf/r2VPc=;
        b=BCc4HnNl9eO4bj32hbAXHFV9tFuDI4FciP+G6KNHVLuygoJVGWze3GdjmA2mOmTgb9
         Hnke8+eXtJ0p7RWn0hzHo95mBNErm8u6lAX1lziUI/oMT2qkZqcsKRkPQ3qT4FCJdY9K
         CKu40EZiI+ApmS/EQms3+isl61ahqZPyabMSilzUCu992VN/fHMSP5EYQzSvedM2zXsZ
         Hen1obiXa7oItAVXoFj+IXPX8Cdle8u2p5KA/r+iUuXgWQ19k42eWMNc5bFCve1wwwF6
         zZWoBnA9qsN++IlDkcE3QcwDif+Vj+cnU5K/eBXqqAcZwzv9ZOL3apaV6x2TaMvQkDzD
         Yb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616376; x=1758221176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlAH/xgNhtYxUmFSrUeEXv9Zp05waRSL1IRqf/r2VPc=;
        b=pq34xMH0CrE1ve6e/7xzkR7xgKJzNfQpXxJMsnjkN+SeRFjTW7f8P8GYKZMawDTzzH
         4sCohSNGnVVzJq0cEXhQWCxYtHhYZiY/dPJURKL8zYaxhtT4QsNqcMujm6bjX686kRUx
         ttctABhDw93pObxKJgo23q8G+e45XLNJrp1O1hl6pb5KSJE7dOViCS2rbF5lSr+a6GrQ
         l0NqnLTZ7zvi65FI78h+mkLWIlFC93B+uW1fihsD2WKYWcQpfULy/LAB3BrIxtKAiGbn
         8s6dHt57LVsCKEKszNwKyZ+QowVOKesZz/xi2a5vjVJiJMGID1Xtm5ndRR/cMBQpktMo
         S0Hg==
X-Gm-Message-State: AOJu0Yx7OWm2zJgeB78bz8TIKcOCd89Z8gLmnS+Sr6YJjBfcqEScNU57
	iE660wRfcdBej+OVl/v+NpIqTQDKOmkL9+dO9shgG/DCzrOxv6KJIFUa
X-Gm-Gg: ASbGncuiGI3venzXVzuFipx7SZRvfRl26FiySHUGleQQnwzoRTXPRo/SXyvIuKRhu92
	m2zHDaA+WEUAAGbTqBnZebZEUBI+HMvNVXbHtFY/YmAnmNJbnn5MTjp8erTnmfFSH2kbA6nbMc/
	Ko9c9Y+umblyJD/Ho45NvP3eIAOGqnOxJMLlueEnMMy2jkoe/yIui0LYwH73IlIUJizzkghMxwm
	bKls7ORULuAIFwkoXSV3YB47L5osRFhHGmXT7Tfz+MLealpqVz8V11DtWkBP6iHFyIdyGgrBqTc
	L1Mgop8evJd7sLOWdzZYctTTPy3NhwtKUmA9I7OLOXwOSvqZ1P+tpTPcbwZi0OVAkoZc+Gwlq2w
	ldeX90M2Nsw61gmwW+h+MbWjUn9yQelmifLmWcice+6fYkaXW5JMnSUSn5K1Ipq9XwmEbmEaoad
	LWtOkUzlnCvvM=
X-Google-Smtp-Source: AGHT+IFWKQQ/DKkLEW8usdep20KmNQ9LFmSRyYY7L7+2Ba5k7KI4Z+F3I8SVvoorqXgeVdlQ3gDHqA==
X-Received: by 2002:aa7:88ca:0:b0:775:fadc:25f1 with SMTP id d2e1a72fcca58-7761209131amr452191b3a.12.1757616375382;
        Thu, 11 Sep 2025 11:46:15 -0700 (PDT)
Received: from localhost.localdomain (static.148.173.216.95.clients.your-server.de. [95.216.173.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm2762616b3a.81.2025.09.11.11.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:15 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 3/3] riscv: dts: thead: add zfh for th1520
Date: Fri, 12 Sep 2025 02:45:28 +0800
Message-ID: <20250911184528.1512543-4-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911184528.1512543-1-rabenda.cn@gmail.com>
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114616_522556_70DB0DD8 
X-CRM114-Status: UNSURE (   9.31  )
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

th1520 support Zfh ISA extension [1].

Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 7f07688aa964..2075bb969c2f 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -26,7 +26,7 @@ c910_0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
@@ -53,7 +53,7 @@ c910_1: cpu@1 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
@@ -80,7 +80,7 @@ c910_2: cpu@2 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
@@ -107,7 +107,7 @@ c910_3: cpu@3 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
