Return-Path: <SRS0=tI+f=EO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06823C388F9
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2020 20:38:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB91206CB
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2020 20:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBa+//be";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b74gdFy3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FB91206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaF9+LY9zflkPzT0Bej9blHhu4QXVV6XG9Xi8ReZE24=; b=XBa+//beH5T8cPm7QEuNgC9XFQ
	nKyXjBvw4gURHnT3SEdJ7fDbZoWwvgwQVE5plxaHpZzd9odfq22pOVa4i5d1kTP/qis5R49ixaSii
	eHJkzg0Ss5TZcX/2VBmEGLHNJ18XzHrQhApgpbCQWf3mteuAVd6XTtLOVr2MivG+hpWn6ThQwGFBb
	SQf0OWliRcvfJ31gbEXgyceHxEAIjKiKb4P/0T5wqwsx+pbz4UFP8nUSfov0nuMYOPWpxTJP/qcU+
	g5EVxDTEeOrcr3Pdu4/yHRilFhW6vikKzNk0R1GgMZr3QRWv9FtA0G37Xiv0VcinEK1KpSk0W21DV
	iLc0iedQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbrRh-0003OQ-39; Sun, 08 Nov 2020 20:37:53 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbrRe-0003O2-FO
 for linux-riscv@lists.infradead.org; Sun, 08 Nov 2020 20:37:51 +0000
Received: by mail-qk1-x741.google.com with SMTP id 11so6208609qkd.5
 for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2020 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWSW4z4tc076kKwNGtL/so7sEYIZnv1CKrVVWPooetI=;
 b=b74gdFy3pCe9zaPemkbiKhO3SwxwW0a3dLIX5XlpuDCn4Wo1SaMTTHVcGYBouJ1+Zj
 FiWq0xudKzDqpK+O0l+0zn7PZNSwZKNyGy7Z8Iaia4d9rqoWaA0IcG7cHFSxmdSMnSoU
 XaweMDexvhdhtXztS2WS5vMjDwHxsyKphb4Z/L29ixLXe/3e+ubCgkgBRl9wan1ROC/D
 kzDVu/Z2IhFcyN3CMlQ8NqEjkfRHo8xcf58iuxQH0oDVbxToT/qQOUNp+peoDb0g+41h
 EM9M+feP9dFB0CBScDGBdmsvxVGR0RkXZxBtivZtCA+fshPrSCAu4NGEckQ1LxyopaVT
 NKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWSW4z4tc076kKwNGtL/so7sEYIZnv1CKrVVWPooetI=;
 b=SK7KkXksK5c6HSsmPLfWFsvx2tFBdn3eDZkXxOXJDcNjheczl77NBU2fxrPTdfwV2b
 gdr7mNhAGldgbz2+lb4+m5/XMJ3KzHWR148pVPt1h4SlrKGl5kzGQMyPfC5uD03O6xpz
 Gsw4HqYAUmmr92d90zyZ2E0kIGVNwoAD8vuG0SJ6MIBGhMBLVGRMXirFGRAF6IrZfS1d
 8iRWsyiVRpnPBHs/tQylBmmIrR/M6x8kTjr7KephWWSIxBo2x+PyqlP6Uw24G9+aEEIA
 2YQJgu6kAG2xMRRwRnG39m3DhxPFBLF4mpNLpdVGWsgpcpC/FbeM/YG4RDMAlRKYdrHw
 qBlQ==
X-Gm-Message-State: AOAM530c4hZ7uEKwIrE22Ezum5cqohhtN+JKTlHASVU0kkCtO8K8GEwy
 /2l3qOBp981wQjQjBEh1hPU=
X-Google-Smtp-Source: ABdhPJyvfPVuTOdD+abYtY71MC+HK3WvITafyZ6+mJl5HWJMJv7ef5YsIyK62UMmNyzmiYg2QbJItA==
X-Received: by 2002:a05:620a:5a5:: with SMTP id
 q5mr2937252qkq.199.1604867864596; 
 Sun, 08 Nov 2020 12:37:44 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id n6sm4849150qkk.6.2020.11.08.12.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 12:37:43 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH] riscv: Explicitly specify the build id style in vDSO Makefile
 again
Date: Sun,  8 Nov 2020 13:37:37 -0700
Message-Id: <20201108203737.94270-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_153750_572694_730A60E4 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit a96843372331 ("kbuild: explicitly specify the build id style")
explicitly set the build ID style to SHA1. Commit c2c81bb2f691 ("RISC-V:
Fix the VDSO symbol generaton for binutils-2.35+") undid this change,
likely unintentionally.

Restore it so that the build ID style stays consistent across the tree
regardless of linker.

Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index cb8f9e4cfcbf..0cfd6da784f8 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -44,7 +44,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
 $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
 SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
-	-Wl,--build-id -Wl,--hash-style=both
+	-Wl,--build-id=sha1 -Wl,--hash-style=both
 
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO. With ld --just-symbols we can then

base-commit: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
