Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D806C74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o3dy5n3CO0ld7kHCm/Ctl0Kl+L9QrpwOe+geFTA6SI=; b=a7JMw6CqydapBm
	xS0eRQn2AD5DTL7FHl8aACa4zkLvodeluY1DuJ6ddMUrEzktZJEonWTEZnZ+VtIfSrvWX5blIeov6
	Qk7q7z8CPQO3ST5CNu5CXkN89a8XdWKDJpI01tFdH3t2MBDEgerIqKUUJrECu4j2KEDchuvJ79SHG
	0+0HnQI2MhSYccQ8fiezx9gQyu++QzQhbkTk9yp5EdtalFdjFT9AWMK3StZFvgslntkHRMpNq5/9e
	Xr0hSxMWNeNKyPSkl0661QGNDkiMlhrDmi5zRymlHTXoSsLfqQPrkgVMmIfP4lmZVdBzd8T0mDzz6
	2FLzgq+VMDZ4GF7YjqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcodI-00Ggwq-0Z;
	Thu, 16 Mar 2023 14:31:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnVq-00GVHn-1X
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 13:19:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o7so1517643wrg.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678972760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXNicKwHPUURyALO36PEegj/jGCRXjX7/YBezTaryXs=;
        b=67doldxYgYKlU/XZ0kZu3+NOAqQ/2WbnP4mwdaTGI0McuaMhRPDAE/s74Wq3t6tF/V
         J0nRxluNtH5jyXjG6gwranylrEnecoP/DUWgaO9JZ4gg6xFffDGE08IwIc2KOUXaspal
         HHuTUIg4II4i6Oa5sRMFXG0qwnNOZQwEH5YClaHtl1ekxMRL+d17IM5dSSKvN8etH4o4
         Gryhf8z+9DXYE61ol4wGcZdxrAPW2qatjZ5Q8iOQkHFCUmxFt43/+ApFfD1rBG+HZP3t
         j+M2PnF2oTfQycLOuf/WXwZevaBF66GgvGXiPTY9lyNMUBSV3fX9CsUSbPa1JK7AlIvp
         vKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXNicKwHPUURyALO36PEegj/jGCRXjX7/YBezTaryXs=;
        b=duzqXJzEpVqy8X0qqZACm+BgKdCeLqf3vXOnjzUi+/MrZJlla1TrvGwLZHu2GxC4zY
         C0qhfRcjq5m7ZAJFhueT9+EhsX1T7CfAjShgFSRmw3OEpDiHiWnGja8anWQL7cwH/pC9
         kDBq0b9pc0OzjOj78v/gGt9f3K3AJf0Zf6ucjxvK/KaPuy0JUbasBYHTwu+kcKI05xLS
         RfpMZBnOS05L4EzDHfi1N6kLH91Y0Sv/CggKKSkdlFuYiGQbdKJaj1psrBU0EW+jvfLN
         A31jurfiseVsTHsaA2wd8VxEjrpnz8F4xQjXOCbCmdSAbJna20aE7gDlRr8Bg1X2nD2Z
         MkvQ==
X-Gm-Message-State: AO0yUKVBSQCj7lsD1TRdDC4FRZ3ztkzt/BOs3PnaAyndrUZHtnLQAIPt
	gWZ1LXHpo82RudaxfaR7EgJogw==
X-Google-Smtp-Source: AK7set9ckwc+gnRj+k56d+SvgcefBu0ajEjl4o1f/HxCl/7FMrq5djA9ftFJ5OFMO4WJD/IRBsDEKA==
X-Received: by 2002:a5d:49cc:0:b0:2c7:57e:633e with SMTP id t12-20020a5d49cc000000b002c7057e633emr4666191wrs.49.1678972760162;
        Thu, 16 Mar 2023 06:19:20 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (238.174.185.81.rev.sfr.net. [81.185.174.238])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d5485000000b002c5a1bd5280sm7210070wrv.95.2023.03.16.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:19:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 2/4] mm: Introduce memblock_isolate_memory
Date: Thu, 16 Mar 2023 14:17:09 +0100
Message-Id: <20230316131711.1284451-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230316131711.1284451-1-alexghiti@rivosinc.com>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_061922_520852_C7094131 
X-CRM114-Status: GOOD (  11.30  )
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

This function allows to split a region in memblock.memory and will be
useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
allows to isolate the kernel text/rodata and then avoid to map those
regions with a PUD/P4D/PGD.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>
---
 include/linux/memblock.h |  1 +
 mm/memblock.c            | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..2f7ef97c0da7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
 int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
+int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
 
 void memblock_free_all(void);
 void memblock_free(void *ptr, size_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 25fd0626a9e7..e8c651a37012 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -805,6 +805,26 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 	return 0;
 }
 
+/**
+ * memblock_isolate_memory - isolate given range in memblock.memory
+ * @base: base of range to isolate
+ * @size: size of range to isolate
+ *
+ * Isolates the given range in memblock.memory so that it does not share any
+ * region with other ranges.
+ *
+ * Return:
+ * 0 on success, -errno on failure.
+ */
+
+int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
+{
+	int start_rgn, end_rgn;
+
+	return memblock_isolate_range(&memblock.memory, base, size,
+				      &start_rgn, &end_rgn);
+}
+
 static int __init_memblock memblock_remove_range(struct memblock_type *type,
 					  phys_addr_t base, phys_addr_t size)
 {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
