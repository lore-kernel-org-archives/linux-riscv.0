Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4FEC6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ol1a8kK5inyXyZ9uaw48M8SdLgyx8q4zu8WHQkAt8qA=; b=rmewSlv6hgl/5D
	cXTFtKuyQY6cysyXDcXANyCIl725tx6BJYNWcZ2UiUG3hiZIXsYv1bNX4cI8saph/Kdp7G3qoa8z6
	330XonKj9vieEk3FocuV9CG6XBCsj8UuRfqLAV0c1X6Au61cGD8PnIqCQnglnv5BueQ3Wwb5ZcIkR
	AsgAUTr6dMCH4I8hZTRZBsYFtPcGNP19k1iqvI0AF2YlkROMwGeH4oMMtAF+oNZjtTjvMXMfQMDMI
	m7gMEk5wXhsCh9iG3/4IaRNKplORMP84+Vkq2Z/Ma53sM95nuQyHllLgSNtGBPjKafMOIfvq60M0s
	G3khvgyvEBI0X1rMGjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqYM-00H11U-0Z;
	Thu, 16 Mar 2023 16:34:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqYI-00H0ys-2D
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 16:34:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1143BCE1DDA;
	Thu, 16 Mar 2023 16:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD02C433EF;
	Thu, 16 Mar 2023 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984437;
	bh=mjOBt0hwl4VEkVOuBgR29W11lOITYRPWxwYwBi1U/4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfcAYXOIco34VRppQNOKu6X0spuHgX5k9bfzDuFTIM9nvbxt91r3BKt7ijB8iRq+H
	 XpS19vMMUqGlpCJWPmr93HGIEgcEgshV8RHx2TMKNjIwO+MW72le/RqTVXtgrk1Flc
	 WprFshPehku0Cd0S5RpHXwW1TiBfWntjsfI+clgpF90YRCBxDKSaN4GL4rWMK3dvMg
	 f734u5KJzP5hmTZh5eLds+GzMgHEsv0Xn+zhy35+rJNyt18Gi0Vznd6phUnlTF9AFr
	 aMCdrP+RJ7krmhC/YjF1waQcicGWVVdZj5+2A1tKmEcm+0aAQKs6BZQ4ES63dSi00U
	 k5fl6Pu5eFJ7A==
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
Subject: [PATCH AUTOSEL 5.15 3/3] riscv: Bump COMMAND_LINE_SIZE value to 1024
Date: Thu, 16 Mar 2023 12:33:40 -0400
Message-Id: <20230316163344.708931-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316163344.708931-1-sashal@kernel.org>
References: <20230316163344.708931-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_093406_897392_0061606A 
X-CRM114-Status: GOOD (  13.63  )
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
