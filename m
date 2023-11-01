Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533C1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaI/kP1aKGI/RMyAMWq6KOwyxBFpPP2dufXK6sgkDkM=; b=Qq+bK4U8i1YSoR
	hrudzeY3SvVwhyMnW4nnUuOTU5UMp6+vUnguPGSyYQyubGCpgMvTy52ajar49XMQkIUX3tJ6ni8+m
	Q+OM6/CwsLLLiEzGpJ9z+yI6N5Sof7BhjZubiNTRYtE2Gk7Vq6vshd0pHShvHTCe/zWddrrT45bq0
	fCRfBJsfJArn7tMfTQvCbh99z0zSsTo4Q+f8ToDFLJmkxC9hI8qSZdG+gtdGl1LNyCxNZT3yOC65n
	w+11bZIYRB8TG6n5Mpjsw1ALihxoUjSSgwMh/Rfadvj3/bFnIW/k4qqngeam8jO4TjeJYtWb8uOz+
	VDz/od0+s8ScEeVDeZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyx6-006NWp-05;
	Wed, 01 Nov 2023 00:19:20 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxywz-006NTt-2c
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 00:19:15 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b2e4107f47so4303395b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 17:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698797951; x=1699402751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=h+GWccleAglOCjmGNoo6tH0kITO6hqLSqo7bOuNKOm9n1/6FtyYi9Tq7o1l1wbK2G+
         M6XYgRj82UoSZOLR4cNq0tjAEwI62Km8OW5Cuvqe4AZ4hUmAH9H1bw7DpgpxcTxhJfob
         4OaNujGWGxp7M6JRIzRuTaokXmBAGLwemhUMylmBjlfLIUAZrH62dKefhayGQt8dv2pO
         +HbhlYfY3TjCzACf8ZwG28Jmd5+0jZ/X4nFGuuFhYUnY/RgNkCxV7p0FLWb7oNkp31NK
         Ezl2T7oL2PzEu3HG7lvilNPOlBvx40vSQgnjhfyiGnZPwLM/cRFOS6e9dxLHzROPeFnE
         a/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698797951; x=1699402751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=AzmBM6mENS+zX3ftVYwQ61xDMN7LFgabkdLqdrOx4t2pcGre94be5ZJkFfXOg4nL04
         eBzkVNylh5YXn+HohDE3VTSkFHTMs1fCAfQAFXIjKoLN3H3IZEx3VBeoFLQ16BPbi+qY
         yYL8E0vyOJ+LWJbpW+wH2FYdeK5XpeQerSIB6yhpOrFftHZghCi5BO6KkNWVegVw55Vf
         QE83A+P9juX1zERK7KXUrqbFaZxlPwKEhU8P0X9bNe3tc1l4QBR0tnXtPMprd18/VStJ
         2uN/Y67uScaJNFAlFXUT+I41PMTiCqSPEknLATTsiNoTo4oFBemMO2WzslWT2IT+4CPp
         mZ0g==
X-Gm-Message-State: AOJu0YxRa1ijP8GkhJ9uFfr4WC46H+0Ps8yPP1gHul7NMb6F8pZAowAW
	+D/KfvZRfHIOJpgptthAQKfY4CKjIGC3TAzWlwQ=
X-Google-Smtp-Source: AGHT+IHgOyKkx/6qm85zvE+jM4hPpexZwI5ClZVow7qu93SXE6cEmFixVe60F6rBM7Xth6bG6pSb5A==
X-Received: by 2002:a05:6808:1143:b0:3b2:e34f:3495 with SMTP id u3-20020a056808114300b003b2e34f3495mr21939715oiu.33.1698797951261;
        Tue, 31 Oct 2023 17:19:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n21-20020aca2415000000b003af638fd8e4sm65309oic.55.2023.10.31.17.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:19:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 31 Oct 2023 17:18:52 -0700
Subject: [PATCH v9 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231031-optimize_checksum-v9-2-ea018e69b229@rivosinc.com>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
In-Reply-To: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_171913_845656_EAE98DC9 
X-CRM114-Status: GOOD (  13.95  )
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

Support static branches depending on the value of misaligned accesses.
This will be used by a later patch in the series. All cpus must be
considered "fast" for this static branch to be flipped.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  3 +++
 arch/riscv/kernel/cpufeature.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index b139796392d0..febd9de4373e 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -7,6 +7,7 @@
 #define _ASM_CPUFEATURE_H
 
 #include <linux/bitmap.h>
+#include <linux/jump_label.h>
 #include <asm/hwcap.h>
 
 /*
@@ -32,4 +33,6 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
 
 int check_unaligned_access(void *unused);
 
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40bb854fcb96..8935481d32da 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
+#include <linux/jump_label.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
@@ -665,6 +666,35 @@ static int check_unaligned_access_all_cpus(void)
 
 arch_initcall(check_unaligned_access_all_cpus);
 
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static int set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all cpus will be available.
+	 */
+
+	int cpu;
+	bool fast_misaligned_access_speed = true;
+
+	for_each_online_cpu(cpu) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (this_perf != RISCV_HWPROBE_MISALIGNED_FAST) {
+			fast_misaligned_access_speed = false;
+			break;
+		}
+	}
+
+	if (fast_misaligned_access_speed)
+		static_branch_enable(&fast_misaligned_access_speed_key);
+
+	return 0;
+}
+
+arch_initcall_sync(set_unaligned_access_static_branches);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
