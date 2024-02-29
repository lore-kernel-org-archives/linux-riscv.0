Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA1C54E49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcK+1bQuCp9TFgNFrNGt+pny6jkTEfp93++Hf9ycAwU=; b=0Y3KjP9+KLNCGm
	OSp6eS2gizvU3lEtozgkvJ3Q/2bowqvXw3skygQnSRdvLGjI9hOZULfHN7LCAFNWppXpy/Y/gD2ng
	bn4bRe6itE00QYIj/BjewXDS2dGu0oisLWbIHwmdyTsl/n4ppQXmZU4Lbvj51Id/rA8oPqW9zCnlh
	KRDA51bNE7icdUnxCFGp5vNuSkkKUU3J5a4/Maf6oQ/r7khhesV9ETI9O/KL2gjcj413ns434IMbq
	8xWbDxVjymQ4hXTIuhI8FI0q02nrXY6JVVo2TkwlFTMm6BW6EgCG+BylQZQdSZaQi4apjmGgQKJTu
	aN4p2+SYaV9PBzMazHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo2-0000000BW49-1lJr;
	Thu, 29 Feb 2024 01:01:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUnw-0000000BVz0-1wpn
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dc96f64c10so4033405ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168503; x=1709773303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SchlyZ4UU3SdoafkJQBbnMQVK65WVY/e6Ayv+xuGpWo=;
        b=iuT8pRh3E27c8GqAGALUKXYubTPqTPStkZoszeJsmgforVsltSoYn0m68MNiZcGEzz
         b30sFOrKN0ee0Zl1v5doDTov08kBz9/z+roNiyL8+j50kjXNEBdC4oIrElqO2SF44pT0
         q7+Yd5INPz+24NL9ZCh+0rAKPcWO77bizBDKLM76z39mJQaEt69rArrtcnoTTvuc8nZC
         rmtfvrW0jq3oj7dDtlsoZ3/+YESdy71Om37peu8B9nsRjepkhPlkevK422ECv+7GxmDL
         UAsNN75nHm9iyvF0EKihsipdXouzSizfzj+16KzLzhNgYwSzGW2hX7lCBdyjzRrYhCn4
         fFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168503; x=1709773303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SchlyZ4UU3SdoafkJQBbnMQVK65WVY/e6Ayv+xuGpWo=;
        b=rIEXkLuNzL/kNGf9fh5Mnamww8itV0OCbQG+U7WlmC0Bzde8o3nwaUkHXLRuZZ3qvQ
         85vjirzR9N0e2jHLZTd4wwZOi2Qh8AuXbNhS2RYroKaSAxMYDYj0FNNoqqIwtfPqzMpr
         fKsJRQ49hVr61mh43ULcUQbLxZHARw3zW5M4pORufYM8UFouqIXgG8vyzmIBXJ9P7mKu
         6Hdrqbh50l6ZQ0YketRJVtfEMPPtT9DIXLQdyGQ0tgg0aU4WwUgOCOcVWQLTtYJp5Ywc
         B4dcwKDlOeK+u0dPzJD6s9TmCGQrYRRfxrK2lKialbaJ2W2qw+Tt17inuQrokGLkaXZz
         qWeg==
X-Forwarded-Encrypted: i=1; AJvYcCW95nFjhFzng4zRzoIkIUmqIXowavUEN9xh9sn9Pixoqzu+7wsJCKctrqg66bEQQbsXsW/Zu4O+WPD3FBOjTA0+lr9jgWEhcMdJ94Exl8NT
X-Gm-Message-State: AOJu0YzhTHZ79zUedqxpROH5GtjyrdhMMSgGvQ5oCImZtBz4SQ90bhKG
	wM1V5/15cBYLQz57HRKS6Bjdngy/S+suyrcAO/nkWSbfYlV8vLiYeck9JgP2hGM=
X-Google-Smtp-Source: AGHT+IF8AP5yy874viGgSFlHQ/GFryEr73kxAAM+WTYHUlwXxC8mSK1Ci2PYhqwM33S+1LfQNiTK8g==
X-Received: by 2002:a17:902:f54f:b0:1dc:cb84:d8d5 with SMTP id h15-20020a170902f54f00b001dccb84d8d5mr788795plf.50.1709168503594;
        Wed, 28 Feb 2024 17:01:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:43 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/15] RISC-V: Fix the typo in Scountovf CSR name
Date: Wed, 28 Feb 2024 17:01:16 -0800
Message-Id: <20240229010130.1380926-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170144_548305_24A92021 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The counter overflow CSR name is "scountovf" not "sscountovf".

Fix the csr name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h         | 2 +-
 arch/riscv/include/asm/errata_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 510014051f5d..603e5a3c61f9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -281,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index ea33288f8a25..cd49eb025ddf 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -114,7 +114,7 @@ asm volatile(ALTERNATIVE(						\
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
