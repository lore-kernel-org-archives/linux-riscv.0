Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB3C001B0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBogQ1zIPUVKLldmLx7eHaaOwAqQQykBwsthU2E6em8=; b=E0HlCVkvnbgGs5
	HFgpaqFBcA0Exd4pjGcF5tWPhGFsuPjpkizZ77Rl726li0nTUkGCcAIgdX+Ww/WzqgDWz1yQoiwSt
	+O+Ta1dWDK3Bz1iv+1bpnq/y5ZLZexeDKKj8jg7KkpT4hEu1c9kE+rVLx0SHEvQRWzW7BF5Ka1Lth
	xpUSnM0pBh3ORoNHNAL3aG2ENRc6ZBJhC6Z6VPaQzSrzPEDW+poePyBFaJzVqDPFltTTWaOnXnpcO
	RdijQn6REV+U/7Y28xe2dSizQy5B5QkWUeBcbsyhanxfBjNTHRCJnPc5+XBajHk/U5o+XdxJ2bNBu
	XT7xvECPh2TlsP1bYkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmtv-004wiz-0f;
	Fri, 07 Jul 2023 14:57:39 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmtr-004whS-1p
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:57:37 +0000
X-QQ-mid: bizesmtp65t1688741838t0f6f5rq
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:57:17 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: 6/K5pWSRdGp5l3PoSnsEr+W6n/O4GVkW2LsupZpOaCCnabhC9drJ+DsHTHGGa
	rpPAydJpCLVE4Yu5xjNNf886fcd75eYPy4f1CJVneC7/0vFizOlY/8RavL9cQLH+5qlBKdY
	T26RBSYkIWrac+plKyZyFDAQHOazNAOnx1T7kOiVneWS5f/wr8Ez5VRxQvzZvQxdei7uftr
	G8bYJAdCFUoNytCFtmfyt9XZohqeJxoGQaPP3fHRTj28Ly8xD8BkFYsPULycHa/6IDvJuAN
	MqUK5SPN9/+jB5l4g/5XTC9L51uz2CBdxApWKXmcHXt6PfAwJmgYn/9kDGGQLO0EvowDYOC
	tj5RprGXjtRiusZgLAzassh26B9m6zPartP8HLPVFF77FEdqu/QC8BNCz0T6GLu2e8ZMYia
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6279798532617974938
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v6 06/15] tools/nolibc: __sysret: support syscalls who return a pointer
Date: Fri,  7 Jul 2023 22:56:59 +0800
Message-Id: <11fd815773f7d202d329ac2c64cd6980b32e4fcf.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075735_925482_B2459B9E 
X-CRM114-Status: GOOD (  10.16  )
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

No official reference states the errno range, here aligns with musl and
glibc and uses [-MAX_ERRNO, -1] instead of all negative ones.

- musl: src/internal/syscall_ret.c
- glibc: sysdeps/unix/sysv/linux/sysdep.h

The MAX_ERRNO used by musl and glibc is 4095, just like the one nolibc
defined in tools/include/nolibc/errno.h.

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/lkml/ZKKdD%2Fp4UkEavru6@1wt.eu/
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Link: https://lore.kernel.org/linux-riscv/94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 53bc3ad6593e..3479f54d7957 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -28,13 +28,20 @@
 #include "errno.h"
 #include "types.h"
 
-/* Syscall return helper, set errno as -ret when ret < 0 */
+
+/* Syscall return helper for library routines, set errno as -ret when ret is in
+ * range of [-MAX_ERRNO, -1]
+ *
+ * Note, No official reference states the errno range here aligns with musl
+ * (src/internal/syscall_ret.c) and glibc (sysdeps/unix/sysv/linux/sysdep.h)
+ */
+
 static __inline__ __attribute__((unused, always_inline))
-long __sysret(long ret)
+long __sysret(unsigned long ret)
 {
-	if (ret < 0) {
-		SET_ERRNO(-ret);
-		ret = -1;
+	if (ret >= (unsigned long)-MAX_ERRNO) {
+		SET_ERRNO(-(long)ret);
+		return -1;
 	}
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
