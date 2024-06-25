Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D14C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 03:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVH2bkq/OQLihVTjbmfpOwH21QW4Hl26jDDvnrzAB+A=; b=1JaSwBDg/ERntQ
	DZcxiD6eLyLAYbJf2yDyPmnutr2+DnCbuPzyrZ6BP5VG5BQ+snwKYbHkae5V0Hp2R+z1XKk9Y3r+9
	I28x0zO/2c3nvZMYWux63MxxAkIdabaZm945xXnsfgyFvdDK+K3dgpfacrPWUS0yWnYo8UMkhpYR5
	Oq0zVA97FZlFVlekMbE0P7PS3s4f6DFru0bI1+fDMpLKsD8Ylz9mfAnzUA624JXuft+zfU2AFD/+6
	h5s+oQZ9HvezxctyVovqHohrsCmzNqdON+BJdOzx4IEUPIYYS0Aqq/0PxMej48Yr/jBqxig1s/aT5
	9izKRuKqyH/QF1S8KzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLwUe-00000001PwY-0dkO;
	Tue, 25 Jun 2024 03:05:16 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLwUa-00000001Pw0-1ZQr
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 03:05:14 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2598f517a33so2705440fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719284711; x=1719889511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyv67PSeQklNr28uKAOt2rKwosz6YdgLMWHbFyWOHQA=;
        b=U4Y/0+1G0c0RwWMJF7jVsgmwBZv/xr9ocq3xdlh6Pg2mPTwRCdEra4GRhMc1JyjLEe
         wLyyeEHS7oaXLZGXYeOEBE4WWrY1TwzGRhStQjLQGQfJDtd952BrQk2Gb66JEmjjeGZa
         HSvSHPiMVMslf/zHE3pfjLrjyjpI7W14i6Lsr6eq1YLwwwv+Zdx2YzEfdXWKmtFf5z4G
         0xEaZ1q97cAOPidyUKPivpPdIp5qfflxvTw6kqIaJtFB8xxuooQC5CtlSFDO/yAotZd3
         W36rJ9qhCKpMAz3cTAyfGbgdyKpyDy7BeCK9HIMGiFFrirrTGWFa3A26fQDv3NzpSFOF
         3zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719284711; x=1719889511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyv67PSeQklNr28uKAOt2rKwosz6YdgLMWHbFyWOHQA=;
        b=n57TBP2CiWc3XccehYvxXZPS28SNDceThpx5VwT1nXQEG1yOmOFEiIO+cd848Q8aa5
         xEFGivshl9hi3BZeqQrF1JuhIO+J1fG4SZNwZodcox4Yh67O9g/fPL6eD61mSvluitnz
         hB6BfvOZ/3JjRo9lSZxfmasBUEiJhakPWl3NgTR4tYTIMN+8ZUjJLqoFO053tcw0vRbz
         uUgX+S1bhfOjqbZnzvqwQrEzEGQbR4wCflfrRCSkaceEBWQCccTPUaCUMua3dmcAMX05
         MWefWQBpyLyABjRuO2FxmrJGp8DVxBbCQ2yzSonDb/zhHiP1W56Q8P8fb78sIhBY17bS
         I8dA==
X-Forwarded-Encrypted: i=1; AJvYcCX6SV9t4+9dy7MMUOED7Gj4zYTlCrJushTAAVN3BhPhziZPgwOX9JgK4B2v2feHoOVHqQvGELSFJ6tQN3ZGouCSUFWoefs1zQvmK/4chW5C
X-Gm-Message-State: AOJu0YwqWuBug0c5kbCQUEHO0jEVWTs7zArmrCLctg0fZtJTUF7edzu6
	mBoZp0J+EoTCOCFqhSSEiIurv9+uaXXajkkBNtrZOIBNLwXAInkSqg+m5+6LeuI=
X-Google-Smtp-Source: AGHT+IF/DCn5jWj92MzkN0yS/LWMwk7ZFFRCntu0ONoViUjMQuwNY8dwceKK1l9FQfJHBePotKTjNQ==
X-Received: by 2002:a05:6870:524c:b0:254:9c46:8877 with SMTP id 586e51a60fabf-25d0168c516mr6589661fac.16.1719284710706;
        Mon, 24 Jun 2024 20:05:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065129acc6sm6953329b3a.157.2024.06.24.20.05.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Jun 2024 20:05:10 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	andy.chiu@sifive.com,
	alexghiti@rivosinc.com,
	conor.dooley@microchip.com,
	bjorn@rivosinc.com,
	sorear@fastmail.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Randomize lower bits of stack address
Date: Tue, 25 Jun 2024 11:05:02 +0800
Message-Id: <20240625030502.68988-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_200513_326382_ADCACBB7 
X-CRM114-Status: GOOD (  11.45  )
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

Implement arch_align_stack() to randomize the lower bits
of the stack address.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/exec.h | 8 ++++++++
 arch/riscv/kernel/process.c   | 9 +++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/riscv/include/asm/exec.h

diff --git a/arch/riscv/include/asm/exec.h b/arch/riscv/include/asm/exec.h
new file mode 100644
index 000000000000..07d9942682e0
--- /dev/null
+++ b/arch/riscv/include/asm/exec.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_EXEC_H
+#define __ASM_EXEC_H
+
+extern unsigned long arch_align_stack(unsigned long sp);
+
+#endif	/* __ASM_EXEC_H */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e4bc61c4e58a..e3142d8a6e28 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/personality.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -26,6 +27,7 @@
 #include <asm/cpuidle.h>
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
+#include <asm/exec.h>
 
 #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
 #include <linux/stackprotector.h>
@@ -99,6 +101,13 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+unsigned long arch_align_stack(unsigned long sp)
+{
+	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
+		sp -= get_random_u32_below(PAGE_SIZE);
+	return sp & ~0xf;
+}
+
 #ifdef CONFIG_COMPAT
 static bool compat_mode_supported __read_mostly;
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
