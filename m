Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDCAC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9fG2j5IyhqZf47FJrMUecoJ5jMsOAIVwtQ6+1Fx0Ak=; b=KikTy0Qmkkbady
	+e15XpiXnJjkgxVzjzQkKUm6adr81s7TZK6RVNXieskJArxtp2mjqXaaxjQqcNcLLtsMrUmanrtCy
	fL4Di7M9zB2gqoPNA07xJdlwcZP73TybdTBEoWWs3kHUa+tFfNMuqyS0ck8WJZDf9CG5VCD1O0zuP
	r9aVUN1SjtXAlWAM1UgLDCqvJgo9ALAx0bIG2pZq/U/2vx9kj+AoenrgqD5E09xFoX2TaV32fQA18
	+eYsEnmWTN/4sBsuVX7cNOX/AYYF2wjnV262FujcVs4102kvbauaixDpWqTZad+YEevSL3C9L6uSs
	S7rftzalprLTHarrr+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi63-00000008nBv-3SMo;
	Wed, 18 Jun 2025 02:00:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRi61-00000008nAU-0Ilz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 02:00:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-313154270bbso6933467a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212012; x=1750816812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=Zo9fhAFoMnGGraRHrzzjBf/qmf50IpOnlVSUrwZJMr4h9ZybnQQzPGhdfCsweMSEMy
         E6xkl4CVSbBoM8eOPXtHI+vmvuzAWLJ0yJ4rddFKVwLPHC/s6jqsc9zREhhxACq7SBQP
         gCHv5S/SzlCFS8Orf6Nieyhp+W57zB0VTGQgWnJZpuW/XdmvrN6Lpqj040go1Ejd7AOF
         6ox+qTGZiooaDNh6Qd3TlMNU7AkjJiKVsbDnE2XF9BoXK+dIrifLE+yWMw86nQVDYBNL
         1ljILtzTyo51dYu9O5P9Vh0jZwmwd8dlfCTRG+cL8StFrHNIx/ASxFQnLW5uQCFVcDU8
         XoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212012; x=1750816812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=CaUhltiTIZ0HlR5FAnLJ1isp3Zby67XVRR3gIWvTdCdj2zkKDiDTMFfQbBab6xBJDw
         hGIJORM3eJNTtHFf+N53JJ9/mjDvuann5j8IIMzQLFI4s7YBDL4jJXblQL8p/9HMSFWi
         hXbqJzuuNlEOv5j+0lM9yq9vsbrGlXY/BonphPStQLLgRHyIwd8JaMlo0q+8k7vOlsm9
         JqVeM4o7XtRZsbQpnOokbAIkTNhII4bpUVmg2grBoYXXpsm6KWR1V20vksuxOlKCPJ04
         5II71ovHfhxmn+UT+4wu/nQNI8sjKUdhS2+TeNNrOeHoxSWhmPMIHOsrclJ4HqpDVDDC
         fldw==
X-Forwarded-Encrypted: i=1; AJvYcCV4qjrNjeYcKr2yILoVqRy17i7Uajikw/jS0ImcfkevWmIgrHC5AEvo5qmhaZzi5bz+pwfpG/9MdW4Osg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Tejvjb+n1JEgDBIJQUPs3Q35wo5rBnXCcDlE/yx+Uk3145kp
	QdeNMsxgr9u5d7Rda/fNOWIVXKeE7QhDe7/Li9WBSe2rRPaJGu5XtpzV
X-Gm-Gg: ASbGnct22NrPY2cMokbxdGm9e8hEEG8CtpcVyHU2AuHzqclongUXSlH9rN9yRD0iuMG
	g8zqI9fzQfoco0SfiLRAKOD+0UjEyVSnvB+vAuyFiwitu1A26c0HasrwNxaB/rFdEk1Pq4dyks6
	6H71iMFfxWruck8gVOxUDOulr+gVj1oDXLNJ6CHr1hL0pcRstwX3osM9NNqW/p6GvHggvD7zVD1
	rRBnJJGJO6EuxI4yyANDwi0wr638GBxE4eH4ilp9NsitBYOFHHYadXibM/bNY5q/ZbrnXe4AWon
	s3w7zH06UpU7pI5Dr250zL7FsA2xkjfqlLkRM/qhZ/fFeq2sDXPtYw3SaNWtxw==
X-Google-Smtp-Source: AGHT+IHWCPRYDnFWn8oETguqq//0JZUxmrEFYPkvKs/tO5/FbBUcPDK5wCS+PyGgBZWbXbKIFSLoxA==
X-Received: by 2002:a17:90b:28cf:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-313f19d17c9mr29041866a91.0.1750212012223;
        Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bca4c7sm11437374a91.3.2025.06.17.19.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
Date: Wed, 18 Jun 2025 09:58:48 +0800
Message-ID: <20250618015851.272188-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_190013_109603_41447C3D 
X-CRM114-Status: UNSURE (   8.57  )
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

Add MSI device tree node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index b50c3a872d8b..c97bd62e5f06 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -63,6 +63,10 @@ mcu: syscon@17 {
 	};
 };
 
+&msi {
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index f88cabe75790..aae4539dea98 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,17 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		msi: msi-controller@6d50000000 {
+			compatible = "sophgo,sg2044-msi";
+			reg = <0x6d 0x50000000 0x0 0x800>,
+			      <0x0 0x7ee00000 0x0 0x40>;
+			reg-names = "clr", "doorbell";
+			#msi-cells = <0>;
+			msi-controller;
+			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			status = "disabled";
+		};
+
 		spifmc0: spi@7001000000 {
 			compatible = "sophgo,sg2044-spifmc-nor";
 			reg = <0x70 0x01000000 0x0 0x4000000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
