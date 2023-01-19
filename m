Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B651CC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xalj0JWsOb+TngMbveP98u+NFib21D1A+4ryDl/YDu0=; b=wiGP4MlMQng9dO
	8Ye1uuIX68Li51SvPyFUlPCzavy1EOuvYJMewWWo0N1kKH9306RsyY8AxshGQ2DB5Z+xH0Zr5TvEU
	AQPYoepkHAKoYR0r5GOJIrSffoK7pyWrAsQP22fThf6vV2pGQtLDuA7NNiGhmAmfTQ14DP6q1YxKx
	VqtyLqShRWirUDYrewGHNbdnrRu1pdc0UshUPq4yjPc2xCJeglWA9OQkbfVpLIo51fViXjngVO4ep
	Qr5EYFq6ai4KNuAxVYe5Je/6DOoteyzOQ2jku/pMno9tEBNz9LX+LIxBOv8Vx5eVmSXPkqyPe1Prp
	saPd9eeZCzuarp+ZPgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIalR-0070zq-FM; Thu, 19 Jan 2023 19:39:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIalO-0070xN-En
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 19:39:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id v23so3303047plo.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 11:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=3qj8ImDexDNPzVIqzX+rC6wXtZROFoeR2a95ETr2dME=;
        b=v0aEc00AvYKFIvbc7c8/SdbLXYeA4x0BtTjaZae5FlUru6BzS8wuv+kY69Wy/UDOai
         6voAP3UJWPQEh1G3545vagXP1YSJub895J/8qJvInT8MLghOn9F1pNOQpdBtXqflDJBZ
         MO5JoIVfpF7GzrSWGhMsCRo3OEzIQjhttooI+GXyCK7qkhI673dtBOdK9VLJRqL0cCel
         mCe+W1NQitE3EKvqFzwvSqLD/0SmJZOjd2Db4MjKmMR1ZNDuCAFDWf01YhtQ6ZEG/spq
         +iCxXF7HVhqE5s2EglwtGz6HKQcN4t63OGoMOYhdHCwYCPsDjJhCuKtVjq8MZjuNSGXS
         Xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qj8ImDexDNPzVIqzX+rC6wXtZROFoeR2a95ETr2dME=;
        b=u2If0g8ahE7XFW9ixwk+LmB9yfa/g1Jhw1sRB72Qa06fzngI5byHIgKED83jXeqSm5
         7GBvnQPiMHYdVPED0fdnIQmOrrWZ9A5YBaOAIYvHypND99xz6VmAd72tUW9fiBw8wRQk
         a8U/e1EebHf6xoDx+cxtd56RJNbHtFYhSUwPfcwGJhByQJeyPtKLalhuMCRVKUqkLWch
         AVpUE8zKVs0ttGfCsXc+DD3UPmwPMdRpO+qRPlVlhabytCVJ7eTl8pnRTIQxwjD4ExbR
         Oq7H35Wbjgp6vKgYV6JUK5TT9dPUxjFWSW5O8zc9a6xQuhG9whwwYJ4yjVbKWFoBFzZO
         SM7A==
X-Gm-Message-State: AFqh2kqz9cbHDZURjeekt0GyQwPQA/BdUKjlKTZBXX0UzjF+RJNi42JU
	UHBf5/fN06M+aoOg7TgdAS5Jr7A8Qx89It3Z
X-Google-Smtp-Source: AMrXdXv+t/mN1DPcziVI3m7BwXImKt699rBPuBj/w1+vSl2adNP6p7Tq8J8B4kbwNBux7Yws2xvAcg==
X-Received: by 2002:a17:90a:cb88:b0:225:e9d9:63b2 with SMTP id a8-20020a17090acb8800b00225e9d963b2mr12904754pju.42.1674157188667;
        Thu, 19 Jan 2023 11:39:48 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id j17-20020a635511000000b00478b930f970sm20830234pgb.66.2023.01.19.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:39:47 -0800 (PST)
Subject: [PATCH] riscv: uapi: Lie about having futex()
Date: Thu, 19 Jan 2023 11:39:24 -0800
Message-Id: <20230119193924.21186-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Alistair Francis <Alistair.Francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_113954_755259_B055E548 
X-CRM114-Status: GOOD (  12.34  )
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

Without this libstdc++ correctly detects the lack of a futex() syscall
on rv32 and uses a fallback that doesn't work because it depends on
64-bit atomics.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---
I'm not exactly sure why this is triggering now, as it seems like all
the conditions have been there for a while, but I had to swizzle around
the toolchain tuples recently due to some glibc build system
improvements and I suspect it's related.

It looks viable to update libstdc++ to understand futex_time64, but
given how common SYS_futex is these days I'm guessing some other bits of
userspace will end up broken as well.   This certainly feels dirty, but
it's easy.
---
 arch/riscv/include/asm/unistd.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 221630bdbd07..26116686690a 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -24,3 +24,11 @@
 #include <uapi/asm/unistd.h>
 
 #define NR_syscalls (__NR_syscalls)
+
+/*
+ * Userspace (at least libstdc++) has come to expect SYS_futex, but we only
+ * have SYS_futex_time64 on rv32.  So just lie.
+ */
+#ifndef __LP64__
+#define __NR_futex __NR_futex_time64
+#endif
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
