Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BD7E776FD
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTP1KMidGrk6m8y9IE87zkCQExGSsRH9BfZ35D2suOk=; b=CcwbtCw2EQHFbY
	CmuehDHrt9wisRceQ9MIru0/8hlCtHHIaq5FeRIAQ6tENVtzuJH6A2hlnUXip+dIf6WvPsNXhA7iG
	Ex2bHnkdDykgrZ4A/yK5fpzeHxUJFX94P0gRleV5HWY0JYSCVeOIe7rd7BcXG0+R8AMS2jOBFi9LZ
	mS5a01u3Y+1RKtPNW0htquDeaqi2DY6/HDwM68klAf64nQzTVq23s7VxqIrCsQ40Us5DiGbqn6Nk0
	PtRdV6S4Qz25IP0k+3nuXg/6M/Nl/sptqQ3+JYt7S3NXMwgZEjCR4EwQPIZyArskrZdH7cBKammGj
	csjF0td8Hr4B2oeFqZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSs-00Dk2m-1d;
	Tue, 03 Oct 2023 03:52:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWSp-00Dk0W-3A
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 03:52:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c723f1c80fso3542445ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696305170; x=1696909970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yycPMI9rC/acogS1vs0h8BRUvc4a6Kod+MRuzLqJ/0g=;
        b=SXoG5LfOwOb1PQsqmnxBlav9h981y0VjqM69MDUc4+6El5NPG4kg8KI5a7fZoaXhv8
         kB8M1/ym7mis+Ay6g2RMOcyAVC9DcNW/TeJJK/0fKpuSAUu7vt1WoYMoTrFkr+oH1f81
         ibmm8k7csLMAxKFnvkSo/+22QB6YqP5JXhdJq9FVHH2gsoV8F5h0DlWZG2f4i+gqWmv9
         /kPjIFds/OkoGYzOHghodNXaujL5q3koSRNgkoWPOLogIBoVnkykEvCydRSfuOVuGGQo
         yIS9bm+/gX4ftTtq0ZRDpePS/Qx+1/m6VJkPhSUWeqR9vzZI5BLBGAoST6oSekCM7j8F
         mI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305170; x=1696909970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yycPMI9rC/acogS1vs0h8BRUvc4a6Kod+MRuzLqJ/0g=;
        b=Z7mWKEgYYT3HMJv/iuXVdK6G8wCac66PxG2ukywh0MpQoBwaKUU64j7vScPoeLFBTe
         ntnZNw2a0S7KrakCyLg4I2skWWdAEm9hxFdVveEIeneESR2S4BuQVzZAAQANFmg6L0Vd
         4A0PFWmcl0t83SqMmeybagJsmvh5MFHT9n3hDdbbRGRIdIfoYNsZtZqAZwP3BfAxp6ZY
         xDjFeQKuIGP+T79U4mVNdBYFfFU8dyOsPRxmyRHalUjQZOI3fXfUuVaPCKPr9YJ0O35a
         toRcTqcRyWmvc7G7lf8gFGw+AxdIfLn3H0ND8bYSRqJbz7XUsiJD2SOSztaooXl3PuCh
         De1g==
X-Gm-Message-State: AOJu0YyUb/EmETV2MYsm7fOeYbpf+REBQpbRoRbA8Dw90oReEpSCta1F
	n7wJsiQRHRBu1Xmlj8kbaUXlTQ==
X-Google-Smtp-Source: AGHT+IFTxF070rx7YJkcoy2/BdnPUrtJEvwz7nDRRqveimSHvcZ4nNWjTlHA1gEQmD/xbZ6UMOx4KQ==
X-Received: by 2002:a17:902:f7d1:b0:1bc:10cf:50d8 with SMTP id h17-20020a170902f7d100b001bc10cf50d8mr10607315plw.23.1696305170384;
        Mon, 02 Oct 2023 20:52:50 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm277381plb.13.2023.10.02.20.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:52:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/6] RISC-V: Detect Zicond from ISA string
Date: Tue,  3 Oct 2023 09:22:22 +0530
Message-Id: <20231003035226.1945725-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_205252_020203_F8FDE066 
X-CRM114-Status: UNSURE (   9.89  )
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

The RISC-V integer conditional (Zicond) operation extension defines
standard conditional arithmetic and conditional-select/move operations
which are inspired from the XVentanaCondOps extension. In fact, QEMU
RISC-V also has support for emulating Zicond extension.

Let us detect Zicond extension from ISA string available through
DT or ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0f520f7d058a..6fc51c1b34cf 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,7 @@
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
+#define RISCV_ISA_EXT_ZICOND		44
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3755a8c2a9de..e3803822ab5a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -167,6 +167,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
