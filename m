Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7407FC10F15
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ku/dM+UMG3P45HdY6D/eFaPjNBj9S569EV/OEt/Kgk4=; b=lN+A0WgMqyq1ug
	lJuLTu6ALFDtJT2r4P+okdy+RBDNo6jh+P50rOnzuGbyjgGM7lsko9R5rrK3W0ZWAWC13H6Q7Zxww
	ikE2YcSIrsuI65JTXyUQez132nBgqk8r78e0ejRYZq5NpiPTscDQ9Zat9qzNFSYJ9h1ItecZTyx0k
	vLJ6d18TjPyaSzzAU917NBkFLaDVnTC3CH0p68O+PrtuvS06OyJizVOpOcacQddzfO3ISNW4Bvz4J
	XonF1GowJcLpff+T9xnqkd+bsFCT4Jx4sKCn8OjSGTfXXg4RrjnRyFX0gwwdzoWPkgRSIyDYvptLm
	E50kwKRodDpAu+1Js91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVZ-0000000C43A-1Ugy;
	Fri, 26 Apr 2024 10:08:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVI-0000000C3n3-0odT
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:08:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41b2119da94so16319555e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714126106; x=1714730906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H50p08qn7uGf4Z9JFkdHi+jkfC6EZzcHo7CUifdDw3E=;
        b=oY+WjznWIsWTme2qMkaoD1GJssTVoZR75jMH6p5Yw1KpRrocpqsBufEaUrhNzxHmgi
         +2X/l5znBgiGx2MuT3LtAFTz+8nyT42B1JTCTPe0Td7gNyBr/FO4Gsc53f+iqupCuV33
         WUSTzbXyQYW5L1gz9C5uiv5CCgEZYbXcM3/JRqFqHmYCNyxD9Avc5/IgER2o6noTDQcd
         vjP2CT8a9qnMo03sfUJXsKV++C/4N7U3Kyutgm491SZs8ZJMW3ClVLR5+dSsNIfWQU4W
         b6DkmGdcXCWK+nV+mgW5UiHog7SGD5ZNOt9ca7YHVOf+02q+WiXiOg3Z/cSKB/ibu+0l
         rkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126106; x=1714730906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H50p08qn7uGf4Z9JFkdHi+jkfC6EZzcHo7CUifdDw3E=;
        b=YpHn9AC+zH8F9mB6nMT3lIC+gvkLwv4rvFJq4Woz5ZZzOf57SsNknB2lUA2xs3wGto
         ccTOKWH8GHZLqZXmM52TlwZcue0IQP+n++0Rc9SNZRed58V9MQKx73QGihJl/qOxgt2o
         hR8kyx3rkPwr6aOP9v+nRx4qb4lzrvJxLLsxpwyselixLvwTwp/3OKFuSf8DgQXpF0iC
         YZXhEJijvYRU/r/iVboxB3nGnbcBbFjKCnE6M1gAXZqrCvICBlKCxLR0nGgvuaP7OzHo
         XgMVW/BE4EQ6F4ssFQK4iQ0xlO8Rsp5MWUCKPx++/fWY6u0RoqVIksawhVj/wUINKfsj
         FXDg==
X-Gm-Message-State: AOJu0YzXhkwmJO7wyhFE7bIrHp1noGZbMBQVK8w5Bvp7E0sXqD5JM8BX
	5yH7+tQPmF8oukWmkEgtuuumG5ZDag7G079CofN8ZnDQhsS27mUN0/nsNv+y4rNpMKgXoDdQ393
	CT2I=
X-Google-Smtp-Source: AGHT+IE5Q3hADYqj2MvVu2H/qxB0sDab34q1JHiQ+l/nY/53ersVI/z5oTpAPArBs5eOKGypLKYc9w==
X-Received: by 2002:a05:600c:a4f:b0:417:ee98:dfac with SMTP id c15-20020a05600c0a4f00b00417ee98dfacmr1506890wmq.34.1714126106377;
        Fri, 26 Apr 2024 03:08:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c384900b0041b0c3879c3sm8384477wmr.26.2024.04.26.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:08:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
Date: Fri, 26 Apr 2024 12:08:24 +0200
Message-ID: <20240426100820.14762-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_030828_380008_23F2C0FE 
X-CRM114-Status: UNSURE (   9.30  )
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

Export Zawrs ISA extension through hwprobe.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..e072ce8285d8 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,10 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
+       ratified in commit 98918c844281 ("Merge pull request #1217 from
+       riscv/zawrs") of riscv-isa-manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..a5fca3878a32 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8cae41a502dd..b86e3531a45a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(ZAWRS);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
