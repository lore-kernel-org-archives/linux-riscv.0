Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6287EECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 03:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7nkkhx6NL3hEec9fEqFrJJednZf5c0UV6UJhWO0llQE=; b=w4yYrFUWLb6DbJ
	bl/Kg0gv4jVok/naKmZzTRlPUJxCN7UucTNeiTjkxSR/HRJFUfIe5UB6nsTuZPt7wxpeqoC4psqwa
	uYv12IIO1V7jW6acAQJeg229LQjygeSnfLWll0QWPq9TPUT4D7zuLBX5H+ZiDLtcZiPfCsUBlh1NW
	Qt//3Ac3Ubc5T5oFsPj6BY0Uv0g6JAT0YfknWvJpqpu7Ba23vqlza5ES/7U5y00lQk9NLOgijK8ai
	YrRoZ4SK4QkLManWFAjVSoJesZwZPEOoVf7fV5mrNQYto6dn16mWAfFA5HdZAnhZLJVk4kSBPuL8p
	2XMtVYjXSmwm+3HAmsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1gA-0069da-SL; Fri, 16 Sep 2022 03:06:10 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1g6-0069bq-EQ
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 03:06:09 +0000
Received: by mail-pj1-x102a.google.com with SMTP id q3so19683131pjg.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FiKTe8Q+mkTmykXyhObB1oFwfgvUMBsktlVZrzooRCs=;
        b=R9C8eSFRs6joqTEO2h/L1RdY1JKj0nMTZECQsHTHnH64wBgqPmGGb4Dp33SRbI4Hv0
         OptYZh62jSWuzrh/GoQCvnPj+4IswqwFBUp0ZbocUm/NInGbMPX93uFv0iOHQgh07IPi
         6cmgqUDiiBUV0ZaznQ2xnWsC3H/SNBfQQkJljJeAOp8IdDWyTC1VtTCuecgdI59firWO
         Z66CqesK4qwtUtAVgO6fYqaGJ3pPl4jcu1sq65RmpbrDsO0mHtbn2sV0j6xn36Re9KMV
         GPfJQUBhbwglvcqOstujo0Ebnfq5J6y+p099HChg+UzwRv2PYqUNgxsVchgeP2PfMYIe
         pjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FiKTe8Q+mkTmykXyhObB1oFwfgvUMBsktlVZrzooRCs=;
        b=HqKoeHVf9+FjtX3Hw4Oej2bEf4qeiyyHfqm0QcKjzTb12IFCtDFf3IL8cUxOqrKKHd
         OmvIfQRWFAereL6DUPIeeHn5/+ZRW8qqdLGrJOE2HvF33LCBuG4JJ301zqAq39IxYCkP
         iVQlKVK6AW0E7bMpglRQSbNg3frhgbiHeIIXX33AqhkJ3iQ2fXq+wBlaug/NpAnNTii4
         y1lbWcAJr5OhHc4Ji3Hrz9V9TEyTK4kLL/OvIHFeTiueOrB1Pml/2AWup3fF7m1+YAwY
         cvoDjzLBHIXNz3okmf1rAp8N9JtSof5npRUykIMVIGes7kX8rNiHlCUU/t287w4BGouZ
         yLrQ==
X-Gm-Message-State: ACrzQf3tx5wP2rAwCw7rXP2a7/uD66bDpxkpbClURq9SNUnGtNhvUa46
	Bw3YSXs+oC41dMkZY0ctMgrqe57QagvDqQ==
X-Google-Smtp-Source: AMsMyM5Rvlb83UyNtOwLareUqsGwv3iM1I/eh9HRlOh/vlLu/kt3jxbJPpZgXvukl2uiUtkJXmYltw==
X-Received: by 2002:a17:90b:38cb:b0:203:100:bb53 with SMTP id nn11-20020a17090b38cb00b002030100bb53mr3164068pjb.107.1663297562360;
        Thu, 15 Sep 2022 20:06:02 -0700 (PDT)
Received: from vineet-framework.ba.rivosinc.com (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id l16-20020a17090a071000b00200b2894648sm330518pjl.52.2022.09.15.20.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 20:06:02 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Christoph Muellner <cmuellner@ventanamicro.com>,
	linu@rivosinc.com,
	Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] riscv: ztso: disallow elf binaries needing TSO
Date: Thu, 15 Sep 2022 20:05:52 -0700
Message-Id: <20220916030552.1396820-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_200606_695765_74DF38D7 
X-CRM114-Status: GOOD (  12.72  )
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

As of now the software stack needs work to support ztso. Until that work
is finished, disallow binaries needing TSO.

This patch is needed to help ztso ratification and prolifiration of tso
bits in tooling.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/include/asm/elf.h      | 11 ++++++++++-
 arch/riscv/include/uapi/asm/elf.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index f53c40026c7a..37a47352f633 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -26,10 +26,19 @@
 
 #define ELF_DATA	ELFDATA2LSB
 
+/*
+ * Make sure the extensions are compatible.
+ *
+ * In the final incarnation this will get the features as provided by DT and
+ * make sure kernel build is compatible.
+ * For now disallow TSO built binaries.
+ */
+#define rv_ext_ok(x)	(!((x)->e_flags & EF_RISCV_TSO))
+
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#define elf_check_arch(x) ((x)->e_machine == EM_RISCV && rv_ext_ok())
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index d696d6610231..fa9e4c52c7ac 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -32,6 +32,8 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define ELF_RISCV_R_TYPE(r_info)	ELF32_R_TYPE(r_info)
 #endif
 
+#define EF_RISCV_TSO		(1 << 3)
+
 /*
  * RISC-V relocation types
  */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
