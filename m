Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5881C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LpFR6f2yf+CFzFEgnApZ/6l/6bfT6Uckb0Ey4q1bxc=; b=snr/3nZtM/6Igk
	UCjrMJT5J5kwL0pwQwNu/LBkocb4vXxleH5F73GAxzu5UPni9dhhLzoIgE/26nZvZ8eE/We2krKq8
	42+yu8eNfig3Mt/Xic1lrHY+s4xOeXm2vMR+tNYyUXiz6pOJvJyqgt5pVHqhWW2v3JB94AHHUw1wj
	WJgOUaHXTvUSw5z+HZyRoe39jeuGT+VXJnZjlQqUe1qiPC05wITY0mFn9aKBxoRLEmOwgktdOpEY+
	HvkzzmHIATwh2ukCrXtfoZgin9Cx287S63658mX1mH3nXdPJMzX+geP9D6vYVEL9wvhwPRms3avbV
	JIgM0G1KPpZc/X3By1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp1-0000000F1Ue-0t4R;
	Fri, 03 May 2024 04:46:59 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kos-0000000F1Ny-3LjS
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:46:52 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-61c4ebd0c99so369519a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711610; x=1715316410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBQeKf9LzcGtRnlVj1F4qxhW04Ec76HXmUW+/7jQ9I4=;
        b=MYs/VsYzAx4i+MKE3hbKkwkgvgI7lEyXlTdcur4w6ZXUD5JqYJaJD/+tbIOKeBobFa
         OHoKyZ6xFGnMC0daXOXAEklVLP+8otvBpyZHK812LoqzaVNPxLUMFWrS0tZuCAIcspQa
         AQb3yYnnbu3km/Blb7ve3nAWGDuNdmUOgm4Ohm3QpLwg8dQPsUAtfCQfE8PFpdNECI0f
         hRdFLos45svUQl9tWjJ6bhnTdXTrgzES4QcdaprFm+mvZPnTCpTl1GifaagwPEYeXbXH
         gRUGGPZcD0m7tsLGgNvxEOXDzAXBZk1RIauI7dtL4Jy7H8Ih5+1D27939syN64DrK2So
         M88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711610; x=1715316410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBQeKf9LzcGtRnlVj1F4qxhW04Ec76HXmUW+/7jQ9I4=;
        b=GnhS54n+n5kxHYvkfpxf19y1lnpJUT7NYi4iKHK3Fz4RvhpeEjEifZ3slIgFxMY06o
         PMdTrbQOpS5r16mRwCgCper0/2sEC7s5aiAng2cKnF0uWjv6etQtahGp9M5+uOZ+7UmV
         K4I0aRLWR6KvEqLSonIjtT49Usg9/Y8FLOlBFd5jRvW56y88GW1obeIOrusDtfrSyIzV
         iY6kkRZ/JASUQNtZZXzT3ZJ8LxTtOicd8GnCsj1SfTPiddm/d0O4ItSQ1sGJtrWts6zL
         7b3b2Lp/tidzzEKoTfvwxTMclVjLyn50Sr3zDE8r3iocLMv5StOBGdqvCJhH8dkW9uGU
         Fw3g==
X-Gm-Message-State: AOJu0YzRpKcuNsfXnOlre3bwW8TjgPKGM11B1Jb4+NvssqFJUrVBpf7M
	bUTieCtBKgLXiHomtYwt61oaTNdXeJhHuefib9Esy2ZPnqvp8Lf8ngG5ZL82nYY=
X-Google-Smtp-Source: AGHT+IGeo3tyFfQWmN4U868PuLMZ0+YMJkIrotJrxO/ZNFtg1TFeJxWfdsDvQ7RmK7l3VFnQ7OcTuw==
X-Received: by 2002:a17:902:d58d:b0:1eb:d79a:c111 with SMTP id k13-20020a170902d58d00b001ebd79ac111mr2479168plh.4.1714711610364;
        Thu, 02 May 2024 21:46:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:38 -0700
Subject: [PATCH v5 03/17] riscv: vector: Use vlenb from DT
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-3-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=3323;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QSPmCsydTyfxAlHhsRmBtynUay/1GAkHyHkWfpyEp+I=;
 b=SRzVfsLTREH64/M8ifdglVwJUQFC2ReeJpmBEWGyVoZtubtxasQyLhUIbG7ZELgLUo0hrouOt
 iE6lPPvY2v6AtXy4mBIWmupBskcHMXnNjNuQXUp8s1btIVmSbd6LXzk
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_214650_890469_03A78F13 
X-CRM114-Status: GOOD (  16.70  )
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

If vlenb is provided in the device tree, prefer that over reading the
vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 43 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 ++++++++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..0c4f08577015 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 riscv_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..12c79db0b0bb 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 riscv_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -648,6 +650,42 @@ static int __init riscv_isa_fallback_setup(char *__unused)
 early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 #endif
 
+static int has_riscv_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
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
+		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
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
+	riscv_vlenb_of = vlenb;
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -671,6 +709,11 @@ void __init riscv_fill_hwcap(void)
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
+
+		if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogeneous_vlenb() < 0) {
+			pr_warn("Unsupported heterogeneous vlen detected, vector extension disabled.\n");
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+		}
 	}
 
 	/*
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..e04586cdb7f0 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the riscv,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (riscv_vlenb_of) {
+		this_vsize = riscv_vlenb_of * 32;
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
