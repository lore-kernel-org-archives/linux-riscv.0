Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF8C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bls9YdJMsDJam/SzmhXt09iViy0uAF0wLn847Z2eKg=; b=BvT3x+uLYSXcDM
	9d+9PFHlDWEdn3eHp2oW0Z9YG+w4fX5U1UngEN8j5Oiem6lw0rw7A0YhzVRkNJTt2VuaN03iQlbEA
	lDMwmNW7NVRYBE7ydDlaH3yH+4+xx8pho3h551kXK3pktdf+8zPEpo+sIuVAt+2oNQ/nj2tgE/+co
	ELPWYPa2qXRb9aYKhVpdCbvgWrDUMyWOTR9ZZD1Uj+ALFErvxOIrqeYxcqM2sih4n9LDIoZA4yx57
	LX9PXPxWIkPZOgcUEFQbrFOWyZ4OSHF2P6LyZvVmS4e+JyenchDuzSTeRuPtJyEKqVjbz2v/cZLIQ
	PpQuGh2opYPkqCekfmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fUr-0000000DxQL-1L5a;
	Wed, 02 Sep 2026 07:35:01 +0000
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTc-0000000Dx6p-0hxd
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:34:03 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cc2085ecd44so201093a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334423; x=1788939223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=F7MXSFNQC7lN7mWAImdv78D2wRBdtBQwMR2uldOxjj6ia1+HqbiETEtq3JdDyTM/v0
         lcuQNxWzjgmkWEpF/lG0MURaQyN91w4pl71OrunzIgV1OSOzSDzkITmriOsW+STQ+wsf
         A0vGwgg5W2Pc4ovLiKX0EnTmQjQk1UzwL1i7m1+BKAothuVKfyfwBta61VA2GBdMhlWe
         44HGpakdWFGan5XKvXWoAD9cMOhHWiCw6s2G8Lo+iy89bSp879oePLdt3cEk/gExs0C/
         DUiwcuk5sIdjLNJzMtBYj2IuyKhrXx8cB4cmrdMAjsfsWRka6pKYOZpLphOD0+pbS3zh
         MB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334423; x=1788939223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=nvjkbn2mtlXrxBN9rtoefOU+u3MlMVpb7cvTGJ0r7WFoKWd8DuyRf6SLSvGbe9GklV
         DNpuF9NWL6O+x/riqyQV9o7PTo1yC3cBeBqJIGmflTy/UYmMjGppgTnS1uoZj3z2RFuI
         x4Mpf4i8Y6KmeFOW3AnK/klzd0GaSEJFSplbO0siaXGw066K6KHhAi2bW6L8ROcxaJvX
         p2Wwq6KZedubSiqgrI7gN1nvmx7/oJn75eNMf1M3aO8rMFIZvIibZIAYJC5VDKJPIS+J
         tXTTqWpVZg2EYSaNmhzcrPxRRbIUG/tg5QkDAaZRKKSGQSOGXZiZTTdSglzQgFheJYMa
         WYFw==
X-Forwarded-Encrypted: i=1; AKwUvBz2r3QqtcrQrJjo8jFc61T6bJoSYWfIOZhn1ofRCqKkoTGmpqs1GOlvdToQKIG5XTNd3jbaxxvd5gPDFw==@lists.infradead.org
X-Gm-Message-State: AFuF++n51tMA1zm5pbJrrdDSCFnkOKe6cF6vVdVZLLwSaBnhCq/GsTNv
	yzDucaFLFf64uM2PCastiWA6IR6XIb1KnobSt0i/cB91euxg88VqBBUy
X-Gm-Gg: AYBFou0lL9fHk+HreiHjRlZcpVPDx4GB+ZWupeRMaTrDL+pX5vFB23xa3UuXZW6Vxq5
	BAxzorDeVUmLlHDZ1GpyeboujTKyS0wLGIdKJBkIxaNgSAH0OdGB+IylBUixE7VJBQAMoxBI204
	/SJADcHfJ7OIFVcXN3Nw8DSci2AYKmuT3cwoOC90VHdd3Es2t3Bs1d77Zm6MFoX6pDTxcIX255t
	symGoyEWDI8G2YO30Gmn8XbihvL4LUK7vwKEanhaJhrTkp5Re9nR3T5Ly950nnTXFJlJmF7Wcwd
	5yM3GacLXuXP3hCGFW+qCkx3o/TOfU5/uRC8B47XU8FYVEt+2MecoVp6jz+7FpcHCVOhMLEAFHU
	J80TGfv96wZbEqLDnDAiin0FphiB6Xov0BMSPz9vD/r7q2eVThBboo0c1LKKJ1Wv41vxFAdFjUu
	vOPNismlzv9awJA4Im7ilKR+uzboSnV5j4D25xjy9fReOLnymz6OFvL++T4WHptwuysdWpCb+6
X-Received: by 2002:a05:6a00:6ca9:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-85ed4449927mr5116039b3a.17.1788334423379;
        Wed, 02 Sep 2026 00:33:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 10/10] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed,  2 Sep 2026 15:31:16 +0800
Message-ID: <20260902073116.802752-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003345_220522_DC53F3B4 
X-CRM114-Status: GOOD (  10.12  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index bd64cf585795..b0e618e13588 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
