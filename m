Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2952EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EB861153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7EB861153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2J46PZu3IYnkgULAowA22cJmqr43emOOJgWnosq/68=; b=TqEq9wcpTrel72
	mTAg/dkSaVl+RF3bdI98jfZJ16qFHFvvWtrt93ZwzIQDbkyCk4R18z2IVmIsbTxGklpJLmepNAebX
	Gn/AVZFr0naY0DmOODDV+qLSTQimm6LUztgqunS7H2bsGm5ytclAhB0JigEY1riqJpaweNqXb4KTH
	ueZcIt6UF6zNO9D//MprGjIZnnXTKUbSYmioAqCQPMldhs2zQgO8zKyhXzN3YA8cfOCtnq35elcpM
	/EAxTgDHGcL/fMe3YQbqHL/DkuahrZqEzWX7iX90uebZ0V/EHDOCQib3PF8MpfKvfTPgfOfUVocqf
	AtlRAiuL0PjEKQSnO38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1dm-007IMz-JK; Wed, 08 Sep 2021 17:45:42 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1di-007IKk-Bh
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:39 +0000
Received: by mail-pg1-x530.google.com with SMTP id n18so3378250pgm.12
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VcOMi6ITdU4I4edFLesYSJaP0RX1fCppqwJ8xVLL0ik=;
 b=MxeROP0RPbN/H9A8pHZYHn8Y6z8SYCJqR4t0/qQ/tUd+3HYR5qqG8o39+8aFn4QiP7
 PcpD/yw2yIlscxGQaKAvFSwfoheXT1PVlH0Rs2BHPhtNHJICdXotFD3UqP50bT3iMC8F
 9EN0yq5kWxlHjfz4ouqHc/kUTe/errThuL4MYE9e2E7Qtwz1Myu91xcaP3RC1YTL94/D
 8gziPSbSDEIwVvl0TmIlZZRtyPGKm1qad3K7n/7wn39keRznTndDsBpMb4vNdb9UtB2y
 7u7ftncL9F5XvP0IGr2v870W88d6IxVF4CQRWlatHMyJmgR8bIrzSEaINAGGDFotnFYf
 tKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcOMi6ITdU4I4edFLesYSJaP0RX1fCppqwJ8xVLL0ik=;
 b=IxRKjqH3WQ84Ea5EI9lyxFhgp8BGNmdPPeEfljTfkdGWD6rRP/8bzztrTA/NUFRekJ
 XgKUTT9GYI3HXbE61MZFc7mMdQ1pNfrGYkBZwZF5hzKjDeEAJ6uOdAc4Vr8i1nb1RRB0
 LSY3KpsaHrjfqDDfmlt1XHouCizinDXnmMqZJ+jWfhTJEnCwovxhrMCRrytuhr9qR0KG
 A+75JIscxsHp9hKtgwEQq2EWVxuwSh+qtElql6/tA3E3kywGl/WrOwHAbOMy1rvsv5q8
 u9UHR4nbyTBjmF9yjYFKYbVzXE7nrrbyx1xtnsM/gpUIRMilTZPgSMCQhoISTQG+mnCE
 Xkgw==
X-Gm-Message-State: AOAM530u1tRBR9C7btl2rYCVMQZ90S9sOERIawbkH+3N9P+xwdGjVhIF
 VNREGdrPmMgCeADXCP40DtWdyjVTivN14A==
X-Google-Smtp-Source: ABdhPJznawYnmbB6fLsU/hbPSpUWDxsncE8PBN3+UiHSAfC1IrhE69U0ra3xpTcCvUFgM4Yge+NfjA==
X-Received: by 2002:a05:6a00:98f:b0:40c:96c5:b4fd with SMTP id
 u15-20020a056a00098f00b0040c96c5b4fdmr4879796pfg.0.1631123137330; 
 Wed, 08 Sep 2021 10:45:37 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:37 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 01/21] riscv: Separate patch for cflags and aflags
Date: Thu,  9 Sep 2021 01:45:13 +0800
Message-Id: <3814a5e48384a893ee61613ad9718dabc95ab334.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104538_441604_8D8DB678 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

From: Guo Ren <ren_guo@c-sky.com>

Use "subst fd" in Makefile is a hack way and it's not convenient
to add new ISA feature. Just separate them into riscv-march-cflags
and riscv-march-aflags.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..428bd3bc202f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -48,12 +48,18 @@ endif
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
-KBUILD_AFLAGS += -march=$(riscv-march-y)
+riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-$(CONFIG_FPU)			:= $(riscv-march-y)fd
+riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
+
+riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
+riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+
+KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
+KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
