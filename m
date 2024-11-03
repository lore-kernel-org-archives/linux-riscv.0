Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C6FD11180
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lErWCDkJ1DF3lggUluWYjFo762dOJvVXJS7XmmCOBGI=; b=NQBE+OvLb2ul3y
	QxUJw2rRpbijDsLeuFzg7plhm1gQ4+P4BFSmFhoLje/k1CP0CxLiAp60FRE4mMA2m/1zDeYwC4yNh
	eqb6+wVllIGlPzVjJzjybZkmIzr0HktyUS8EbdaFe4T6c29nsCk3pBZ9mCDP2z4J0owtEKpKx4R0E
	dW3JPFRldiEbziqxIjjR25PW8YDLH0q2q6MXv+3xDoxM6zrGKDUloWBTaiPjjAcBtR2HyTbH+oYhT
	1e0RJO53HyZt1uPRZG5sfi2y7ElOGuv5VWnPHd5aTScvuiQQmCZrH6vfwRvrpH4Ib0A5aZMoSxXHI
	sw/XY2zzXwzr50F7BqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dG0-0000000BgFv-196Q;
	Sun, 03 Nov 2024 16:15:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c8L-0000000Bb0f-2xea
	for linux-riscv@bombadil.infradead.org;
	Sun, 03 Nov 2024 15:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=51tYDRwP1WvxpzmCthvL0bau6hmUz8qjqFRqrLI9cd4=; b=gl7gu+hZGoCJ0EdwYDTjzKKDBj
	TmNVsbfUaQGjwppSkynZZE+Fbtfoah8ufiGxdM90bHTv+tMnuJF2s4E1ME1gApCv9NMproKo5Ov7p
	A6rc1M8wadUfSqaWgmLplkkpMgYV3LX7JEA73OXqRJkimZl2K/NYWQQc+PLUS3Nf9Sb3iWKjh8sJD
	ayjkmmTtT4zbojI07YYPOVVWOYbzyOs6HyRfTpn2J04XAPKw1AsCjzgfcsVk0EBGRlCC4dQXl4+VO
	pwTkPw+qpE1YWl/cc5ZXF8R9Bdt+tlX8J1CtnyuHJNgXlaHWWNfSkG1KbT/1F1cV+1/M+CbRNpCW7
	QrUq6lrQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c8I-0000000B8UK-0RhQ
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 15:03:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so29918095e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 07:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646190; x=1731250990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51tYDRwP1WvxpzmCthvL0bau6hmUz8qjqFRqrLI9cd4=;
        b=gSFmJZcwZPFR3CTPCjdDtsJEac4evplsetr5FUnoigIuB1U9GO40zgpher9HnHDtQ/
         Ws78lIenhXlkkfKhZxryswHiv8Lv/SqlRV3fvMLuy6JD6Feerc+Y6X4mxxpWWEzPgn+c
         eXpIodpas2Uj6J9ghJHxSeqQQpHVMYduc503z6L0yymBzlkxzfQ/l9Y3CJmRRooMrVto
         vEfhgmmupYLrpKo3rfQUhqn8OT2q8+GMuhWwsu8qgjCF/A2CnG68iWg5LemQQ5C3f0XE
         El49cpYbEdQMDiOpGn8DbOxH+0zuK8V5WapBZmWpQH49cRgrvFwVFNzYfe7kvbXcj3l2
         DsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646190; x=1731250990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51tYDRwP1WvxpzmCthvL0bau6hmUz8qjqFRqrLI9cd4=;
        b=FjnIsGahn0OvPX4PBH/kfjuEUos6OVQbyysmXpE3k1cIPWx5RVXkurp+eSPBKcMKam
         HGg1C9f2SmfdGhVqi5UHLKU8AaTHLn/ALvWIj3ehU1SNsiVWMsh4G3Bo2I0k14WH0EDo
         a10e1x22pS7unIui3mSaFvDCGXksDUEL93JPmqs0B2FatofIXduzPFSyryEy1MuJRwbg
         +9JZlHXqOfrspkDR5NI+kFr6Q1+YfWOSYzvbn5YMqsgEtNSf2bjjCcpxAji88uCdDlA7
         k1p0ZwI7DTpGX5cPnKw8gp5Uq3ybOjwt58OlJ4FWkFn64rT7HewmGyzzHItCQFw6MDmt
         +vGg==
X-Forwarded-Encrypted: i=1; AJvYcCUV4C0zy1ZDIlk3Te2iIbniw5zzIjeNEoYvSQZCnE5ow3mqlx+svKNalW68dBA0RfsUVBpA2GiyrZ4NaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbdbuHxhuN5Y0mZyd8+4oRYAiJ/Iyn8j84mYJ75GUybO1aN9dC
	5Wr1FSEB+1RFIB14nUJoOM+urMrlby7oDI2kwEt/YwwC8u6UqGw3SejIZ2cLPIA=
X-Google-Smtp-Source: AGHT+IFqldFYKHqBiRaB6ae6bURZkYwVuzbn5bQ+e+Hym9E5heEep9SJOfB/eoXxuGPgZenIG/xzCA==
X-Received: by 2002:a05:600c:1c9e:b0:431:5632:448b with SMTP id 5b1f17b1804b1-4327b80d3c5mr115258455e9.25.1730646190486;
        Sun, 03 Nov 2024 07:03:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e5cbsm10816042f8f.80.2024.11.03.07.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:03:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Sun,  3 Nov 2024 15:51:51 +0100
Message-Id: <20241103145153.105097-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_150314_350006_518D99F6 
X-CRM114-Status: GOOD (  10.08  )
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

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 74bcb0e2bd1f..0aa3c3f5e682 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -94,6 +94,7 @@
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
 #define RISCV_ISA_EXT_ZABHA		87
+#define RISCV_ISA_EXT_ZICCRSE		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5e743d8d34f5..5f453a039ec9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 					  riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
