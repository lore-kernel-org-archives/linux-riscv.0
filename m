Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5851FCCFA07
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xs1qYHr6auTeMY2aPxEB5LdN3HLwn/PpAaqLkqPA3Oc=; b=n50OcUGsSQL0zv
	dhR5G2++JRJ4Djq1bRyz2Gh3YrHSXD3sPjNJO9SOBioSAW+5oJB5nHgenYodqb0Ahd2u35t5wzkAV
	sSJ1Qv19nmb0ZN5+KdaNkRCVh8ChUAhZzIAPp12cBin7D3gQQunJh+4kVFfsuSS1qOB5WTjXMviha
	Qxy3EIbHqjljFk3bNRKaRYfeVCbwSQ3B3tXNWZRcYtJtlcGWNQEhUdVcSMy/ANXf1yCB8bUZHO5QW
	7mL+Tb2W03kXqWkTt59JNpgsiS3n/QhT2GQbJ+KjjmZSD6c40lkQPAUP1aODFFsctN5TIrbv8MMmr
	KPtjJ41bQwOT4fTVjEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiiq-00000007TOB-26GN;
	Thu, 26 Sep 2024 07:15:32 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiPp-00000007PTD-0cz9
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 06:55:54 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a0cdd77dbeso2508835ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727333752; x=1727938552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz6nXOQPpHKKg/2POW9sH3ldlFQk4LGlQ9pIvX2kgEo=;
        b=WS4dVXftXJwjIQ+d5i+dynby75mRe8P2Df8gAp/eiJTwBGqMdDJYqQqroXVNOHQNtb
         mD0tEWhuAwNdvIHcN8kNyRQnn6VvuZYRBmbwAgrt6He64CRKZf83XBY5/a3uBiQpwle+
         7UnC3D8AJsq7QpzzqVvofTow2JvJaRiuJ65rCrBXc6MRTNoy2KtI6EJ7DUUwm9s7Jexr
         BV249/gfFG7d1X8z/bSCI/C6klN2qe8Y/JlL8NJTgm/Go9w54vjQRMz49zcGiAt4ftwj
         ca+B4DEXFUDsob0we7j9lm7YhEe1ql68u0F52fdHkT2oPAz/z3eJeLVmvozSYupAg1/q
         /BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333752; x=1727938552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz6nXOQPpHKKg/2POW9sH3ldlFQk4LGlQ9pIvX2kgEo=;
        b=qB5nsmBo2+L4LYwqQirAdQx78ytcSr/Ekmwd3LhMA3/6A9yl9OjyfiQOGIgoMmS2Qa
         HhBOQI6F5aLwF0UW52yUg7bQhcp3AXdNGf1T+1LT5iwhQyNAAOLIsnIFZJlTiL/bunub
         lac8yhAMIHLUTUkK75XhghAU4g6Xz7h6GHZI4Ay6x+Vt0XgdGHmnZBt4166d661dU+d+
         Yi7MFpWxnPDE+KVUdA20+o+Wd8DN34MFyJ3v2eQSehxK7cJBLpssOa0Ehs6BAV54UmH7
         d3veo1/+Tb4Bwa8cuPLCWmRM6hsQxe7NbupY1Fcipn8uLRHC+WJAYWw4MXwcJ/Nbv0n3
         Y9+A==
X-Forwarded-Encrypted: i=1; AJvYcCXBNWQa4kP64OjlXszPKToSfVdgAf8ZQH7qr4JT8r9GSdwOv956qEWpO+RCB1509qD461EjBvySUh+/qQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbQkoJGSj7vfeUhJQFexkUieRj0IQOp0fQ4834xUV78YEUSL8v
	3qk897oJ43YNyCuqlqQ+8qMD/2UA1kNm47vc3LMKaYC6xPIzMfSXOab3jgckcpg=
X-Google-Smtp-Source: AGHT+IE5HtHveKKLfQie2ZdRESQAIt2gsyCcJcr3zDTArzQG0bYH4n5mBiG2zxUxyKL4arsG6HYvQg==
X-Received: by 2002:a05:6e02:1fee:b0:3a0:9ed2:67b8 with SMTP id e9e14a558f8ab-3a26d6fc9a9mr60527305ab.4.1727333751901;
        Wed, 25 Sep 2024 23:55:51 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73120sm3592352a12.68.2024.09.25.23.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:55:51 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: Add csr_read/write_hi_lo support
Date: Thu, 26 Sep 2024 14:54:16 +0800
Message-Id: <20240926065422.226518-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926065422.226518-1-nick.hu@sifive.com>
References: <20240926065422.226518-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_235553_211798_7A6E4DF1 
X-CRM114-Status: UNSURE (   8.84  )
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

In RV32, we may have the need to read both low 32 bit and high 32 bit of
the CSR. Therefore adding the csr_read_hi_lo() and csr_write_hi_lo() to
support such case.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Suggested-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 arch/riscv/include/asm/csr.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..54198284eb22 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -501,6 +501,17 @@
 	__v;							\
 })
 
+#if __riscv_xlen < 64
+#define csr_read_hi_lo(csr)					\
+({								\
+	u32 hi = csr_read(csr##H);				\
+	u32 lo = csr_read(csr);					\
+	lo | ((u64)hi << 32);					\
+})
+#else
+#define csr_read_hi_lo	csr_read
+#endif
+
 #define csr_write(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
@@ -509,6 +520,17 @@
 			      : "memory");			\
 })
 
+#if __riscv_xlen < 64
+#define csr_write_hi_lo(csr, val)				\
+({								\
+	u64 _v = (u64)(val);					\
+	csr_write(csr##H, (_v) >> 32);				\
+	csr_write(csr, (_v));					\
+})
+#else
+#define csr_write_hi_lo	csr_write
+#endif
+
 #define csr_read_set(csr, val)					\
 ({								\
 	unsigned long __v = (unsigned long)(val);		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
