Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F92EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u6jbNvKOMw7A8XnE6er6OGR8tToGZSnHms7d8rQaMCA=; b=uEFn4+HSQC5wpg
	lddowTwMPYLGH5KqvZ5rY0ZwVfAivCn8wo+4qxFsDhRqsIOqOzCQZK+Fw4zYgYlqXtAvaJrjJCbsX
	byvxAw9BAxFeADnoQxjLO+OWSjWYV18EZe66tgTPCxp726wWp1YDVW1IvEFJ0R9139rsqg6GpBTzV
	J8bazKUnMX7YPPa8m4WpeKJunlxbyrV0uEoXDt2vMZrq2NXR1op57bGrt29qmPDygFM5o8pfk7zhx
	shTMjD8GbP6EXDSY2DbkxHj55hRu9KBGfERwCfdgtV9t7m+tq4qofEcS5v5VyYAqs5RKDFFRSVUCO
	o7rr9RNF4U8ruiodTqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcUs-00000008xFg-3LMi;
	Fri, 21 Jun 2024 11:32:02 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcUq-00000008xDU-0qV2
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 11:32:01 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70435f4c330so1653206b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718969519; x=1719574319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEfFryDpLG4dH8zCVdjU9zRDBUZiLvxvddXIXcpMvC0=;
        b=iMRxoQKEJWNZnOPMvUajofRwmTvzjq0L7chotBvCya22U9V6x3Fyson/be9yF25QE9
         RoJ3utt3atmBSP5ZiOqJSiwJGxevMUKF9gowFdsi7VUZW/cuYRaJzJxdUN0lDOetwzHh
         sGWNasqHCfhl09DcOfdY+x8OBHBrjLRZlyb75Hp4yZUHxbv7fl9jNJO5SVjrpRguT9/e
         vURobCiKgl0Rx2vfeg4q0t/+olsawsGseaIqb99rRukqbf42+kzNbsUCCKrXoq9+pXj1
         vnpS97aQHUlmM4nTm/eFQlFwgAELf/0HX9L9gCpdQqeSZPQEFSndg35HW4jsiXXR2nPc
         hPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969519; x=1719574319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEfFryDpLG4dH8zCVdjU9zRDBUZiLvxvddXIXcpMvC0=;
        b=FJalMCPJ3Etlh96lkFFR8z9DfZ+ncF0C3bsQsqwPks4b92f+j0L9tymEuVuc7Cry4p
         YrNBEhELPeMMEFzVwIRtkvz/8occqzCBAiPdp3gNN+RjZ+lyaJKLhuAGDMWQE8cQs0Hl
         rnoy/C04/IgYFVQHjyBH7cIsQjq0tCJMlwNLtC3xSsdgL1+lMWRhlteDo1uS47AQmibo
         DypEKMkxqxPCyKQ8CtR5nBe+Kr0AYyck64cCIARRmP+5Bg/lLH+81nXaXZ18zdwnnA2u
         kuaMc8Kxj9qAmIvydU+TUgEbdXzGjMePtPsxUCG4XwxZKpIWbjKrcWkd72VU0doksmZl
         tDDw==
X-Forwarded-Encrypted: i=1; AJvYcCXz5ZcmiaAwabkYoU4svjDwtaS0KbJy2b0aXMxNxxkliwNmMo5ZA3Jyu2jknaMEOa1BsxpSqW8bTUJbpjPrHSKIoUeBOZrtYeiiQpAT1ZAg
X-Gm-Message-State: AOJu0YzmSxnC5DkHwWPC109SqvlgM5rX+0puYJw86glNUPUziOj5VDyp
	R8XrPBOhkNQeWKK47vwNZniHw/rBVKlTqMBxRc5up/POZ6jcXnV3d3v4IGNGuqo=
X-Google-Smtp-Source: AGHT+IFT/y1zF1Jddf2NzmkYrziVwMZjrrqkWjtGt/0nH8eLs1/XWHtwzQpNBQcoLZX3seWwnm/v6Q==
X-Received: by 2002:a05:6a20:a98a:b0:1b1:ed9d:f92e with SMTP id adf61e73a8af0-1bcbb641494mr7867935637.38.1718969518719;
        Fri, 21 Jun 2024 04:31:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065124e354sm1181707b3a.119.2024.06.21.04.31.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 04:31:58 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
Date: Fri, 21 Jun 2024 19:31:43 +0800
Message-Id: <20240621113143.35827-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_043200_272353_27F6E205 
X-CRM114-Status: GOOD (  12.43  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

A handful of user-visible behavior is based on the frequency of the
time CSR.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc015b452ebf..c07f159d8906 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -229,3 +229,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mtime`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7b95fadbea2a..18754341ff14 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 83fcc939df67..fc3b40fb9def 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/delay.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
