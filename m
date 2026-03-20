Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007161093168
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Wwes6DE3Iu7RCsL/Kd082jgCeZ4GugaO9PZjpw+bu4=; b=w9aDTYOuIIiW6S
	3cRGPeaN+X7Wg3r6y/MXdq0zumB6ikoxnkew+NHBk8z4NmoTEdmL/dua7BR3nOpJsY+4SrTmHKQST
	ME/nib9FQ8qfA71qQxsD474sfJZ78addpgi8mvhOd79qK/aLWhx4QlWQYhpWjsinknRDEMDgOZ9iX
	PT5xpCx/yiD5wNwsHGPIgAlSi3NAVPChE/KUNZqAqYt9M1vlBq26HDjAZ1Rxxg4NIX/nw1/9PXntN
	ssuOfF5PFWxbqmOcBc20/cDKcfG+xiUKmPRFJb1uX1C6BEy0d3lHR3qJ9keSLPLR25lL6COl6S4Wy
	34e3/kdqd9hsqH4PSnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSH-0000000BvWu-1oJ4;
	Fri, 20 Mar 2026 02:19:17 +0000
Received: from out199-17.us.a.mail.aliyun.com ([47.90.199.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSE-0000000BvVq-0wlR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 02:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773973145; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EAzJzufneBlcPoGjpazLCaVobJJTAb5aIWwFY3yZDWc=;
	b=GgNUlyZkNW9a2GbezmOLUH7uTInyV2YncPzr1LFL/LI8s/OTLuVCiXKL+dY+/Yus+MNMZ8D9gMsW4PRwOrF8KbTHxUCc+Z8BKknWfeQM87GhpBQgT0NKf9sIEqUxE3SViy3hDLFFDjhOGqTyI8u77Oq+ZCHF520fzSQb/lA/1/I=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X.JxWDv_1773973143;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X.JxWDv_1773973143 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 10:19:04 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	alex@ghiti.fr,
	debug@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 1/2] riscv: vdso_cfi: Add clean rule for copied sources
Date: Fri, 20 Mar 2026 10:18:49 +0800
Message-ID: <20260320021850.1877-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320021850.1877-1-cp0613@linux.alibaba.com>
References: <20260320021850.1877-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_191914_531861_9DE1B323 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

When building VDSO with CFI support, source files are copied from the main
VDSO directory to the CFI build directory as part of the build process.
However, these copied source files were not removed during 'make clean',
leaving temporary files in the build directory.

Add the clean-files variable to ensure that these copied .c and .S files
are properly cleaned up. The notdir() function is used to strip the path
prefix, as clean-files expects relative file names without directory
components.

This ensures the build directory is left in a clean state after make clean.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/vdso_cfi/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/vdso_cfi/Makefile b/arch/riscv/kernel/vdso_cfi/Makefile
index 8ebd190782b0..10292498b765 100644
--- a/arch/riscv/kernel/vdso_cfi/Makefile
+++ b/arch/riscv/kernel/vdso_cfi/Makefile
@@ -23,3 +23,6 @@ $(vdso_c_objects): $(obj)/%.c: $(src)/%.c
 # Include the main VDSO Makefile which contains all the build rules and sources
 # The VDSO_CFI_BUILD variable will be passed to it to enable CFI compilation
 include $(src)/Makefile
+
+# Clean rules - remove the copied source files
+clean-files += $(notdir $(vdso_c_sources)) $(notdir $(vdso_S_sources))
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
