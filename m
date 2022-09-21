Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A947ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CHSAZoQHWKl+ziAEnUIUuW+DkDtM0wDyd6+uOBPXUw=; b=v8vg4l/dyEXrxl
	IY9a+wlkr2dzUFK9Y74jzi1og7fHozNJc6jPXx3dYgmK8iKF+foUeiTVeHzAhdsbEpc7wM8NqrynT
	ht9P/sQQ3y729xIfEBEXbnVzJ7IVgTfNnM9Ph/RxFJw+nnFAoWPMZQGQsRcrqTqyS1HPIDQJXpxpa
	PI2wzHb8Z4Uf7UFBGlrYva3tAj8wUEUJvbFHHz6Wo673n8dynRlZcwJV52FPTabi54ou/8JgKR79b
	JnAF4pOZ6mw8FwbfmBPS78c5vOGflrnzWp82Q09I2da0IO+YRnn4wp0kyi/KvtBqyKHuJUOZo9Rym
	BqmtP35VD9nBJVhFMlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gP-00CUaM-4o; Wed, 21 Sep 2022 19:46:57 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gG-00CUTN-OB
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id w2so7068000pfb.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=a9YZZj3lGUqe+IwHRLjiPb6pN/UWuamlTiBoCYoLPmI=;
        b=KUtve68YbAnLKygu3ATVzrkeFx2VZjeryWkp25VpkprhhLrvULcHBBF6erRDJcLs6/
         xbzlg1oaIf6adLONfrKeOZWZ2DUpcf1KoExAwXAMzCwWEN11Dy7MVYVh/D2VfVaxuynf
         skEtJ4yRWgwEGfiHLzn2ieF96E6kTe5f1PB90/u2EA8FI6/dPX9/TIw3qmfmQioVlRyb
         2FDKlkdmiIpRued51ne65XbN58e0h1lnfOErEBTQHkMijSEcT09NVN7dZ04mm1oOpjpS
         LuEeu1+tuDk88/W6YsohpJ8McHH/S/xouuqTMy8xYUfUFuKnhFQ0mtncWfCCvat9V8Jj
         BA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=a9YZZj3lGUqe+IwHRLjiPb6pN/UWuamlTiBoCYoLPmI=;
        b=u28HpPpHcaI83BgQl0otw1JWfoN/l9cPogsFi89nlOn1FN83rQFYzhbYHKgCr7Ro4l
         +mIWaH7gqJGzOI04CzGJfj9csJN/PwnJ5DK1mUr/GMtcD8ef78bBS4nmNMnS6ShrUfSs
         vXv04KPVftQXrAGWKrm5Sum9mNZg625q4/Z/ts179F/x+2u3lYbWWbknBm/vRu62zqfE
         ko468TxbBLBZFvVQ4xLAQt8bfZsZSyirFqDB1jedadBoBZw8Qpa4Yf0NPhhITw7WaRUc
         2cq6k0/5rYSXXyMDBTlfojmiiV8ft3vTLkyJ01uUSdUF/SROMy9/n6XCFunSCa/9xPrp
         n7Bw==
X-Gm-Message-State: ACrzQf20xjPKiP4x2UgPN8Hi7EDU8kFCTIgrg1cnNKhulIuKA52NjsV4
	eeFxt8sl3osiyKSn8elZuWlYB7nLWSQP6g==
X-Google-Smtp-Source: AMsMyM5e9sxhZfSKqweFZdXouVWvcsBalwmX8h+diHZQu75VKDV/Xi4imKr486GDbiJwe/w1+Fddiw==
X-Received: by 2002:a63:f304:0:b0:42c:1057:e37 with SMTP id l4-20020a63f304000000b0042c10570e37mr26067926pgh.379.1663789606938;
        Wed, 21 Sep 2022 12:46:46 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:46 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 04/17] riscv: Add vector feature to compile
Date: Wed, 21 Sep 2022 12:46:16 -0700
Message-Id: <20220921194629.1480202-5-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124649_073484_44F07E97 
X-CRM114-Status: GOOD (  13.39  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a new config option which could enable assembler's
vector feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig  | 15 +++++++++++++--
 arch/riscv/Makefile |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..e294d85bfb7d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -432,7 +432,17 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
-endmenu # "Platform type"
+config VECTOR
+	bool "VECTOR support"
+	depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
+	default n
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
+endmenu
 
 menu "Kernel features"
 
@@ -556,6 +566,7 @@ config CMDLINE_EXTEND
 	  cases where the provided arguments are insufficient and
 	  you don't want to or cannot modify them.
 
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
@@ -648,7 +659,7 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
 
-endmenu # "Boot options"
+endmenu
 
 config BUILTIN_DTB
 	bool
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..1ec17f3d6d09 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -50,6 +50,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_VECTOR)		:= $(riscv-march-y)v
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
