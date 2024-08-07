Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E1EC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/+Mrb5v6khH7isSMLAJGGeV+oQ1HEWPaA47gpodMX8=; b=1YIhXS3Hjl4yRd
	9Z7P+bYDhiLm3Me/KbY6JgfSuKUugBMepnuZaVDFdX1xT4MD+SRix1+iH/1kDGaVk5fd/8H0sZXWC
	EKCfR4pTgGhkdzLi/qZqJY7/TorwOWLzwtb3yBy7YsTY+EFyCT2U0Db0jYaoXQ+mTEGSE4pznhEy3
	r7oPgxksdt1AoEFXnhb1ccIeMdy3z3MDL5nD35rcesrzV1uoP22djaxqeGUmdZgLQ6HV5IWb3tkRT
	bJLD3Jzjt0faaNvkIHyCB5jPbc4aI2JWYu3OPCi1GQMoTI8lUylyYS1s8t77gyP16UMChwfxr0dvs
	8qeQLa9fa9ieRWmeUT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUbE-00000003RBt-2U4J;
	Wed, 07 Aug 2024 00:32:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUb2-00000003R0V-3ZBJ
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:32:12 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3db22c02a42so775506b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990727; x=1723595527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=wWq1EpdctIjS3iog6322+lUVuNoO2GZW83AbnLotLQ3wSOBb+bahB8WM1IKQXm5LO7
         us6dMR88QapPRDispFViUPebbSI0pqHRVdCF3wuaXpWsPDtPcIM0ai/E7BBPcBFQVz7t
         q+pOprbwwP1/BJLJap6QFFYyx0q3ArD+w6pMFEB1KJmpEotYl9Jn7xrcta0/XB0OzH+m
         3GA0KM49blaABesU5EwrlXxTpxf1T6tfau0FV0wXqGR1Dxdp6KyerAp30k46UQEtnfSg
         XfdjdIvUsaWvybTabctRiztD+IyeoX+XsMF+u28M3xzKeyjRQxw8Xx8ZASyy9yRPkDUL
         33Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990727; x=1723595527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=PqKcfKKSHHnd6FqqAsEUHlLxD3eR4nlNkJXuWeBljAi+lP4Hx8PWey7vZGxQ38s877
         l2dJYm6QLst6DGdo93BgauRBY1h/AEiRr1MKvSt+cxI9Zv1n1hOa0JtqXlDlbMOW6xZ7
         rOlfVk8ARvc7zv6ZlJd++0DUMYoKkn1QmtmZPHWFlSdzNcE2Epda/mZhSyXs4yYadMR7
         2RefDpdW18ZK2FJAZWdiKPL/l3jOepOKYh90ya1hklpOztcqj778d6gQPvUGaQfdGaGk
         krGKtv/apbRz2sEaOEXggPo5ryR7WVE1SOlqOMPUWjjHlNOIxCyVRpQ3RrHdwHYaHe8B
         DpFw==
X-Gm-Message-State: AOJu0Yw1KZLRvD9znWhlp7euj1mjz3vY5Hfewcp3tmLew9vG6Uvz5xfa
	A2fpo/n4k70nZdy24KF6PoNyUiGqCFDCBgXiEAnb3BtSlqtOPg/lf5/aRXY9AVQ=
X-Google-Smtp-Source: AGHT+IHqzKeTjTwY0Ng2jkjIMaChA9GIbY2sG0qJ6XgUQbDiYCd/LS4ujzMb8ElUuNWFWcAn/anGOg==
X-Received: by 2002:a05:6808:d50:b0:3d9:2601:891c with SMTP id 5614622812f47-3db5581fedamr22651422b6e.30.1722990727421;
        Tue, 06 Aug 2024 17:32:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:32:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:47 -0700
Subject: [PATCH v9 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-11-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1263;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=R1ruP19VNMYIJ2t74sibaC/YoWJ+uh82rPlu1gqwh/o=;
 b=vR7egj22DaToCJ0lFeXF/Sk8iuiDix41LIpSDYfvyZJw4L8VcHmi0ndy9Vft4en/hY8js4/nv
 GniIsQaMb+HDtS7wmY4nAomw3jUjJ6LXwfSjooY3JOkZbazmUMC4IWu
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173208_987579_B464AA84 
X-CRM114-Status: UNSURE (   8.63  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..400753d166ee 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -266,3 +266,13 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
