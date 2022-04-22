Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yO7FcR6zKSzpBxWDTN3fb7BFg0/L9RHGlcqs9mH1+uo=; b=MZHdW5jUf3ppDe
	VE2QSCS3PXLLXTlgRN+VMldx3my7GOKt7KqDi1sVNmwO20VW14wKFGz5JUJpaKNgQ4zFd1qEb+yqp
	1wQqliGL/T93Z0cEdL5FVbGL3Qes4ahFnwSRE+XidqjpZxRK3psPKYOnTKFq2DvZW011B5IwMFAXa
	JuFJtYS+fEIFLwdJHw4mX0clonbZak91nH3mb5zL39NY/U7AmxwlL8cVgrfgBYtT8lpPbtslUId2L
	PYNM1PDgBcc8UVO0+yO1V6lEPtp9KQfkGp2ku5S19qwVbWrkcZ+PxiDBQ86BqkMYyvSZdOXXCPPA0
	HiUWt2l0iYRlNQzwntoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni113-002b35-N6; Fri, 22 Apr 2022 21:40:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni10z-002b27-Gw
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:40:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id n18so13609678plg.5
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=nMon46hNHIwg2PB4Q/GowbUcwfZXFv40rGcb5eZ38Ms=;
 b=NA588skUoZui7J3Ntq1X2DWgG+53qt3SlUwl5bq49OsXLSALfLtxQ4OebQ8afDylI0
 vz5KoQ4TVoNSawvhDxTE2MZXc8WtbCWLmg9ND8bICSPnOnj8v2gSu+w7kJm8a2IMYTrg
 ihIbim2GbU3zWBYKMKRkbdjiDUuFvtTjk4I+gmjnqkokYXnlgHgaMH/JFlYIZPKUSLAo
 leSTNZkvf5r7PmK7C1nDVSJqBgz+3dExMVmr9c8QiockIZ+rjyeQPVYERk10aqu2rkGC
 B2teQyMO1aLBX57PJwQ7uhQuInw8//32Jb6MFnxnG/P57YqxGm+kkjqZ90m8JZCGWCJP
 C2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=nMon46hNHIwg2PB4Q/GowbUcwfZXFv40rGcb5eZ38Ms=;
 b=StXSjQ0rzdljBW9/zk2kvyw6Dxg/Q3OPgdg+j5D92a79Fy+7mbOX+I25x9ljWbpuex
 x5Rf8tb/8j9vm37EX2bOYe4Leg1Uk+E+57ECFar0b/cs6GFXe4mxwR/qSsCauS2qWe1U
 KMDQDq+4z6SAvGBOXPUAMwO6BvjE4b/AFD0dFyBQ9t5LB55LucJCtkCzySR1hZJWW7gT
 /hPEMvIB2kav+uAdtGbCxnBdorxgXcseqC2oRP0DNhkQd3qXBxwsrLe0oKo6m47Lg3ZW
 YAfxBbZyHwm1EgMpZRe0mq3W92jVkXOT5YDwDvg5yAF9qq8nqIFF7cB18KhwA1ABOaUp
 4zLA==
X-Gm-Message-State: AOAM5301jDoyCo0oqmbguYe4AnAoypspn2TmwN4AymtqT2Dcp/tJPzro
 q32u75gDEgbrxcH26Q3IAjZWCbArAaaFQA==
X-Google-Smtp-Source: ABdhPJwJwrJLJTrluKj/nf4XeEvKGLrZpnrT/lzEnM+wEBsNUH8UiCenbrAp3/uuru5PpyCldExM1A==
X-Received: by 2002:a17:903:285:b0:158:d693:c52c with SMTP id
 j5-20020a170903028500b00158d693c52cmr6585587plr.36.1650663632792; 
 Fri, 22 Apr 2022 14:40:32 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 nt22-20020a17090b249600b001cd4989fec7sm6748132pjb.19.2022.04.22.14.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:40:32 -0700 (PDT)
Subject: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW supports
 sv57
Date: Fri, 22 Apr 2022 14:10:55 -0700
Message-Id: <20220422211055.9278-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: alexandre.ghiti@canonical.com,         linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_144033_814218_9C60A94B 
X-CRM114-Status: GOOD (  11.29  )
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

Similar to the previous patch, this allows a dt-selected downgrade to
sv48 on systems that support sv57 in case users don't need the extra VA
bits and want to save memory or improve performance.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This is on top of the patches from Alex's set that I dropped.
---
 arch/riscv/mm/init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 16a0fa2e8432..33f7f9357ffa 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -740,6 +740,11 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 			if (!mmu_type)
 				continue;
 
+			if (!strcmp(mmu_type, "riscv,sv48")) {
+				disable_pgtable_l5();
+				return;
+			}
+
 			if (!strcmp(mmu_type, "riscv,sv39")) {
 				disable_pgtable_l5();
 				disable_pgtable_l4();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
