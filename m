Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84725C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4175D6113A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4175D6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vKxBfAdWKbbuf7ERZDZ9fgnpN+r3haj7oHSfyv1zfj8=; b=A28AYNNarsuylz
	Ogqx8Ri7YDs3zAcT0h2IG6ENe3hijxE4lMGvGOsnIvh+1b32VAyART9/ZFDzQU6bDvea75Jii/VuR
	j+AgezQo8azmrwfeetrirXwlUfOjseJmZycILj/waEineIg05fQSyGFECGpJLYKXtX1onFo/7crfE
	ITE0u/DYf4FNBAepQ5Zy/LyNWF1h4iKWpbmuKUiNW136Wpn1XGk9fTymEvkUjOAhGqsX+r1+f7CkI
	E4rctjEgDq6b6LZnii1Gj/GPULwECvgtxgz2K+PkSsMvUCbq9aj5xyTOozsc9b5Gl0Os40vvq9kQV
	zp9ywuB/uUr8BVQOfM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5aGV-00BJgK-4n; Mon, 19 Jul 2021 20:53:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5aGR-00BJcr-6U
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 20:53:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id my10so12261841pjb.1
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdqaR+G8inJJm/OX6ujTKrMpRjVqLINMc/k8jQGEix0=;
 b=eDmv9ctXDxXSrY2Oqv6drB7LXdpOSNPaRHDXpAXZIb9rhxo1Zzl2h3zL2LB9P7LwPG
 36XKn4vTgG935gp7NdzPERMzZ0e1DiHen+2SZ5xuOB6qCxd0/HsYzOteWPEnntX5v8vg
 Y4wAfqYBgagR/MjSrlICAbiSytOCYmswDL07xgVlzTHNXitwNW5edpYfuOIaI3j6Wd8m
 9WAuua7qmpETo09Y/E9r8Qiz8RSH9bjU7xFva/F6WvwSl1getDRtkiv7XUMK1kIKr2on
 xilMDbBHlV4+uYoEXsE7KNmy/wIsNEL5gS4V0jXI/Ku5+dgEPVoN57nz8jB98aqqXHmS
 TskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdqaR+G8inJJm/OX6ujTKrMpRjVqLINMc/k8jQGEix0=;
 b=iJC0+u9Z6FzpBEzurnWzO9mKilDQS3ca5jZk0ELZDPJ+TXobvFJUVLeyWM//b/0FFc
 17m9yych1y+z5S7QqUCnLt+Dk0dIAqjTULFiyzE5SwF+lhTfWYptDSsDSwBQNH9l2MFs
 HlZ0NMA4Avk8fs97YBvgbcVR+TeXwNw+90OZoIctbjXI1jnrjNYjXg0em3YFS/PFy1mr
 IIN08poKRqAxxFsm3BkBCh/iYMKpPUfF3st9XSwNxzYZBnNG7z2JXPYwEAXBVz+kx98I
 jgSwzQEB/y6BELBftWTaefuTWq6gADwakku5V06pa1YbNUGPv2pLIZ1CQxz9Dedmbaxw
 vPFA==
X-Gm-Message-State: AOAM533DuGcKALHQTXWZDW5orZDnWY8h0dtSg0slbHj9LBcItlkE9ZR7
 gt1X6JvFeGrfx89lJKeS7KY=
X-Google-Smtp-Source: ABdhPJzj/Q2EwqgKkf0HuOe2e+BRJlJZStx/NWpsmeWOUcl1imL8VPO4FfRM3IVnUX32jYjIy17C3A==
X-Received: by 2002:a17:902:9004:b029:f0:b40d:38d with SMTP id
 a4-20020a1709029004b02900f0b40d038dmr20829840plp.85.1626728002167; 
 Mon, 19 Jul 2021 13:53:22 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id r15sm23940924pgk.72.2021.07.19.13.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:53:21 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>,
	clang-built-linux@googlegroups.com
Subject: [PATCH 2/3] RISC-V: build: Disable LTO for the vDSO
Date: Mon, 19 Jul 2021 20:53:14 +0000
Message-Id: <20210719205314.1023455-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_135323_287463_F07E398A 
X-CRM114-Status: UNSURE (   9.72  )
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

Disable LTO for the vDSO as done for x86 [1] and arm64 [2].  This also
disables CFI for it [3].

[1] https://patchwork.kernel.org/project/linux-kbuild/patch/20201009161338.657380-28-samitolvanen@google.com/
[2] https://patchwork.kernel.org/project/kernel-hardening/patch/20201211184633.3213045-15-samitolvanen@google.com/
[3] https://lore.kernel.org/bpf/CABCJKucpFHC-9rvT7uNF+E-Jh20fz69zdO49_4p8G_Sb634qmw@mail.gmail.com/

Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 24d936c147cd..4535a77792be 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -30,7 +30,7 @@ obj-y += vdso.o vdso-syms.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_LTO)
 
 # Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
