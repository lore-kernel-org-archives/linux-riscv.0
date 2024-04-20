Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14668C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2D/bSvid8IT98bpjOGTitctul7aCZSyW4vLqfPAuQA=; b=3KY0KY0RBL1292
	AhJakeuamqWPRG0BM+Ozv3hXH8NZoL8qOrPQhRAHiIfG3LSVIutQ9GSu4aKZ5YzpdxMPo17Mo7Hv/
	1/kZcexwttalnROrXIdjSUYo8o0ZmkJVmf3mkMEOfVpVG7w5TyCmDYz7BXP5x5CR1dB0EvNg/fWrx
	8g+WLWY1tfYMrLancgidDBF7zyw9IQ2bi7ulV9PTQFQRRhNx2Ks/i7bERqXQYzDEOg9XZ4sDlIzTf
	To4X/bph/v3EbBvOFMq9uFvuUIJrJw1fcBMOeQtfB63zo3Folr9j+08aiIsc4ZBWUBrrm4oKFwoq3
	YdTe3sUhaipXuCZ1EZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxy42-00000007MZl-3MTe;
	Fri, 19 Apr 2024 23:54:42 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxy3z-00000007MXH-0fbC
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:54:40 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4371955d27fso13972361cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570876; x=1714175676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rU9bTQzimBlb4bBeVGV64JD8vBjMh3ZSXWmumJprSMc=;
        b=LbR5oyJEa8oXq9rjFzoqUGW77LBJNFmbgdylWC8rcISICGvmUhpMX6iJeGek8BWGx0
         B1LP0Pq78oFlpPjL0aXHtsLwBAFR9FVt13wTV/q2ks8ns56q5KVQXln7gqljncKCbr5n
         mTNiOmSET3lUu17vLOliH5zaXY1wHHASrRGI4G/QbJ+yXxYBwL/VtjXGNJ6DAUJzQqrf
         n5ZxV3S/k+8p3GUCJTJdlBhiMF9pFh4SwERMoorcAmfhZYxgldooszLrdGzRkS/zvt0O
         RcFgKFm/3mIgJkhdfL9y9hAVb5OpzO5RbK5Gq3GfJlycYjzH6+ZOqiwXdsgVYJ8pO2fM
         XvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570876; x=1714175676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU9bTQzimBlb4bBeVGV64JD8vBjMh3ZSXWmumJprSMc=;
        b=nfFLe/sZx/S9uk6IPY6FUNZEooTdOd1jPI3BwegT+jU+hfOJbxOlP33E6nwXak7ekm
         IlKD9W2hmNf7X0qQJN5yEqwlJz0qtk4lrK3/kaa+nzmStNskfZlZH4TLc2N13aJ/eTA1
         PCHbs/bvORCJCoe4w/1OKe9apm0vpMY+wEYVIVqOXi+wcl3Byhh+K4HlM0yd3xzKDv2O
         HoBETL93aonJ87GTXcBnKS6fbKGoRuDsA1O13kggx+PKJLDck4j9RdUCPWu/Tbnf8EuX
         HYxoytHpxGdbJzyI8XqHKfklwWHn0afaHx0Q6ppKFH/z/IOHvIHZQ2aD/ZUcUjisCkB7
         kS5g==
X-Forwarded-Encrypted: i=1; AJvYcCUiJ/l7H9VOFBJIit3W9Ywh1CYnaS4OxQE1nBHYXX9d3fKfK6onPYx5Q5Z5W5Df6adbYGVHnqdT3fwBsuyz0UtKbGXRkgqlVcepgk+W34vj
X-Gm-Message-State: AOJu0Ywfs9geNsIp7LdrH1e1AI2jwDZGz1XPIbkvpBxmhR2esCYEzksj
	hND6uDnC+Si4xOya80U+LuzJo2ojBwenoSeWfZK1C/RDnctPFUS9ay9xkD6Yn57gh6BfCXs85eM
	9
X-Google-Smtp-Source: AGHT+IEp4LLA0ETVFj3v2NTREBIL9JwLMfd8wP55jjHsvOjY9dRaboqfqB73D1IRQCndgtBmMeDbdg==
X-Received: by 2002:a05:6a20:8422:b0:1a7:336c:555c with SMTP id c34-20020a056a20842200b001a7336c555cmr4805991pzd.60.1713570477483;
        Fri, 19 Apr 2024 16:47:57 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:57 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 07/24] RISC-V: Use the minor version mask while computing sbi version
Date: Sat, 20 Apr 2024 08:17:23 -0700
Message-Id: <20240420151741.962500-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_165439_207703_280C47D7 
X-CRM114-Status: GOOD (  12.94  )
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

As per the SBI specification, minor version is encoded in the
lower 24 bits only. Make sure that the SBI version is computed
with the appropriate mask.

Currently, there is no minor version in use. Thus, it doesn't
change anything functionality but it is good to be compliant with
the specification.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index f31650b10899..112a0a0d9f46 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
 static inline unsigned long sbi_mk_version(unsigned long major,
 					    unsigned long minor)
 {
-	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
-		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
+	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT)
+		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
 }
 
 int sbi_err_map_linux_errno(int err);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
