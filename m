Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6BCAC597
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNRvyp3XDi+23ziBxYmIcQqY2tzshcriC5TiwYeuNgo=; b=L+OGvlP9X4i61n
	UuAgkZpfstu1CfbOPWvO2sEcj7rxeSrYWZ+V+YbrfnBYWrqrk7t8CM3s+hMPwfkBR59xrd5DWYj46
	lQcb8lHWQjjx1veTapuOt55QLePeW1FjPntawBfchOFu244Lal+FLtOF1EwR1yGizJjCnUmjcLZR1
	TiUku4aSJPnVQJiO+UC/VCSIyYHdDfQuRZushzxhllHxDKZ0/rOI7lolU65C3XRE0gXZ68LlF+EH2
	KCkoSdxkupbfSA5az7m3LSGBV3PK1aM/3npgpDy8kHrxdhK4awe4+thBP2ovIeQYVWPAkHSVrOxCX
	rHH6nsduQQgZ+moWeAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVR-000000018Kw-1xb3;
	Thu, 18 Sep 2025 20:45:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVO-000000018Ja-3Iix
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 20:45:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77d64726e47so986942b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758228326; x=1758833126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFIFdbIH/bKvV1avROWPNI4zxhkvHd6hfIAukKkVczI=;
        b=WpnjJ03bQmWFvpEubPpFJHSI4qyQnqXczlYj+GVUtVe0MUEKBfCfNME0Czb9mvbf2d
         X0313sua+QvP3+8it7EsJgOAomeKd1eTrPDLS2he3xteo9lATFqgs2LICAP/puoxhAFJ
         i1tlHIJwexxpBTdAeLFT6hPr3PlIbrDdXT950FsNJw3NE/gRyMD5mgPKC61NGcotmkTs
         lcMJObe7VCjvquofr1sYYCUtkhFh0imr5Djd6j4j5mXDt5z+Ke3DGJykpstrXiJhDssV
         ywuIUWNfySDdLQHTn1cRaOi+Myl+I81B6OlrTBI0uG0O6mHBMg2Yw7p8bOt7VgMwE//h
         AHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758228326; x=1758833126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFIFdbIH/bKvV1avROWPNI4zxhkvHd6hfIAukKkVczI=;
        b=tNJde0YskiPW1KTtPYWx6QjRwrZQWZxalVJLajQC7EfGqdlJXSdQ/Dtyu0TCr1BbqA
         kiRuVpEkKm+2TPPuoRnOgZz4Tku8hX8uKri4SXLTCMtGnG/EW9x6vGQco7aaW1wKdYzl
         rBV4c7tgcKjJ8E203Kq6EX0ukqlLPws95Mrdt5hT4GyNtSUM+Xvbg1V6te7w4qoOWBWi
         OWkummzFP3m0iXf3zsOCLAivpgOW/L16Y705V2dYNvpwLliWye/x1llZKmStjw78fRen
         hFnXsjxwaNBJe4q/QpZP6eD4AOmcAYCNOpGpGEzcUrBkx83edhJlfQHBO4vmpfsVWeVA
         Z1CQ==
X-Gm-Message-State: AOJu0YziHqwGMaWI+7FkZ0sOTMgBAmlWl1XHap03lcKdjHI0DNhSgHJV
	MkoySjxjGuYGYc2cduJ1JbLW/mWLcnPCOqXmKRIoG3+WCwypC5QBAFJH
X-Gm-Gg: ASbGncvRORN8Kp1t/XHx+5ejX7K5n8F0OZ7rdjnjd19XXUHuYAY0row6Me1+b+Ss34e
	a+hZtuXwQjgP+Iao7AuotNtyUgVZFs3ZX3EteGam/LUQ+YEjesy06UfKap89jM5RHA3HC/b2ovX
	yjWkX5tPCE9RqKPcI4K39jW9/V620xeQbO98vGBpjgZMij9PGg7dxLgwptvvaftRjudbnkdIOZm
	ktIvrCoQuyfmLZlNGzrlmuIRLh6Go1X9ofB7G8cOPCre4oSjkfB3bYpdJRZybqEVnyTIXgvsdf6
	WEP2z5NB6o59baFQF3X/uMBrm1BI+SC8iCVUlorIA7mu7BE7dR04XIeLB8PkfAcLjMA+5ZvJOFV
	tHoqhdCKF4f6/cWIhMH1apDihYOWcBh2RaF3FKwrwIdZemRXYXYY=
X-Google-Smtp-Source: AGHT+IHMX2wzLIuP1H1OYeeMGVJI0rgVYaYF6wG5yHwKshxuo1aOWGmuNzZXnQ/jUOJ9+eorBuztOg==
X-Received: by 2002:a05:6a20:7344:b0:243:c274:1a7f with SMTP id adf61e73a8af0-2927277718amr1294133637.46.1758228325445;
        Thu, 18 Sep 2025 13:45:25 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aff2sm3178181a12.1.2025.09.18.13.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 13:45:25 -0700 (PDT)
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
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] riscv: dts: thead: add zfh for th1520
Date: Fri, 19 Sep 2025 04:44:49 +0800
Message-ID: <38abc793c2fcb9dd26c89bab10dd4450d91ced4c.1758228055.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1758228055.git.rabenda.cn@gmail.com>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_134526_828749_3B378348 
X-CRM114-Status: GOOD (  10.45  )
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

th1520 support Zfh ISA extension.
It supports the same RISC-V extensions as SG2042.

commit cb074bed1186 ("riscv: dts: sophgo: add zfh for sg2042")

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
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
