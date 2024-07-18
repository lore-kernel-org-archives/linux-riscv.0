Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F7C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 00:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVixOxZJ41aM6yq1GPMKB5diDLAFe2ZdNIUPM4pYBvo=; b=Ozc3n9q83U3KUd
	kqG4C5x4Fd9vAvlivaVPgCC1LIdbNPeDRF47p1e1hy9pel37SW8rBiuShW/XpLdMP4Ymx1Awykw1l
	2dLoFr0998LGr638bCxYPFfqbSZ9twyjKCdBiRvzEkZ/qDUgW0L96FHtj3NaZSuLHfousc7FtNfGE
	9TLGCE8FtquWncVnlfs89T5hDxL1P/2tZv6XqHleUXZR5QsObXmh6uPPOWuE+fFx8J3P1Jp37VQc0
	PQTmRIt9w5FsDRvhq37+ubYTTRChpFm8QlzjrWF0tlNP4ctzhYdM2Xf9pMH8kIvSlFcIERXhZf8NX
	zcvnRYZZFMPiJIhGmOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJi-0000000FIFg-3XBm;
	Thu, 18 Jul 2024 00:48:18 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJe-0000000FIEO-3bf6
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 00:48:16 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3839d74a2abso814165ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 17:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721263694; x=1721868494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQiU3jLs/PVYv24pQZF1OM35EdgJeLHTVO+iajBsq3c=;
        b=XSBCZOP/J1GpXtzOeG1uNMnURKl7ARY47Lr4P+6vYhsHmAhrxEo635OO2DWtcQpPVW
         ZFWtoxTk1m/CNrllY7kL+UJdBhchlOrUSySfal3Z4vkJO7RSjowSclK+LXi8O9/QFOs4
         kx2ZU9Blbi2u621wT3/HWb/yMD6KVUfOSgNTV3C/o1zSNV7ezE9fCgF6yzLRQ3eowwsO
         mqjpvTvAk0ymB4idH+Jk+3poTofcK7+SXDkTVLIekDc5sZB5HZP2AikeF4SIzIgXXS7n
         c5MeCL/WlUCrPEQj30fVhuA1wYm4GUs36XeID7yyGXAuuRuXdV6emVS8kGhxSeFIF4bG
         yQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721263694; x=1721868494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQiU3jLs/PVYv24pQZF1OM35EdgJeLHTVO+iajBsq3c=;
        b=EccKWvlmpdjEnTe5V5+PJ0HL5kQMP534aTocAPoWVYEwse2bqOONkdFcVUOMYXOCs1
         E2+kSYoBkixES5YnuhzwANGpxvj9G6mY+vEWXUSZANyG+h24+YnthOFfCGQe3Z+C0hek
         Czmt5Ivl+dYJMV+R5LO6SO4bx77M/gGoqaERS18HHwNyx00uf1lWS1gMvltpZzXVJqTU
         Gmntt6zkZm3AeYhY/wORbIuKE1p4Dga/zW41F4AhJMWGeZT9BL1v8Al70GeUCZhg/qTn
         +/duvmnbNl/17IJTKdPHAXADPlVYAm0ICl1aye+UqowqKD3Wb6v2bEufwuEuLwE3STgr
         C/YQ==
X-Gm-Message-State: AOJu0Yx/n1SK3TtottJfje5jfelmg//w1o7ZUN9SvWkvR4KCpyeadSJd
	SHel3fWbLStd9IEFdlfuI9+E0bVMwGBcLqOoADg7KjS2GuNLJHnbn9KG95h5zfryBbFTXjwSOv9
	vfAP+iKTAGjJIPbX/L8acxV8totfPukxrhFkXL/jOZD8wXyoz+W0CL84bq0XBAtC+O71vrIILhN
	Z9fTP5QS+gmo0cZRo8UWkxuplpcXf6rcilIdgZzgt2toGVjA8KBSQBlCri
X-Google-Smtp-Source: AGHT+IHQC2fSybGj1wvVXYG/rNOyfBlLM1/ZwN9ZqAtrY4RDk0eAm6Wfwf7zO3wfGYZ7JiO0lxUPvQ==
X-Received: by 2002:a05:6e02:15c4:b0:376:410b:ae69 with SMTP id e9e14a558f8ab-39555cd31f3mr46347585ab.15.1721263693464;
        Wed, 17 Jul 2024 17:48:13 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d53e4sm5694300a12.70.2024.07.17.17.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:48:12 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 1/3] riscv: Enable cbo.zero only when all harts support Zicboz
Date: Wed, 17 Jul 2024 17:47:54 -0700
Message-ID: <20240718004808.2246354-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240718004808.2246354-1-samuel.holland@sifive.com>
References: <20240718004808.2246354-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_174814_923527_739540A3 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we enable cbo.zero for usermode on each hart that supports
the Zicboz extension. This means that the [ms]envcfg CSR value may
differ between harts. Other features, such as pointer masking and CFI,
require setting [ms]envcfg bits on a per-thread basis. The combination
of these two adds quite some complexity and overhead to context
switching, as we would need to maintain two separate masks for the
per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
support, writes[1][2]:

  I've approached Zicboz the same way I would approach all
  extensions, which is to be per-hart. I'm not currently aware of
  a platform that is / will be composed of harts where some have
  Zicboz and others don't, but there's nothing stopping a platform
  like that from being built.

  So, how about we add code that confirms Zicboz is on all harts.
  If any hart does not have it, then we complain loudly and disable
  it on all the other harts. If it was just a hardware description
  bug, then it'll get fixed. If there's actually a platform which
  doesn't have Zicboz on all harts, then, when the issue is reported,
  we can decide to not support it, support it with defconfig, or
  support it under a Kconfig guard which must be enabled by the user.

Let's follow his suggested solution and require the extension to be
available on all harts, so the envcfg CSR value does not need to change
when a thread migrates between harts. Since we are doing this for all
extensions with fields in envcfg, the CSR itself only needs to be saved/
restored when it is present on all harts.

This should not be a regression as no known hardware has asymmetric
Zicboz support, but if anyone reports seeing the warning, we will
re-evaluate our solution.

Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Rebase on riscv/for-next

 arch/riscv/kernel/cpufeature.c | 7 ++++++-
 arch/riscv/kernel/suspend.c    | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0366dc3baf33..4efaf12b470e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -27,6 +27,8 @@
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
+static bool any_cpu_has_zicboz;
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -97,6 +99,7 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+	any_cpu_has_zicboz = true;
 	return 0;
 }
 
@@ -874,8 +877,10 @@ unsigned long riscv_get_elf_hwcap(void)
 
 void riscv_user_isa_enable(void)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+	else if (any_cpu_has_zicboz)
+		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index c8cec0cc5833..9a8a0dc035b2 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -14,7 +14,7 @@
 
 void suspend_save_csrs(struct suspend_context *context)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
@@ -37,7 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, 0);
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
