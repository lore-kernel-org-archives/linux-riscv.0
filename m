Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58222C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 21:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D861022D00
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 21:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D861022D00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9R1MB3ykRNYdVgWSLygmhSSWSWFjv+TLV02AwHMHMI=; b=Op4rh1UDDOwVPPRhimpXjU6IdR
	5ZwO8fjngxo9SmEDRJTD01X1T6V0jmIkNgwVVpS1O3a67I/XrtvPI87Wts2XxcMYCUYh0cXqd50h0
	+TAHlqtHh7gAY6n9pAY3fsnL/WXhhJb2RGpkQW7/C33A2n50ENL6GP4b2eOQ/ipTThVSAEpk/bRYj
	nHxHYOShEA2v3kzcVcXNb6w8uILdlcw6el4sS56ti9NpVxtXe6YYJvHK04qocgAuQgQcN3JNxtRaE
	5FDCwdVthYVKWniKW+wo+zTw+BtX0rJQsjDMgqTd3YTotMs484WeP5Zd64WkJoAmf8cmMron2GHS1
	hrxTr73A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz4cl-0003CT-5n; Mon, 11 Jan 2021 21:21:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz4cd-00039v-On
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 21:21:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id 91so232805wrj.7
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 13:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEFDDHpww4S7jZVTaZD1icQ+na1aoV8Oo3KDfAMEdTk=;
 b=FK6zjLr4+E02JhNbMuXyh1qxoOhquU2JANb2OZm5+JP/nhIfFq6Fz2sYDDAVkW9aOw
 WLh5iRnl6EzlEiJzp9EHuFt05i+yP3VSFFr9z0eYz4zAJQZ3vCrKASMRirbwW9PKai81
 RfDGz/YouiXKy6UHlgMrsBs/By8zRfs5aBovI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEFDDHpww4S7jZVTaZD1icQ+na1aoV8Oo3KDfAMEdTk=;
 b=bquByS2A0vg1Ux8Jwi0s13PxwR4ic3DhM2TdhqNTzPmLfckeAXAMuMkoRCGRqUDOrz
 zRR1j2MS+meFe37QhIPIyI26a1shn7oZJdoey1GMk2ziAJsIy0hcX0Th5VC1mvii1SLj
 uuC5XhWb3QG0KW5jCWgUsxrDSx5wM+nx9fX3gKT2odw+M8E5s7OkFkiqdfT2TZtk4gVO
 f/xrEmWNhhyGAE0f3WvFd0snFwvWBViKlyisl+zrrKwCy9ZrRhP+qzbD/M5d/h7t4nxK
 oAfa0aVBkixe1VsCXLrHaz+lCtH4kO4tc5GKG2RJYuqSg6OiSHaIsjiK7CbHhtmLrN9e
 ywDw==
X-Gm-Message-State: AOAM530lVMRPF2/1zkPURBpgv4DdF9LjDGaRocIksjFpO9E/hH8yejLh
 kN+hrEt3OzPoq/l8I8HbRVi1FblN2HaLE2KVf0Y=
X-Google-Smtp-Source: ABdhPJxbI6qQSX+hgbuH8BGJTIUzRTH2XlCvZ2Conpe5ZrK82kVNAVyLheeTcmABEY4tEuX3KlAnpQ==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr976097wre.408.1610400064586;
 Mon, 11 Jan 2021 13:21:04 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id o74sm808960wme.36.2021.01.11.13.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 13:21:03 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: simplify BUILTIN_DTB processing
Date: Mon, 11 Jan 2021 23:20:32 +0200
Message-Id: <20210111212031.2422-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_162107_963281_6E110430 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Provide __dtb_start as a parameter to setup_vm() in case
CONFIG_BUILTIN_DTB is true, so we don't have to duplicate
BUILTIN_DTB specific processing in MMU-enabled and MMU-disabled
versions of setup_vm().

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/kernel/head.S | 4 ++++
 arch/riscv/mm/init.c     | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 16e9941900c4..f5a9bad86e58 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -260,7 +260,11 @@ clear_bss_done:
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
+#ifdef CONFIG_BUILTIN_DTB
+	la a0, __dtb_start
+#else
 	mv a0, s1
+#endif /* CONFIG_BUILTIN_DTB */
 	call setup_vm
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b17f8d22f91..45faad7c4291 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -615,11 +615,7 @@ static void __init setup_vm_final(void)
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
-#ifdef CONFIG_BUILTIN_DTB
-	dtb_early_va = (void *) __dtb_start;
-#else
 	dtb_early_va = (void *)dtb_pa;
-#endif
 	dtb_early_pa = dtb_pa;
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
