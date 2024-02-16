Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA59C48295
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VViKer9yfYOe5ax7kXkyU8x2jb+S3myFovX5m+swg1o=; b=bK/odFcjRgF0As
	N13w3zwAinVAFOMxsXAgQCLsLFu3qzOfKVjqQqq3wL3pPhYXz6b/gWQY9qAxXsuWr9vbK/qteLpsq
	yZv0jythDjWfCNREl/Gfr0NbjMOfUkHY5pNstvRH6xlB+pILJWdcz6TIwBp2cWK8lMtQL6jaj0urL
	mpn+N4kawpnGbGWiIHoGKIdVDGVPsd4x6/an6shjNCTUsinJFhZnpPxTwTaUJ8JKAV5TyEBATHM4j
	6N/biYcrTSIYsfY4npKIu5IExK/AooAoSv9CUvWf7xXUAwDdeR30qu1fC21WrSVNM0+Nl/tEh8hN2
	Ud0NS0zqClN7xLCBXd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4v0-00000003eb6-1Nvl;
	Fri, 16 Feb 2024 20:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4tv-00000003dsP-1WjU
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Feb 2024 20:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Zm8eYFzkCy2fo8YTnXRxd26L7cmwWO4QztMTfO2g44=; b=Te/Pql26vCKIrUqdaHRKpNwcUd
	Wz1AbFEUJQQRZtuq5Cgs1xwtQLCq0J7ppeC/I8dVqxJTMVZiqMK8f1OQ3BLsjY26ZWtNWoA7hZiK+
	zaVlZJihpJVA+nU0dn/cmmZa3IJkYkobD0Tc30hCbj5Dv3+S274kOoaf3EJyFMPblKod1WwMsdhYT
	5fh+rDsjOsdMaiGL1+c2cvq6lODcSSRZC2AvuurUjTItYdF35lyaiazEcDI0zsuOhUKbDSX2Y0Umj
	a3XHFQeW/WaxPoSVw46Kh6yH8CdPeGV6a7jMm6DZSS3eXq6ONOnc9OernogmB5TYfR2mNdLFlwdFo
	vApfz0xA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4tp-000000001su-49Tj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 20:33:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e104a8e3f7so2067776b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 12:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708115608; x=1708720408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Zm8eYFzkCy2fo8YTnXRxd26L7cmwWO4QztMTfO2g44=;
        b=nyY8VtHddz8coIeT98YRuLINF5Uk98lnruGDLaS76KH1SJIPllEqyBX62+JIVlo4Ca
         aWcrixwZNPWUxFeKfgEcsF9zpvb3oo3qVyKLGN0Sa+rEsGj+BWfbJnrE3nOAeaJTCZHR
         NVRidE+RS9oM+/dgZ0KYmhFy8QQ7QClgWubQFu9WGhqIWuFnW3ahZYfUVBjM+AhlKIOL
         FtpgyYE5Xxr2EzTGhQsPLbXorcdYkhEF74nCBCPfTszmdssbwqEN3yHqv7L8o4K+012/
         yscz9M/IIhjn0yO+zSiCu4N2pylomz754Rk+Q5cU+vY/WV9vjBabt1DtvvKRJlmS7QQC
         Cgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708115608; x=1708720408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Zm8eYFzkCy2fo8YTnXRxd26L7cmwWO4QztMTfO2g44=;
        b=aMozbyJYWTXTLrxZPo27n95iZ0EsumopO5HoNmVweMXxlEkk+JgbsTO53sneG2ra+2
         1YEfTzm6l99+lNWyYJx2jp4t6vmUU/ClTLkpudAe8WyZrMM5TeoMyZyNSkKaRl2B6BC4
         x0DMIAKvWM9EV+WjnSsI17btStGgXQ9ZRi94jfWSO/YXW3ppR0FbxFetAr8Q2i8mzPxs
         NA2IAUbqvCnWSC8H0KyMGUQMbXao35lZXY0cSdRWYLNEOlojEt/m/LFaTs9U86I0EFJt
         o/c8xWbrldozPm1M0YAkQ9JPns7UndJ1GeUA2FwDlzRG6xkuJS0JJ2uzzgwwKMA5y0Zi
         eDDA==
X-Gm-Message-State: AOJu0Yy81u+iUJ8LIkEP7jTbmsJw5KGGUMGZnWcCklfRUSoBm3QwVQD0
	J4ZmaC7vJpWCYGNiV+myGQKBWhil4bNfxXHLC5CwYlWc3KyIyqD7d5ftIKImeMw=
X-Google-Smtp-Source: AGHT+IEE+9Rd2cRZiKFG//TBC6A5MVnz4PILwOrfl9W9HSLIQgriikVS1s20Act5uHkKuWl8Niuu8A==
X-Received: by 2002:a05:6a00:2190:b0:6dd:839a:b070 with SMTP id h16-20020a056a00219000b006dd839ab070mr7424707pfi.34.1708115607225;
        Fri, 16 Feb 2024 12:33:27 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s32-20020a056a0017a000b006e091489776sm369918pfg.92.2024.02.16.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:33:26 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 16 Feb 2024 12:33:18 -0800
Subject: [PATCH v4 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240216-disable_misaligned_probe_config-v4-1-dc01e581c0ac@rivosinc.com>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
In-Reply-To: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708115604; l=2683;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=T8LMOzu9nHFuhW9wH9M9lyPtW0uvmulpUpoeoDk93nw=;
 b=7Z+H3hr0K9ilHDGmJqtDgek8qNy9Awetiw6Ny/gJ+In8L9mHa7UCmYXxVvrHClWXiNWwcuPXb
 K1XoWmZBrhWC+w962RzV4XLb4sUNyxBe846G8yUAdaQFcIBdIZcGO1j
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_203335_403263_D1EBD112 
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

Create has_fast_misaligned_access to avoid needing to explicitly check
the fast_misaligned_access_speed_key static key.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 15 ++++++++++-----
 arch/riscv/lib/csum.c               |  7 ++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 5a626ed2c47a..eb3ac304fc42 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright 2022-2023 Rivos, Inc
+ * Copyright 2022-2024 Rivos, Inc
  */
 
 #ifndef _ASM_CPUFEATURE_H
@@ -28,8 +28,6 @@ struct riscv_isainfo {
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
-DECLARE_PER_CPU(long, misaligned_access_speed);
-
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -53,6 +51,15 @@ static inline bool check_unaligned_access_emulated(int cpu)
 static inline void unaligned_emulation_finish(void) {}
 #endif
 
+DECLARE_PER_CPU(long, misaligned_access_speed);
+
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return static_branch_likely(&fast_misaligned_access_speed_key);
+}
+
 unsigned long riscv_get_elf_hwcap(void);
 
 struct riscv_isa_ext_data {
@@ -135,6 +142,4 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
-DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
-
 #endif
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index af3df5274ccb..47392a83239d 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -3,7 +3,7 @@
  * Checksum library
  *
  * Influenced by arch/arm64/lib/csum.c
- * Copyright (C) 2023 Rivos Inc.
+ * Copyright (C) 2023-2024 Rivos Inc.
  */
 #include <linux/bitops.h>
 #include <linux/compiler.h>
@@ -318,10 +318,7 @@ unsigned int do_csum(const unsigned char *buff, int len)
 	 * branches. The largest chunk of overlap was delegated into the
 	 * do_csum_common function.
 	 */
-	if (static_branch_likely(&fast_misaligned_access_speed_key))
-		return do_csum_no_alignment(buff, len);
-
-	if (((unsigned long)buff & OFFSET_MASK) == 0)
+	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0))
 		return do_csum_no_alignment(buff, len);
 
 	return do_csum_with_alignment(buff, len);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
