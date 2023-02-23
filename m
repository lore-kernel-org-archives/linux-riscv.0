Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04904C64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v7Ncwa0UYc2e7CRKs5pASFfLdU663DGFTyXCyAkh/Q8=; b=WJZrObhMzbRx5h
	yQ2Gk6+mRJdZEdAphHgxi40mBXec3uJ7jn62ywbm/deU5pf92Uh4yGSefDPhv+IaN8w3KW0sRAnj8
	MigmzAlrXdg0LHHAbTC7hBFwX8EbDBC4fqYLsU9J3LUfFUfdSsToeN1HYhMmgYyrisrOFXFgwdfCV
	YWGwgN/2FMYkz48ZckVGIFujrc22WSHKHVnCbuw79N8+T4L+aPxtFAaZpjufVQeyqSlUgYHsetcM4
	TRPSdLoWe0WrjR8/A1roVg042jq1N5orIvgQpo6o2Kx33F1hvbd4brQbrUTLIuXIufaG7j/JWsMbI
	z4BZrw7vwhv7Jf5Yldiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKMy-000XNC-U5; Thu, 23 Feb 2023 22:47:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKMv-000XM5-Fr
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:47:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id c23so9723453pjo.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 14:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677192435;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ybJn7kCRec9SnLpkXZr8qzdxr7lmrNVvekDkzOAgfU4=;
        b=Cer4oPPqPExTW/+/HxRb/gmbR8iwXzwphrnhm9Sz5Og/VxGVI4D7E294LicG0EiLut
         hNGelhcUQcfGm9ZjYJcdZq9GMjHtfttGfVWjjWaLZlLYEepGrzzc16btYynjxFdwEQfR
         HOnnSuhWjhJYCOFkDF6LEPwJL2k/KEW1+NqC+Ih1NvTHCP919AxAjHgAqCnQ0l1Th7og
         /DCH8BJnCJDUGMS5KYMq+N1saePXGdaGPJvTlDuAVwV2SP8qhaFYx/DHtAl+c3l6KsTX
         AjmrC15Y7yGZMayzH1HB3dXzQ+35GKQPGRGqAk8S1FkpzO0WQt9J1F6CHEvgg7zN49lr
         1TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677192435;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybJn7kCRec9SnLpkXZr8qzdxr7lmrNVvekDkzOAgfU4=;
        b=InYnjU6f33hOQIyC7b72J/vSUZjIJTULMp9qyz5OubyM5ySX/Lrf2zSWDQTlwUTrXl
         cGWNPOd/Nf91kqyko2VZTMQP0jbwJOGYg3O5Q+Nl6isVw7XQAJRcsG1+BAM0v2xnN2N7
         p0+idB8KPdF+dTM94SeltvZBL/c2+C0+PHJ8SPGFHNyIcCyYcT4xBhWHBlInikDmWdn/
         is953ar1jcsgrREIGJBmsuP99wHQA2GcPB0ik8IhoRxt8fHggRrSzX8ap32n/ozEDXjG
         6P9GZkS8pq+pxAwuEJvz0symRHNMI5DR33uRd4wPSnGNGb4I+Mu95GNxPQs4D+H++Qel
         7GuQ==
X-Gm-Message-State: AO0yUKU6TnrCMjmkovuu6CO6ToOjj/mW3tg6hPRFL7ULn5DKIC9X+sfn
	WptRR9OD090MJtItjAOlyAQY7z3brkdgNv8B
X-Google-Smtp-Source: AK7set9ao9JxfUxz/W5yeJjxpAY3Ukm1V6xTNZbxKsGQvTmbDJ7H5VTqU8mNt2vM10Q2EoVCUvGpIg==
X-Received: by 2002:a17:903:643:b0:19c:d0c9:8fdd with SMTP id kh3-20020a170903064300b0019cd0c98fddmr886153plb.52.1677192435516;
        Thu, 23 Feb 2023 14:47:15 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b0019c33ee4730sm8326603pld.146.2023.02.23.14.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 14:47:15 -0800 (PST)
Subject: [PATCH v2] RISC-V: Stop emitting attributes
Date: Thu, 23 Feb 2023 14:46:05 -0800
Message-Id: <20230223224605.6995-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,         linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_144717_771389_D727EE9C 
X-CRM114-Status: UNSURE (   7.67  )
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

The RISC-V ELF attributes don't contain any useful information.  New
toolchains ignore them, but they frequently trip up various older/mixed
toolchains.  So just turn them off.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v1 <20230223195112.10489-1-palmer@rivosinc.com/>:

* Add the attributes to both KBUILD_CFLAGS and KBUILD_AFLAGS, so
  assembly files build without attributes.
* Set COMPAT_CFLAGS so the compat VDSO builds without attributes.
---
 arch/riscv/Makefile                    | 7 +++++++
 arch/riscv/kernel/compat_vdso/Makefile | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76989561566b..7b53f0be56b2 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -81,6 +81,13 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
         KBUILD_CFLAGS += -fno-omit-frame-pointer
 endif
 
+# The RISC-V attributes frequently cause compatibility issues and provide no
+# information, so just turn them off.
+KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
+KBUILD_AFLAGS += $(call cc-option,-mno-riscv-attribute)
+KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 260daf3236d3..7f34f3c7c882 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -14,6 +14,10 @@ COMPAT_LD := $(LD)
 COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
 COMPAT_LD_FLAGS := -melf32lriscv
 
+# Disable attributes, as they're useless and break the build.
+COMPAT_CC_FLAGS += $(call cc-option,-mno-riscv-attribute)
+COMPAT_CC_FLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
+
 # Files to link into the compat_vdso
 obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
