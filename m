Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5603C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=td0QqofdDgt97z7KXNvI1ie8/A8s7Dq3Snq2pzdUT3k=; b=i9LrN0zLa7XK9v
	o0oA0HJZrq2jUuFXJx/kypIezVENXA8BY0TfFxoE3fU438oynOYwp/bBFV7CISCh9p1AQQuEk6Esp
	aCttPQzC+48m1iw8cg2Ud6EkMaJBxllxB4134vz3QinAIErCzZ2fU1We9YUxwsDkTxenr5iF+sn6w
	VuBdMgof+lLBf1AbxJUaIjSxRedutmHFss0YbuQBn30wN+YxJETuabdNWES0ZmiIEqSfFFhF8ViDR
	WO39+xPZLFrtPhukV7IGcwMrigwFlOzkDB9aSqfkDPB67VZlVtUALOfqIG3RW9W96IqAvMPnGDI3K
	2vpBqt/aLvG9uI+UXvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplY9-00A1PM-1U;
	Fri, 21 Apr 2023 07:51:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pplY6-00A1OB-1B
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 07:51:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b35789313so1487843b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 00:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682063476; x=1684655476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdqGzzha/G/+P83vZf+W6YQcFNyRp4ZBrv0bjj7acfU=;
        b=AGPDqm63rl+TAUkGfZAQ9S0pDf2o9/UKVE87j/XRd9Q0FzIEenR8lpcvmjNNQvtamn
         TwTKRlE4XonvzyqbLIGZMGURp/4kiOh/yXB1K02XVEev0QUKB/ZhoRVKZldz2Cs45p+V
         wXAunDHvJ6YWRciDmqXanDd7khYJWAnAwXGtZgf9ODvNXCntSJZuarADeFhLbsYd40vr
         JRiSki5Pnyq/s+FcH69u/IDVfjKJjHi6HHIT+i4G4jNzB/2mAKS/LZorkZGLgTpW2ibG
         PWjbkkYf6nGlrJJEeZItEvDCIuTZrKPNQdLm7BB9eqz+rjwFfPWZGB3rCGWGovNryAxu
         kseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063476; x=1684655476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdqGzzha/G/+P83vZf+W6YQcFNyRp4ZBrv0bjj7acfU=;
        b=dWqEU3v/088b2nGGsUpdJPBIaGpSB4h8Xan757GKnMP6rIghjMTvPaLi3jlDEWEBMJ
         wIqUiq3rz+2/ZNUTc3Yl7Z/aazmVAHfWkowqsYyio8IxmMZJpJW79Oo10cKSGPbvCRHV
         h/1PV2W3xlPNcP967ZFFZV2j2XI9oPcQ+e0IFGs3xb5zlqzW+naDX9Gzb5XK04y+kbe2
         TpdbQHpi7IJDt1uDaNGdYfmhVdK8vOMW96Cjx/VkHis8PiUk9q5Rkkz43IyJIJDPzqXr
         hddvBOD0pgnpTdxFPn3xmw5vfe7v63z5cEIk2yUNtZBaRgr48cq5TBNu1ZFja4NwqQYQ
         S9Wg==
X-Gm-Message-State: AAQBX9ejD7FaMWWmT9IOC53XFJDKxRkGpaZsF+xMaaJlwfP2UmXENad+
	QKmN9A7du1OnfXcEEG4UUTvq
X-Google-Smtp-Source: AKy350bo+x+yovC1FYUOJu3XmmXwt77///5Mccw7olM4tHuUPGxXcM1ryphF8zkfTOiBIgKjXGIW3A==
X-Received: by 2002:a17:90b:344:b0:246:c097:6a17 with SMTP id fh4-20020a17090b034400b00246c0976a17mr4398929pjb.24.1682063476395;
        Fri, 21 Apr 2023 00:51:16 -0700 (PDT)
Received: from u-NUC7i5BNH.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id md17-20020a17090b23d100b0024744818bc5sm4131803pjb.9.2023.04.21.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 00:51:15 -0700 (PDT)
From: Woodrow Shen <woodrow.shen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	greentime.hu@sifive.com,
	Hsieh-Tseng Shen <woodrow.shen@sifive.com>
Subject: [RFC PATCH] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
Date: Fri, 21 Apr 2023 15:51:11 +0800
Message-Id: <20230421075111.1391952-1-woodrow.shen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_005118_420973_4ACA0810 
X-CRM114-Status: GOOD (  11.50  )
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

The commit 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
allows riscv to use mmap with PROT_WRITE only, and meanwhile mmap with w+x is
also permitted. However, when userspace tries to access this page with
PROT_WRITE|PROT_EXEC, which causes infinite loop at load page fault as well as
it triggers soft lockup. According to riscv privileged spec, 
"Writable pages must also be marked readable". The fix to drop the
`PAGE_COPY_EXEC` and then `PAGE_COPY_READ_EXEC` should be just used instead.
This aligns the other arches (i.e arm64) for protection_map.

Fixes: 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
---
 arch/riscv/include/asm/pgtable.h | 1 -
 arch/riscv/mm/init.c             | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f641837ccf31..bb1e05367739 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -165,7 +165,6 @@ extern struct pt_alloc_ops pt_ops __initdata;
 					 _PAGE_EXEC | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
-#define PAGE_COPY_EXEC		PAGE_EXEC
 #define PAGE_COPY_READ_EXEC	PAGE_READ_EXEC
 #define PAGE_SHARED		PAGE_WRITE
 #define PAGE_SHARED_EXEC	PAGE_WRITE_EXEC
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..8b8c6ad85fdb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -285,7 +285,7 @@ static const pgprot_t protection_map[16] = {
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
-	[VM_EXEC | VM_WRITE]				= PAGE_COPY_EXEC,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY_READ_EXEC,
 	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_READ_EXEC,
 	[VM_SHARED]					= PAGE_NONE,
 	[VM_SHARED | VM_READ]				= PAGE_READ,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
