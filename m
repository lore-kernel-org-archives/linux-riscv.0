Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ACAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRkxaRxXYq+fGZVV6cQf4AN2uh6JlxunPkgzh3EhlcE=; b=pZgZPtG6/B29lt
	ZBtvjNof9vTFeZ4EUlwBE13S7ejV19t9p2BSkXxb0k1VPARS0BaEiIFxt0ZoYZQ2s+yTePd9j2adS
	2hbp3uFx86b5I+fHk8DYTnEsRG2M1FOzjIUf8MU+zSPOuso88DcjVjMxBqU3d3C19CM9QleaCWmze
	RvQi9sxdac+tX3Euyr6/9+Xi0YuqTgaZanN7RNjSFyMZBWX95TR/K1he9ojfYScenjUJ2UkjorCP/
	Y9f8YnVOBV6Xk4HWDde9a+OT+qJI0nbH5MIaj7OwWNRieQAIrZ/FoPd3H4+Xxt3rff7aC+H3xWGvQ
	SyiJUvOUxwrrlxo7jH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SCR-008tmo-0e;
	Fri, 10 Nov 2023 14:09:31 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1SCO-008tmB-2A
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 14:09:29 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c72e275d96so28466391fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699625365; x=1700230165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNncknImGYd0G7MADnDhbFKl7Y37Hs80keyCtMwuCbk=;
        b=szokN1EWEYMpmJgnKThsCUzZqLjvsVZCedF8mpuwX3A0yhU519EtBMfya941+cw0K7
         xhRd/qsV02Os5Asmx3lKSD89oT3rWhTpxCf6KJo6zuBW1xSm5Q6OWkmOMELEABPSXuRb
         M8AqLEfxRjZ+M7Kush4PzOqXQTamBsTDhnSxVJh+lkexHmAr93mV7WUgwJvitNCJlhnR
         2rtU11jYONq/vJdglFHu1SQ4YbQsk573zzn6v3C+x/tzIOzMIys4RF/RY//QOuLetBCW
         mAA/WWdWbZk3jA0/y5tUnNYL8ntVX3+gXGebN1zzJWgULniDIw5c43w2dZYVxLKQQ98I
         nE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699625365; x=1700230165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNncknImGYd0G7MADnDhbFKl7Y37Hs80keyCtMwuCbk=;
        b=bn6JMAQP2Dtfx4YzK519jImoZRWBgT/hHx61f3wOGR2z2BClXeoA4mskVIVPsrZxPi
         S4TIEFa1kHzq8zxDaf0RxrhccEvcCeB5G6TBH1fdSX6qoobqFGIP5q/Jj1ZyMQCwjPv2
         hbVrTyxYqbzEx9OAbETGU5aEJO/9/sey0d1EmW+3ED1XF6/LvksC6j9jMqXVecGkr1fk
         wsvc2FSPxQIPchL2e5rNclVOjcQMs6zmOL0BGhSfvNDsBntuhrNRxX0KJt8ECmf9/OjF
         bX8N1syB8MW7YUNKlMZtgow+QqUDoZJuutpV43E9gvmu2IG1Z6nZe/C4aKOlg16zGBAx
         PQfw==
X-Gm-Message-State: AOJu0Yxbyc4l2jgGIGcPJPZ8qiaA3RoGZ3D9DWVTctiWFglWakoSD6Bq
	jr4gGOl8/uOKfBEZM80GGPubHw==
X-Google-Smtp-Source: AGHT+IFnc5DDn6eDvAmwHfvD11R9Doa6XtjEu4mYLiLBs82TOIbZPRsbYbDAWR9qLMG/ZVUIcvzhnw==
X-Received: by 2002:a2e:2c15:0:b0:2c6:f51f:c96d with SMTP id s21-20020a2e2c15000000b002c6f51fc96dmr6506404ljs.13.1699625365568;
        Fri, 10 Nov 2023 06:09:25 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600c150c00b004083a105f27sm5173099wmg.26.2023.11.10.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 06:09:25 -0800 (PST)
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
Subject: [PATCH 2/2] riscv: Enable pcpu page first chunk allocator
Date: Fri, 10 Nov 2023 15:07:21 +0100
Message-Id: <20231110140721.114235-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110140721.114235-1-alexghiti@rivosinc.com>
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_060928_733071_5F9CB2CA 
X-CRM114-Status: GOOD (  12.27  )
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
index 5b1e61aca6cf..7b82d8301e42 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -416,7 +416,9 @@ config NUMA
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
