Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E4EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqQdDchEWmwo/vyKEgOtAkdaKCe50MK+I8nnuwaTYM4=; b=xvYmv7V7NrQmFT
	Sez91npomXNFvFYLycnv6hTbYYS+WAiweM84P+rMcnp172Mg6lB1lvcdYB9eJm9lzOGJ8MsUXstcG
	48Yr4IW/09BYj6nKsgFPorwzGAyXJieFCFxT1i/cTC5CtusiGB24oaOygoPQALMsADZxTeoMpjiFf
	s6GRdKzXvbUjXFLuN8xeLycNaMN2q4AWFXKSCnoGVjYMsSboJINeEBgNhXOGWtedXOkDF2ku1KA22
	3aTSAWLSLJv4fYNgKQ4/8hU27+50t/GEDgPMJNm9TOOT+Qritteqx7jzs+tgVy00TkGrMl3SCXR6Z
	v+pJYnR7xQspVzE/2rKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH5K-008pBE-1E;
	Mon, 19 Jun 2023 15:46:30 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH5G-008p94-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:46:28 +0000
X-QQ-mid: bizesmtp74t1687189569t7m7jpj5
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:46:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 6/K5pWSRdGohZNUvm+E+aBmN22HnnFyRXuRHvnGIbTDVz3MMHAcfAkZHut/22
	oBZEiw0bdSq3fdy8TZ1wLcWNbBv6BS5Qkib2Uf/E07s/XKnsvEdfPyIeyfdcmGQ6iaEekGP
	wdGVwIuoFAS/GmCNoaZGs0BE23z2/9ssANxofiDOaUMK8Q7LUyJZt3nZLNQ0BTE+xWG91mO
	1CqBoQCuXORCxllYiYYSKCPE9I3aJbD3ryi9WUUHv34iJKJthT6220tPZBmICcgArJqXJZb
	JaMq/mVg+AInXb433YehYBPwUtAehkvYfqnYiWAMbukF2h8Ph9i9NRvCK3jVSr7od41o5YK
	kjrCWk+7LIYzRIw/YRYGUaX+gcdvt1WqvCfNx7SdcYexpWQ7yYQ3liuAHlGfg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6480484968202464133
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 04/10] tools/nolibc: unistd.h: reorder the syscall macros
Date: Mon, 19 Jun 2023 23:45:56 +0800
Message-Id: <1bd84b8adfa209f89a04e6beadb412385af7859b.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084627_138270_B3CB3B9A 
X-CRM114-Status: UNSURE (   8.62  )
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

Tune the macros in the using order and align most of them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/unistd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index fabc846f797b..e38f3660c051 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -56,9 +56,9 @@ int tcsetpgrp(int fd, pid_t pid)
 	return ioctl(fd, TIOCSPGRP, &pid);
 }
 
-#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
-#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
 #define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
+#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
+#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
 #define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
 #define syscall(...) _syscall_n(_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
 
-- 
2.25.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
