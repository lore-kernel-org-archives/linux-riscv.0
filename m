Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3660C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:38:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135236143F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135236143F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X01rCZy9mTSWbj/L9S5YtTdFsybVaVoPWin65zzLl1U=; b=gaCJod9VeGbVKzeC+XzCRfFZQX
	csd04umuUDC133ifMsjucd9dlsLQMbVeEqoM40XKk8nYfYF2R1eqY90rci3DYUtHEA6U06YjeRLQ6
	MKAwApf+N6k1EAAu95/T3vuxRxzPQXs0p2P/B2pLIOD1bNaqZwyOADWmKt+MHTvePva7nUdXx6kiu
	/wlVA5stFbEd8PQHkQtnlaZPF07D4Z8L5haASnt3Leq5EoqTxwqXTHrAAhPVqZz1EW6W9l5nPsVVi
	LQ6nkfBLx6UnUD3Ia+6fsl0OjiVPo4AzeyzQ5DmakjKwEou3XgdsDY0Zwt31CjwKUwMhyl4J2Z5Y3
	pGqVNBwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhfVI-00964P-Ia; Fri, 14 May 2021 21:37:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhfVG-009643-GS
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 21:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=v2dT72KZKNqP8FFr0B3YUB03zzy0OGJuHBgaLd96n8k=; b=lTEnP5Sp4DEUuRTbZMP+66L5Zh
 KPNjJGz0T8sdwi0Kh3nDUlZpC6HFYiWmupPEUg0NuCvUusuidEVEW+nEjyZtaxwZVkzQJDCxpky4P
 1MXIOLA+PhLDmscC3C90RT59m8diWIooGriIgi95ds5UoDiep/2cIxYgInwexTNdX+3Aq7WtXqeP9
 KRHrzaj8V89Z+rjTqZLj9DL1DvOf/dHwsDWGRqgPs5PS2HRMzZrQPjoJ2PuWqJGgfX18n1BH8oCTi
 DmtNgbHx22t8mXbvhvqHQ6FKZem3e09thxmOlfXCQSjSQQU1ApEUZdQ6DvZ3G8XFfEJMJYuUi/2R5
 ee5PiDhg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhfVD-00CHNB-Rz
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 21:37:49 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 gv8-20020a17090b11c8b029015d47d8ecbbso507909pjb.3
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2dT72KZKNqP8FFr0B3YUB03zzy0OGJuHBgaLd96n8k=;
 b=bXVe6XNvVH4rK8v/Z+mCbDS+E8dJU5EYacW1tpiOwZPKSTdidAaXFEg06j4ksSuuai
 FrvVwfJYbW8IGywpYWgHWyDs/K6lSjSlsPVKtAPHFv9ulIXRSV7Rml1iui8DXn5P76SP
 dNokHRG8XrzXZ5MFY0ohfMpzwidUwqY2aHkPh4LnuXjd+ar7fEekQeMHfqw9lt1JOch/
 e77kDTWSN3ZDgTp3uNkWKY2/dHuFENTREI8xSDBd84k+gPyft9ohSavfVac50ln9eAh7
 09IVXHCYz6i88amp5I6hAslwT3pnn8JoCY5Cbbp4mbn3VvT9ZmWArxf1GZ8N3c181JOQ
 c+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2dT72KZKNqP8FFr0B3YUB03zzy0OGJuHBgaLd96n8k=;
 b=eEF2P0RKSHC/woZukpBTpnxDNXy/h3FCpaFapuSmmm+Stjc9mN5tVgYZB+23BqAyIY
 tWrJEHXOHRKYIqnOSG1M8G/UwsFx2weAJ7l/+xOmzFoW6I2lewP/9UOeoWVr06XSj7y4
 83JreyxSWV+DQfi/jSpTDIZsK2rJ3mDnfatr/yBIz9hX+u6zX7Nrx+hGw9rtPS+ENBig
 F0HbzoSoo7HAii8w8AtvFCVA7HyOEKM18b8mKZZHFTP4m7h+ZZr5KMybzN56T7g/gLgH
 FkTIHEk1hr8W3BBQVmEPoQTXjpFinY/bda5Z22orPA9XhNhi73nLz4xU3VMathVrsx9x
 bC6g==
X-Gm-Message-State: AOAM5328IuAPojgFWd46Fd+AP317Hg+0pTB5fuh6rXZzf/JphW5fUa/8
 G1Wy6HDTMIOR2xs4AIRdzdbRF3U2MAZdEw==
X-Google-Smtp-Source: ABdhPJxHOd0+aYvPGQX4f4p8zuKQL0gzKr9YgZGai3Uq5p89D9xx8AJmz4lWiVC5/0AifKlxQ5txAw==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr55904894pjc.174.1621028266675; 
 Fri, 14 May 2021 14:37:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
 by smtp.gmail.com with ESMTPSA id y199sm4590523pfc.191.2021.05.14.14.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 14:37:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-riscv@lists.infradead.org,
	clang-built-linux@googlegroups.com
Cc: Khem Raj <raj.khem@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] riscv: Use -mno-relax when using lld linker
Date: Fri, 14 May 2021 14:37:41 -0700
Message-Id: <20210514213741.447088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_143747_946643_C64E29E8 
X-CRM114-Status: UNSURE (   8.94  )
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

lld does not implement the RISCV relaxation optimizations like GNU ld
therefore disable it when building with lld, Also pass it to
assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
ensures that relevant assembler option is also enabled along. if these
options are not used then we see following relocations in objects

0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002

These are then rejected by lld
ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
v2: Use CONFIG_LD_IS_LLD instead of LLVM check

 arch/riscv/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3eb9590a0775..4be020695428 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -38,6 +38,15 @@ else
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
+ifeq ($(CONFIG_LD_IS_LLD),y)
+	KBUILD_CFLAGS += -mno-relax
+	KBUILD_AFLAGS += -mno-relax
+ifneq ($(LLVM_IAS),1)
+	KBUILD_CFLAGS += -Wa,-mno-relax
+	KBUILD_AFLAGS += -Wa,-mno-relax
+endif
+endif
+
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
