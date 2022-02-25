Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkiQOU+3bKTjw/+XkgRSVpwIrr6deyAN3d8Q4fNAF/o=; b=zmVbYgYTYW6ZG8
	Asx8UEmX0d5knvrjx76Zsb3+V2Qs3WL7tchG7rF7Ad2mC/lm+0dCKZjXNIaiJm5k7kD357pLtwcBm
	YxJCukCaVgSI9QVnIAxxjsxn3qB4k4QXlerIhKHRCTxd5z/x9NWqYhP4unklpyLvkW9oTvnVr9/z2
	xKzbLSx/WqWQOVkhVdpIvUAof1rG+2uTYkyNrrSLLWNMm1sFk1ia+HLZlGM5soazCFoFjgr8FmlyK
	6rbM9mrPibnDU8xfxj1cI2rZ2xyg1tw76uJnzK9XAFw1kTllUu8nT8VwQG6Xid0XO4DLbYXYWpgq8
	Ik1hSJ+iDWzG9gWyxWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZy7-004trN-Qf; Fri, 25 Feb 2022 12:45:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZy4-004tqP-EN
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:45:05 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B1283FE4B
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645793102;
 bh=SnSbt9srZ7OcpfO0TO3d0HjnXYX+4WJ6SgK04DiqgE8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=bcEi+LRiTemlC7Hj63WfwVaBWrkJ6xI0+QDibvP7bLfF+CmKjYWpu0MIIlYHLDZXU
 zs1bFHorBWqxTimKZlX/U0Va8OvbWkKVF3aeO9i5jQTwi9l1a/QOACSr9rSxqX+Qhx
 m+GARMgijfuxqQVTVF0YcoVAHVjXC/I/TS8YQIjFx2xvBShUoLmiz6WLLvtyqG79pf
 Png5lW6KSjhxNRhnlBErHRotSf0uScw9OWAv6qKIaT6HUaKhhYrJtLf7pqBiZoM0Oz
 viNNFKRvi6DmzuMI2o4N+1r+DH1VfkzJA1EOGlKXMYpm+8uJEmxtso/VmgKjKbbT4J
 d8BTk+vYhecTg==
Received: by mail-wr1-f69.google.com with SMTP id
 u9-20020adfae49000000b001e89793bcb0so850292wrd.17
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnSbt9srZ7OcpfO0TO3d0HjnXYX+4WJ6SgK04DiqgE8=;
 b=FwsDyOCA6BLoOj5d5RSkmN6Li/aqahYBJkeFdjE6PCn0UhXSApdS85WrdY+9If0gsq
 qiD5yXW0VDemqbgvSpqZC//XSsYb46gG09JtXqDB4gPu4IbrM30dzFYhciKbYQd7BLfw
 iKiNuMcP1SQR0q7G1NRIP5YC/YEYazDIZTVtvjKMiPLoFOb6w3+Hf9x8uef8BMx0kbnL
 LFwV3wEPhiQ9tCfSNeT33rZkp4LfdXBOXGcYZ51WlydArd+mZETazg1UN8Q2KAO/j3H/
 phP43uFxGWLaAsI+nRQNMY7oiQ3WKDe0d77iet8gNloKKw5bF0dG7bRdmtKpuuQ+xB8r
 Lw6Q==
X-Gm-Message-State: AOAM532oPovmrwsl6MowrNNr8pEBLKSTALmhd9ZNW49Z61Te8b0i7dM9
 749Psc1HzuSp4z/5U7KTdCVa0e+Czz4IauplWUR6TaGb9aRLmvaWIWB54oRoC6YTO5nE/amdA4c
 tIK6pUm+9riI0dsB1UGTMvh03olhpZGIJ5Q9xvE2Mlltjfw==
X-Received: by 2002:a5d:6a41:0:b0:1ed:c1da:6c22 with SMTP id
 t1-20020a5d6a41000000b001edc1da6c22mr5742735wrw.473.1645793102135; 
 Fri, 25 Feb 2022 04:45:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQgKrZu6jaYzaCu1NYJXPtNkDwJhWrhUHTE8uagr23ma/j8UbcytWvj2M2yAnW2lyu4uqPTg==
X-Received: by 2002:a5d:6a41:0:b0:1ed:c1da:6c22 with SMTP id
 t1-20020a5d6a41000000b001edc1da6c22mr5742718wrw.473.1645793101972; 
 Fri, 25 Feb 2022 04:45:01 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b001ea78a5df11sm2712125wry.1.2022.02.25.04.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:45:01 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes v3 5/6] riscv: Move high_memory initialization to
 setup_bootmem
Date: Fri, 25 Feb 2022 13:39:52 +0100
Message-Id: <20220225123953.3251327-6-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044504_648618_02843F15 
X-CRM114-Status: GOOD (  15.34  )
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

high_memory used to be initialized in mem_init, way after setup_bootmem.
But a call to dma_contiguous_reserve in this function gives rise to the
below warning because high_memory is equal to 0 and is used at the very
beginning at cma_declare_contiguous_nid.

It went unnoticed since the move of the kasan region redefined
KERN_VIRT_SIZE so that it does not encompass -1 anymore.

Fix this by initializing high_memory in setup_bootmem.

------------[ cut here ]------------
virt_to_phys used for non-linear address: ffffffffffffffff (0xffffffffffffffff)
WARNING: CPU: 0 PID: 0 at arch/riscv/mm/physaddr.c:14 __virt_to_phys+0xac/0x1b8
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 5.17.0-rc1-00007-ga68b89289e26 #27
Hardware name: riscv-virtio,qemu (DT)
epc : __virt_to_phys+0xac/0x1b8
 ra : __virt_to_phys+0xac/0x1b8
epc : ffffffff80014922 ra : ffffffff80014922 sp : ffffffff84a03c30
 gp : ffffffff85866c80 tp : ffffffff84a3f180 t0 : ffffffff86bce657
 t1 : fffffffef09406e8 t2 : 0000000000000000 s0 : ffffffff84a03c70
 s1 : ffffffffffffffff a0 : 000000000000004f a1 : 00000000000f0000
 a2 : 0000000000000002 a3 : ffffffff8011f408 a4 : 0000000000000000
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffff84a03747
 s2 : ffffffd800000000 s3 : ffffffff86ef4000 s4 : ffffffff8467f828
 s5 : fffffff800000000 s6 : 8000000000006800 s7 : 0000000000000000
 s8 : 0000000480000000 s9 : 0000000080038ea0 s10: 0000000000000000
 s11: ffffffffffffffff t3 : ffffffff84a035c0 t4 : fffffffef09406e8
 t5 : fffffffef09406e9 t6 : ffffffff84a03758
status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff8322ef4c>] cma_declare_contiguous_nid+0xf2/0x64a
[<ffffffff83212a58>] dma_contiguous_reserve_area+0x46/0xb4
[<ffffffff83212c3a>] dma_contiguous_reserve+0x174/0x18e
[<ffffffff83208fc2>] paging_init+0x12c/0x35e
[<ffffffff83206bd2>] setup_arch+0x120/0x74e
[<ffffffff83201416>] start_kernel+0xce/0x68c
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<0000000000000000>] 0x0
softirqs last  enabled at (0): [<0000000000000000>] 0x0
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c27294128e18..0d588032d6e6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -125,7 +125,6 @@ void __init mem_init(void)
 	else
 		swiotlb_force = SWIOTLB_NO_FORCE;
 #endif
-	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 	memblock_free_all();
 
 	print_vm_layout();
@@ -195,6 +194,7 @@ static void __init setup_bootmem(void)
 
 	min_low_pfn = PFN_UP(phys_ram_base);
 	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
+	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
