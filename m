Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEEAC54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67i4LamWY1wpKVcQtFqGyucUe7vqZnQUilUaFB7XGmo=; b=sgA909nU562x+f
	hOETl5Bycj/AA6iGEYNH9OVMxhnyNgc8QAcN0uW71MhTC3zwCJmBpsAktBsWDk+ga8hhfwFndNcNL
	KOFc83vB5oV9gRnXUVCma4oSkSJxU5Wh/MpB98nUQfsAvMYRXH/EPCz2fG0tsAw5epEn3YKdPeXBl
	sy1i6p5Gkik8fQnhfIoq67WJpOuzglrSHp2nNbTDLW7HzQa9SoOt+0yKiTzL+wV2gHhNhYxetKa4z
	rcLXf1C+VzlT9vvIBJ6qYUBqrmgVDUtNnpTD1hOP1HGG8IcrJzEnr6j5BjhMl/iUIGmwTr6De1/nv
	3aLvOZSahYFLBxhfk0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nK-00000000M7m-3a1q;
	Fri, 15 Mar 2024 13:40:22 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nF-00000000M2E-0Hmg
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 13:40:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5654f700705so3206159a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710510015; x=1711114815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJnRy+44kdyiI867YTvTJ0QaN3WpDo84Y8Or30+oC44=;
        b=EniO3HkhB1VOP20UFt6DfeagBB+BGBd5iuCHHnAmAR+rsyMQqIQ498s9fq4Uma2pMA
         RrtL6+xdaRJQ++TxA6jzZMtPuxUgchgjaR5dsUlVWz0iuZcnmIuUuOQtCYuRah/pX5Gr
         xQhwedJqg+EPp9jY7iP3utcG2rn0uuqIgpBQCKi3Vpxq+/6vkUQL8MkUJbdULWQU/d0a
         wqj0KHvM86QW0LuFFBTCjtnGn/PJcNkmwoOqDbQbjBE9vY5uXbSxZPj7jWzrpjkJIRTb
         kS6rg0aM8zuULd2TpagHBIuVFFak4Abuvi7F+LP1E+5zNV+O8z7a2EcSe7SNuqg0PIxa
         Pe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510015; x=1711114815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJnRy+44kdyiI867YTvTJ0QaN3WpDo84Y8Or30+oC44=;
        b=VvGe366paSOtwSbq1qo9ZEe7j1c70vI+5bB6UJ8SvkD5OtitNHD34Qc3chIafuLiBO
         lM857CrTszmjgMj6apLks2NnKrYkzm1YzTqzkm9lkT9eORaTO36ypTUFL6qEnjRj+qBw
         l4x4UHzLNnEcMWGe1fYBi+ywmXMxFdeqtOnNVkQx7uZ3HTOtmJucwtEXTEIvTXe96ZjD
         F49WNcDrS1z5z29S3ciRsuJXo6VaC8J+rD3vmomNSVtECDc2ZPL2zLk+ahk3+QAFQWqK
         UgOshEB6PUHHH/ArdoHE1OzX/vpjeTK21BkHqZ50mGCYa3f/AgC/x6hYJ4CPp2m9ZQKM
         GlRA==
X-Gm-Message-State: AOJu0YzrcWwpAeuY0c5yYejQYWHYbsit6sNdAr8ArHm0ZAD+gscCyQjx
	mJo/UGmLnpkG5N1E/iOmFzNZ3+8z72m40gFneU8TVBuJu4TPrubhzxtsbcXpxywTF/7LxZoIJ0P
	a
X-Google-Smtp-Source: AGHT+IFtGAn2JydxU0NiqmM2gZPO/j9xW7rFsJ0TRPtIh8g6PNT6VKvIVa8TwkNzkHxREOeV8rGC2w==
X-Received: by 2002:a05:6402:1946:b0:568:b471:e583 with SMTP id f6-20020a056402194600b00568b471e583mr1237814edz.33.1710510015375;
        Fri, 15 Mar 2024 06:40:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id g42-20020a056402322a00b00568a78fa96asm1040271eda.6.2024.03.15.06.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:40:15 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM
Subject: [PATCH 3/5] riscv: hwprobe: export Zawrs ISA extension
Date: Fri, 15 Mar 2024 14:40:13 +0100
Message-ID: <20240315134009.580167-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064017_137609_927E9835 
X-CRM114-Status: UNSURE (   8.98  )
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
index b2bcc9eed9aa..290afe9b5753 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,10 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
+       defined in version 1.0.1 of the RISC-V Wait-on-Reservation-Set (Zawrs)
+       extension specification.
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
index a7c56b41efd2..cc443480fd00 100644
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
