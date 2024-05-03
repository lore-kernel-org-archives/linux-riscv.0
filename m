Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E5C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKX++k3CNNHfyTaX+6HSD9mkaV0h9Exw629pNhydcrs=; b=AF+7dnS7jsUxB6
	XRfW/SLvW28l/vA/OO+ZB67sQnEXYwClv8dJdnuTWAck1arKIYJSZqTT0eacSTLg4HUbqhyPryN0G
	4d90hMvH6LRIJNXpgLnaO8MU8wE52BOJK9rpSgl00YAHbUTTCATpHGwD8TRpCLAZNcYBo8OW6JEtZ
	yVCvrDC2OEA7kHTUV614iWoXC/vRpOxOoA3hEEHbNqrrvAgas6GBkJ2tFjiTeQCuz210qBJDab5QY
	xnPGC7yqVHySKmqSBPeIJFmOvBerL78IPSsgv0QW0yuxTt4s13DAR205euTRqt4KhUxSlZon7Vze5
	twKsNuOxpS2vwAWyxwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kqY-0000000F2th-0vLW;
	Fri, 03 May 2024 04:48:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpH-0000000F1k9-3Qd6
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=; b=os66DGCzr+/vOAhqwNYBpC0ehU
	cDXLA+KmCSJBrbWvEduC3hjNc69EX3off7I0j8fLJ/soTpV7wOYyP9QuH/qQdvIF7FGLGbgz/uGFP
	dCjYe+sRmh6K4hscBj8dxgMlW14kO+iv9nzzNqcXJDaRILD7zj70okQCZLzucri1lriwrPRRIv0pz
	K5jJ0J0qbpu4k150hjdGgajcuUwIruK/wjYBOZgIIwnH/B/Fns4kTb5CCDtomq+Yw8T6Z1vsxPXaJ
	mi4MHKjZur3JsAWsHuNPX9izUvuisY4JswAHUsqf29Q3P7OToD+IpHg8KFyHwFY7m3UPgPJE5ylSZ
	gsJ61wDw==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpD-00000000Q2Y-3thD
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso5221682a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711629; x=1715316429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=GQOT3M9txbUdAyIRiaVE6UGx4C780T/6a5TN1rmGuqHQUE7m6D4O9ozVc4Xp8jbjhs
         S3p5RLUYOnMVp1oEdvH/tPW5YDNWJJEwttJn4tqPoHsCMEFQA9vGbWHt3Y8fdnP0OXML
         1Jtpn1509TJM+RnaCso+p/Mx31OCTsOd2Qcndu9Sz3GjARquXD9MnrZSdZUpVG5muxW8
         MnvGP8rZgvGO6y3U1+s9g5hR1YyioxF+diYy6QVvzA9v8YhG8O7rODgIDKZXrBXOuB02
         hLaBjPOzu6iCRwQtwvRnLBYfq/uAI2WSbYSv+9md2pLuwxPsh5ycjxqFHqN9xqGuHA4a
         hyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711629; x=1715316429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=aV+W1ld00EBfcYKFDLNkIbCOjPOoNXUgOLn6Fw9iOyWIm7DCHcRq6LxlkelfbAkyd2
         JBbC//MJO7ZW+T27k5HFOMNYSqDbLxYXF28K2wW38AA3xPbxkm+rDJ8IdKqL8aWpGO3M
         3eTbcCJoaxkvavnAvyko4VORB058uLnG68G1EpTVfla7DY4ttsryQXDbceF0I4NaFLTE
         DU+ss687bb87CJG9ckws/64hRfTE26dxoXWkHM7z71Ym8RE8kwVdiEtlxlwJWmEgOutE
         7DVYXzaRE+5wfjLbZGWHglu+jRDmnN8GnrpqpF6l0JrMyALGtvfwUl4Z5fUK3hGCNH6F
         9otw==
X-Gm-Message-State: AOJu0YzNqsZHGeVf+vLZvecgOI7CJNg3UqMyn0sOL5mBS+RiDhbi5QiN
	Ekx8ywKWc5EvV3DUiXRr+ky9bLQJnHWIw69sw12us1SzoBl21ORi4DHY2VdMnds=
X-Google-Smtp-Source: AGHT+IHxiJG3XKuZnalMhMY0zBrYlix3NEAr72SPYl6kui+CH+Se+262eWO3YNNn+MAYWHadXypMvQ==
X-Received: by 2002:a05:6a20:f393:b0:1a7:4b40:96db with SMTP id qr19-20020a056a20f39300b001a74b4096dbmr1617087pzb.10.1714711629443;
        Thu, 02 May 2024 21:47:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:47 -0700
Subject: [PATCH v5 12/17] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-12-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=tsASdWZ+V/WOtznPM1nvcKllla4Vt62mCeqqf/9/oDU2uch8BE2mc33Z26RL6fLgWnEC8I0+Q
 8mBe6EQvsFnBS9sgIxF6SaL2+IQ9ituhuA3C9zxt/NwfJ3n0ZomxMIP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054712_339803_2945503D 
X-CRM114-Status: GOOD (  10.35  )
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

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
