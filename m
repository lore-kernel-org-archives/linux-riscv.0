Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE43C25B6F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2N2CEIPmT1ZfJL3sttofM+C1rQYfSniqFzShZz1lMTo=; b=fe97i+by2UBwBb
	JFPTadXorM0nDAmId7B/Op+hLCjGPB4vsrFR6iCKqF2JWlNU0it7W1SeJlXtTImTfe0WGb4yqbRch
	HiHqYIukuZkn+2CQkZalDgWzLecFw0Au1xkHjZ7u3cmogubTydzxqUoXRkoa6tiD5Uf4mPnCljkqN
	X8VjxFOc9y/3mB81IiP5zLdfhh2oLGpwkvG3MNXof9Q0HqNX5TgKyUyH7EOoXIswzX2PoMWod8Tp6
	NuJtNh5Masv/IxTmiTDxqhOpmXw2jMBRtLC62gRSLSYW1MJMQRr57JeiMMsyeJfAFVCzNg0bEYZFq
	nBf6FzDITyJaZ7vJXClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikf-00CsF4-12;
	Wed, 25 Oct 2023 18:37:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikb-00CsCz-0O
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:37:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5ab2cb900fcso97824a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698259023; x=1698863823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMA+62ieF0dHRmbCC9GfwETOr1r4110ste5ly+nBz6U=;
        b=J7Mr603WpUDIe3B8ktGKyoLCKRhUKKScSPzwtCfgyBXUkie6MAFv9utRQkg3a0LeA7
         amtXgD+CdGdk6gGcbk+iRrMqsWLItXT0zRfAavSonh/UYU6okg4lAxfxUm4qSElhPIVz
         InlNzLZq07jKp0Ny+fRnZVocxyNtMZ0SY/Izz/NzdmwCOPNApmyZfIp4KuW3IJT+iH6k
         kW0drddYzfsSj2CPmaZIxI7N9KZbUR5B+xHaYYNMBoDHIWA0JxWWGZ3crv200jtbfk8v
         9vICQVutk6dyXn2MaUHuW+rRF7ieBv0fsRU89Z2N6W7/sEpGVzMPC04BRRBJzQsmzfqr
         UuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698259023; x=1698863823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMA+62ieF0dHRmbCC9GfwETOr1r4110ste5ly+nBz6U=;
        b=XWjpw/a6S0GRELkVl3iXkpZ/+qijdVj093feoixD1JzPOm7UW6t1owxWVBq3ApFcDv
         fXtjmU0f9kXfJHdi72anc+9Bect+Rzjf1WkjvRjWgqr0lAl5OvmEhAzNyh/4iXVn3UaD
         drKjsdVHlfE333vyUkgi3qR9o3gbaWtqIVmJ1PY6zrdEgDILVc3fY19mKQQVR9vgxBbB
         X7QudeEqbqYSkr2HNSoSyy0Vh0yYUAEMcz2iB4nY2OGsg3k7JBQ0ihLK7WT3kDxTDKLo
         6mObnCZF/4ZvFGTZ1UTt4dwV8tYMcWoWPB3eBvACObXvxSelEJQgKHlQOXk6OkgYFbNk
         xeiQ==
X-Gm-Message-State: AOJu0Yz/3Gp7XMySU876GQiDpBNMJzFUpJbAfWWKBtk2lcO+0U8Bsb2c
	pUmHObP78mkuo8rnYtUJtlmwzQ==
X-Google-Smtp-Source: AGHT+IGWiBP6XA7K/f/VG9hs7DTTqjpeQ8mNNk//GZj6Js6XKPfQH2D4dC63vtWJoNHA/uNws80I8A==
X-Received: by 2002:a17:90a:7889:b0:27d:1dc:aa5a with SMTP id x9-20020a17090a788900b0027d01dcaa5amr15159894pjk.23.1698259023367;
        Wed, 25 Oct 2023 11:37:03 -0700 (PDT)
Received: from localhost.localdomain ([49.216.222.119])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090adb0300b00278f1512dd9sm212367pjv.32.2023.10.25.11.36.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Oct 2023 11:37:03 -0700 (PDT)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	heiko@sntech.de,
	ebiggers@kernel.org,
	ardb@kernel.org,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH 02/12] RISC-V: hook new crypto subdir into build-system
Date: Thu, 26 Oct 2023 02:36:34 +0800
Message-Id: <20231025183644.8735-3-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231025183644.8735-1-jerry.shih@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_113705_162072_563019D5 
X-CRM114-Status: GOOD (  14.12  )
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
