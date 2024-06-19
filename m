Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DCC2BA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGREuITA/k4QcuVmh2sQhv0Si5U2a1T7/IEdmVsgx4Y=; b=BUayzJO4uWn5kG
	XkxJXIKPVJuH+BvlT0Ia4dwIoW14x38LybPp0WRO8a32PxC/jjzOZvkkgXIhuVyETZ/WgpNwKr0Ho
	/bs2psXHqQ99x8wUmoqtKlC8Ch4kw0Sc+2kxpgOvm2Djc6AZdTFf9T4FgmIr8ZfRWH4WjdGfbCGtM
	8tWR8wr8R+vheveJoF+OR7tIztpeRV72zRfpNTA822SvgUjM7gfU3Y+ZXYTeXD6UoLQXTH4XNJyy4
	dmV/NUaBhkSJd/seZSYlZmS/K5ySqRO/zzNXDOzmhQYKjdPHz+vUS/qS/3HV0JxXIBd2ZXySL/NTr
	w1m0CAfC6jxBPJfKO6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BT-000000033pa-0k3y;
	Wed, 19 Jun 2024 23:57:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BI-000000033hH-3yBG
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f9a78c6c5dso2862075ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841456; x=1719446256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOKC028yPYch1Ke/tNFgblYoKhqz61EWi9uuPUKXmbI=;
        b=vV5fVFeLW9rPo3rIJj61dAgtJYSCvvtQU5apI+JUcJuL33U1+HedOXvBX4tAKYwLiY
         4R4DzEtyDgMLzjUxs3LVu2G6+FjuegRRFBE3cEh1uv/jFo+PM41GL9CkI+hq5cIb/pkl
         zDXgpFoivzC16vMMEDn3JAyB40YCejXzDYrMs1qX7w3ue4Jd00pwFd1ethcPqPbgmu4r
         10poGSvpKoEFjnVFHjQb1wQacFJW4poWfzKAKhuMhhoy1Q9cq6lKjUrhlCXZS/gQt5CA
         IeXppSMzpZayKFR167OAKlA88Y5bXYgtPyl5lWA7Tfnssys6Io9erNFsM1czSNn4oVu4
         bKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841456; x=1719446256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOKC028yPYch1Ke/tNFgblYoKhqz61EWi9uuPUKXmbI=;
        b=oFNd9t7svv9Bb+DVScjEHd1kH4s216OObcw1aiJv9ZJvi4QURqfQE5KNZxaEp2wkaC
         c0BVg5H7Q6TF0EE7HUFdF9++BpVMX4TIt2jz0n7kjAfGx1clzN8/l8PPjPWJUo9u7oiQ
         z2WGRkaU133h6KAK0B4aGvI1hvCYow4DQ1VtSlaxmTaKehIaBso4Sp2gHMGw41Td5X2Z
         cRVGLv4Pt1NQxYuUuY3sEeyCphRSWMDgu408Jemef7fc3I17LArGofadLQ0zQoOgcrn2
         VY/6xNfIFGFGZUhEmIRCW0jUSahTYBjKhmQwM3fqsvp/2ymUwACjCxq7ns4B8I7kmc6X
         EAZg==
X-Gm-Message-State: AOJu0YzqsYRz8aiNjuX201lP/Sm+rYgT7Yy+Q7q/TlqEDliIV0yyC0uX
	DOpj7IRHX35aaDT8TLfeHNvdbtUBnkGkIjoMRBFGLXlG/o34nXSGJ9M6vDZtGQs=
X-Google-Smtp-Source: AGHT+IFqbn5yDjdLuA+jmVCUC+AKSwQqm6gIyqYTL/7HDqAlOYnC0GiNC9kMe2pGkJv016qHqQlvFQ==
X-Received: by 2002:a17:902:ce8a:b0:1e0:bae4:48f9 with SMTP id d9443c01a7336-1f9aa42e7a1mr42022105ad.32.1718841455977;
        Wed, 19 Jun 2024 16:57:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:18 -0700
Subject: [PATCH v3 05/13] riscv: vector: Use vlenb from DT for thead
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-5-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=4477;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=qOY+VtIcVN3hdGAY4IcChQJf3hAlNIfnJ4uQBcO1roI=;
 b=5TtfZAlOuc3utVE8165Rd1ndzsCNKmNfY7QEK4sotjq15ebm6/duI1KY6+rVJSRLQdq32XI4l
 PAI0/EWD9igBJoT4peFmtuk/6aM+wKPuepV+Z2Wp4b6GhpYHw4AS2bC
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165737_288122_8F1A6508 
X-CRM114-Status: GOOD (  20.85  )
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
index b029ca72cebc..e0a3164c7a06 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 thead_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2107c59575dd..077be4ab1f9a 100644
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
@@ -625,6 +627,46 @@ static void __init riscv_fill_vendor_ext_list(int cpu)
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
@@ -689,6 +731,12 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
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
index 6727d1d3b8f2..3ba2f2432483 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
