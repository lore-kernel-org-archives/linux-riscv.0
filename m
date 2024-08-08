Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE0EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=znQ9va91MLVBOX84BpD51IFkryxBkelqWgF7WzOuKCM=; b=huqvOkzAezOSfv
	Q0sgnoNUU7DZqUvEeZFANyqWlH+iPSSJ5WqlaOl6Q6p+0SNQ/As8FLyS5RnnfzDAZUnZzxwe1XI7H
	Dw8Dj28IWC0sePP14wZaSa/JLOhPJN6fnq8IUxHtxOissLyWpbhk4brHZ3/Vtv1K/QjsKmmGbecPt
	xq/wuUf6WZIbmkGMyBgYMQI4dhGJN31L5+/gpOEcq/6XuWXZEf2e5WZ1lqx3KiP6hEh/DUP0xEc1/
	X5Sj9/1qP0reJembPNu/mbu1S63gA0X4CbcD+n1hNWAq/E4lIlbQwaCk/Pc0JBIxRK47GEgkRku/p
	14/kmU2XpWAe2Gjgpx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc855-00000009EXc-2O8U;
	Thu, 08 Aug 2024 18:41:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc852-00000009EWb-0nnS
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 18:41:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ff4568676eso13260125ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723142503; x=1723747303; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AG7o4n/MhCzESj2P+tLcsOrZ/Z0Rt0fnlAPDLYPYB3U=;
        b=s4/7XEtjfBhKG6wqUq12prKvN2RuKHKHlYHnjIbSGZxIqbGR7MflUYQcb7QdSeY3BO
         mNSkLBspGzJnilopEmQIlToK5pxet4dleKyQXnx8bVQm7xjejCqTJ4xtbKgqHEoIeam8
         0Qmy2U/G8sjkEAyUECA0R/lk1Jj5uU3tVwAE5+Y81QkNscdiQO/o2BbBOFuK+tTLnQ1s
         OxOCzMH4CsXmx5/xhSCVjZlgiK1f2dNAb1wcQQRG2Q6RRuX+UtkPl52oyZZydmQbzPdC
         HoF/NPHMAYeW6WEUL5YIAV2gr8GIHeXPsfLi73VjBn9mJWjDYaTTKrbC2V19wCRHRYhc
         tCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723142503; x=1723747303;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG7o4n/MhCzESj2P+tLcsOrZ/Z0Rt0fnlAPDLYPYB3U=;
        b=TyAQzX4vtC8z48rd3BhlqlyNrRojfgxQLo3SfvA39twd9+xDzRnP3KEn6noglLJNg7
         Dr4PpmTjNu298QTytQmdF+uGFLwpRWnuJyBNYeEjoRcenRdRK7jHe15WAmoNG7gKUkGQ
         /9pLA9ukpeAdzqxhbgWKey1APxsVE5jLLMlVqiwhc1W2Rpp0mZuOTluSt4r7wvm6pU+v
         1dz1WjgKUc0FtWXny46Oak3sBnY0bgs2k4SCfUgXzm9Hf2ABfwy6Pazr040i28Lj5tug
         iTJ4nbiB9PLptLP3AeCHhCnv52IkU09v6jo2Apw78mvv/z3rRh1brreLWWXBYldY8Aay
         cugw==
X-Forwarded-Encrypted: i=1; AJvYcCX9/vUYdDnmkZnv4pRuTEeBFuAk11xm/em2YkYZF3QqsZv6orimWsYp5cBlYEV5DRPieDk7qEvdd84sSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqX6lTf3Ee5jJoGvapMJDApymsyNimMWLYA28dQJ09k1uAERBV
	P5TgQT5EGBwjqHueiigVROiPko3j+rSVNiSVHm+LnbVFniNhzAszlEAw2zftnQc=
X-Google-Smtp-Source: AGHT+IHFYMrAf47hOMo+LBIFpOsA7X9Xf8/oax6Ra582HTcJd8AWpBMyQAjoYdlXCRtGRDVUHetLpw==
X-Received: by 2002:a17:902:d2c9:b0:1ff:39d4:1663 with SMTP id d9443c01a7336-200952ee879mr29883515ad.47.1723142502941;
        Thu, 08 Aug 2024 11:41:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917a5f4sm127727315ad.211.2024.08.08.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:41:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 08 Aug 2024 11:41:40 -0700
Subject: [PATCH] selftests: riscv: Allow mmap test to compile on 32-bit
MIME-Version: 1.0
Message-Id: <20240808-mmap_tests__fixes-v1-1-b1344b642a84@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAGMRtWYC/x3LTQqAIBBA4avIrBNU+qOrRIjZVLPIxJEIorsnL
 T8e7wHGRMgwiAcSXsR0hgJdCfC7CxtKWorBKFOrXnXyOFy0GTmztSvdyLJttPdmblZ0C5QvJvx
 D2cbpfT9q1ny8YwAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723142501; l=1481;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oKVmgxAvtU08k7fXc2KY7/+qmgzTvGzLzIGlMP6cVUk=;
 b=FmFtK2qNAbnd0xcmjgZmgnNzTYYku7+c+IaE3mPTuKuwXBke5hIVWtsIfv89fURYD0pWwYHZC
 C/MJNLRhjn3CFJCPGLgLbHPFhh+EX7+3lgdYy2PP4qGzMKpoA+Hhwvl
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_114144_470794_1EF4A0A8 
X-CRM114-Status: GOOD (  10.30  )
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

Macros needed for 32-bit compilations were hidden behind 64-bit riscv
ifdefs. Fix the 32-bit compilations by moving macros to allow the
memory_layout test to run on 32-bit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 73d05262a2ca ("selftests: riscv: Generalize mm selftests")
---
 tools/testing/selftests/riscv/mm/mmap_test.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/mm/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
index 3b29ca3bb3d4..1c3313c201d5 100644
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@ -48,11 +48,11 @@ uint32_t random_addresses[] = {
 };
 #endif
 
-// Only works on 64 bit
-#if __riscv_xlen == 64
 #define PROT (PROT_READ | PROT_WRITE)
 #define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS)
 
+// Only works on 64 bit
+#if __riscv_xlen == 64
 /* mmap must return a value that doesn't use more bits than the hint address. */
 static inline unsigned long get_max_value(unsigned long input)
 {
@@ -80,6 +80,8 @@ static inline unsigned long get_max_value(unsigned long input)
 	})
 #endif /* __riscv_xlen == 64 */
 
+#define TEST_MMAPS do { } while (0)
+
 static inline int memory_layout(void)
 {
 	void *value1 = mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240807-mmap_tests__fixes-651cc2b5fead
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
