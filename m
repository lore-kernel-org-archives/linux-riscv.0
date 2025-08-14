Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 22:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3jmslKO/zu4NrWV/Tda48DMT4G2OiMUFDurJZ7JXTw=; b=gFJr6YmdWGerDl
	Aa+gx5GVVvYNgxS7DzSOjm61R8ci+zymqnCLL41bd4uxi7MECq4twZwTDUOrLndvRstNsQR4D2uiy
	f0wpRVsGP50SsTm2trgcHsH+FId4xNGCOilsxp872evhzzULv1YJHW+6YunLjyR1JuCqsH/YWgE8t
	8KR8ogXbozgje7r6bEaU5sXKQ80lI6qKKn3PcWWuUsDcnfKTr2uXIFt7B2jY4jvhj85tdzOVW3y6b
	TtOC4Y1BCkdg1nz1IdlTEPfukhKiJm1i3ZdC/qaubrLzqrdB/X0+ckWW5CrRwYLuykKDvWQ3GqpDA
	JsAC6D+hqwxfElmKMamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgG8-00000000fPE-0liK;
	Thu, 14 Aug 2025 22:17:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgG5-00000000fOa-0ftY
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 22:17:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so827272f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 15:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755209835; x=1755814635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kuor0TvH0eWNwQ0Bkjy46IoOk4rYYWmtSEfj1R/kPQs=;
        b=EC6USvHEFrgpxd63WonyYnv6MvRDQKpeh3JCxLqdFidMbgGTBV4eg1/6SrSwye73VH
         QBE0oxqRf8HEvT9WI6E1HvpkqQmLeuoNWqT8Xo+f0OHkEvgH0PzCMjJ5OSFraxChGEcv
         SrK7bb+hlRlI4z+Zaf0VKW4uUH0Xr+dEaSiU77vKr305CeV4uCz7hi39467XK5kIiUay
         QeRCIQi+122za2Mjfv7Bwc15yrOI8H2rdaeV5CVQkT+301bX6qxOSA9rZNorskubXbfs
         s/Blthtblil21dCdeEsNqDc0jkvSBib5dW8ZaWO/Hncy/UrlCYg02aItlPssSig/Ivak
         jmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755209835; x=1755814635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kuor0TvH0eWNwQ0Bkjy46IoOk4rYYWmtSEfj1R/kPQs=;
        b=l+sQdw6R8rsG5BuVT47ze0LTabJOVVBpYNjVB96hB974u0t1OpJn75v67VLnnOw3bU
         s2W3Cg4oJ0H0cceZiGY1IBAm7B5cD86gTf7NJbc6jfVwoEbGF8hK6xjF7AssEP10JFRD
         nHQHhtZuobG9Rbi6Jw+uQVJvjFjKXlgc1BhJCx+JRttCj2TkrwxncTIC1SkdCUiF1SWT
         uD7p8KYrK3bbr32FEbT8DmtslXUimCdbIF14EjgDALGd8qtkaYudh/5KsNihoOY2zRWJ
         PuSorzwK7Gevsi4s1pwCDNtQoeJmXVmD98HZTOOf5DKIAWT0wInFapUtaJDf+Uu4xnpg
         w77w==
X-Gm-Message-State: AOJu0YwGcE5fFj1mMB+GQ1FRVisLfN+amJN+7eTQmoq9P6sybkECbLzC
	PkCR4PnXigLYl8Lfb7JDGuleplZKU6W4Hyx/dLd4ywdsefscti2NrtYiHma0UzjkMQo=
X-Gm-Gg: ASbGncv/wuCUTdoqrL0FvGAeYfaIOTjWDarDACOlUS+hsGHBb2U87QxBzFz08vjkSFK
	aF/F1yLrqh/ITnsFvp5RG7G3gc0kv0lAo+XGnNtNRqll7jmtD82wwUxTHD5+ymLmmxo5KGflN4Y
	2rSBM7ycEkTHlBWyZOdWLLuOWvI5Z5iZkIn5fRswSGkb4hidSTLfIiWCSHwsZV8UKm9UkdsIrgF
	hDmJmd4c3MQcDBJRtF12bFcCSNTd1y3WFQxcVUvv8pGUidg24PKIbLPzWDuu1lgb8Lz6Xo+yInZ
	y+pvNPk3tF227n/D3ZDzGvdaARFfmSMfWsTBZ0dBSfrjG4eIDReInjcfKARXhhjxMeFbIBrX0DD
	7fhF1s9d9QVC7ERy6
X-Google-Smtp-Source: AGHT+IGeamQuqwTYZ+rZTtX+TzqESj1c0goZ10shWH7imyUZQMAyssuDKemZBG1+V9ZWkM4wSQo16w==
X-Received: by 2002:a05:6000:2905:b0:3b7:994b:8409 with SMTP id ffacd0b85a97d-3b9fc36ed4dmr4439066f8f.39.1755209834692;
        Thu, 14 Aug 2025 15:17:14 -0700 (PDT)
Received: from offtkp ([2a02:587:495c:4600:1684:b2cd:695c:d02])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6c0561sm34710475e9.5.2025.08.14.15.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:17:14 -0700 (PDT)
From: offtkp <parisoplop@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	offtkp <parisoplop@gmail.com>
Subject: [PATCH v3] riscv: hwprobe: allow querying available RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Date: Fri, 15 Aug 2025 01:13:24 +0300
Message-ID: <20250814221646.32140-1-parisoplop@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250813180545.110666-1-parisoplop@gmail.com>
References: <20250813180545.110666-1-parisoplop@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_151717_216779_3752C1CD 
X-CRM114-Status: GOOD (  22.80  )
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
Changes in v3:
- remove the 59 magic number and create the mask as a define

Conversation from v2 to show motivation for this patch as a whole:

> And do you have a real usecase in
> mind? I mean which project would benefit from this?
Yes, I want this feature for an x86-on-RISC-V userspace emulator
called felix86. We do runtime extension detection for our JIT.
Currently, for any extension that defines instructions we use the SIGILL
method previously described, because there's no way to tell with just
a hwprobe call whether a 0 bit means extension not present or kernel
too old. But we can't do this for all extensions, some don't define
instructions.

The end goal would be being able to detect an extension using hwprobe,
and if it's not detectable, notifying the user that we can't detect it and
they can mark it as enabled in the emulator's config file.



 Documentation/arch/riscv/hwprobe.rst  |  5 ++++-
 arch/riscv/include/asm/hwprobe.h      | 29 ++++++++++++++++++++++++++-
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 4 files changed, 38 insertions(+), 2 deletions(-)

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
index 7fe0a379474a..a06eeec11e2c 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,34 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 13
+#define RISCV_HWPROBE_MAX_KEY 14
+#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE	(RISCV_HWPROBE_IMA_FD | \
+	RISCV_HWPROBE_IMA_C | RISCV_HWPROBE_IMA_V | RISCV_HWPROBE_EXT_ZBA | \
+	RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS | RISCV_HWPROBE_EXT_ZICBOZ | \
+	RISCV_HWPROBE_EXT_ZBC | RISCV_HWPROBE_EXT_ZBKB | RISCV_HWPROBE_EXT_ZBKC | \
+	RISCV_HWPROBE_EXT_ZBKX | RISCV_HWPROBE_EXT_ZKND | RISCV_HWPROBE_EXT_ZKNE | \
+	RISCV_HWPROBE_EXT_ZKNH | RISCV_HWPROBE_EXT_ZKSED | \
+	RISCV_HWPROBE_EXT_ZKSH | RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_EXT_ZVBB | \
+	RISCV_HWPROBE_EXT_ZVBC | RISCV_HWPROBE_EXT_ZVKB | RISCV_HWPROBE_EXT_ZVKG | \
+	RISCV_HWPROBE_EXT_ZVKNED | RISCV_HWPROBE_EXT_ZVKNHA | \
+	RISCV_HWPROBE_EXT_ZVKNHB | RISCV_HWPROBE_EXT_ZVKSED | \
+	RISCV_HWPROBE_EXT_ZVKSH | RISCV_HWPROBE_EXT_ZVKT | \
+	RISCV_HWPROBE_EXT_ZFH | RISCV_HWPROBE_EXT_ZFHMIN | \
+	RISCV_HWPROBE_EXT_ZIHINTNTL | RISCV_HWPROBE_EXT_ZVFH | \
+	RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZFA | \
+	RISCV_HWPROBE_EXT_ZTSO | RISCV_HWPROBE_EXT_ZACAS | \
+	RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIHINTPAUSE | \
+	RISCV_HWPROBE_EXT_ZVE32X | RISCV_HWPROBE_EXT_ZVE32F | \
+	RISCV_HWPROBE_EXT_ZVE64X | RISCV_HWPROBE_EXT_ZVE64F | \
+	RISCV_HWPROBE_EXT_ZVE64D | RISCV_HWPROBE_EXT_ZIMOP | \
+	RISCV_HWPROBE_EXT_ZCA | RISCV_HWPROBE_EXT_ZCB | RISCV_HWPROBE_EXT_ZCD | \
+	RISCV_HWPROBE_EXT_ZCF | RISCV_HWPROBE_EXT_ZCMOP | \
+	RISCV_HWPROBE_EXT_ZAWRS | RISCV_HWPROBE_EXT_SUPM | \
+	RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM | \
+	RISCV_HWPROBE_EXT_ZFBFMIN | RISCV_HWPROBE_EXT_ZVFBFMIN | \
+	RISCV_HWPROBE_EXT_ZVFBFWMA | RISCV_HWPROBE_EXT_ZICBOM | \
+	RISCV_HWPROBE_EXT_ZAAMO | RISCV_HWPROBE_EXT_ZALRSC | \
+	RISCV_HWPROBE_EXT_ZABHA)
 
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
