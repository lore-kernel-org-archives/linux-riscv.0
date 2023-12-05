Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F68C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDXtu0vEKC7OjX8eKUHwMzhR+W3e1jcl2cwlmSWirIc=; b=0DPGeD3iZ3bSGS
	qOQBeiPJ8s+hOJqDlLRpDZ6nUzUKZynr+8PwEyOly9wIeNvRBO/uZRtMkS9JVcsX+l7eSfxCrvkzf
	3k6fj8Eq0TiPYMgcbEFZ9Swes+PRDStOgL0fZniOvLZCwDNX7gzjYDzRI3N8fsU0+n5CHBKGIMmM/
	CyslosfuzSl92chkuLzHrW06EldLdMMZlRGxBQWeyp8fX4xzp62CeSLww08HicFiA8Sq8sYLz8q3l
	Rbu4eu97DpeSoPXp22fknGLB7hPmdgl2x1mBWwtDcGSXlKhXDhd8rXlEm9nbzYbK29tmUlui4iUnC
	DSqah2bwlvQmqFmZtUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARj3-006nbC-1n;
	Tue, 05 Dec 2023 09:28:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARj1-006nZs-1b
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:28:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so4314184b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701768498; x=1702373298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ww+t+x4EF+o8Iz1q4xD0rNSq2UgrGpxhIva2EbXP3U=;
        b=ic5NIXMyQVv967mtmgpdoXUeRpDPWLlp1sCcOkXINtiOSvdC2db9PwdbgQ+/uwhyDd
         0GvzVbnVc1kBkhivirCFvbVvH+3wgbAl/CscQ1z7EP2YS0lKyk5zfP7G/iBw6ybeHW+e
         ryc7Ekzwt8E73Aw4bxDjXKtyAtw6HoW2Frex7TfzKm3vCOYAZYS2tNp6usCx0yOiDSs8
         5DhmAKmOWe7eFgn8iaFNDRe9HNta3mizRZnlob775lpCBiM2v8ZznJzIvIfaLfRgNcmj
         BELoX5dnTbHayhQpTvDjkjou2+/sWD318NIjMw0QCB3/kzpCNUoa7Q1zaOWkaagTb8c/
         ycgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768498; x=1702373298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ww+t+x4EF+o8Iz1q4xD0rNSq2UgrGpxhIva2EbXP3U=;
        b=qTRdRtLPm6LAKMvGvFmbQJMYrACWmFW0yYh6mbe4bqfAAAZk9g+Lau1AgfDUM4icFl
         wWCcGT9Rwil+vqjR81axXe2Ulvxw7qi2hEzQISxJI2+YrVNA/wSZxQs+J58DxN2Zb0za
         NcnF5Yh9SaeqRyXz6ht5dwNUAls12Yfsu4KwmP7QqEBVjVLmLmxHaE2NxUt/5lJ9mo6X
         GWKmzVECKYWZmVx+MFRXTETzsEILsOyaO+mUQ0g8tQxNY8+lH2oAhvWazaOk00fP7xPg
         udROgiey4LuKQf5xZ+Ou5bpIPAUePCjiB0/Ivqdlj0H2bvG7W/D7KDYTVi64OFdHdK+f
         sBHA==
X-Gm-Message-State: AOJu0YxGpsl3gHMeYPu7fWgh5vUiopd02q5PlLiaoga+AE+pZuVvpqMU
	fMIRNgkKvesxWyCiAmpxeYbL+w==
X-Google-Smtp-Source: AGHT+IFaWRkKbZw7DstMCEBheFGlYTaPcp/3Zi4NlnL96zF+Y1cISDdKfBWTpwQP+FRgk8CWXY1DdQ==
X-Received: by 2002:a05:6a00:893:b0:6ce:2757:7866 with SMTP id q19-20020a056a00089300b006ce27577866mr1216195pfj.33.1701768498058;
        Tue, 05 Dec 2023 01:28:18 -0800 (PST)
Received: from localhost.localdomain ([101.10.93.135])
        by smtp.gmail.com with ESMTPSA id l6-20020a056a00140600b006cdd723bb6fsm8858788pfu.115.2023.12.05.01.28.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2023 01:28:17 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org,
	conor@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v3 02/12] RISC-V: hook new crypto subdir into build-system
Date: Tue,  5 Dec 2023 17:27:51 +0800
Message-Id: <20231205092801.1335-3-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231205092801.1335-1-jerry.shih@sifive.com>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_012819_536788_1723F506 
X-CRM114-Status: GOOD (  13.53  )
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
index 650b1b3620d8..c7b23d2c58e4 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1436,6 +1436,9 @@ endif
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
