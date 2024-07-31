Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85525C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpsANbD8STIbda4XVlC/8pV9ZRHiWcC64qhfTiIBR84=; b=qu/hAINFRjOx4k
	nGOXvlo3zqyET6rmOh76wzUr55ipBd5kShLenEuVPgBN2UIHzW4jmD8gCdMEcdPFImAXr02dP13bI
	bL3eRgyWUByPfG/nuhNFKYTKO5AZicmmwnrSjbCkT3/kg+o6z0pMWepGjrpqD6PUnZfzM6Wi9zvtt
	iLQfaTsSl89kirxGaM+G41qv4PqZdwtH/S7/9gkbY2NkAoqbNzz+uD0gX5IbrdzqbEk6iSKSTh1aF
	0ZlhHFM37N63aD5CK65mLYNWh5gwlCrfgufdJKydK1sEgUURtxxq6s2gfpE53iSJfe/mGzHebBO0u
	TK59nzeFPXebt6iXmlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3rr-000000009mL-2wAC;
	Wed, 31 Jul 2024 07:35:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3rn-000000009kU-34mD
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:35:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3687ea0521cso3389141f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411322; x=1723016122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z44ALrb7LNXYv1B0ZHkbMo5mYcvmK7MIKHKlm+pxL7E=;
        b=Lhyfw+evq8W93mFfw1SQQ/TfQB+zfRNJktpMtlWVzsPXYuPEidY2JGUF1FQ+XXjimr
         NJ8BMDtgit8W2OhVn9DZLvxk90Mqi5DksF88fu5LiLfXc1lRA57hmIzaJZCq4YNC/rFv
         xhyAViTI/priabSRW2E/an14xLC2TWBjCSRZ/QFu9fDDWGxXXqWQY7sulyclKageOp8s
         wGamx+fpp5NrqaVH3M7LH6CfuLHhDUh1nZgP2NPZX5QLCUq6n5LyKll3t0Zk6HwTz5s6
         TNyEuaCoGlTi5xBRonK23ZN+eho+v9kr35jquHOIFmwt+ghRoZNViQETL9Wase0BOQpI
         OBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411322; x=1723016122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z44ALrb7LNXYv1B0ZHkbMo5mYcvmK7MIKHKlm+pxL7E=;
        b=f6snapjP8d/+1JULlS2f0p/nESD3uWd5P885td/gNKuH6ZHx9zZ2HaZTZbJI+ewc/R
         Gs9bp/tJhFYwtb4V+gYY4+8jBjUzWESz+xIPC8QZMuaW/mCkgTq7NH7+5T+FaRx0Iyyv
         uE52xSmaWubngZgCa2DUXAgJdQZzJIJvWDApTV+M4KVf7/ja3tjppjWCmugdgeW1GTLZ
         oqiUI5JDk850u4y1GpmPkOKC5KIg2yXoYZfkF3JzkXXXkjOpmEjH5Zjpo4GK2ky8OJRK
         TGIOZ7mPE/AwaunpWkoeHrH2Ue+nPIJQ6n40GoViPs1dxI+C7e+5MjhdVWDaz40u+E30
         F5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX+QxfgewT/f7CSz1PrQCINhVnKmoQe8MUcY16r0ixp8+h13uSlsSSSKZIF3GGJYiiGtubh0/LYfonxdPhUo4Mg1YtTkRFCsK22YUVC/REp
X-Gm-Message-State: AOJu0YyKmbyp3NtPVtl3ERsfGIIMpqTzEU2NRWgJl8UKfUZOIVffqag1
	L4bhfZ+xRFDCj+8ZGPzlg8Dkyabm9FEj4iwrb6oNKHzj+VUlDZzJWREHy6+lBwQ=
X-Google-Smtp-Source: AGHT+IG6U6uPzWRr6gyEB9gsCw8ZKy/LcXxiWXsEaCB8YLZ20e09CxhjZV72Tw4GvYFGKWtqsWRHog==
X-Received: by 2002:a5d:6d87:0:b0:368:31c7:19da with SMTP id ffacd0b85a97d-36b5cf2520fmr13078467f8f.13.1722411321847;
        Wed, 31 Jul 2024 00:35:21 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36862271sm16333146f8f.98.2024.07.31.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:35:21 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Wed, 31 Jul 2024 09:24:03 +0200
Message-Id: <20240731072405.197046-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_003523_777997_4653093B 
X-CRM114-Status: GOOD (  10.70  )
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
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f5d53251c947..9e228b079a6d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_ZABHA		86
+#define RISCV_ISA_EXT_ZICCRSE		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2a608056c89c..097821df8642 100644
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
