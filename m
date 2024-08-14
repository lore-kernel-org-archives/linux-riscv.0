Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4AFC531DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6ToOoQ6j01rdoPRVVkX0NfS+LXPZmWjTkboqBG53iQ=; b=c4VkDOPA5DJnf2
	PtDN1qwOqqB979mZxxz30MTDHFEOj8kQC9tQBALunKYHN27rBLurl73RqLnO58D3UGEla8Gts3ME9
	3Lx3IoeXvsThtMmOoqhrVCg99y2tZEp35tUgUyX3Gb51JoZsmBGGNPPTeu1G32NgPhFtGop8s/wlU
	3qYtqNZCH4SpQyS+iESm9MEJsQhaVSzHxnGpo7NDvw8gfweMZxPRVcSII8+Rp7T+wQJDM/6NZmYdD
	Cxxt1Uv+suvM6xfhMs2W/QeqcRSXB+GXyAj6W0uF+0kPUGxb7Oi3mqZvdJmZBueasB0RTlTkfVFVb
	TtDs7GZrNLean4H6WWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96V-00000006BoH-3e9u;
	Wed, 14 Aug 2024 08:11:35 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96S-00000006Bml-3pJX
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:11:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-710ec581999so3253172b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623091; x=1724227891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aeJwSkJyEYhCArckd2TWKFlpkUc8ta4z33pmclBmZc=;
        b=Ikdr1Lvb0FVIbPAyi3St+hDn6QQuBPzYEaaAMwklRlgCy89QrHxFPrjPSktYCBpWV8
         NnLuWl1A+UNS3JgFE3kb8oWjURyBjPGJKRzJ7S3HGCnEsgwqwEKPZZUo948kFWe6oj4C
         2eHWY/bEXa/Te2KIxlVDMdIiAjFj8GjpFXqwWYCvcwxUv9PCcM2obcLckBVOrARKAHW1
         qgnX3B17BBTaWRYKRaNgxoWQ1eUo5tDcjpx7fZHNGy5r9onYGU08clgpiDMzWuY6HcvF
         2kogf+jrZ3cjjpSZGS/9q9i85o5BZWyLBs1tFhUdCKp7HXJC5H+R/7VaqGeL1Y6kwmcf
         oTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623091; x=1724227891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aeJwSkJyEYhCArckd2TWKFlpkUc8ta4z33pmclBmZc=;
        b=IjpVWq6IE4mU9oHj8TLQUdPm3V3PsmBGi8HrWX2CbPkueswh7hXJBEZSfm+rPGpXxB
         JAn06p7cuzgb6ZnO+L6BVGKN3v8g7y085TC7bNHFL0Tvvv3ywweJV96piIKEFucIAHjK
         Mhc0Ed0hoZv5cz5IiA1mBWcGY8lX7Ce22NwETgyV4uPYgGZ2Hsv6LUAsPZUE+TvZdgDt
         /hlykTBvat4q9Bn0ZXrmPQIJ6N0cExa9fnbupXxwIKVFRJmuRWBYHdtu38WnGK12YQew
         pvPgii6i1rLxauCOyp+g8OOAoOgqAv+PHxWmhiFQvg1tEujEvr9RWQH21os834s96iJy
         zv+A==
X-Gm-Message-State: AOJu0YxgB17Gg+UZy2GFKYTEEArD6BU/0iLmMp6/SxPKpFyD10TkL3Ps
	Qa1gg0Dv0oIXWXTvVRzcixTpsqRNJ8b+iSYcd1Q6C3igtptUOGe//6u3YGYSBdLXkoC9tjBdauk
	dTfrfG17vYFjaI2Rxfgp42vsJnKBqMNn4iAC00oCVOK/owd0TrK661vJJ8gdCxkqTSxg/+pXpJ4
	mD554zwHzNe23KWF/9OLn1NbzjPuD9aB5Sq8hXdBBax7xceESy6C9w22ob
X-Google-Smtp-Source: AGHT+IHzz6k/y9eJBQjHqqaXxD/Ow2KDkmoZxQIFeBXhlwFgBTesdH1eA+S+4NnIpxaGBpdLmz+UBA==
X-Received: by 2002:a05:6a20:c908:b0:1c4:7929:a593 with SMTP id adf61e73a8af0-1c8eae8dccemr2856680637.23.1723623091285;
        Wed, 14 Aug 2024 01:11:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a94d2sm24559955ad.127.2024.08.14.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:11:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 1/3] riscv: Enable cbo.zero only when all harts support Zicboz
Date: Wed, 14 Aug 2024 01:10:54 -0700
Message-ID: <20240814081126.956287-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081126.956287-1-samuel.holland@sifive.com>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011132_980279_61AEC508 
X-CRM114-Status: GOOD (  22.76  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Rebase on riscv/for-next

 arch/riscv/kernel/cpufeature.c | 7 ++++++-
 arch/riscv/kernel/suspend.c    | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b427188b28fc..0139d4ea8426 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,6 +28,8 @@
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
+static bool any_cpu_has_zicboz;
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -98,6 +100,7 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+	any_cpu_has_zicboz = true;
 	return 0;
 }
 
@@ -918,8 +921,10 @@ unsigned long riscv_get_elf_hwcap(void)
 
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
