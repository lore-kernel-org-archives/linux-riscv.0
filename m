Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFF9C7618E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ol1a8kK5inyXyZ9uaw48M8SdLgyx8q4zu8WHQkAt8qA=; b=LXU39wl+CdQS0c
	cAJLvNv6vdZBEea335JNkWqNONJDSJc0s2eSSic4eQpBNIvSn6BGCIpVMXzar4KOn6Z+YT4fa3+C7
	aOj9A4G0ImbQDJNWj320xwfYz8ITiBSfrStDN4/65lOuGA1Akle6Yi2bV1XlVpsxQ2U0FFHpwbkCr
	+7HbnG6DNJir9HUnU8ijsGZ0/9wuPbzvK0RFsWaj+X0vEodD7j49ZgEf8HHOek1kXu5B9CIgZkHoS
	aFtVtCiCaxxDZMMpvrG+4KoYM5v2iQKOZIyrvhoIWTNUuin7JrmoYZFIsJgK6Y+3GwF9jDR1GteHD
	NMgeZ0YrHj+zeQ8CR9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqYa-00H16O-0A;
	Thu, 16 Mar 2023 16:34:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqYW-00H14c-2u
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 16:34:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8ABDAB8228A;
	Thu, 16 Mar 2023 16:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA5C433D2;
	Thu, 16 Mar 2023 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984458;
	bh=mjOBt0hwl4VEkVOuBgR29W11lOITYRPWxwYwBi1U/4k=;
	h=From:To:Cc:Subject:Date:From;
	b=RnSnpXS3Xm9ai5Poh1VPMCOF7dz6QmSqTFbozcXRAeC+l+0KtXZVWnJlpyLz0bIdG
	 hKIyzUss4eiVx/qGmhRY3qXHnaN7ZXXk9JPnz+gwZ6rNO+LugRHoQdKM05Sdy1iTGd
	 UXhet6KwQM+bUWX36+Y1S79y1XnV1xbJUXGTh0CaoJp53VDnhQypCY84NNL0O+JRWn
	 GmtLw0nFbSbxrSO/ExUjQIspo5YEeCCQhb91Sep/lozJ8MGQWOcgZ3nR4p/1o2gSrN
	 ZQ+rALb3FCKYIOhvTdm7t36ycNbFFFcFJqJzmQZSbd3GLxsJFmJsZ9ToBHkHFA61Jl
	 TbTQUIHM2oiPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Dmitry Vyukov <dvyukov@google.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19] riscv: Bump COMMAND_LINE_SIZE value to 1024
Date: Thu, 16 Mar 2023 12:34:12 -0400
Message-Id: <20230316163415.709058-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_093421_086725_4480DF33 
X-CRM114-Status: GOOD (  13.24  )
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

From: Alexandre Ghiti <alex@ghiti.fr>

[ Upstream commit 61fc1ee8be26bc192d691932b0a67eabee45d12f ]

Increase COMMAND_LINE_SIZE as the current default value is too low
for syzbot kernel command line.

There has been considerable discussion on this patch that has led to a
larger patch set removing COMMAND_LINE_SIZE from the uapi headers on all
ports.  That's not quite done yet, but it's gotten far enough we're
confident this is not a uABI change so this is safe.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Link: https://lore.kernel.org/r/20210316193420.904-1-alex@ghiti.fr
[Palmer: it's not uabi]
Link: https://lore.kernel.org/linux-riscv/874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com/#t
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/uapi/asm/setup.h | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 arch/riscv/include/uapi/asm/setup.h

diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
new file mode 100644
index 0000000000000..66b13a5228808
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/setup.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+
+#ifndef _UAPI_ASM_RISCV_SETUP_H
+#define _UAPI_ASM_RISCV_SETUP_H
+
+#define COMMAND_LINE_SIZE	1024
+
+#endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
