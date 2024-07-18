Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A65C3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaHTef2NRNk3Dv3wb/wNREem1n0pT8PtfLNvvJx/SUc=; b=EoDr6ehs8Ic5uv
	6qRT/hEDKlrJICPflEbttqB31ipJsUNAcPfRqoW8UJ/q+m8TMX6JxvRB4XykmWkzWfPOL0cNSKj+K
	YkVCpCfQn3XxezYUisUcKDRk/cqplQUWfPL1breLuZX/BVbHeyuO2WMX5HcRO5RaVGEPGVRdUDEN5
	SH+Xo1EjzyyZUYTwCSbxRIrjZze/w+d6QadlwjgKLnCNwvUV+WnBVI+LZ7TVu7H6bfwF7Gc9tpnuj
	yszdPGGjjBi155EpEnidjXwksirjul/qjjtp1W+SRZ679fR1oiBGYNknLkpNCqQvoOSnXE/OMsDVd
	3dXhs+O4kIOGTGpmlAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJn-0000000FIGs-2DPO;
	Thu, 18 Jul 2024 00:48:23 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJi-0000000FIFV-3QEK
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 00:48:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70b07bdbfbcso1127501b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 17:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721263698; x=1721868498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFld1vW28kOoabvpVtGlz2RoBm7PVswCH1l6QYeAzTM=;
        b=mNI04PIHwvX64YNByPSyDUik0dy/FYDB4XhOOHWgmhzr0iUZmYbuDkKs5PdcJ84zKB
         iJkwsD7UDooCd0deKwz6J2AD4l4Z+8gWcjXsqysBfd1QfX92gIh4nXZlWs4vWI9WyVmy
         cmzPeKW7NDUVMvkEBQ+0eQSXinAqjtQE9X8dxDWBFkeAoYk0lnPfewta+SayuVlr96oI
         Tl6ijF5zyidjo5aDt8XV1Nz6ssaIWvfw1bprSi0mK1qxnSh5wwsXzl7aXHza951vFCzR
         MCUUaTlLLv+FHCq4OUwizn5XCI2EIMoKP64ZLJx0aGhXp7FBtLfffqTFG8K6HEQHZ8X/
         qs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721263698; x=1721868498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFld1vW28kOoabvpVtGlz2RoBm7PVswCH1l6QYeAzTM=;
        b=YARKRRx0H28zKzPXzzmsF+T/SoVLrZTdusAWnIHzuXDx9J2ywrgi8p6c8biliDzfRp
         /QbDEt8JKAXDrL/xqHnkBluEWViEA4fwtFLItR9bMKfqFjKACAKCdMF7YiEVB7p+3Iwa
         nhWLpzEj18CKvB9w4GY3e8RZnLmokTn3uCbItFaiA6klJ57XQVBuKx2z5vO0PxFDg0av
         paoIjkOkiKuwesb6yRvvi0QkpwfsoPIeeyk8Ku4RQ+90rNTJZDbF5rpic8KEdA73niQ2
         ctTVC98NjIEH7q9sSz0j6iTFld2BgcF8DUYQVbwSnyzsfATRd+/v1tdMx/bCYo1I7X+i
         02Pg==
X-Gm-Message-State: AOJu0YxJmIHQZ42z76ZHDstjsgVfUmindsPB2KylHzdpvcqIbzSPWTDQ
	ohygHfY0TSHX4Lj3AoqIdh+yeIP9mbTw5IGiu4cwGltdWHk0Y7yUE//C/0jYW4MUyXS+rAB3vu1
	ZUeXVoP8ihuEoVvfMfzYOK6nlq1PIOHEdjUCHIAiVV4VDXSSwZNBOIr4OAGieANhfXlN220cPO0
	p7VMVRemzkYLMqldeBWSCS65viNZLVQZB80U8g6ysKkBXszKVBjcl7QNIp
X-Google-Smtp-Source: AGHT+IF8mHZFxowkJGrx83wri8IP0GWRoDPRyQHAkdVWFwQ+fv5skyg8lghAXu3kMcXnk8PDhmI/Og==
X-Received: by 2002:a05:6a20:12c9:b0:1c0:e225:b11e with SMTP id adf61e73a8af0-1c407846c80mr2231878637.13.1721263697497;
        Wed, 17 Jul 2024 17:48:17 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d53e4sm5694300a12.70.2024.07.17.17.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:48:16 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v3 3/3] riscv: Call riscv_user_isa_enable() only on the boot hart
Date: Wed, 17 Jul 2024 17:47:56 -0700
Message-ID: <20240718004808.2246354-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240718004808.2246354-1-samuel.holland@sifive.com>
References: <20240718004808.2246354-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_174818_883323_215EBAAC 
X-CRM114-Status: GOOD (  14.24  )
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

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Drop use of __initdata due to conflicts with cpufeature.c refactoring

Changes in v2:
 - Rebase on riscv/for-next

 arch/riscv/include/asm/cpufeature.h | 2 +-
 arch/riscv/kernel/cpufeature.c      | 4 ++--
 arch/riscv/kernel/smpboot.c         | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 000796c2d0b1..7670792760b6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void riscv_user_isa_enable(void);
+void __init riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 43fdae953379..517035356107 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -875,12 +875,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 19baf0d574d3..0646f79e0a02 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -235,8 +235,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, true);
 
-	riscv_user_isa_enable();
-
 	/*
 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
 	 * so flush them both right now just in case.
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
