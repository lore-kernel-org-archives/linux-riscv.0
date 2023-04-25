Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4E2C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/OMkvx4yYG6kztsn58ltsV1L8VNUVIjFZzm3ttaKsBU=; b=qRq8vbjOagfzWQ
	2Px9o2c3gfCcxHzmISrG3YR2VtSYsIyHxDeSlsGdJ7nLNRP2JueTaaiiVgx6qkQSRo0gk3ncIHJrP
	/wYLjMjFS3lBoJAXs316H4TUnOgZHWtY22vXfmVyRaVh2yJWJu/xnQm34Mnp1DPuQjwSVpc+CRHl2
	RM3MY9LdQIWIg2U35lEq7+8sBvB/8Os1nYilLULM+WTUbecG926mNeLIxOB+M/xnHZ1jqsPtrQWNs
	O0y9q5HZ3YsfhuuI5RUOWL6uALwACwWBVYU0uN2/utdEN5HqYXRFipVwJ9u2w5zvyJwRJbdYyVwzG
	6rHeYQ0SglaGN+WxVtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFuZ-000lyt-2N;
	Tue, 25 Apr 2023 10:28:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFuW-000lwp-2v
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 10:28:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a6ebc66ca4so43262705ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682418514; x=1685010514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kA++O+pMyIyiBRgMpOYocimA61Es/epK+LozS2xJWA=;
        b=TA31uCg4i1SG4f0WGmUmjp/qsfA2NnQFyb2Q38FYjuKEtyevkBuuF4ypsoIG94LaSJ
         7P6eKJ0hy0WlwPXh+YUiKmHU8wumOMxwDos1g3GzMqS+RJ4LHwQDgHxY/0NI7hN/Co6F
         xqaSE4VU+fvMOnuW3jWLbEwBgF/4/DVUJKN0+01qxdiFZKlQ2drTzlGT3AQ5lOjEWehG
         M8XFelzfw4Ph/5izFSafBp1UHlfC9G52mcWoN5CyiSK1KzcQw1XOlJXuvIqJcrO1XYSF
         Vmuvnf5cU4wwOEPfLZHagBlsOR7lXGtF7G2nIwAPmr6/UmhjlnGfWh25t+9ZsQPtaDiy
         rUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682418514; x=1685010514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kA++O+pMyIyiBRgMpOYocimA61Es/epK+LozS2xJWA=;
        b=kAUF3zqIV+Or/YKodJMj4ASkXy1Ut+zQaUxn0ZkKBpo0gjXou9MUrrQmQBpNV4bvgR
         IovrJPuwJ1PMlJLNPubjXXtsYoRIhCmIrHe2l4ojCAoHHh772PavflgR7YhyohIiLl9H
         WpFGqEyPjzu59JkbGBsmov+wYeobyNhS11UZEFztw74uKZy5liCgFTCJT1Bd9RG3hFS4
         dFq5bH8VXlOM5oxUjDUyQuSL9Gv1nmsydZbNEgVjbCLV8hf4ZoPg8DZWUIrxHMtibmQy
         8suxjCiuLH65sI9u97tEM9sMXfOmASE/Ds2X5TJG/j+K3ZN1DlFSHpumo006diEO423+
         waeg==
X-Gm-Message-State: AAQBX9cKQArE/JSw9Febn5Jw16Ats53lwR5SaBpzKVYZgIluUtZCrErZ
	esSs+Oa0NRaYg/zzKwFBLJq3
X-Google-Smtp-Source: AKy350ZO3VYoeeUwW4196yjH1jI/FCxj5VNUTp5kELZBXbZWb1eSHB5CYbWrlUInQY2/eK4oMMF5Kg==
X-Received: by 2002:a17:903:187:b0:1a6:e3e3:dbb8 with SMTP id z7-20020a170903018700b001a6e3e3dbb8mr18155758plg.44.1682418514033;
        Tue, 25 Apr 2023 03:28:34 -0700 (PDT)
Received: from u-NUC7i5BNH.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o3-20020a170902778300b00186a2274382sm7996529pll.76.2023.04.25.03.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 03:28:33 -0700 (PDT)
From: Woodrow Shen <woodrow.shen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	greentime.hu@sifive.com,
	Hsieh-Tseng Shen <woodrow.shen@sifive.com>
Subject: [PATCH v2] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
Date: Tue, 25 Apr 2023 18:28:28 +0800
Message-Id: <20230425102828.1616812-1-woodrow.shen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_032836_986299_BD0CE9AE 
X-CRM114-Status: GOOD (  11.36  )
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

Commit 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
allows riscv to use mmap with PROT_WRITE only, and meanwhile mmap with w+x
is also permitted. However, when userspace tries to access this page with
PROT_WRITE|PROT_EXEC, which causes infinite loop at load page fault as
well as it triggers soft lockup. According to riscv privileged spec,
"Writable pages must also be marked readable". The fix to drop the
`PAGE_COPY_READ_EXEC` and then `PAGE_COPY_EXEC` would be just used instead.
This aligns the other arches (i.e arm64) for protection_map.

Fixes: 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Changelog V2:
 - Rename PAGE_COPY_READ_EXEC into PAGE_COPY_EXEC and remove
   PAGE_COPY_READ_EXEC.
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
