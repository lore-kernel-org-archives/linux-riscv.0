Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E0CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AsJS3z1BkTaNN5oFkd7KEnRqX6WgIiSSH+yTGbrTBJI=; b=p/Z/ENZeoQV0fB
	dmEoGug9Q+hVmYKBic0Uh4NGR0H/95nl0jj2YBK0iPFQE+/YA081zTEv6bQMJ924UXbwn6LWOOZdo
	kGafwklHGWUJdtjjuBiOl0jbPY3BTnqhgFdHxQYu6AJ3sNeU9iw72CsrJYEz+tPpuizDuetsPU2OT
	CzHDpbpTO9FnJ+F0h8m5fbobfwVfuTA1XPVTLd32z8WWpMxh+5puN2t1YFI5tCLzmRpbaLiAwHidk
	omNVrtQv2mWC3rcK1d2WBcvqq8+n3/zX71w5PMkZqOc9djDYBL7sFJmoo3AswwxOlsvXE0+cobCoU
	3UmZPB4iKtL8a6sOH7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDlmv-000PrZ-0J;
	Thu, 14 Dec 2023 13:30:05 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDlmW-000Pak-0k
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 13:30:02 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c41df5577so49346375e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702560577; x=1703165377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkTXCXrHUkIYZAiXcbMUlKAwNq1xBlh137NstiChyxg=;
        b=jO4ND50KFPCmXBZHzqn7i8z9wKg724AkZwxo0ipFCFEGvWPEaN1kqC3myXnerRY+9g
         Dy9TCqjqQktPbgek901Gd5pCzk3iiyLMgjyziaGdWoVxgO1VLI/B4xE7UTi+cs1wYrce
         6DsBrEsJTIygw4DJN7o9FORNTRfEWK/PhZbXFxaes6J1UDD5iGFMVevqTmWzMHLD+Nbj
         s+Tl3cz+ivOm6Q2ZSdVRGkaFS51UlLU9we0SHvRd6rsGbNeCUbbfi2q2fdKhMjJtl6ve
         B0U8YnIBrMuhbNjclf8jcdkhj187XffSf/IpxfXrfVvN5p2r5o/PdoOBCD1JP0WbheY9
         KRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560577; x=1703165377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkTXCXrHUkIYZAiXcbMUlKAwNq1xBlh137NstiChyxg=;
        b=D7aoBD4AFguj5hu3ZTF8Ku38PRRZiJBpJg7i1feUGOL6hAKCmlEd9kPpjiJBOLV+B1
         lSCyMdF5rwg8hG3obM4Qy+xG5g4A0zz6HfCsfxTqhjjwnDzEHYVv5ZQDD9HbqDxuRL12
         Nup9lSNBuNUdiDqU60gdUXuvwNgAh34kal5FdI+QrjjoCls5pzXyDYgaXZ5QzHi65ZEw
         CAdURrTxm+6e0HP8JRKrOlobxH0eAUHpEN9o4s76a4Ai2PlIuZTr1PjMcw8ShCXBFzw8
         5+4BL8InCjBB/k9brOPqRFWqbccDeGw8BN/Ci4OyeUEGDu5KeQOzvL3t+h3pxtTnslGq
         2InQ==
X-Gm-Message-State: AOJu0YxVUHTabKfHqsQ3I9JnwAEaPDL5vuhvzxBIebyW9keJKOa/xZLU
	x9bnMQQxlvDxJblo8sF4Rv0xFg==
X-Google-Smtp-Source: AGHT+IFY8a/ikzRFmDNwTTeme387SJFOWFFd6jphJ+RMixQGZw483YvP9tBvX7Xri3w5b4Qm0adYhQ==
X-Received: by 2002:a05:600c:3b88:b0:40c:2a6c:a462 with SMTP id n8-20020a05600c3b8800b0040c2a6ca462mr2919054wms.78.1702560577533;
        Thu, 14 Dec 2023 05:29:37 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040c4c9c52a3sm13038759wmo.12.2023.12.14.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:29:37 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Use hugepage mappings for vmemmap
Date: Thu, 14 Dec 2023 14:29:35 +0100
Message-Id: <20231214132935.212864-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_052940_509115_37CDBDA6 
X-CRM114-Status: UNSURE (   8.77  )
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

This will allow better TLB utilization and then should be more performant.

Before:

---[ vmemmap start ]---
0xffff8d8002000000-0xffff8d8012000000    0x000000046ec00000       256M PTE .   ..     ..   D A G . . W R V
---[ vmemmap end ]---

After:

---[ vmemmap start ]---
0xffff8d8002000000-0xffff8d8012000000    0x000000046ec00000       256M PMD .   ..     ..   D A G . . W R V
---[ vmemmap end ]---

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..f636336e6401 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1383,10 +1383,29 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
+void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
+			       unsigned long addr, unsigned long next)
+{
+	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
+}
+
+int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
+				unsigned long addr, unsigned long next)
+{
+	vmemmap_verify((pte_t *)pmdp, node, addr, next);
+	return 1;
+}
+
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_basepages(start, end, node, NULL);
+	/*
+	 * Note that SPARSEMEM_VMEMMAP is only selected for rv64 and that we
+	 * can't use hugepage mappings for 2-level page table because in case of
+	 * memory hotplug, we are not able to update all the page tables with
+	 * the new PMDs.
+	 */
+	return vmemmap_populate_hugepages(start, end, node, NULL);
 }
 #endif
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
