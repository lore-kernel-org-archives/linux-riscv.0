Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1A4C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:29:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D7E20658
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1EXrmiBi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLvThvo4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D7E20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FNbqj1xET70XrrKo4Zy1HcxQ41VRBJdW1vNqJet4zVo=; b=1EXrmiBiIg8unfpngeERfHGw6L
	Eh5jZ+HmyBg8Fnloz6Pr5hw9jWM3Fcwc7iGz4wfeQuN8nWq3ZKn9igehukwfIguYxL+4GDR9DTJ20
	XuTFvTTMHGn+YTG4jbRuAqqarnCal+UdSfw5PHS24T07R4MYhcIF9UOrRqfQg5ebGAs5g6ww99hNN
	/lstKTiYgp3YDSAL+THPyVXXb/LSsvV8+SjPxJFa+x0MVCd4AN44fovKH5IFSArGXrQz/Hr0+aqV0
	Ar/Aa30Sye64yHsff8MvzUISK4SRSq79r9UevSIdkq6IMZkhDryFq3HMOa2hRjgXJOwJ/YeEz1101
	wnh1GOow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvSU1-0007LU-M5; Tue, 14 Jul 2020 21:29:01 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvSTy-0007Kk-VP
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 21:29:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id f7so295771wrw.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 14:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKU5uergA0Aa1mhqo6EMw5cD+1UW22BLT1dbrl2IsxA=;
 b=lLvThvo4B331bayf7/2UW/PMnmk32xtN+AvUwEC3DxxqKKvgNziNafJzo9DEoIK0QG
 QKzBqXuBmcpralubgX51+CUBI4c0b46M9Ab1xI2BIHwMtO/otjajXJRIIx+txB5bTezH
 B9ODKxO/tX+X0KC1G81RMh04/C8nJ1AFRV2l3DDQOXKPrdD87xWKVoO6E6a708A9Fm8J
 RiGwBvNR45fgSkPjgHAhjrwzGIBkuUmJRfdJgV4s1C1mnH7z5nTGkl4y2CboFC0VRsU7
 lym13gI8bIQ4BX5ttI0t32u4r9GpBJl5jCo5Vb53DvR7Ib8lscUatlxLiBbQvQ63Yzdc
 doPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PKU5uergA0Aa1mhqo6EMw5cD+1UW22BLT1dbrl2IsxA=;
 b=nnvxfii9rS8Jxh8jUNpxXMKOpud6ldQtyND7Z/7rQniPbOjDu7lXpvhcESMfWOBkLP
 CT9BStYMLmGUHc1PYQtEByU67oKppjPDA8AhpuBNyF6qgt0euiTlvokrgX6u0vJVSt7e
 bBUatd6ZAmLxqwUpN3EcgcxHxvcdOdnswVEU7xJoHVQFHLAdapkY4KOXeHUQr682l/dw
 ndAAPs4PVrnSZJ5DQOmqV8dTXnW+HM3UUsaUvTolHLDYP3hx6DCoFc1NTd4GEcVTRFrq
 DwSaqeIjZaYitrrXrKpdrrx9z3n1IsF/zb35YlrmuUfBOJiMDoLyoJPd1Ca5uZQTRWYV
 WcIw==
X-Gm-Message-State: AOAM531q+bAYF6h2xhBswa7+uIa5wvkHFQIFzupq5LvSsm66tZNSgf6t
 obdt4WtEi9oOoixX4xRbVlnbzo5nnCJNLw==
X-Google-Smtp-Source: ABdhPJx/YmiJpiV9bcRcVFcElAJEvBJY+hvPpl6tbRljDQF0airtIeNgs192Zz5AkAazHZVyNC8OSA==
X-Received: by 2002:adf:e801:: with SMTP id o1mr8186529wrm.54.1594762137484;
 Tue, 14 Jul 2020 14:28:57 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s8sm345wru.38.2020.07.14.14.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 14:28:56 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE
Date: Tue, 14 Jul 2020 23:26:11 +0200
Message-Id: <20200714212611.19692-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_172859_033049_A03D85BC 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: linux-kernel@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows the pgtable tests to be built.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---

The tests seem to succeed both in Qemu and on the HiFive Unleashed

Both with and without the recent additions in
https://lore.kernel.org/linux-riscv/1594610587-4172-1-git-send-email-anshuman.khandual@arm.com/

 Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
 arch/riscv/Kconfig                                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
index c527d05c0459..c9a764c3c795 100644
--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -23,7 +23,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3230c1d48562..b4e674b1e857 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -15,6 +15,7 @@ config RISCV
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
