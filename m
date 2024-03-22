Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD2C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JoaW6+VVYpC9JN5B6dkrCAPZCcENC39oAUK/s610xKs=; b=r6pg/w4K/q75YZ
	y07MPd2APpctr0ZeGE7xQYmg67uzJdQk9PKwpUQsIAtRSdJCI+tbo5b4gbtW23FUn6Yh8+axWjm2i
	Bp6lvwFWMQow0zfkqF5u2XQGVEh6L7b1+5kCkZrVNsrYGwa/M1UPKQmH6vxnTOS+p0wg9Df96/cNp
	CVBMYgTCrwUIhdwk9rTc8H9W/ltZYx7QfBepgXMkZexhC7qfeIVbisRJMTVdpKoX4csIOSQXCnwdt
	kZefA2Usu+kNCmhlCqOL7YJMkj+M8cmzwTQ0fioS824AlL77GykXGahDbG4LcKW/82mtmnBq8pz4T
	rlm8k0ZyQPIKkDqn/XiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfFA-00000007PLE-1DGz;
	Fri, 22 Mar 2024 13:47:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfF7-00000007PKI-2PvY
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 13:47:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso1321959f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711115249; x=1711720049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r9eVyrFESxHRaOumGQtoSWklF8ifgYGnuwT/ep84+ks=;
        b=gXFa08H7gWx8fXO8uqfP9bJmLw5xo2OzuNNENIL9xlC2u4atKbdwxsN9bscWDT/zqy
         gLHXv3GLCq3Djb/BQqCj2A+damkoQ/EJNxWv/025Js3zzoYJPTyCMVvUTyx7POoB3DFx
         4D4njoWAkdiBLg7mUmYGgt0mUmkY65BMIDM9JPa2ZwRtyTWJmYGlHb4eAAFDFVCqu2dr
         CfCX0Ir8osE7ObJfEvGzu7rVI/0iHV+P6xlNsWLooUsQ7ksB9ms9nkWyXzNnR9dgFr55
         VORREiYEdzaIsO+dASmY9xsdOfaJbcpaB+I+WDL/WRBlz/+8/H3qZoSTKOWScer6NQEM
         iLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711115249; x=1711720049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9eVyrFESxHRaOumGQtoSWklF8ifgYGnuwT/ep84+ks=;
        b=Gxln68Xdf9scl8mjgiSZ1rxIEjs6e+hhh/YXYKqvYe7bLi7KbDc+QrfGVJ1KTt50zK
         jpCiwPTf+fFP8f21bn8HhTjVzIjH/jmTYMBMU5S2SNVc9Rk9DdXKEYFRa6Zplv1EDJud
         r9cMSjBwKIkdfyrWZRBrElj3P5jXZ5UmS8P3B00WAT6/PjfTPGF/LwhHnknt5qMN8F8d
         /5YmxAwZzcGb8yy7pD1wRECmUaKlUvwxAT+SqSX1zveanvl49KyRqRHs3gvE8r0OJEl/
         DjGuawN4xA+vqKENuAPsvi1uL206r0Xc+npJ4Y4N4YU3COLdYTai6ay1p+LXUhan3xv8
         zEPQ==
X-Gm-Message-State: AOJu0YxCLci5VmkDCHDhKEntqRz/jT4egZvVl5Fig9Gio/tULbR4EIFu
	EK5gvRIc7q6r2uSG96Y2A3p8F6ypcOZsnotnYgak9UmL7Fp9HFUlMqF5qJAOHmgDwavcHU8H7Gs
	m
X-Google-Smtp-Source: AGHT+IHBk1doen/lv/Mu1xyFKFoCCK3Xfk+QsHaMKj/wrZzaX7mCBBevQqD0lDngDIYw+5+9u06zvA==
X-Received: by 2002:a05:6000:1042:b0:33f:6ec0:d228 with SMTP id c2-20020a056000104200b0033f6ec0d228mr1643151wrx.1.1711115249577;
        Fri, 22 Mar 2024 06:47:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b0033e122a9a91sm38763wrb.105.2024.03.22.06.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 06:47:28 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	woodrow.shen@sifive.com
Subject: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match constraints, take 2
Date: Fri, 22 Mar 2024 14:47:28 +0100
Message-ID: <20240322134728.151255-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_064733_656451_5F927567 
X-CRM114-Status: GOOD (  11.94  )
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

Commit 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands
match constraints") attempted to ensure MK_CBO() would always
provide to a compile-time constant when given a constant, but
cpu_to_le32() isn't necessarily going to do that. Switch to manually
shifting the bytes, when needed, to finally get this right.

Reported-by: Woodrow Shen <woodrow.shen@sifive.com>
Closes: https://lore.kernel.org/all/CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com/
Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
Fixes: 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands match constraints")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c     |  2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.h | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index c537d52fafc5..a40541bb7c7d 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -19,7 +19,7 @@
 #include "hwprobe.h"
 #include "../../kselftest.h"
 
-#define MK_CBO(fn) cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
+#define MK_CBO(fn) le32_bswap((uint32_t)(fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
 
 static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
 
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
index e3fccb390c4d..f3de970c3222 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.h
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
@@ -4,6 +4,16 @@
 #include <stddef.h>
 #include <asm/hwprobe.h>
 
+#if __BYTE_ORDER == __BIG_ENDIAN
+# define le32_bswap(_x)				\
+	((((_x) & 0x000000ffU) << 24) |		\
+	 (((_x) & 0x0000ff00U) <<  8) |		\
+	 (((_x) & 0x00ff0000U) >>  8) |		\
+	 (((_x) & 0xff000000U) >> 24))
+#else
+# define le32_bswap(_x) (_x)
+#endif
+
 /*
  * Rather than relying on having a new enough libc to define this, just do it
  * ourselves.  This way we don't need to be coupled to a new-enough libc to
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
