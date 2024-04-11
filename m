Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FE5CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOZMy/m8O99+ve2jgiwpPpU+PTZem3ypRs94XM2tpIQ=; b=dAbZvXmV/cNCUx
	Ea/9LGxyeb4abmfElOAzP/gkQZjnPHQI6jmtUNrduCDvZM217rzt4j0CRYPFQkyRcWYQAAoJSuMxT
	zmBn/UxLp2rP1a+RiQN4eo6lzPKAnbfakVz6JWnmjiYKtrPvVThJ5xtwi3S9JPBxZ6LVYWpEW7JL2
	LvnvKKsqARgAoK3z+qdolGm1QjVYkKROuLtd1lQ4SDiObBATv5DquJlQ2JFPiCLlkUog+ao+90qcp
	3gNR2ajz2NmNouy9AG92bx6XT09F9uULeYCZk2AHPo26u1mOg569YhQLkyV6iiA0tPFO7b5CHBtMw
	EnaArvhvnOPJPFOgznMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj4O-00000009o2G-1XUz;
	Thu, 11 Apr 2024 01:17:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzP-00000009ZeC-3CWH
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e51398cc4eso7940795ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794106; x=1713398906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ogf9r7p61Rc1oGw0oa8bhNwO/iV9jqlxUmzvsZGcz8=;
        b=ldQuivrGqdeGZ7tLYd2fE13TCOaKWgSs0E/zjIQt90vWf2BTqk+I1YR2vUemZA3DAr
         ySn4K09i5JllmGII3u2ZgNrnl86xicZMJmr+1A4ipu+1sxO9R5PhQ6bgvsL5RasOKDUm
         cMhA1ALNvjEAXT+BU0Cd+y5mb+Zt8vyojC5TbPwfgFtO827JW/ERYsaeMZbw3fmEJ9II
         Q7zMw6e/oVUpAXzks1SpO8+KbsWfRxrlypwEoCCi/lwxjr0b0SGFIBJ9zLepl5e3cMtH
         wq+GfdNXJdtWREIIlORAzLJEY5aI+xfwRzjWMKKJbp6Gn9O0CrgJ3h22VWe0Yb62KtAW
         KD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794106; x=1713398906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ogf9r7p61Rc1oGw0oa8bhNwO/iV9jqlxUmzvsZGcz8=;
        b=q8olofKkiBqGjrBtOpQEydkXuEYRInLrPTDpp8AmdeaGZSu434pJWO3BSGyPZ0rALI
         rA5eyq8UZ/uWdCApEcHhtCbE76mgnZS17kVL7feRuMJTXm+39JiUjRElrOAnBrsVsSIz
         6YAYo2BEGSSuGuzjyWRQ2MmduxMFUyjTX65LRndmf3UIGVggbFGVXVzYg2oqEZn9Huos
         Rg5FgNgbnNY0d5ZWiEGc8sGdQ+qMXm9ZV2bIlz93wHwECqHnOmzNwgkB7l+EZK4r/Eb/
         iN9Nm0ZiSBcv3yjQE8dtOwKEyK1vGc9zyoUq5AgGvGHk92FskXMm9YaiSa3P7vVYoBd/
         fjVg==
X-Forwarded-Encrypted: i=1; AJvYcCWZK3Aku18Rl260mhJEOmPPMZJkAwG0tHBiO7LUW2BA5B1WlhItGQ1DCV6/h3DUSiJEZkZdRapyVwBQum1m6ZhXhg4x3AtHHSP9btKri1Mv
X-Gm-Message-State: AOJu0YymFPI8OEv4COvrAe/A0sNQyC6ZAFe6I1yQgnpWtwvq/v3gL1bt
	jBW5cMTVTx0lZtOeaYvkLADC8DJE8xCn2Q4EntLStPuqUE0ZyrYf7OExOkooe14=
X-Google-Smtp-Source: AGHT+IG/gd//TA1TkjWqM9vD82L3r8r0JszUDH21ZhI6QqZDs4OR9Y/ESBK0GgL0mQ8WNU4EjNB6Kg==
X-Received: by 2002:a17:902:c944:b0:1e4:911b:7a6b with SMTP id i4-20020a170902c94400b001e4911b7a6bmr5362603pla.61.1712794105838;
        Wed, 10 Apr 2024 17:08:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:25 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 07/24] RISC-V: Use the minor version mask while computing sbi version
Date: Wed, 10 Apr 2024 17:07:35 -0700
Message-Id: <20240411000752.955910-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170828_638489_F2025234 
X-CRM114-Status: GOOD (  12.90  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index f31650b10899..935b082d6a6c 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
 static inline unsigned long sbi_mk_version(unsigned long major,
 					    unsigned long minor)
 {
-	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
-		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
+	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
+		| (minor & SBI_SPEC_VERSION_MINOR_MASK));
 }
 
 int sbi_err_map_linux_errno(int err);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
