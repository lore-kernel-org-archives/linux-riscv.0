Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432D0EE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2uKaqMaeRXZfl/cpGy6xX9fHAltww5nTAhwvgauWNE=; b=j3wW6v4d4drdCn
	Nlk04w0TfHzFUDPLUUbo8I/yb87IFYARsPFlsdXO4BaqQPEDgKt6QtzpOmE6Lh8mpfAOv56MuBwLB
	p3oBwOQu+3FQvRGRDQ1HWV05xa4Q0pHRm2x2vOhtOBdF4dek1Hnkbsnm14nEEBFG8ClQ70kQSELTU
	DZCtrwRYclRPnPvlEcPU7bT2Eb77s7VVj9bzXWMitDYS9D2/0S1eqMZXwHyQiMWtuyM0vpKWRTdVZ
	de33hcFYcIO8i5ILzy15RS1Wj0Li3byxPjk+IXwbfi2dRVDRnVF14kp/+go/VbW6pxVPyCcSjagSI
	Ecyg5CG689mx89/yFu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofY2-0000000CKIv-2XOd;
	Sat, 07 Feb 2026 10:28:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofXz-0000000CKIB-34Cv
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a95de4b5cbso9061265ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460095; x=1771064895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUoy8LcMVnmchqzfZX24FgqMVeTS5IEuCIGnQQzaKiQ=;
        b=ITgIOGRdrBIG7CqNdEpXjxGJ9L054PeYaFC37g/dSJXNJrH8Oc6MhLxlgXT+ecWXQh
         mnSwZ9cZHD5puj1Dq6luX0fdrAXMFwDfPPR9Y9wkrSqgweXcUsO6OlY4FGk5i4XBuZNe
         cPnls+JKxz7nDyLQvow69TUPlEsvfSZ4z+o4GIQWytP1WZvqXk7HhLTEzsJ/Q4SOTv7W
         Ta23PDeAP+sweajDAtdC2HXf1h1Bif5N9bWbCSTNsWel5HEWBLUxmmp8zgxBIThsOXJZ
         K5/tsLIg5dk+2R5B9pzlroqmCXqpRmDWX45sTY+puMrstW1j9rM6MUQiQ8NRABBdULrp
         ETGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460095; x=1771064895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUoy8LcMVnmchqzfZX24FgqMVeTS5IEuCIGnQQzaKiQ=;
        b=KFSujvjnFXgHN1w1p+9dOma4MnQXAJKCJCOJkBNeRxh0w3oPWoNDzFuYSD61WC2bvw
         qSy2z1AJzipGjn38FnJEX2XStEK4pwwaD4QmTaihDpD5Vk5PTQD6IY/0YXHooYnCE3sV
         8deDwxTNVuPhEMyQ2jP1jPp+Uwyv/mQ8/U7Cpf66HOufpkkFHvntMl05pDEYEnbEprKl
         h73n5PCONHS2N42ICRqgiiC/SG6fAbmg6gheF2aY/On+aWzBaFINx/pRlFhHeGgeTDzY
         0ZG7iQCGR+fJ6ZXwpB6rjsiH7cPald7Py85ipK3gcqDbWJP5GiKOliF7wY7O4ZL6rLlN
         U2CA==
X-Gm-Message-State: AOJu0YyAX4WWMGwBtGItnHrbWN/xfKmmz9CIivCKQiMPYXRGo8v1hrlk
	1HlzBEy0cZMu0SheOobVluRK+hUhK1+gw3EGdzq6E7AymIKKJh2fx8pbWzx4UdEGBnFRvLYrenJ
	K8JYybSw=
X-Gm-Gg: AZuq6aIEEILSv0R0CqYJe6aW1anXFcTQi2KUTKKkSK83iMHlFb/gp3cU6jmOcR7Tu9K
	7OuK8XQU14QTJMJ29oSmpjN1Zp1rOPYxMbEWd04EPiQfGM3RAr8ICRcXJqENRO0ZEZBysSndNcZ
	UzY61r4qrOpRdDSK/1DUXIa/bOanwdukBZNhYJjc7ZxRXi+6hQW2l5IVBhHgacHoqjjkC4rhyLp
	i2EAE+zU8dlEqZI83c6SUhXWGtgxOHz9EQpNSFQeeWVVKWKXcuyluYdkXlSnyX3vSF5vh+2Ac0C
	xcBYB0TlecW6ch+LmjVHBLy7pJHCulrBy2kptdbve4o4Y49gjNDh77u/iEkfWnAjS7HaQrz62f7
	8bHJsANtOQdvIr80zSqAtCyO6+oy/a6aoakQvCUGlvywl04UBnO8ed7pajD6Amq8LT4aXVv/qQ0
	Xwfnq6qJQ32xU9s8qP3dsMuy8cA8xdsIjhVPrsw33p7aDBtfqYa8eZdw==
X-Received: by 2002:a17:903:3885:b0:2a9:327f:aa31 with SMTP id d9443c01a7336-2a951631db5mr50298215ad.21.1770460094619;
        Sat, 07 Feb 2026 02:28:14 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:55 +0800
Subject: [PATCH 1/8] riscv: cpufeature: Add parsing for B
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022816_389167_8929C0E6 
X-CRM114-Status: GOOD (  10.20  )
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

The B extension comprises the Zba, Zbb, and Zbs extensions, as defined
by version 20240411 of the RISC-V Instruction Set Manual Volume I
Unprivileged Architecture.

Add B as a superset extension so that when "b" is encountered in the ISA
string or devicetree, its sub-extensions are automatically enabled.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index aa2af21f3bd32573558e964f94b32f9739f4c89f..35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 63ad6393b2c6dcbfd6e7e247cf4bacb6c11fe58e..3d3af82a53250f29204a3fb138feaf520a878d0e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -480,6 +480,15 @@ static const unsigned int riscv_supm_exts[] = {
 	RISCV_ISA_EXT_SUPM
 };
 
+/*
+ * The B extension comprises Zba, Zbb, and Zbs.
+ */
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -528,6 +537,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_b, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
