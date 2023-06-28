Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC875EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/t2rb5c21o8llSQ/BO178VKAGDXNEFSi7e1U7gRh6w=; b=gRGoYX+E65Vd1N
	kbtEsuroMWIhNQxOs+4q8CBf/qfsUm9Mj03VPP+phRtQ0lpDiKp3K/Raym2hoaQ69f1vy40rsnhaQ
	siMq3466QZBAoShJLG/c9U5yDeD3+8kj8DBhePJZ3AQF4+xraVpZ4PbZ5DE4068MLIJSzMI4W+i5w
	4qfrGGzHGz2GKQ4RZIO+nnZkSVPQztY9t4F6HeGEP1iMFBMDjlHAbYVnKUwIbmSAIj349u8J/Pyb/
	FgwqzY2IcUqNNn/b7Y2KncxdPfb9/X9CPN4dSN1AB/jU+wMcYGwJHjpzM1pEQ/dwv+4tf3HfsK5rU
	/lBpCbN8GsOWPEzn3txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV4q-00Fke2-0C;
	Wed, 28 Jun 2023 13:19:20 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV4m-00Fkd3-1b
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:19:18 +0000
X-QQ-mid: bizesmtp69t1687958310tkm13siq
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:18:28 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 4Vai6KyTH6olGrLgZSh4EBdEiPnKWxX8aNTYUPXg6Lx8/XabB2ORuydqmTx/K
	nWsv/KD90ZFL9r+VXWuXyOoaC4ERWR4sRX4WJGAdhGOcAVvoLQD6ex8moLKIWd4QdG+IQ0D
	j+Eyw8nSFDo7OPg9885wL1pFPE2ySFIKUphzXcdUp2+tx3SCAcbjOBrFZ4dxb56eUSh6pPc
	/BQ3n6GCw3KrPwbZO2/uOtkFe+rxslqi4Gdi42zsHGIqonDvO3UvUWI3MA7r00cqXahGUsa
	6HaNURQHnn3AYs8IQZA5V8bZfJyoZdF+ukP58U08Qu+0XQrbgUdUxGmj+dB65uJm67WdVz/
	Vh7LojKgfFwfn6eZRuXjKUbeiX7LvUBY8mnaXVNcLABVkgiZtjPMU6Obm8yuA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7654508823436994445
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 05/14] tools/nolibc: string.h: clean up multiple whitespaces with tab
Date: Wed, 28 Jun 2023 21:17:18 +0800
Message-Id: <bb93eb9b6684bd72dc62ddbc7a7b09b16eb5bc17.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061917_452903_C5CD8BA2 
X-CRM114-Status: UNSURE (   6.77  )
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

To align with Linux code style and let scripts/checkpatch.pl happy, the
multiple whitespaces in arch-<ARCH>.h files are cleaned up with tab.

It is detected by:

    $ grep '  *\\$' tools/include/nolibc/string.h

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/string.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 0c2e06c7c477..e8f471ce09f3 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -148,10 +148,10 @@ size_t strlen(const char *str)
  */
 #if defined(__OPTIMIZE__)
 #define nolibc_strlen(x) strlen(x)
-#define strlen(str) ({                          \
-	__builtin_constant_p((str)) ?           \
-		__builtin_strlen((str)) :       \
-		nolibc_strlen((str));           \
+#define strlen(str) ({				\
+	__builtin_constant_p((str)) ?		\
+		__builtin_strlen((str)) :	\
+		nolibc_strlen((str));		\
 })
 #endif
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
