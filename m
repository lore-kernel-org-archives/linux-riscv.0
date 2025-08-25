Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF9CA0FF0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3jmslKO/zu4NrWV/Tda48DMT4G2OiMUFDurJZ7JXTw=; b=nMx0KhN1jl3R/0
	AfcuzAkT9y7m0y8BUoc+EU2M1vvQY8ZgCUBBhlfhco4JA6BuC2T8v7glF6gRD7voYCrmoYHBmCbUE
	Tgdn7MavFSg2xJdSr9NdO9aSSGrwcq8/N7IPkYrNVhR5p2qF6onxr0OD/gbS+PUOdSSkE+an1uiAr
	vDfxZGoaGet9vvW9SQyQpLBvMw1A8wtg1LpfE6bNOcG14f/XzcTaDAZXFRL+v4vLshJpMPYy5fIn9
	rSnHuVLB6nWiv0ue+85yxej4ltotesuc14QUdcmjDXObuUe/xAUdQoSAzJ05P/2Vcf58DM0oE1V5J
	Ow7FojkHWLOMo80Ui69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYH-00000009Av0-1pw2;
	Mon, 25 Aug 2025 19:08:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqabA-00000008mKs-3Qwo
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:03:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c6ae25978bso2026454f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756141391; x=1756746191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kuor0TvH0eWNwQ0Bkjy46IoOk4rYYWmtSEfj1R/kPQs=;
        b=JyVTAZp+MnAKmkEcyLbmh9QlVGkvazS9y41VaNkbrXmty6qTQTwp+UceUX/XF9DPM5
         uzG+6ftWxU+BTsRqVHm9RvS44fjEAy0vJSOjKhmxL9JlXISbWKqM6eQnoX2Jy77AW0Aa
         R/Ta0YKMCPhXH7cIxUSI6AaklHCTyghpPetnQZ1duazS5MTtTPpQPgAqDgm2oREtNj/y
         AunKacLFv2VqhVwzvLWx0dDNKIZrGIHCMR5tkaqdJNlDw1Tgbn41mpJuT9U7mzUqldO9
         hOzWksRpg1164iWWxzg4RU38pFo9KkNKp5wVcCf1utwuupZKyxzgFMPrB7btJYq1LZlL
         acGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141391; x=1756746191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kuor0TvH0eWNwQ0Bkjy46IoOk4rYYWmtSEfj1R/kPQs=;
        b=cLMthZswHL67dZ31UHVl2+oLEzZRGiPJ8e1xchTWCQrJVCidgPwLwhIIduxlr99WKZ
         3EUhtS7YU7OSdYBBnwkso7Fb/pD1IHh79JiRDORiddg7eeUUUFx16P+0YzZ4yKmRA3SZ
         kK9cCE6LRvdLL6psvXLtMnMPBMCUWdRBgxUhJp33y+0RfE5F1CxF0YW6OcXuVUlaJZnY
         cRCwsZSo2MFnez4voKD3it9CS7XGsxjZsqHtsw5rtUmcGIzA+hWBaqUdto/nlBgA1ceO
         8gU+FUpE3hogpnbV8TwWxZ3Ueep73VaIntnLuY5qbFzmgKey6YdLK3ZFzi41YgX03JhG
         VI4A==
X-Gm-Message-State: AOJu0Yz4JKBfnHgxoeFYyO2vPO5yGwV1DMaKf538ShwgjdYUBJChsCwa
	sd2BO0i5ZJNSNGcgldMjrudvM4qedtaCnE1O1elAxiB+jHbbU2LU0JAGmXGxaRGqMaY=
X-Gm-Gg: ASbGncs+BksXfv30tiBdQI+pCzDJa89LNsRKs8yuk5vCsE9xoX6ErpYV3UirTFPJGkP
	JyQbvnsqHdoIrcHcJuxreejme+JjPuUp4MocHF+zPJWfco2VNj8DwurOThrNJo+qnUVXH3hHJr9
	v26kw6LppKSxlVUXeEVkvEgoTIQ07GKJ4tXmFDM5Lb44OISZr3MojJXnyiS8ER4MhlilC5sB/EB
	J11McDRO7rv6nbJfj6kMk5sN6h2jzSm2OyNsOlbzXJQfSvOT2oCa7IMLkoGPLEH66x6jDdANjtj
	UdtsJgTefvpa1GnCvNLx/QO0a07ztqWQ7PG7BZ9FSk9drIxC8md+ZJRE9QvEc0lvQYSjzp100Xb
	Mxdj/N53vhQPJ/T7g
X-Google-Smtp-Source: AGHT+IEsbAeaC7hRl8yCFJAYwJhbk5y6Yx10xmvf+Dq3OA1DlOvL1PFej3j0fhCU0QebM72h4h33Gw==
X-Received: by 2002:a05:6000:1a88:b0:3c4:bc55:65d8 with SMTP id ffacd0b85a97d-3c5dd7b4175mr10613660f8f.62.1756141390352;
        Mon, 25 Aug 2025 10:03:10 -0700 (PDT)
Received: from offtkp ([2a02:587:495c:4600:1684:b2cd:695c:d02])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70f4269c6sm12211185f8f.29.2025.08.25.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:03:09 -0700 (PDT)
From: offtkp <parisoplop@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	offtkp <parisoplop@gmail.com>
Subject: [PATCH v3 RESEND] riscv: hwprobe: allow querying available RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Date: Mon, 25 Aug 2025 20:02:21 +0300
Message-ID: <20250825170258.24068-1-parisoplop@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250814221646.32140-1-parisoplop@gmail.com>
References: <20250814221646.32140-1-parisoplop@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_100312_859344_6C0FAE91 
X-CRM114-Status: GOOD (  23.33  )
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
