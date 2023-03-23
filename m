Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C150BC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyhpxayQpQ/kNxfXIZw+fYaLGCS3Pn54OIJSv6ntVNI=; b=htxriBF5HrPCpR
	uH2FgrLQEzwLotQdOnJsbOdE7C+DjRrXFYNb6k/npCJt5n+9iKfLMyiRp+N23otPR/gXugxmi3o+z
	7GT/w/cJ6AT3uxHFIvTspXITDiF8ednHpKfajeC1Tqxbd6xyh/EiRioycK8x8vqhAGY4t9+nQPXOP
	FF3vPsreyG0+ylFUzmd4N0uZROAznJ9OX4FEE+UVI2Ud5PPjxGGh5VpcLUxrcpncF0/xnvqUEdRYO
	OGUwj9PSEErsL2yph5vED0mhinXOLWmf0/dt7+UTzC8IKPZFvMsA5hPU7jYNH3TRUXNfwnvyWmOga
	ygmKVeX5+Hi7XLhXjcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNv4-002UkN-0m;
	Thu, 23 Mar 2023 16:36:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNv1-002Uj7-29
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 16:36:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id m2so21291468wrh.6
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679589360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFIdVMyY2JcOEfEYtk1Mrcm+ayayJpn4ssJH1y+Y8SY=;
        b=XRx/qjnE9uNVUhjrkckwtZNfRSeDtPWLGHujMYbX+pUc6W8XwJmyzK1Ozrgu3VrsCw
         ixX8yG4vVRdtvMmjSzsPFW6TAPtaQxa32kDhr/vEIxz/liX5Jnxy5ks5DMPn+9Tyqa0I
         dhuIn3YjYroXQczSAF05RgaY7Kx28T0tYXahdqAvORqBe/APPcYemeDL+w3XcSMRAei/
         FKvdHHP06rtfOitHpAAyJ0P4XX7VIzxGjRd4JUWIFZkTI6oVrvarr15s7codKgs0PYNT
         zS2CfmUgxC4epAxnNbYREJe7YzKCstK51eH0rVUpoZ7mNbioJ0ywr2VQq6ujrDbSqDWe
         XaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFIdVMyY2JcOEfEYtk1Mrcm+ayayJpn4ssJH1y+Y8SY=;
        b=gjPRA/vsKnm75xXxkYAiqpmOKNZA0+uTC9Syt/mNAECVaEuBTN5DVAjzYMTXKyRqnF
         FVvvHHLl0dJguAumzWeKMt3jqFRfhB+0e3gbXZ4hsjnfAd4Ztibyv+4x5bRzSYcbws7l
         mo8Tc0gOHv28QtFXE6LLTH3zJIz5wACT1nOu5gYni/qmr+59oPd2U26NgHvmDIlK9PBF
         UkDOvpnfzZCqymz9KaTYm6mTzILXDXvzTfMYgSA/8F8KV5aZCXoNsJdxxf/VV2eMq7nA
         T6BAsb2qOAjLoZUOs0vr3a9Fi0V851LbYXUKkMl3Vyy7jh9x/SArFmBS+VfGKpsIuN5f
         BkZQ==
X-Gm-Message-State: AAQBX9c+Fm0mv6c5tmZSzafXMVgsoPTXb+LF2Hvc5eYZ6QQNYX4+8qN3
	/TZDRnjWBlA+j2HtEXp2ROkGGw==
X-Google-Smtp-Source: AKy350bZB6XINZ/e2OvUeiAx/NAII4Q3/0majzUkK7Zk38kV4Ea31iChLco4fr0gnvIX/KOBcmR+sw==
X-Received: by 2002:adf:da50:0:b0:2cf:f312:86dd with SMTP id r16-20020adfda50000000b002cff31286ddmr2991280wrl.18.1679589359878;
        Thu, 23 Mar 2023 09:35:59 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b002cf8220cc75sm8570661wrm.24.2023.03.23.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:35:59 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Do not set initial_boot_params to the linear address of the dtb
Date: Thu, 23 Mar 2023 17:33:47 +0100
Message-Id: <20230323163347.182895-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323163347.182895-1-alexghiti@rivosinc.com>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_093603_701367_2CB6E51F 
X-CRM114-Status: GOOD (  15.51  )
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

Now that the dtb early mapping was moved in the fixmap region, we can
keep using this address since it is present in swapper_pg_dir, so remove
the dtb relocation which was wrong anyway since early_memremap is
restricted to 256K whereas the maximum fdt size is 2MB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c |  5 +----
 arch/riscv/mm/init.c      | 21 ++-------------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 542eed85ad2c..a059b73f4ddb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+	unflatten_device_tree();
 #endif
 	misc_mem_init();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb78d6bbabae..0f14f4a8d179 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -249,25 +249,8 @@ static void __init setup_bootmem(void)
 	 * early_init_fdt_reserve_self() since __pa() does
 	 * not work for DTB pointers that are fixmap addresses
 	 */
-	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
-		/*
-		 * In case the DTB is not located in a memory region we won't
-		 * be able to locate it later on via the linear mapping and
-		 * get a segfault when accessing it via __va(dtb_early_pa).
-		 * To avoid this situation copy DTB to a memory region.
-		 * Note that memblock_phys_alloc will also reserve DTB region.
-		 */
-		if (!memblock_is_memory(dtb_early_pa)) {
-			size_t fdt_size = fdt_totalsize(dtb_early_va);
-			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
-			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
-
-			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
-			early_memunmap(new_dtb_early_va, fdt_size);
-			_dtb_early_pa = new_dtb_early_pa;
-		} else
-			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-	}
+	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
