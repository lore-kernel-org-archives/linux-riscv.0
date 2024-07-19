Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB49C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HdeUzPkl/wIT/lAuY/GN9VrNgg9HIjB2hY600SebDI=; b=mtGZjcfNHa5xfk
	sRY9XjdR/Y+5HxrFvwXBcC9oGNcqF9/KXqi+TD3lMZnVQc5h3xvcCWDyyYG3+rShbUSUdBiwUthhY
	6J8JwXOxBa/tsRY/DPB0DHvXSs8i1hglqatJEuNbRPte4uM8W7gyhbJbdLFFpJjdsDZl7zkhpmvRs
	eCei1ai5SBz93A4U/R7Vss+jl0mnwZ//sQIyNWUq2g/0lwI+n2VGwDVNKNFxevqyXsmG7tsc2S9oU
	HY37/qI6lfamJ1xpTRvik8D/F4j0YXL+TzWrGynuagqCxH7TS8vlwfseQhRZN9P1yxbL9Htl1jxAV
	i6WrTvJofb0Wk0CQcIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKG-00000003Eef-1dKW;
	Fri, 19 Jul 2024 16:19:20 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqK9-00000003EZ9-3yYM
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:15 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-75cda3719efso1341801a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405952; x=1722010752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o2be5FktIdX69DunJPm+I88K7Op3K5NkCKgmd4N1yw=;
        b=xMrWILK0PfG1Mo+vbQOcMABj6qudEKsEY0gZCDMz+wdqk5YnXErmWOzLk1CSa5KT8z
         Z3xg/4trV3f19imL/PQ6HBc+Jk/w2XCLv1rHCxC5l7+tK70WbCP18sgyQpwAv2peGmE8
         OJTkPPWxFwG0WqlSGCstJH8fhnJigKqchqjJ1i60cAG4XkNyYf4BRWUTXxoY2GCyQmQ4
         57w/l5arEHWu1G7sIS5ktFQgfXqyZEjE6MuK9cJfk5vEUYont7+RAejy3G+60NLZTvZD
         Y+h5FjuuC8rBXZ3OImhUIVXAld/wiay9oiur0jD1cQqcYTnXeIIvHTRl9vCXq6wcldUf
         B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405952; x=1722010752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o2be5FktIdX69DunJPm+I88K7Op3K5NkCKgmd4N1yw=;
        b=kh3SRkieS3UgCapWeDklWniQ6WMlENOedJmrZDhkQPi0ysn0CvGnxNpZaCo4bAR/Qd
         retx0lGFwufnTWG2ffBpN9W0qVBI8urPU5hUfUAhpOovazPkrSZ77YfCgyv4BrXcXe22
         /iLoXg/sdjdxmV4/jh/VxFjTK64SjwIgjKOCWSIb+NWNGS6EfrzL6c5ONmwXBKS+VZOh
         YZv0Jwq3z0+eKfmf3ljwSDTU3ENwRzeZiWX/Se82/qi7EGwb5AzrBbf54gEJa8WO9DWm
         4ItxMXYGrM4szaR88GY2n1+Pq/TvQrRHmk97dmoWH7Er5PCTekZpUBs75nkAn5FL5t7S
         vx/A==
X-Gm-Message-State: AOJu0YwZrlkaTclMlV2Jf8hgx5Y+tcwlHg6sj4ZCfCec8JHtB5qThxE2
	vRtHPtWF5xfPxrwh3r+cJrYCB+gxIZgbFTsawt0Eba5QYo81PIYXXp5WNRGzeHM=
X-Google-Smtp-Source: AGHT+IFgqptzibPvt+5pwhHE48QCFnZlAw2nhk05Xg+M6oivXTZs0m6YGapuefqcLICXcT1uuLeGRA==
X-Received: by 2002:a05:6a20:7343:b0:1c0:e46a:1639 with SMTP id adf61e73a8af0-1c3fdc7bffdmr9817499637.19.1721405952479;
        Fri, 19 Jul 2024 09:19:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:00 -0700
Subject: [PATCH v5 05/13] riscv: vector: Use vlenb from DT for thead
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-5-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=4541;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=K+roXVx59nBWzGVd/j10XnzknGtMw9TY/ZlmKWcsED4=;
 b=KFNiqD0jbt/q5ZJLj3DisDT0jaKnMkot671Ib+rlhHiFbFJ37qtP5hySngtI/4oVbcG0afjlF
 wrFAOybyfGlAt7UZSUZNjohWY1BV5eQo+mT0Z3LeEZ/Nyp5/hFP2Oey
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091914_180129_C6B7ACD0 
X-CRM114-Status: GOOD (  20.62  )
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

If thead,vlenb is provided in the device tree, prefer that over reading
the vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.vendor           | 13 ++++++++++
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 48 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 9897442bd44f..b096548fe0ff 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -26,6 +26,19 @@ config RISCV_ISA_VENDOR_EXT_THEAD
 	  extensions. Without this option enabled, T-Head vendor extensions will
 	  not be detected at boot and their presence not reported to userspace.
 
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_XTHEADVECTOR
+	bool "xtheadvector extension support"
+	depends on RISCV_ISA_VENDOR_EXT_THEAD
+	depends on RISCV_ISA_V
+	depends on FPU
+	default y
+	help
+	  Say N here if you want to disable all xtheadvector related procedures
+	  in the kernel. This will disable vector for any T-Head board that
+	  contains xtheadvector rather than the standard vector.
+
 	  If you don't know what to do here, say Y.
 endmenu
 
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..28bdeb1005e0 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 thead_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 041e5e8f8312..bf25215bad24 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -37,6 +37,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 thead_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -772,6 +774,46 @@ static void __init riscv_fill_vendor_ext_list(int cpu)
 	}
 }
 
+static int has_thead_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
+
+	/* Ignore thead,vlenb property if xtheavector is not enabled in the kernel */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			return -ENOENT;
+		}
+
+		if (of_property_read_u32(cpu_node, "thead,vlenb", &vlenb)) {
+			of_node_put(cpu_node);
+
+			if (prev_vlenb)
+				return -ENOENT;
+			continue;
+		}
+
+		if (prev_vlenb && vlenb != prev_vlenb) {
+			of_node_put(cpu_node);
+			return -ENOENT;
+		}
+
+		prev_vlenb = vlenb;
+		of_node_put(cpu_node);
+	}
+
+	thead_vlenb_of = vlenb;
+	return 0;
+}
+
 static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 {
 	unsigned int cpu;
@@ -828,6 +870,12 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 		riscv_fill_vendor_ext_list(cpu);
 	}
 
+	if (riscv_isa_vendor_extension_available(THEAD_VENDOR_ID, XTHEADVECTOR) &&
+	    has_thead_homogeneous_vlenb() < 0) {
+		pr_warn("Unsupported heterogeneous vlenb detected, vector extension disabled.\n");
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
 		return -ENOENT;
 
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 682b3feee451..9775d6a9c8ee 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the thead,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (thead_vlenb_of) {
+		this_vsize = thead_vlenb_of * 32;
+		return 0;
+	}
+
 	riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
 	riscv_v_disable();

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
