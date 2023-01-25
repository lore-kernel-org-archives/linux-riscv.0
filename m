Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED849C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gt59IeNTDMMMC4FUlzR3dNV8ZYGcQgZINqRYnf/gfog=; b=MC38eAbyHqEs9Q
	+seR/IwzzsIj3yObimi8bkTVyPaRkS0eKQwluTVY+Uv9SARYPZYo2pvjYxWiH9mAUOUGLalD/BSL2
	YbgPeskJPa9/A2JrKVL45C/qrXPtHXYJTOdvIR/hXfht/qwu/qpiWQpAQQ+Vv2uUcElxv/EU+Eb5f
	eHqF1VQ+4J2jxsFLG0oiZcYQfgxW/PeJMy4WKvkV7TRXQjtNVL8Tcr+6OJImLxJ/netxEl8WLkUby
	tvIueAwWPiiVjVHQEGtrpuJEjjdrEc/rI715b4FZttcF0sN70y7w4KSU7MNktpD0rCrUiudLCwHmM
	8/i/UAMJLfulWHR9loxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKges-007VT1-4Y; Wed, 25 Jan 2023 14:21:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeo-007VQ4-CJ
	for linux-riscv@bombadil.infradead.org; Wed, 25 Jan 2023 14:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pdk9Hg21UiGJKBpwTJEtp2zNNJGaWTJ6E/wOuwrGazE=; b=OkwhimgpUBeSGThFyJ787Zv4tj
	tNvXX9HeiXchgRNL8WJSsgL/2DHsUWFrcMFPWAuridjZy3LgiuzXxyqmjZZFFdMtc9gashUy49JF3
	bUiJ5ZeT99OYfM6zH8y/ouC/faS42UOkM4dQo+ldO9AOUQoQ1bL4kZnCVVFX48dm1OV2U/PB7Vsbn
	Gv6BawxLeFpkmH/v32T/sltG1A/i0qXOrsJIvNIrX91KM2j6J/YDK4wlqy/GH7h0xBXtdMOwMDIOX
	jWSmJBKJPZA5HK2EfHSxjazeXYOgnzuGvTUw+hH3t9hAicgJXhDAkckYBob93wlQXoLHQjhePv+Hl
	1HQ4gy+w==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKgeF-0029rl-0b
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jan 2023 14:21:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so2170022pjl.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pdk9Hg21UiGJKBpwTJEtp2zNNJGaWTJ6E/wOuwrGazE=;
        b=T7eGSydzCb9tsVg9VvD9J6S/VbtlVUfNp4BWLGQII0x3jm0LMpbz0LXxJO06gfWh/z
         6iPQIlBjKGFuLPoSrPEJDxdxBYILm+G3nkILHYBTL9jKZ5Nhi2v45NPRtOZBWa+s3yDQ
         hvySxHZschtGpLoON+nEFOp7qENlE1HwJn7vpMZfHYctwLrwojbkwTCmIp3LqkWlQTG1
         D64cs0edjNrfp7PlcWJYe27cDzjSZatBhkdesulr/rz/rJzHac+k9yqZmiH0Yla6braN
         r42ULyG1g1OIdpOdJ9VEYeZMd8BmZLZ4QRBLPYO319N2mbrwK3tnbdDxc4RxibPsPxqN
         8GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdk9Hg21UiGJKBpwTJEtp2zNNJGaWTJ6E/wOuwrGazE=;
        b=Dq4N+M7HxdZPBXZfsEhCGZc5SSa4PzQXx4RwD1uvBN59xdsNJcEHlzEfyVgijk79gd
         NTrCPMJJvN8xXnxen4Ze2W3xXjB/ibHkbYUx8eEoGPy71N+msSY57yX/AtKPBb9V4kEm
         hbHoFsHc8eZ/7wt7KdbBSUlQJFEA6cGH3fvvTflVePGdxOMNOeVzxCoFevzGigk4so7a
         uqd8Pt+9xoYmW9zhoZn36ri5Hu1LaOe6p27dvfaydgoVrn+Qw652E8cC/KxWQJPyI8rF
         HLdzU5+aCkgbs3IdkqQNBuL0EshlNjhHSiXB41IryifSPQAT9UdjhyPDMKkHIm+CTlf9
         ApPA==
X-Gm-Message-State: AFqh2kooePd7V1IM4ZVyGMRp2vg+aR31ZSwS7RQ2PN79Ds8g6J0ecrfh
	KEFvyZKpr8wjHQUDcta/VP96LMoY5An0DLjR9aVncSAPfgWhZ2tH/3OPjV8ejuz+TAMnwwNSoJ7
	9bhctdbZcbpYwdrDJnT5KOTWIVM5qalJBnrXs7lb7oCsGGzavCqjVXks9dKrme1hDlkXJHK1Eur
	n1Iu6cPwBr7Q==
X-Google-Smtp-Source: AMrXdXtK5TgYd7QRGlqkQx3V6zKwI+owEPLnQGHOFH0yT2oZD/AVKYYxogM5JfQLtu4ECIURORpMLA==
X-Received: by 2002:a05:6a20:8c24:b0:9d:efbe:a0f1 with SMTP id j36-20020a056a208c2400b0009defbea0f1mr29905022pzh.1.1674656498014;
        Wed, 25 Jan 2023 06:21:38 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:37 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v13 07/19] riscv: Introduce riscv_vsize to record size of Vector context
Date: Wed, 25 Jan 2023 14:20:44 +0000
Message-Id: <20230125142056.18356-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142111_408210_BE4D066F 
X-CRM114-Status: GOOD (  12.86  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect the size of CPU vector registers and use
riscv_vsize to save the size of all the vector registers. It assumes all
harts has the same capabilities in a SMP system.

[guoren@linux.alibaba.com: add has_vector checking]
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h |  3 +++
 arch/riscv/kernel/cpufeature.c  | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 0fda0faf5277..16cb4a1c1230 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -13,6 +13,8 @@
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 
+extern unsigned long riscv_vsize;
+
 static __always_inline bool has_vector(void)
 {
 	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
@@ -31,6 +33,7 @@ static __always_inline void rvv_disable(void)
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
+#define riscv_vsize (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c433899542ff..3aaae4e0b963 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,7 @@
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -31,6 +32,10 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
 DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
+#ifdef CONFIG_RISCV_ISA_V
+unsigned long riscv_vsize __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_vsize);
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -258,7 +263,12 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
-#ifndef CONFIG_RISCV_ISA_V
+#ifdef CONFIG_RISCV_ISA_V
+		/* There are 32 vector registers with vlenb length. */
+		rvv_enable();
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+		rvv_disable();
+#else
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
