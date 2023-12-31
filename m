Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6F3C47077
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJkFqCaBS47gro/VENANjO0K9xx8lcv+TvLhpm+Trws=; b=VVOLtPFWUtH4Ui
	rubR9X1XbS7zvH9Wx+rxE7Y3YZZspAcdMQtKIbDMThR9UtFi6npaGLJ9WEfZyixDXuCLTFJ/mHp8R
	LvtYMJXsShum52JA2f1UhIHledhdZnxmtWcJ0tfLHNvLhj8d6zxk9u4hMzCLwVvew9zQJYNw+jJXl
	oTyLXZaWlxWSOh1mq3GpMBDPwXH6/ADilhwgf6xlE0FspWDzKPazDa0rh0Wb05HypjWpGTzQAwipX
	5hHjdbkMuPPKOdMsL+RSuemQkwVkw5llk22D4rBrGPu2EpLyT53Hgh9mfuXCTN9sFMcH7Yyn9nxE8
	X1/+S7QxY7OTMSo5d4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjQ-004mQR-0r;
	Sun, 31 Dec 2023 15:28:04 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjN-004mPG-10
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 15:28:02 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7baa8da5692so330929639f.0
        for <linux-riscv@lists.infradead.org>; Sun, 31 Dec 2023 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704036480; x=1704641280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leMifUQFY/hnRKKKOp+M4kt1TiREdMrY53gOOvxLu5g=;
        b=jgQ3Hn0+djItBcFXywCbVt/W71QUXcjizV6WMuwcFgvBFLJ5NdLkrP4K5+uev7yYGb
         7JXmeUYaSKyZk0MagiXWrpye7sJn3YrL4FCJQqQBX70sl090m2jJVt7/nsqvTWC+EBly
         KSx3U1JnSCixlxFhuvM2eGobOf64MHtSqkbGwN+38eSClQl0cLTazgMUnQ+60TJUHyaH
         flvGlmVYbcUlSKL/i7XB9sG+1NwS6xHTzg/lX+SUpNOmBdatY7DzOW94+0gBI9hDWzYR
         JoCbn3oFO6HYrQOlvpRhohat7LISv+ELaX9+krx1pReBxJXe5Jjk/uPpzBU1j7gZJAFq
         DxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704036480; x=1704641280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leMifUQFY/hnRKKKOp+M4kt1TiREdMrY53gOOvxLu5g=;
        b=QI7qwXK9WdNyZv0304V8AYQ+jT7bsfLzskNsQPsqjEQCizqGUYZZfNTidijmVg/ciT
         6BQbtlvJ7cU1Vf3lysgPsaCYwIqy1Bp2rBlRXUYadJfMDV0q4u+9JpUmqjha5rkFt+hg
         0hmwo5pRArYA6ZUQ0Xc/b8Cb8KkU2Bee2uUeQ8g9b8hcFCXnbJuPrePv4PVdyptJketw
         vifkZhLEot4yU7rAsCxieXlTTPZnIAxIdakNLeg+qilpw6SA45OD6f1Dd3bLTg5dfcHN
         ZndTIU2Os5AjKraM+nI0jwYlHsXliSdyg2rgQq4bnOtEQ9MDN07WLunz8upjJlgtvcjO
         /7fA==
X-Gm-Message-State: AOJu0YyxCxQoXLubnKRs8HUhY9SYUUIKKbZIA3ZauQN3soKyoMiz/SHl
	d3zBC71ywVcm64iDInLoXgbow8iPqzF+iw==
X-Google-Smtp-Source: AGHT+IHvzlmEOnBTt5frc//wb3eiOCzfM75y7LicREf98+n1CVL3gaYUoNXYckFPbzNADg+lxI7hlA==
X-Received: by 2002:a92:ca4a:0:b0:35f:f4ae:955e with SMTP id q10-20020a92ca4a000000b0035ff4ae955emr17849031ilo.35.1704036479991;
        Sun, 31 Dec 2023 07:27:59 -0800 (PST)
Received: from localhost.localdomain ([49.216.222.63])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001cc3c521affsm18624430plf.300.2023.12.31.07.27.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Dec 2023 07:27:59 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v4 02/11] RISC-V: hook new crypto subdir into build-system
Date: Sun, 31 Dec 2023 23:27:34 +0800
Message-Id: <20231231152743.6304-3-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231231152743.6304-1-jerry.shih@sifive.com>
References: <20231231152743.6304-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_072801_424512_D4478E2A 
X-CRM114-Status: GOOD (  13.17  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Create a crypto subdirectory for added accelerated cryptography routines
and hook it into the riscv Kbuild and the main crypto Kconfig.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 arch/riscv/Kbuild          | 1 +
 arch/riscv/crypto/Kconfig  | 5 +++++
 arch/riscv/crypto/Makefile | 4 ++++
 crypto/Kconfig             | 3 +++
 4 files changed, 13 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index d25ad1c19f88..2c585f7a0b6e 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -2,6 +2,7 @@
 
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
+obj-$(CONFIG_CRYPTO) += crypto/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
new file mode 100644
index 000000000000..10d60edc0110
--- /dev/null
+++ b/arch/riscv/crypto/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
+
+endmenu
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
new file mode 100644
index 000000000000..b3b6332c9f6d
--- /dev/null
+++ b/arch/riscv/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# linux/arch/riscv/crypto/Makefile
+#
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 70661f58ee41..c8fd2b83e589 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1519,6 +1519,9 @@ endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/crypto/Kconfig"
+endif
 if S390
 source "arch/s390/crypto/Kconfig"
 endif
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
