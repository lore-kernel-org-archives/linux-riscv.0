Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9030CC982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOuDMRlIBO/NtSBeg/lfUKQ5UmSeDA3d/iQn45VEezE=; b=mdfgQZPWBKMvIr
	6ooLquzFb+AB8ttRRayKOYsEZlgq7yKVQjJ05oiDT9yR+FUQ0N9oY8XLZmu+hqBW2kk8b9qnq2GkN
	1+sPfeKIjn/0f3Kvhlinr80BElHGcxx6Y7fPIEZh+vyRqVibnTVx4BvTe0N1jGmtG3M7FDSajPTzT
	YjRgQt/QWunWZoVUeixijPGjvAP4WNL2WYRKWXL7/n5QoAMeQBTi41ozMwX3Elf7t+Cc+Uy/EiVfu
	tgUqEYNN9CVt5YrmizQ6nYvfZkqoqRPxB4HPpkKTYIYmMBWmp2ZuaBrl23Ay49QYH9ecFs2JenyLy
	BXg3QSZxMuWutsqZ7IXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7q-00000004kJE-3CiN;
	Tue, 22 Sep 2026 08:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7n-00000004kDU-2Wxq
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=; b=Sr/hXNVPwxM2oFv6pmCbl95Ps9
	y7mqtIjQc0LqkIQDLNl+4YCPVx17pjYpXKkytSm99gyophMl6OZr9pdD+gMCghe7ZmnRJKGvdbFVd
	eo7MBv4AiheBbJj5cnT7RkIPt8/cYxIIC27rKr16KAVKp5VeiD5qC97hg0tXpXYQzrq+eaMC0Vg9B
	ninjrKZ+KJ4KiBt2pG8gfCuO/J+Ih7QNIZXWYph4PMZNoULwvdNTN/lJbqqC80JcV85XDBMJF2msY
	Se27mmu25lW65gqa66TqdYJYLYlXCZpDjJ9txLi96BsSX888V8qEMZkzDVEGmVf2sVEEs0eR0eWsf
	Wd1RRubw==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w7i-0000000DHuA-1bem
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:45:14 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2419045a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066708; x=1790671508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=DmDSfa0QwGpubNSybh/kTABHLrTXuKNAhxPMvMDa09NgAD2ZB39MdRzV1LCbQOdhj1
         E5Lg9tBDokPDWIgd7mX9ffZsR3Ovczd2iBVH5nnjkBTg7XXpwoSyBWcx51CeDbRQzrFo
         AZbiDU8UJDpFZRwgQN7+SYsOuONQxIR/RSHDs2Gc4s1VHeCoGhF+IJacYdn9fMT6GdQQ
         sVSLp9W/rDOGj7uwawKyv8rtstcZe8pfToUh023p1Yv+pIPW18QjoqLh/+j9YyQ+Jyr/
         59Z6fUTI7eKSaJSrW7eazs5MwCNSgIOH+Wgld5ATAxg+JGzC4XRoMYxhLIPLC8xHdztL
         2pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066708; x=1790671508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=IgHlSnJolW+6tADk1oE1pBDem/lsryLmnMqq3t+D+81ICBPNUEtd4B0BXXGdf/Tfbb
         kMf4bNP5QHSIu01j8ld0eOCu3oYBZCLzAUPPJLG2Ryd37X/5MmBkSz/Am2rIttLn6Ht7
         zrtcy1KzsmEjlbt5cWB1cLtlLjoIYPHsqsh/MY5oYRAqVkgC0OVbKOJM/p0jK9mdLzEK
         cZ0MW+2a8csJf2WI/RLgyRZsjqrOYHUDseU3TSmg69JlTpqVgajG3KGST9bk4o+T3QoG
         F675PjsEtsBsys1BvB1f0/Zugxpk3EXNK/YYUgEFZWPeBsiFC/qf6IAM94I5AIc0CArh
         GLRA==
X-Forwarded-Encrypted: i=1; AKwUvBy+OtO4SDFpT0p0V55X3PZgt2m/yqt/P5FkYlv++tpJbmIIHHRjoPKGFWfO3tKp2xHnZ5MZoGqAJOZ4ew==@lists.infradead.org
X-Gm-Message-State: AFuF++laKCLticoj9tu0JOQTmN9JxEJ/G4CCAwDYrWuxzKRDhHZfXWuJ
	LuHWwrNtTd5sw08H7Adh3+z61G37RIx5ibG4WKgfl+hL9OXUMgJeYe5L
X-Gm-Gg: AYBFou32z4tsaIJwxD8PNPUFhnV7paA8hbcdozsJVoBndfiY3bVMY5355h7TWhQwNNw
	hw21sISjiRZCcSi/V7N0q/md2OgwB3yQ25FeD5SqEY0da7mTf7toFXuvzTcWJgHBWs5ZahSblwz
	o27HIBpiAQKtgjfZp1lWXv4Ki1k41fgK4UCR3Dnjbkgd0y7e7L7NepsEKVPiqFGIuccVjarWN1T
	2pWDY58Cl8YNspr8LO6SqbZOjS0GwOL4GbbxcVDbWtjq6jOq1i70s8/g6+h6xMmHYzmMj823asg
	/hej67jW55Yk3hxpwQSp3h4MDNOM27J9AQ8N4npqlIqQF6uGilSonfh7Affli8bkNA4FnTscafp
	zDrA3QLqTDO745B1oKYL3+QI2xzL0w7028EIPkr2TB4DynLWuSm1l8LmwDkQYE5hc5StSNjwOC+
	rUDscgaqCWOgNYhdy1KsZUGiVozgr0HGFUpNN40ya637uMUQmtH2fOsedN+cd7BoC7Gzw3/g1zD
	P4Zc4Q/gxdGgk2LfE+8Ig==
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr486642a91.19.1790066708546;
        Tue, 22 Sep 2026 01:45:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:45:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
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
Subject: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Tue, 22 Sep 2026 16:42:56 +0800
Message-ID: <20260922084256.1515554-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094510_760467_932B18AB 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c7acb2e449df..fdfeee5afa1a 100644
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
