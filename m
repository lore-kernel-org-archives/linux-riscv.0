Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD2CEEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5alaYA3/JrqwXbid1tv420K4rqJraHLvqz+l+tjS0iU=; b=lQHgzKrCTJYSij
	bOVtFwy8FJ4nzW69OfRSd0tEnq/3q1NJ75qCHbmEgDCynHMg7SAzNGSKK+310grDUQfjhKFbeiyYI
	voVkX9VeuhXGg0H0fxhlKFQLIJAMP++VWJvaGhaeen0nkFJeDA3VvOpLzAUnN9C3NScrB07p5vzlQ
	98ric5YCxH9EtzoKUpkJV6YuKl0mSnS4YzPhHSL7Gc5dX/hSVRHd116lJFBx+tFLbj9LCcvNESPCU
	I8+emPuB4F+FYakvgZlqF1RU1muyTx8BnrXwJ6SjZ9rabsji2VKAlglFhi/1heabDKSeVAd4NnoSJ
	HjlMyKgewRG1+FAY/llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4B-0000000ERAh-1rUY;
	Thu, 12 Sep 2024 23:17:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot45-0000000ER3u-06aP
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d88c0f8e79so1264142a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183048; x=1726787848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDHpycfSyd14eKEYNZ2Tiwh37NTkssfzdaJprWVmYic=;
        b=ZCqxjLHEWgrhIFreW6lLWySdXJEw7KdUH0g4kfW7Iin13/V6aK2hYh+8BvokhqoliT
         jwx5pRNBWbBilYmYoilA2YyfTzY7ZvS5SXQLo3/74Mm4yaTB/6TVlr1Ru0BwahJDSs/G
         0UFjpGpDsNWcYlV/A7tQ0HaD7h1Bw3q7mQsJ48AdzdShPw565buMBtDC8LfB83J4z2Go
         4VA2xLkeflv5qBQV8Y9nfozOUFOLSGBP7ukk9TLOHRM8ftJsYadnzvEn1Yot7l73Cz+k
         fbtL5zgzxpXDCLuSHnvWXvom/B0iEgZViS1veYmwyeoyL+hcun5Z/IVMaMDBzL8V5P3T
         TuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183048; x=1726787848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDHpycfSyd14eKEYNZ2Tiwh37NTkssfzdaJprWVmYic=;
        b=Wxw7s+rsX5LX79ca1osvFd0zzJ1HsftR4rVu9TC/HZOv3y375f6HhEWkgiKBguVqGe
         7p7XLtu5YDq+j8/bsEFvdBobHu/7OXxQibvRzlmcsXDTSDCnPCMd3Hqakma9PAWPa+C6
         /f13fRJR3rjwh9UTuTbVIZ79+ooTbzLIQwUxNRl1rShcOuYpJrTZAoYrJ9FFsNONgnhh
         yuSDBRU3jc3qw2f93JccamSKf+H9A6GLMPiqK9eHjnaDILriBpnfvr3dYfx72RzI018/
         1/68vp1C/fpEYuk3DBjwYj/Si/2ZvaDadKLBHMqVjJYzegoq2nxrnLDGj2AIDDx3nZ4W
         LadA==
X-Forwarded-Encrypted: i=1; AJvYcCWdMWPIOeYlTBMOqomCMKP8/wDCpjs74F+72hOvqxRiIbLvKbZDTNZvDTiNewPuJvYhyW7K8l4ylKK1/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyry6ZuUwyFJt9KdYJf7NUuo4Yim+OKkXNPW5HqrtLvDz+Gp1xb
	CUpGegAItuedJ2CNMSu+drNRsfiG+UIwl9jm0ZP0pcdfjLH5JkwXCTzWjHwMf4k=
X-Google-Smtp-Source: AGHT+IGgw8wuv6wUiP6Uqm3H0s61sB80F1WhERdlqMkwOmwPP9ITQsqy/bvbAfvC2aqbyGgjaY4ahg==
X-Received: by 2002:a17:90a:f2c9:b0:2da:6a4d:53a6 with SMTP id 98e67ed59e1d1-2db9ffb3672mr5841992a91.19.1726183047961;
        Thu, 12 Sep 2024 16:17:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 05/30] riscv: Call riscv_user_isa_enable() only on the boot hart
Date: Thu, 12 Sep 2024 16:16:24 -0700
Message-ID: <20240912231650.3740732-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161729_376211_6B7875D5 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Samuel Holland <samuel.holland@sifive.com>

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 2 +-
 arch/riscv/kernel/cpufeature.c      | 4 ++--
 arch/riscv/kernel/smpboot.c         | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..ce9a995730c1 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void riscv_user_isa_enable(void);
+void __init riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f7fcd23d55de..41fd0be25bd8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -919,12 +919,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread_info.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..e36d20205bd7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -233,8 +233,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, true);
 
-	riscv_user_isa_enable();
-
 	/*
 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
 	 * so flush them both right now just in case.
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
