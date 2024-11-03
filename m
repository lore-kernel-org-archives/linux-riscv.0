Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7EFD10C0D
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYJQQqxofDBagVMCFXykNim0rz9sMPAYeWqoCHoWjUY=; b=XQ3cYabNdBC8zt
	80GcCIa3IZ/8Ut33TAtvhIr4cmUXQAdZhQv5YcVDz3LFwbNt8mOYaITQkNO4t2I8GLABjXRgux/s1
	nFmKiqJ+VC4wLJ1QFD+gOEXGi1H8WzVdODtQYUa5w7ffkAlqTmD0fGTZCLk1eU1M3cffmOcitT5YM
	PEpMr/fECCXAmGujgdmJKhhtNHU7OZ+Oa6auXW79BFmHkETyPGIP7Roqa/1J80WhOftSgOb363V6D
	f2CH53OITQNm3DBua/JI/1RyrT7hRIC9aZldw3VE2I5tqj7vMzalIAPduOuhwTYCXWI4z11xitRNu
	mLmYCSIFDsaUAf0uj0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VPT-0000000B7mT-42Je;
	Sun, 03 Nov 2024 07:52:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VNi-0000000B7RD-1twd
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 07:50:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c77459558so27462155ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 00:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730620241; x=1731225041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKC325jeeb+bVADWaZpPiV68gFL/gz/ByL8ImcIeld8=;
        b=YGKVu5cr2fm0JNky5Z0lMKotqib7I7Z35KA4ZSFVtljkl0nnoA+B+qz4oMD60itVKM
         bfCuk5RvnjvJomn4bEAtNuuURE5GJ/x/LBbwWIgpRFhgmtDm2MM0W2oj7YtNT4eXl18W
         OoyCBKLzLar/m9fKb04hMrIgUJeudp08OdKi3arGbF5GDXiWxQ8kypcSd5rOGm4MREQO
         KS4a90X8DA8SChDEjUob9MNqVHY7AdyW2y6b1oD0o8OqnDBaLuTqXvXJ99yAs11Uz3HO
         uEXThcGXcbIMe/MD5PodVPhP6j08gSm95Q/4kWJA/VSyrMpUg3EBGfeyJZGXv2Zc+Ky1
         mNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730620241; x=1731225041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKC325jeeb+bVADWaZpPiV68gFL/gz/ByL8ImcIeld8=;
        b=t2On0UQTyOHE09zAmY15I73EwAJH/FT7xFgWHO9rIW84f64kGN0cdYoULEGDr98O9a
         96XLeVBxfmWJLrNXlehLYZ1ghZeDuvsWkPq8yiBPGMqpdrmpe9LXlvXlSM1unEPaK3Hw
         rbfFo372JPhV5GTQik+ayCmvPrwvNQziSj2ryVTo+svgBDWswTcY4LQ6sc0hBeOM8q33
         GhJmkdDhKUiTduHbD/LcYDhkbSZQJjNoGU30ardHoJrGym8a2eUopCJeMFjeuRztKX4q
         7o7Z+8howpdbS9dQxtEwXYFCDVvhGEEHCNgD2d7g71P/1JhxJhlMrf+WB7IP7vkCyAbz
         +HDg==
X-Forwarded-Encrypted: i=1; AJvYcCVlRr1qMWKe6Kiv9JWgQ743WbxcgqzxTjvKEaIBnC6zBhHMdlELV+mmuGOsgg8VxFKfNDOnaV+/EoGwkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzh13bEOVDxN1RbqUxDNm6mMZ44SURYEEQa/dPCnqt/uX0sdmf
	6bPqKrorC0izpOJ0XckHKbmO0BUB4uAaqNhLm71NtNMnN88M6PzL5+6MgA==
X-Google-Smtp-Source: AGHT+IEKYPq7oqoeSULfZN24QbWKB75bFPKLNJo6fZCRP1KNJw6SX/2/tkgq6QHogIYQMwPXETbmyQ==
X-Received: by 2002:a17:902:dace:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-210f76d6870mr236020995ad.41.1730620241063;
        Sun, 03 Nov 2024 00:50:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056eda2csm43041595ad.49.2024.11.03.00.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:50:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: hwprobe: export bfloat16 ISA extension
Date: Sun,  3 Nov 2024 15:49:57 +0800
Message-ID: <20241103074959.1135240-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103074959.1135240-1-inochiama@gmail.com>
References: <20241103074959.1135240-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_005042_514454_3344457B 
X-CRM114-Status: GOOD (  10.75  )
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

Export Zfbmin, Zvfbfmin, Zvfbfwma ISA extension through hwprobe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 12 ++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c       |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..8c30dd06f3c0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,6 +239,18 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..95d00a065b4e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,9 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..de1966bd1776 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -131,6 +131,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZVE64D);
 			EXT_KEY(ZVE64F);
 			EXT_KEY(ZVE64X);
+			EXT_KEY(ZVFBFMIN);
+			EXT_KEY(ZVFBFWMA);
 			EXT_KEY(ZVFH);
 			EXT_KEY(ZVFHMIN);
 			EXT_KEY(ZVKB);
@@ -147,6 +149,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZCD);
 			EXT_KEY(ZCF);
 			EXT_KEY(ZFA);
+			EXT_KEY(ZFBFMIN);
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
 		}
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
