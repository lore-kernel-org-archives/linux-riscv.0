Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE748C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 03:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oiNxAbEDAGnMUFvphkEmNQH53W2fQRi8GPCrwAEjyOw=; b=ocrRk2Xvzll/0s
	K+l3wnifoS0PDn/KRtBDfHWPdn5aeOpiLRQFmxuaLTfi15C0KwmI8CqhJ1tMv/Dm6LSY0KKAch++n
	i86dNDaCAS/18cAfvPMY7/iCOR6yGZkmowTGhyIddgwUMJ6Di1kuNaRmLj6jCoyXePu5wVhGi4O+o
	vsd6FedbIRqX4k/M8pteXN+aSc3xhkc7Zli913e0PKa6Vb92ZcHGceqfVUIoqCedMWX80e34/LxeU
	zTq83sTG1AI9ydIH7VcCHq3xgo4JqBzUJmuIINm0FZZvNwgdb+Ms+5nc8jc8OQBDYRLsaFdUyVv+v
	lkYtxrKa2gUGJ9CYGENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9bN-00075V-0M;
	Tue, 25 Apr 2023 03:44:25 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9bK-00074U-0D
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 03:44:23 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b4960b015so4259114b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682394255; x=1684986255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FDl29IJnMyKk0HAOJUhT84um1D206mTAna0zXUTVh4=;
        b=AQ76KH3Hg0JgeTd4CCxOysPi1nty5DZCbeO8eAVwqGf12h2QQos/X3jF5KlWS0eKlN
         rATRGJvx5e4DxweWAnz4JnyzU0MNKVkjavVT1Ql6fXiTVKPYYPqlEy/iS2r837WDlK4M
         0ICUAEcqzefrUxxn2NOMuDSRpecy4F89KPU/PQbdTL2ayQ2wsO1hm/gOacMrmty/xni+
         lU+c87ci9FeGNRXt1Hn1rsOq14MiuLRu3JXNPmFMnKmVrFLcvDdCVpP7eqeDQiPnsNN4
         oiXP7zBIZFDl4p1q6j0lSzKEuhRMFWq28deFIs1RSq3dgicg5BuQ8CStmX4bSUjvik90
         WNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682394255; x=1684986255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FDl29IJnMyKk0HAOJUhT84um1D206mTAna0zXUTVh4=;
        b=lnRCkZrbbui63bBx5eNhJ+ibdEGgX7D8Qe3L7u+B3mT5t61pP1htDmzGER7WpBvYzQ
         Nb/cUVKJysa+zQOctd2ZKraXsxB8mdbxoysEoJPvknmua4md28yAH0G6O0MQo90876KE
         Lhq2TMkziCERUMIJHM+QHfaCL8/13uvhrCsMxF7g0pvHfxpAN7rDgs9DKrDp0ZxoNcsd
         deQ9xoUzw1t3tSg553p7lbXmu5g+9qi8zajLyGvbpQp3b2mXl3HLSxu9N4QjMkDPp/y8
         5Zw59xzd5YiGMhGb8FW2DfRRe44dgaVhrN1rgHUN7hyqiOxVj7wk6yM4HR8ChFp8K4Mt
         5uqQ==
X-Gm-Message-State: AAQBX9fFyVzW68TZBSyVpJ8pIfVdDE7AlEAMvtW94vLVYOsThGRrTJVn
	uU4AyWvLgeg86UMeFdXVbtCz
X-Google-Smtp-Source: AKy350a7wV8JRhw1mdvqUV9NXUDpy9YRow1c0MVzgOflH8MfguPvo+fSW3CQbKF+2eCcq2xmH1mSvQ==
X-Received: by 2002:a05:6a20:4410:b0:f3:4da0:a25d with SMTP id ce16-20020a056a20441000b000f34da0a25dmr10985884pzb.13.1682394255331;
        Mon, 24 Apr 2023 20:44:15 -0700 (PDT)
Received: from u-NUC7i5BNH.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y21-20020aa78555000000b006242f4a8945sm8117805pfn.182.2023.04.24.20.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 20:44:14 -0700 (PDT)
From: Woodrow Shen <woodrow.shen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	greentime.hu@sifive.com,
	Hsieh-Tseng Shen <woodrow.shen@sifive.com>
Subject: [RFC PATCH v1] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
Date: Tue, 25 Apr 2023 11:44:07 +0800
Message-Id: <20230425034407.1601585-1-woodrow.shen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_204422_111179_AAC7D6C5 
X-CRM114-Status: GOOD (  11.41  )
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

From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>

The commit 8aeb7b1 allows riscv to use mmap with PROT_WRITE only,
and meanwhile mmap with w+x is also permitted. However, when userspace
tries to access this page with PROT_WRITE|PROT_EXEC, which causes
infinite loop at load page fault as well as it triggers soft lockup.
According to riscv privileged spec, "Writable pages must also be marked
readable". The fix to drop the `PAGE_COPY_READ_EXEC` and `PAGE_READ_EXEC`
should be just used instead. This aligns the other arches (i.e arm64)
for protection_map.

Fixes: 8aeb7b1 ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 3 +--
 arch/riscv/mm/init.c             | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f641837ccf31..05eda3281ba9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -165,8 +165,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
 					 _PAGE_EXEC | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
-#define PAGE_COPY_EXEC		PAGE_EXEC
-#define PAGE_COPY_READ_EXEC	PAGE_READ_EXEC
+#define PAGE_COPY_EXEC		PAGE_READ_EXEC
 #define PAGE_SHARED		PAGE_WRITE
 #define PAGE_SHARED_EXEC	PAGE_WRITE_EXEC
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..cc48b0d93a98 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -286,7 +286,7 @@ static const pgprot_t protection_map[16] = {
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
 	[VM_EXEC | VM_WRITE]				= PAGE_COPY_EXEC,
-	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_READ_EXEC,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_EXEC,
 	[VM_SHARED]					= PAGE_NONE,
 	[VM_SHARED | VM_READ]				= PAGE_READ,
 	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
