Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E635CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1f71ftdVKhum7jM54lCXCcG9rs0o2TvvlTSu8ZsDrA=; b=WYXGYJd3bnZjue
	rhEQSaXVFV5kIjXqTKf8svYIAImTFK89k+V+79bEUVTTd9j7PWNkoS0Yp5HIK/JoR+6pDWCNtIiDo
	Yf/hN7D/l4hqZ/lkZ0+yQIPsSkAaEIS23X75+c8+4Uot+TC0k923GjBg3vMRR0S0GAjFuEcmaVSLo
	FAVXEFaGt5Ef0AEWA8gotNP2rw/W4jDXrlOy3jiuJp+dy+4vBLSKWP+tG8H3EWYdCnfP57YJoe+F8
	3G8l5Sur73PE45SfFOlQ3FWg7hV3KV8B2iWlHicLJNlbv48/tQa8WtbMbwINw5OOgmjTv7bYasCUN
	7laUjxtioMB2S5C+5bZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZw-0000000FChB-2Tas;
	Tue, 02 Sep 2025 04:25:08 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZu-0000000FCfK-05Ej
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:25:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-327ceef65afso4909164a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756787105; x=1757391905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=dtS9s3DsIKY0YInrK8DQgfG/OTlFFj8QNiREOQ3Kmyq6/3vI5jZRduwQmf+uOdOXRd
         cPZdlFHKYEArTpJLlx2n0QYAIh0k8WE9oXxUb9y/IRm2pDV7sfDYy711jl4anOLfOFCC
         mq/m1gaPsbQT7HqDLeiEixZUOfQ7gnxjCf8PCRlTq0wdimaRxE15017UGFh/eSETZCDj
         mZrPwOHdXCEwonkIoq23ZExTnYsXtaZ3fielR7HGmfrWkhw5LJEk7a+KTgAqVZGwSMmv
         118DLAaIzq5qx9SvbpILbZxM483CT7DlT9TEDAHaOPLxMCMJ7ztYtEtp9tig8DvY0hvj
         qJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756787105; x=1757391905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=OpEXC+BOe2o7gOOOxDxzjB8LfWSl6k9tWVbzHqPXtHIdJEHRXbThbJF+nX1YauLaxz
         AFlROKdb1s6swvvMhsGdplnlcHYtPKzY0KJIRiBk9KWLpTLzBdcY1s4d+pDtZPmf2Nzb
         3Kdw5z0ANu9g5IDEVGEb1My/dKKtGct0gJOBclJk+rlgYbNkqanR3g9jR+zyI66NZoaW
         e9qPNF0zDu8osoW+ePHDMtPNB+PdqB0S6yPnOvLu4YJ88QhR7wSga4Nsr8FHY/2QLXyW
         WIidVcfY4VEVcviMRIswDHzZE8nD1YFYj3f64k2k6VR/s12UdA8YffQtwzIKmbQgZAzz
         o6lg==
X-Forwarded-Encrypted: i=1; AJvYcCUAtANp4MwC6lIyhWctqF5WUlUZtWzrzGy4GqoVFoo5fouQqnj7DWhJYVOL5cmn6elXuH7tWdcMVe+ciQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzrOAikHz2zL7+9gZe2uLVCTt6UX/OHW4UIYmf2xo9moj/C/z1
	FHLQk0pMvxh1dVr23YZePC3PHzct4oHfTRweL+5kaK+RTAVWKr+p7++2iNVjupO1mm0=
X-Gm-Gg: ASbGncuaR0j4OM04SMz1TOzYCOLl/1KWvBX/80w9jWrGRHKO7eLjuS8as4scavbyqe3
	sHwW1O4CEqloGc94tGNhOktXaMbVF8Kty9IqdNFU9QXoQz214LTm8Wjau7zgPCgGibJGNnp3B9s
	5q3gxv3d8IRyBe+acCAPrgdGOuvFbZYl4X2kALZ11RJH1Wxwsn5l6TPIP2W4JfvtlFR0WcESOb+
	YI1s2298nHMECDacQQINtokN/qL5EXCk08rHieXHnuvNfgNxzBqjRhwo0loDPvfyRqH/V6u6QKj
	Mtuk0/son1EVbbns+LJ5X86SAgKlQdnhEF+0Ozz3mu2jA9dOTLxb1dB33ZywbeChiow6i6G5iKh
	gU7bor+bOyFyzZLR1F3IMbes1WPgOZOB4HedwJ9Cwy7XFf0Oo1yRTB61209iXK5t6f2MTrNjmSG
	E4k6luJSUFkA7V7ivQyArdi15whfUmQ54hQuYKJmENS9M=
X-Google-Smtp-Source: AGHT+IE5ILaPlbdaJvy0lHhCLMkEi7dV07tKF7N1W6t5v1Wvwl43pItJx8N4YHBrAE+BIEHm1Y1uhQ==
X-Received: by 2002:a17:90a:d40b:b0:327:a04b:aac with SMTP id 98e67ed59e1d1-328156be03emr14100705a91.24.1756787105177;
        Mon, 01 Sep 2025 21:25:05 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm12216706a91.2.2025.09.01.21.24.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 21:25:04 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 4/4] riscv: Use Zalasr for smp_load_acquire/smp_store_release
Date: Tue,  2 Sep 2025 12:24:32 +0800
Message-Id: <20250902042432.78960-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250902042432.78960-1-luxu.kernel@bytedance.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212506_052523_7FBD9143 
X-CRM114-Status: UNSURE (   8.09  )
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

Replace fence instructions with Zalasr instructions during acquire or
release operations.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 79 +++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..b1d2a9a85256d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -51,19 +51,76 @@
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
-#define __smp_store_release(p, v)					\
-do {									\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
-	WRITE_ONCE(*p, v);						\
+extern void __bad_size_call_parameter(void);
+
+#define __smp_store_release(p, v)						\
+do {										\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
+					 SB_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsh %0, 0(%1)\t\n",	\
+					 SH_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsw %0, 0(%1)\t\n",	\
+					 SW_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsd %0, 0(%1)\t\n",	\
+					 SD_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
 } while (0)
 
-#define __smp_load_acquire(p)						\
-({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
-	___p1;								\
+#define __smp_load_acquire(p)							\
+({										\
+	TYPEOF_UNQUAL(*p) val;							\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LB_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LH_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LW_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LD_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
+	val;									\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
