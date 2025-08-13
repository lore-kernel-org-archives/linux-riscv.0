Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB3EC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPr6I9jN9hs8A7yoAjQfrpv8HBdu1nsLIyGiQ60V8xI=; b=OxMmT+bIHhsBQW
	T54IB7QKUqoBtS+Wt8CuQ/Z21C5GAcLvvOb6EgYjAhneFwQ3HxpngdpwIAsJWUfpat0k5ANWvC2eD
	4So5JHaxQpLQcp0V0qIM82Jm8G7jtg4xshWk3DbA2SCfmokn+Dp1F/rlTJq9h9jj44L8EGvQD0VcP
	5KZYEZ73QCDJIYWM3u0YBwb9pNnrIlckXoTtw/FZ9ePWVAqxaxe5B0YI/f8zduV7lHgUbyZ4M3b/T
	pMQQdt99Tr5qiaYOaYiSu+FxCyIpIhjtiC+7Xb4cfayEsqopoxrd0PTFlEubtGVx37zEYV5dO6iDY
	0E0kqnvIUi7gDjIbFFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPf-0000000Er4s-30Kd;
	Wed, 13 Aug 2025 19:45:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrz-0000000EfpB-1uDT
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Aug 2025 18:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3fvpXwMewAxzeukQjigSxPOayWXPoM7D3C6RZI0ZcNg=; b=pa+7FgnKw+5rQORF8odF7nEhSz
	VNPFak1iAMRiXH7aa3UH3uwycPcqBAEdfNyaZNzbsMvkFwo9jQEPFNeefAqqSCg/NTGYjTuXZQnGz
	1SdXoSOVqzw2pleOqWk/6z3CJ8iPpMo75OrV1QQv21NofxjHB0dbbJXKmYKjc30QODsV6xQ9t6eYG
	vd8Q1lTU5s4xaeFje1xc7FjgHfAY8kWtJRecOclMsm253/jKeoHkkw4jC1xAAiLHqiFDQvoYOVQSH
	H54WitVKOudKWKXIhiujZ5CdJCtQBSL5e0Ku0tlJ8sbuGlvoQ84xXRgeXi20bkrcIpxrodZdWKVp/
	w2klV+Eg==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrw-0000000G8jT-2OGY
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:06:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6188b5b11b2so161044a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755108394; x=1755713194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fvpXwMewAxzeukQjigSxPOayWXPoM7D3C6RZI0ZcNg=;
        b=lA/M3y7xP+UCMSrEoFE6yMFZqW3O4O2MWA7MeVvxiuHL64ggT4hLixS+EPzJ8L0L+B
         pu7KjGgMXHhxQNU9QfFU5ybdIZasn2fBFEF+EA86A3GHKM+Iros3hRVqbrqi1FXK/62X
         VZI6kOGePlOB1jqj7idrKN7IOTb9MSUidY582XokgkBYT+e/zhki1gBeJdHDwIrm/FYe
         ijHjsvnrFDP11j5S5MH74dUC+zPvCz00jVCnshJP8KnBUA+uMqrza0l1NkWneET+pRzU
         cywFR5jQTLIqIw4E+6XLVsPN8SKfJG+/L0XXCt+vVgawbcYYTV1nzEkaLnG/EDm/Ktaj
         pJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755108394; x=1755713194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fvpXwMewAxzeukQjigSxPOayWXPoM7D3C6RZI0ZcNg=;
        b=Luy0h/+qrOSUiE6fiAZvoJkg3xib9JSLiv69VcHT1zB4J7OIKayeR+d2G5Z6ygp52i
         ADRibweoGpWxeTaFy9pKG9JsL6P1LN99eecpEN+IDK+CMDY47kFDXNfDCp6Ki3gi70th
         sr3TA4YXUy+f42Sz2I3uf784uJYhGW6H6CFqOBy3bXL5pEdedjm22nzIxBwpGG8Jpcws
         og5Z0WoK+xDf58mpKUiXxBtIr/oe/Z82EEKy3ba95NtGCfnhliGin3eQxsXb9hihbRY5
         KdMsri4SGZYqucYuvxPJ4iJ6pWBWbwvu+pcBaC/SWh6xcVod6gIrlfkS1qqmSsJa0nUi
         T5VQ==
X-Gm-Message-State: AOJu0YxDp9jNa1jlSaE73XB33sZu+2bdHJPyffUzb0a7ox5WRvPmHXEb
	HHwMriqC82qYCwAMkC2Z5Jbe6IeqLUt74YKsUL9XIn0jpD7Wgkui7Ki/9I8a6EFikOc=
X-Gm-Gg: ASbGncuNyCAfIr57TozYPEztNsFl80vLJ7lsjkYBFM/cPMKxwS64jZDI/uPSGOag4O7
	gDmpmuwO8uiE6gFHVt2CURxMP8+A9JMgm2vf2fWrCcKLPAbO1EorYTH/8kEjydCZj/pyKJTpTeR
	664xxKqzVMtHfRpQbQVTTGlUmGLhd/b+r/u0Es7tm0+gWPyQcf6FekmF4MLp1lF5iGZH/UUckRc
	o/qyGhz9mADy1ze5V+ZsSbM2MlXoFF/nHWK1en+a+CUTYTbJK7Ngi9VLUBgPflaFnUJW67n18p6
	/ouUhocj3XpPQbJZnoDRvri1DzlsY1GjaNEmPvLknB7UkO2NM0jNdFqqOsf9vWGmtMRcZCfflzh
	QwnnrMFydvylaP4Nf
X-Google-Smtp-Source: AGHT+IHq8HCdjXAZZ/8cDwBYXThmYEZX/xoSzOFuVwXITr5p4ddK5gTkBFvu9wrpyt4LAVGqaYcelw==
X-Received: by 2002:a05:6402:26cc:b0:615:c767:5b9e with SMTP id 4fb4d7f45d1cf-6188b9e0371mr103436a12.20.1755108393781;
        Wed, 13 Aug 2025 11:06:33 -0700 (PDT)
Received: from offtkp ([2a02:587:495c:4600:1684:b2cd:695c:d02])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm22556349a12.25.2025.08.13.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:06:33 -0700 (PDT)
From: offtkp <parisoplop@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	offtkp <parisoplop@gmail.com>
Subject: [PATCH v2] riscv: hwprobe: allow querying available RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Date: Wed, 13 Aug 2025 21:05:28 +0300
Message-ID: <20250813180545.110666-1-parisoplop@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_190636_739014_03DAD66B 
X-CRM114-Status: GOOD (  18.13  )
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

When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
bit in the resulting bitmask means the extension is not available or the
kernel is not recent enough to support the bit. Currently, there's no
way to differentiate between the two.

This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
which returns a bitmask of all the queryable extensions supported by the
kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
fallback extension detection method when the bit they want to query is
not available in the kernel they are running on.

Signed-off-by: offtkp <parisoplop@gmail.com>
---
Changes in v2:
- convert spaces to tabs
- use git format-patch to create diff

 Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
 arch/riscv/include/asm/hwprobe.h      | 3 ++-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5d..6d77def0a46e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -360,4 +360,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
+  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
\ No newline at end of file
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7fe0a379474a..501d49b7a02a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,8 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 13
+#define RISCV_HWPROBE_MAX_KEY 14
+#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE	((1ULL << 59) - 1)
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad970499..a3b92df4dc05 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -106,6 +107,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
+#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2be..40e7fa5f85f3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
+		pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
