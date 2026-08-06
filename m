Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F858C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vwApv+aipPQgQaX7ZDyhmcQgT2Kp3cWN1x1IbEKi0I=; b=Op+syLe7UNvAU7
	pJysL5t3cGk1j/XSk8yhZwvm3hDY+3RfjZEmFR7gxTgt7cEKH27vXLv4Q8dSY6M8xOOjHs+YxwbVm
	DWI4impq+sivOaVpilFc/f99A1J7KWOtnwuKKmW0LyAzKP6ufnOpjnazBrJbYXCETXEusOSJ4+V+W
	KWwb9ZvOo1wWEd754apWk0OAV7CdpHXT482j3O+/y0lO5kCJdzGCVyldPpOOK+PKpydwbrXNPGWiR
	Ac6Dt0zTxfO+qiSvq9OvwX8HZVC1ecLOK6xDVUlloFzVJ12Fp/+teNFkID8n4hH2rICwbF/QDxFpo
	OHeFXibK+tAHDumvWveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXK-00000005R04-07kb;
	Thu, 06 Aug 2026 09:37:14 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruXF-00000005Qvk-3l4m
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:37:12 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc6bb7476dso2630915ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009029; x=1786613829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=N73AwJSYHD6sg4hLqt69ovjH+PSEa6WRvURkdaDMbq+HjCIFZ76HggtErorca8XzxM
         WQEDmqqYYTCNTmYP9iFC/D5DpwWs43e8CwC0PrAvkKGp3GndgUaC07AjP20K0SvhBBxz
         vG58+l49sAUOd7Z6CY4WBCeDuWE5PqP+FJJ/81SoIWlXKTnL7q92KcIXowFVjmeXuoDz
         Dr5qOD01SSDpZrnMfyvhPndSxW2itu+UwvGGcFZUoo221CIoBTKVZ0iKXqofu3QCN1Np
         r30BU6Bxi/S1YlpTKCWrHtEZWWchKGkAycg7jeMJvfeOIWzkg/3IcLLiNQ8DWkAH1CmS
         fCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009029; x=1786613829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=g781LPLWQXZ+YgIqCBdDujFIbUjzg1qIEWbJHCiWnnd26LCxITvonbbpqHDenHLZmW
         JskPEO9JL7V/af0Ey5ToXpN1Jlab5pEqhjura6xBiMM8f4mSNoimZcW5SrdmtewaShXi
         nM/+uzSDylTgygfPNaO0bZ3o/3eP0fz3pMbNcWphjbEp2kU0HRF8z1LtGSUroGWfvyv+
         eK4E4daT4AB3kj31tUeGrM1d8T9zS1hO++kbyFCv89lEgzbKvHe0OWnzY3OQFtiMUV/j
         yj9a40GLk2tP0NdGewUaXR7qP4ARZ49Xl7lMN92dhcmEvWtrqgi21HxE09HMEAnu71sk
         95/A==
X-Forwarded-Encrypted: i=1; AHgh+RpoH6MDFCzIK2B4ifiUup1ngEQ3A5J6zIu0oXlhmIvMIe6YesnIVHAloFBpO8ebgtBH7VztRsJeyj7NrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvGTGkfGtbpRusiNkIU8DrQBDdLiLyic5IYqFhzlEXn7ZgLYP
	69ASb/w2anfKLeSB+DcuS5MRWPnEmpWwAKKw0t7abNcfqVxp+CWsside
X-Gm-Gg: AR+sD1314jnwP7jd4cn2RDbNra8Sb3EA7cGSvxZWsdGpDWQxjv+2oASI62qRMpxJL1A
	148pjQmxXNkGJk2d7cgqJkQlAkdLvMSBCOMdpu6KmwSeVRPfa0oQwcrUhj58frTTnQKQG0WEmoe
	s9pK3eg9CPvb2ZzqfBMERlHydm/i4ZrIkzbTVidTgSitCbQZm20Qhh/BsDncFH62SJgn6Hh6c5t
	x8sWCxmfI0L+y3RRE/EH1g0WoZSn2VPt2Vo00OoTa46k4znl3PK+OWYyeYTbipq6Q0TfS29U3ev
	VTBxH36biiUn7clbrj6kXZRh+piNZwBVNwTl0pM+/3YnlsG9cLobe+KFwaWxRiepqz2oF80ZJ/E
	IyGTfThEWdaJxDApURnivF9FUNQgfkDB9Tr8//TcmsfWXYUyWWXFQZKeIYyzCfLaIt+i2jLmB0w
	3RNRPmKVBVV7Vh394pPPHbETNZUduYLUHpASSIPCMp705+FoaojS4UISkuklboniCjUuEM1GH5n
	Q==
X-Received: by 2002:a05:6a00:464f:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84f47dd0b44mr3119262b3a.14.1786009028817;
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Thu,  6 Aug 2026 17:35:19 +0800
Message-ID: <20260806093519.2907771-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023709_954974_CE99D714 
X-CRM114-Status: UNSURE (   9.29  )
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
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index fb78b7814f18..8cc9d666bc54 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,10 +269,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
