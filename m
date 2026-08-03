Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA94C55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 22:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gyPwzo0gjkMgVykJMaYRgCrtiz8/ximL2B86oKJEZpQ=; b=BrHR6TJm1y4puX
	mejw5kuZXNnpSwYa8hs0P56/LPoDUzk+oGlf+3gMey4ObguAUob04a6I0IvDbF8QTd/5zYy670dRh
	ypdeiH16f68qamUcmGnx8OD/jmVIf1bZneezbUU5uTQbMf/oQ4euws4vpsl+IiGev7Nlv38oxdaJm
	ZLEhDvEz+8GstJ6Y4xXA0Ac0rZQ0Ur2MN3rps5aDgtJ7lELk4s4yX4Pc78S2uUPR1mWlHeBASD7kc
	c5ObIshZ1bvp/w3UZ6b7Ce71kUjEAgoDmeOicADQlglT5XaCjaTQeoFDzx8udW4Gxv414N97d5f9q
	UgsV3trNzMcoVTjg6x4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1Zk-00000000dpV-1xKX;
	Mon, 03 Aug 2026 22:56:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1Zi-00000000doK-3S0R
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 22:56:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4957eefd361so18245925e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785797760; x=1786402560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NG+pUn/qYdtaBwZ98+q9ajW2K5Awz1ROE2xKD0CL5X0=;
        b=mF+spjL0RA46BzxFewcZQe7EDbSqknU6XP/XiqnUoboAY6pQvI0LZ1xveVFNrnmSh3
         PUwqB7dLYv+pmPE2Nn74nNV/78mlg4QShurouEsIlSeoKtBoHpJ6lKZekEQyXFtiDd2j
         OKphbOxLed0m90cknlvBWk2nXquFMlEA9XMS6l5b86jY+/KqmU1hh56FvIdjLg5ZQZOP
         vr5B+4htoLDQIozKr3HGyZ6rw5raj5yxDT4qWjBSFVbGhVYVCa0lTYZcy00LtgomtdPm
         7Zy1FvDVMdtyOSvg7sP0P/UMP28B3x1x2HtykD7JGBSrhvbemr8C2lHVyFclfgH7Z6Mq
         0sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785797760; x=1786402560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NG+pUn/qYdtaBwZ98+q9ajW2K5Awz1ROE2xKD0CL5X0=;
        b=Gso9kn4FJ7jLItWa/abEgg071A/ELYMbcYYIjddWZdjZPDbRzxxy8DiBnOucv+bmFN
         5QiT46LGapWMuWkeP5RHHaE6uhgeGgpllCCRf0O/q1d6e5xQ6huTCdzJCCMmcZf0VzFu
         CBbLAYvovmAwLMkIZaE56aWds7uPLTRRqRj+36vpZkiDJQW+ErxfTTj/NcVbYlbXGE0E
         06Y5rdbQxDbi3mJzA0zg1gTDKLi/NP68Xzz0bBUa1UA1cm8RwfFPH1WTKFVQ9JLnGRhn
         38bnax/U/YmuV48CFbkTDJs/cdl29S3jlMQ3PAoYTtJph2Ij3woy+XE0gscW4Qk84wjc
         2OjA==
X-Gm-Message-State: AOJu0YykiTx7hvw5j2yqbDm08x9fUPrfC/wNcP0H2nP1gDOf9JlgFjgM
	3Es/nAsnoqbNLirqU82csEJpAdDX1hdXydnnNncVY7AAhK4QpplTQaXyfVCBtA==
X-Gm-Gg: AR+sD11pXoZ72dJ1vgYdlOAsAPepAAdBOLsTLv7g9kSY5yD7NV+FjD0HEIwIf3SE6Qe
	m5mY7JS6L3j6v1gsQmOe83isUJga7PftBqyzOCzrjx025hHNV2IgFFQquQYgTXADilCe4jddvlW
	QfEB4Np1EErC+9IbGonVsjVkvi1HUQ3j36C9QhSIHaDSH8u4ZElpHXnVa1kMffJwEhC/7hBCHvZ
	Q5wBB8426Gm69RiT4WCCXePpaRyuNHBSmqwKfaayIINqs0q5f8I5GKSskFI8cJFPJM3kWDGyQmV
	gNhVkck9nwmQQW2zfJk/uRKnHhWRBFlqC9WrY+afLlgqyKEsn7KmqoCra8dfmE7q2pfATvcSuoK
	4E6pIaw8eGgtSW6hnVkUbLijYFVcKxqd+h8laSC0pyqTLG4cRYg5CWdxJfgYlqhgYBbInlAcB5t
	lBow1ZUaQAvoX8faXCURIVcVYK2yRemnXkZGSu4oB02rlJc4y4tlRwbWP3oYS2RgPUZNcPeaA=
X-Received: by 2002:a05:600c:840f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4980c5fa29amr239323745e9.0.1785797760103;
        Mon, 03 Aug 2026 15:56:00 -0700 (PDT)
Received: from potato ([31.176.181.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm35691695e9.0.2026.08.03.15.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:55:59 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] riscv: add ntl_hints.h for non-temporal locality hints
Date: Tue,  4 Aug 2026 00:55:47 +0200
Message-ID: <20260803225551.142098-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_155602_866155_A3884830 
X-CRM114-Status: GOOD (  10.31  )
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

Provides asm volatile wrappers for all NTL hint variants
(P1, PALL, S1, ALL) defined by the Zihintntl extension.

These hints request non-temporal caching behaviour for subsequent
loads and stores.

The new header falls under the existing riscv arch maintainers
in MAINTAINERS, so no separate entry needed.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 arch/riscv/include/asm/ntl_hints.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 arch/riscv/include/asm/ntl_hints.h

diff --git a/arch/riscv/include/asm/ntl_hints.h b/arch/riscv/include/asm/ntl_hints.h
new file mode 100644
index 000000000000..0c51cb8b49c2
--- /dev/null
+++ b/arch/riscv/include/asm/ntl_hints.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_NTL_HINTS_H
+#define _ASM_RISCV_NTL_HINTS_H
+
+#define ntl_all()	({ __asm__ __volatile__("add x0, x0, x5" ::: ); })
+#define ntl_p1()	({ __asm__ __volatile__("add x0, x0, x2" ::: ); })
+#define ntl_pall()	({ __asm__ __volatile__("add x0, x0, x3" ::: ); })
+#define ntl_s1()	({ __asm__ __volatile__("add x0, x0, x4" ::: ); })
+
+#endif /* _ASM_RISCV_NTL_HINTS_H */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
