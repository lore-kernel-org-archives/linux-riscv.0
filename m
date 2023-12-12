Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D1C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6E4fGDcRoBjx26GXvSTCfEunnrzkCMffuTvbAJXTo/M=; b=ELhuGimAtN21K3
	HvT3bPgjfYN5CpkecZbbYTUXx2LWWnN3sbibIhBvG9ZdczkoSr0dDF/QB3LN8mfYSgRq54EsNBC16
	E+lMSBuloX+ai5rS+7/OlDmY93WL8kbKsVq7wYuNulkF4/RemQCPr3P/zUXIiYgyQxjcpJM2+ZVf9
	Gskwhunb1thE2k+zsyHLllrKfArT1Alo2P4RkAeOIBhtE1O9oZHp5lkqvRDYPQz7QomJhBuXgTKmq
	Gf8bKgggHiRL5VfI12I50fKGhwkuAix915Lt0u18YW1MRlh2/yEBCQr64wCmFkptm/+NrnrBtBNVz
	u908GHAdU9+5lwtnUzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDARA-00Cpqr-1P;
	Tue, 12 Dec 2023 21:37:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAR7-00CppG-1H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 21:37:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so58038955e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 13:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702417022; x=1703021822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCOh69caXbVfDD+nz3SkSSNJ4LOnzQLxIG6SJxHDatw=;
        b=hTX63U6TcJ/d99pRh+Kr/Nae8BUjbuO2jKROcY6hqOnqgTihpO04r9qoFYpBwTV14i
         QagrECXCpvdPc+TKkriV8xFt8d6ePXw0ZhyBo/tTUOxtIgezjn0Vr3VWYw1iOwpoez0u
         Cp1ujBBYRhKPuzrRi+vQ09Dmi2j9RwgxvpSHkPRxOKW26j/F2wPEEap5g5bydqdNLD9K
         Q2G7eyZ+dnL+S+QLSSfYuV/alxz/2QkHbFaTSveA0L/ZV+kKQpNi7MA6wmntOeFOuOvr
         3peGuPiFtHjpnn+DM1hT7DDH83HxrtDSjZzqsvCqMFXF/y3JfObVrMGzKwLNP+3223wG
         bp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702417022; x=1703021822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCOh69caXbVfDD+nz3SkSSNJ4LOnzQLxIG6SJxHDatw=;
        b=Kma1dwC6HhxGWe0M75NqqWh3JLhDyCizr/2/6Yh+Xmjo94exAcV0onCvM+xD5BMPiK
         Yu5HFbfEZpCEfacDIBwUaZk22Muv5anEm+9NxD11OqfaaLi+OuQsK2R+pqoPMRXD+YB2
         hNTMZzmUowbLrOJBNkyJt46+7Px61j0uqm+48/cz65KnQ655YB3fhrllr5UM5Ff2UE5o
         vdJnM+w2tfli2kAGErYPkWXRHcRpoYxCdDcc6slasjfnjrIAXjrI9iVDilB65e1BO12u
         Nwh2kNX5crULMtj72tiu7WBRj5nYOaPLuxIZXup4RadssV1ZL2uEHOIR8dOUGZhRIGQj
         Q3sQ==
X-Gm-Message-State: AOJu0YxtyL8ddm/7IHwOJazaDUXZr7Hdcw0719JaxIVa3UDt84g8K9/h
	NQT8BvoHXlhCAl08zsAtbXhC2A==
X-Google-Smtp-Source: AGHT+IFqqgEgVUuuLcp/jxl4AbRQVAxPSPDTSvhp/ckLGpwai+H0FWmy2ZTFwQBh1m466TRnZ7G6vg==
X-Received: by 2002:a05:600c:2814:b0:40b:5f03:b43f with SMTP id m20-20020a05600c281400b0040b5f03b43fmr1885174wmb.353.1702417021655;
        Tue, 12 Dec 2023 13:37:01 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ay35-20020a05600c1e2300b0040b2b38a1fasm17954734wmb.4.2023.12.12.13.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:37:01 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/2] riscv: Enable pcpu page first chunk allocator
Date: Tue, 12 Dec 2023 22:34:57 +0100
Message-Id: <20231212213457.132605-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212213457.132605-1-alexghiti@rivosinc.com>
References: <20231212213457.132605-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_133705_507215_F02B99B9 
X-CRM114-Status: GOOD (  11.95  )
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

As explained in commit 6ea529a2037c ("percpu: make embedding first chunk
allocator check vmalloc space size"), the embedding first chunk allocator
needs the vmalloc space to be larger than the maximum distance between
units which are grouped into NUMA nodes.

On a very sparse NUMA configurations and a small vmalloc area (for example,
it is 64GB in sv39), the allocation of dynamic percpu data in the vmalloc
area could fail.

So provide the pcpu page allocator as a fallback in case we fall into
such a sparse configuration (which happened in arm64 as shown by
commit 09cea6195073 ("arm64: support page mapping percpu first chunk
allocator")).

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig         | 2 ++
 arch/riscv/mm/kasan_init.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7603bd8ab333..8ba4a63e0ae5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -415,7 +415,9 @@ config NUMA
 	depends on SMP && MMU
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select GENERIC_ARCH_NUMA
+	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select OF_NUMA
 	select USE_PERCPU_NUMA_NODE_ID
 	help
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 5e39dcf23fdb..4c9a2c527f08 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -438,6 +438,14 @@ static void __init kasan_shallow_populate(void *start, void *end)
 	kasan_shallow_populate_pgd(vaddr, vend);
 }
 
+#ifdef CONFIG_KASAN_VMALLOC
+void __init kasan_populate_early_vm_area_shadow(void *start, unsigned long size)
+{
+	kasan_populate(kasan_mem_to_shadow(start),
+		       kasan_mem_to_shadow(start + size));
+}
+#endif
+
 static void __init create_tmp_mapping(void)
 {
 	void *ptr;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
