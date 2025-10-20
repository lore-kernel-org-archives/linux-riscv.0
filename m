Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6186CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHPed2PJKwTdVIZFTRJoNywbuOJRbcvhfzDHc4RdPrA=; b=2yjGNL2ne31f+Q
	clqI6JfGFrM4MzFnIc5BV+HN34EKiOGiBTL5tqCMaYjrzEDb6BOipTa7mMdfQQU7CWogmP8CcUfvk
	ud+OoO/KdaweQAAr9QU+PFZ93nrx0moEoLTbMYoZHSY8hhot5qlgdPV1WRq/Cfe0iMQO/0szAQUdZ
	R/rS4jdgkufUycjMfwYC1oNG1t2ldUsG0wov06Ea13SBLE28GVIrkGbCVPgSCUNTS5Ej2d1pBcTis
	o9gdAFqf8FLwUCVymy4jmcgYZIfKYyE2IrMHlDAa8HPQBkz5Qypnllv3kS3SuMLi/l74DMqLyHhU5
	H9lIQODvbJmBng8w+wFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOt-0000000Bprm-3R4z;
	Mon, 20 Oct 2025 04:21:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOr-0000000BppS-00nj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-780fc3b181aso2170891b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934096; x=1761538896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=iEipUyS5mpy3kIBp2nWh3cbhHRPEw3mWs9lXvBXuGSdOhP6/pCfVn83OwVc9iqQ3Vu
         p0H7+V6r1LObGveARkWAuuIh+GQ07ARR/PLMFk/wI8JXLyn/gal//V+PqRcf0l5A3t4u
         +Z3/tP5Z5Lb3CIdZqTBR0yYvyMJqfWqXVbV9iw10VChqUDkrMu66EpD++0ErEFx6Gw56
         Xa6NOZICPUFC5r5LlMbGONNc5eUiokEpL96207zmBJ3zb8vBvfY7huXLaUhhDHdlAvtv
         PHbzhlGIGDSZJHp0LMrkC5515IT4kzg91F3ZTcExLuRijStSdaUMab0USWa4wERB7CDZ
         k3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934096; x=1761538896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=BqlkqsTE4iwAGaOlYGfjhCHCd2ejuK1dfwXWNw6xiafNTO8UWnH19XZ3vS72od7UZd
         S3xnhFCPHNxduA+7qD7ed0bF/cfR1celHJ3POIK/+l8jGM2VzDdsXAoVIAdRK0s8jesN
         54DHDIaYYFH5SFliHJZNOETezShOIG4yndetsl0bHDOq3ECgfCBcDYEbq0/e1+Doacw0
         Q0zJPVWAC+usSNaRypeBjURZt55uiDEUxOxaFif0aUGuK80KHBlX93g906KR0Cid3AXS
         an7PQdnLqJMyA6es98I2ZDEpS1gbf1UKrF5HsYk9whXiv+gr/VPhivkIGocB3Cbnh9FY
         MARQ==
X-Forwarded-Encrypted: i=1; AJvYcCXteq12PjocNFV0OpUuYaGiICzpixJMQ/hVhkHUV6NydzVe4/qSpRoTJMIZAEKxok/7Zc1sADnak1E5zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOTwFpx+IUur75GMyvvEIMep94tkIk6OQLJFg1beqNjDGjF1ZR
	s8E4Rf0dfOpp9TVlOrHPUst8qDaNetSOT0Q1jAX3I93Ff3jOiR+ucGu8d5Zn9e3TCDg=
X-Gm-Gg: ASbGncuOtVCejmgB42Itggg4aW0cCWhYF573fQO8eQ1qV8UoWU6TuuHbVH4N4wYcFDL
	sbPdQrBxmZJmF3x9imEJOGpBHTkeLzi4itTNIFRQGA/g2yj5tBt687CyWe2BZYiCBUbPGmGJBg8
	2yWbSUb3tHIVUGBIGYYJHKmK/xG2yKhkBzZy5Nq0b7tzduy5MiqUZB/7fxtGk51TLT8yFs6U0go
	nmSNfgGrqeBvUjzuW2Hlb5g93F3YIKXLy2T7W5YOwDif30rQp7GsojMzIhgcveVgHlbJGMpJJFl
	vikrFzqMeunoaL+itmXi0AxKcoeIe4mCvUyOFwLn2kdwT94ioF8JzUG1J6sakkPzxvi1R2BU/JD
	Gt+MIi+5rxAATn6E3OmbEPORGXovuDigOxIddhTZgzg6zSLPBMzxcokS2o3meHHbzWTkIT3bu3M
	DXCB8N99yEw/67UmgLAlhcGQ3qJXHG5C9zYDLxlYMLMRiaYOuGg1b1luUyMvXdpno=
X-Google-Smtp-Source: AGHT+IEVDRzQqxz41bjazvzEtq94PPu5+Ha6Ch7yR6vZUeSxKjd1JAWFRYIDj5wLQhSdXdNmOhf0qQ==
X-Received: by 2002:a17:903:1d1:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-290c9cbcca1mr154193285ad.19.1760934096103;
        Sun, 19 Oct 2025 21:21:36 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:35 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 03/10] riscv: hwprobe: Export Zalasr extension
Date: Mon, 20 Oct 2025 12:20:49 +0800
Message-ID: <20251020042056.30283-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212137_044377_C905CB7F 
X-CRM114-Status: GOOD (  10.49  )
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

Export the Zalasr extension to userspace using hwprobe.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de..067a3595fb9d5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -249,6 +249,9 @@ The following keys are defined:
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
+       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
@@ -360,4 +363,4 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad9704993..d3a65f8ff7da4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZALASR	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beb..0529e692b1173 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -99,6 +99,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZAAMO);
 		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZALASR);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
 		EXT_KEY(ZBA);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
