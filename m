Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E07FC001DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eudctjn/YRuNFQcUr41bu9iD+VFzmBXk7B6PlSHpZs=; b=fGKS0mq6nAntFr
	1YW9FAJUN9tma13diabRjkTghiWqC6DRGYe8NeIvSXCTjRNkpC+L43aMdq8D24fJ53plzdn9RIh2Z
	SNZe3liIuE3WghwSkYX3jJtBwJpYZtVCsblySHdfr2KNkL9/ofnuWS/qGO/bDaUnDf7vaUymThYI9
	B4kwVJcDT8u6Rxip5ZLkLyskKxk5xGKAhm3jj8Nuu/xVv7++VXwpXdaiAajRuJJQ7DaibF3vxZVoF
	MOpFcXorwvZ0U/iw1ZnuBElPw16ey2ZqoLK4WQs+SHnqpAiuLxTXlazQGhqJLvy2ZG6jkmSHgZ0dP
	SrJ5JBD8LQNSX34c2QCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFja-000FcN-0b;
	Thu, 06 Jul 2023 03:32:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjX-000FbU-2E
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 03:32:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666edfc50deso163765b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614362; x=1691206362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tlqEDwtRwx6uylosFQCtOuy8lBa96SgAwEz93e0NjI=;
        b=dgvUiTH0tF+IXJGUSbU/qOy8YrB08kHgQ8/arUCFTyddQbneanC9tezL8lXIpoOByK
         g4/tb/g6cLn8nAqGWrq699W04LhdinFbnL00Oi0d0C7PnQWyyThCRxydAeh0ujC94vdJ
         qVxv39E/siIKroL1TPStJTyP6bnLrwui9rdstp7Eik75uddLnX5ozwjWUSVnhoAv6sRB
         mU/SBpAJz005Ec7YqsWPrJh1dmlIgHWUKj8dBGrYGZEdWb6AjCcxfrmaihF00HVpZUMK
         ltoeoi84WmR6i5+ls9KsvIduAfSHUHBhS4f8ktnIJECF7lvQp7ZIITS+IoBFm2Yn+XfI
         aCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614362; x=1691206362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tlqEDwtRwx6uylosFQCtOuy8lBa96SgAwEz93e0NjI=;
        b=dG1f8DSYogFSk/WH2dphwL1z4YWfAe02cIjKqvNYVcv4P2hthPx0ak2Odkdj7tTMXV
         bC8YNaTtNh3xpZGwB3by0uncYReYyVrlNYJqHOD9SqvuQr4BKUBxkox8mtWS7EgTnvsR
         nptB/ThUwjj4BOTaDBIcA1XJX8+ZPdmoYEhcXveld/Z3q6TQZl9Qmy+CGFmhsUOVQ28m
         5XX81ZdEaODEPCOLrdnU/zOY4CzFx3NZlUyvA9GRfTkzaxaYOZVeZR71Xzc3U5fMSLuV
         GMvljtl+9CyLvgAb50VzRV7arAKoH7LZPWlpab8GFv3fRZSa//dLSdlUyZoaTTonIY8D
         J7sg==
X-Gm-Message-State: ABy/qLa2mGmEv0Mv/mC6rRp9B076WZpPU54ytdA87fMQOXEGCjGZmiZ/
	HLawVrHE0Xedm5CM04upINevPg==
X-Google-Smtp-Source: APBJJlHRoO3OOf/Yu8KIk2dz7/z/aRnJLFW/TkOd0McK/ZFZgWFWJTIVEe3mL+IgCv3DGUL326qHIA==
X-Received: by 2002:a05:6a00:3a0a:b0:678:7744:31fd with SMTP id fj10-20020a056a003a0a00b00678774431fdmr6980140pfb.0.1688614362670;
        Wed, 05 Jul 2023 20:32:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Jul 2023 20:30:17 -0700
Subject: [PATCH 1/3] RISC-V: Framework for vendor extensions
MIME-Version: 1.0
Message-Id: <20230705-thead_vendor_extensions-v1-1-ad6915349c4d@rivosinc.com>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
In-Reply-To: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com, evan@rivosinc.com, 
 heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_203243_731341_8881E77E 
X-CRM114-Status: GOOD (  19.18  )
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

Create Kconfig files, Makefiles, and functions to enable vendors to
provide information via the riscv_hwprobe syscall about which vendor
extensions are available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kbuild                     |  1 +
 arch/riscv/Kconfig                    |  1 +
 arch/riscv/Kconfig.vendor             |  3 +++
 arch/riscv/include/asm/hwprobe.h      |  1 +
 arch/riscv/kernel/sys_riscv.c         | 40 ++++++++++++++++++++++++++++++++---
 arch/riscv/vendor_extensions/Makefile |  3 +++
 6 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index afa83e307a2e..bea38010d9db 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -3,6 +3,7 @@
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
+obj-y += vendor_extensions/
 obj-$(CONFIG_KVM) += kvm/
 
 obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c1505c7729ec..19404ede0ee3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -276,6 +276,7 @@ config AS_HAS_OPTION_ARCH
 
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
+source "arch/riscv/Kconfig.vendor"
 
 menu "Platform type"
 
diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
new file mode 100644
index 000000000000..213ac3e6fed5
--- /dev/null
+++ b/arch/riscv/Kconfig.vendor
@@ -0,0 +1,3 @@
+menu "Vendor extensions selection"
+
+endmenu # "Vendor extensions selection"
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..fadb38b83243 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -9,5 +9,6 @@
 #include <uapi/asm/hwprobe.h>
 
 #define RISCV_HWPROBE_MAX_KEY 5
+#define RISCV_HWPROBE_VENDOR_EXTENSION_SPACE (UL(1)<<63)
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 26ef5526bfb4..2351a5f7b8b1 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -188,9 +188,35 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 	return perf;
 }
 
+static int hwprobe_vendor(__u64 mvendorid, struct riscv_hwprobe *pair,
+			 const struct cpumask *cpus)
+{
+	switch (mvendorid) {
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			     const struct cpumask *cpus)
 {
+	int err;
+
+	if (((unsigned long) pair->key) >= RISCV_HWPROBE_VENDOR_EXTENSION_SPACE) {
+		struct riscv_hwprobe mvendorid = {
+			.key = RISCV_HWPROBE_KEY_MVENDORID,
+			.value = 0
+		};
+
+		hwprobe_arch_id(&mvendorid, cpus);
+		if (mvendorid.value != -1ULL)
+			err = hwprobe_vendor(mvendorid.value, pair, cpus);
+		else
+			err = -1;
+	}
+
 	switch (pair->key) {
 	case RISCV_HWPROBE_KEY_MVENDORID:
 	case RISCV_HWPROBE_KEY_MARCHID:
@@ -217,13 +243,21 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
-	 * call, but get their element key set to -1 and value set to 0
-	 * indicating they're unrecognized.
+	 * call, instead an error is raised to indicate the element key
+	 * is unrecognized.
 	 */
 	default:
+		err = -1;
+		break;
+	}
+
+	/*
+	 * Setting the element key to -1 and value to 0 indicates that
+	 * hwprobe was unable to find the requested key.
+	 */
+	if (err != 0) {
 		pair->key = -1;
 		pair->value = 0;
-		break;
 	}
 }
 
diff --git a/arch/riscv/vendor_extensions/Makefile b/arch/riscv/vendor_extensions/Makefile
new file mode 100644
index 000000000000..e815895e9372
--- /dev/null
+++ b/arch/riscv/vendor_extensions/Makefile
@@ -0,0 +1,3 @@
+ifdef CONFIG_RELOCATABLE
+KBUILD_CFLAGS += -fno-pie
+endif

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
