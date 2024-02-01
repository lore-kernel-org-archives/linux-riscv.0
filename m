Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71552C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1On2fmxuON0rrUOpgZ1ttm5DGd5pktZBqsXpSipugE=; b=NdwonSe9Yl8rgz
	746LUEuIIRHU/B79nuNF7HSPREonZn00aThCZdupzUNHiw+hBOSeczZLzgVkjruAkWDWGca52xX26
	gFQIacAY0rO3Gfc/7LiF8gFLGC+vH+atth5B524NOGNBZFW73IvfmbJRAK7S7q751zAQGa7Fqy6le
	Rdhwb2Ny0jN8OHbyYKiI+sgGRlwB7nszaCK4/d9ppBdDWqaGAbDhWyxxBVtN3YiiFrK1On10VoDrj
	duFLUBvuTT03p3qa1VKINTqwdOjPSBV7OCtnzSPy1nFY3BzTec1rdoXhQIl6dAocWRl28P9J4sMTO
	BT8EUvzm4FPx4c1qY0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQkn-00000006nVW-13cW;
	Thu, 01 Feb 2024 06:40:53 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQkh-00000006nRu-2oQu
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 06:40:48 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6dddf4fc85dso438792b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 22:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706769646; x=1707374446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIXyaPpVLFUfFDNyJy3KWQ2yUOHOdYcvoDWbSmBuabE=;
        b=m0gqtFwxCOaacYf4A/yzz9zoERrnUi+IPx/FV4YFu9J5Cgm/TLImcJCQQJ9SyAajyK
         XYGhwwUql7s+inAzWpX7ryMsP+K3hhEyAcddq4+GmNTlkaT7YpwHwAlxYQW8b6W3H4Fy
         TfRRgCsdffzCgX/1C2b2ueUc78CrRqqoDjxpcbS0y6pJQjaFvanr6/qCtzhDeGjYBxEc
         44b4Kd8fb1zKjh4ftIp2BaFy4GuwySYHxnjoVUE/xlpNhO1RQG2SBCMHZzhEsBQXkhUM
         uo0FoY1CXyghqtZ4Azg95fAiamM0avmTEu2IxYnUWgPeZGI/tZNBa4OJTS05wL0mTjlK
         vF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706769646; x=1707374446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIXyaPpVLFUfFDNyJy3KWQ2yUOHOdYcvoDWbSmBuabE=;
        b=tX4dVl4wkOiEHT0h8F4z9zVDuTJwtA5NrTO6WGCcN+mNMIpOujZ17EIbcs08GnIn58
         bVBT+1PsepiRD9C3heB+MUiNOpg3gZic+0o9u6uQXl03FyLoInHo98SoHZTUJQl5/Qvo
         UTJV43SLL8HCWANSpokqlrTt6tB5lubf9iuMVXUw93DilqbXVDHpjx/Fa6ZvTdcH/crc
         1CKW/s1r/c/9Jlx55S33z676UboZNA5abnhACPheziH7K42wKzLIjcQ30iPARhvQjxSO
         AJJyLF9M4h2riml8NfXsfrXUAangrmpHb9da8jP9ACTYL8O/0aFtWfkqh62oKYzEvWCj
         9UYg==
X-Gm-Message-State: AOJu0YzGOZ/Ln4u2mtVD1CLxx+FMk4vG5MwcBPkxWqr4BL5r+a30WwFM
	OqDBdr1Y7g+5oon1kHZYXA4qWc7tsHEO1GxcGCKurFTxZwc642h7ZbijcpJwdJs=
X-Google-Smtp-Source: AGHT+IH0Ilf+FhRJHFE95RV4Rfrl8XpJK4Lt8W5UOLth2X1zaJdGQWNQfaO0qCMIHLCPfQ1gwt1ufA==
X-Received: by 2002:a05:6a00:2e8d:b0:6dd:e398:2a84 with SMTP id fd13-20020a056a002e8d00b006dde3982a84mr5625436pfb.7.1706769645899;
        Wed, 31 Jan 2024 22:40:45 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm10925764pfq.9.2024.01.31.22.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 22:40:45 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 31 Jan 2024 22:40:22 -0800
Subject: [PATCH 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240131-disable_misaligned_probe_config-v1-1-98d155e9cda8@rivosinc.com>
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
In-Reply-To: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706769643; l=1864;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=+3+H4L8FL4dzjFZ4FqWhB/vlMrVeJ1UYdAoYv089bgM=;
 b=bRvK7aKUqvows9fD9AnnFe3X/BPdMMpRQM2UWcIw7htlQ7Bn9ObEUpctD0UR2OtlMn1rEBT20
 SD8K04u+x6tCVTERMuXek6EDidfS6/EYlv21nNMSndqs1QmpjODeU5J
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_224047_749141_2425BB30 
X-CRM114-Status: UNSURE (   9.58  )
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

Create has_fast_misaligned_access to avoid needing to explicitly check
the fast_misaligned_access_speed_key static key.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 6 ++++++
 arch/riscv/lib/csum.c               | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 5a626ed2c47a..dfdcca229174 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -28,7 +28,9 @@ struct riscv_isainfo {
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 DECLARE_PER_CPU(long, misaligned_access_speed);
+#endif
 
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
@@ -137,4 +139,8 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 
 DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
 
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return static_branch_likely(&fast_misaligned_access_speed_key);
+}
 #endif
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index af3df5274ccb..399fa09bf4cb 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -318,10 +318,7 @@ unsigned int do_csum(const unsigned char *buff, int len)
 	 * branches. The largest chunk of overlap was delegated into the
 	 * do_csum_common function.
 	 */
-	if (static_branch_likely(&fast_misaligned_access_speed_key))
-		return do_csum_no_alignment(buff, len);
-
-	if (((unsigned long)buff & OFFSET_MASK) == 0)
+	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0b101))
 		return do_csum_no_alignment(buff, len);
 
 	return do_csum_with_alignment(buff, len);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
