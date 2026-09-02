Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F3DC61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lY7cGUr03LYx35GjCHec9GEGTCVMnB6k/xYXKirTAI=; b=yG28fwKjEMqDF3
	uWWQH6TPgpBWSam2YAc7VM+Bg2uAOiXxOEWGT3o9BVTGGq/0VEWX78qb2V5xhygZGoRvsqc8+3anW
	2K5cP87/grMWJnPLCDxfldndQlqdyTLzDV/Q6wuoqO3j2J/t3CLcnQOXqL2JzwICqmu0vp6Bgon1w
	83lrULjyygr5nx+j0ZxyandOtGE6f5OO7/R5EvjubRPpuw3JYOln3ZUZpjMW9UIPntUMJo5DCSLgt
	7wNrZ6ZQANGzwsODDkfhRwwjLA7i/LXo+PC5nQIE8EKILh0AlGsvxSayJ8xadTJcmYcFTespuc6+h
	fkO2IisJnstylA//c5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fUQ-0000000DxJD-48pa;
	Wed, 02 Sep 2026 07:34:38 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTO-0000000DwwJ-3tiD
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:33:36 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so237724a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334410; x=1788939210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=LRjyrchoDe0/9SlQNuOTdckSxhwQ4K9AReq5EuzhXjSpjI7oQQwLm2fSg1fvpqmMdI
         aZpsrxyW4oemsLIlz0SQo5APfufJAXb1LlQ6liP+uQ6Pv9/TSzGPZsoT5GkZvCzIHplL
         vJ4MxSc8VU3XCUWoARn7Fz/9BFLFxgNokBsjdl/DfMKpCRGMG71swd3F/WWqge2guUsL
         hAc+fWqkzvzvdV2ooq92tJEtnKsra7dI6v+YmhtJNoaJrJwBDbr2+UMwMu5Vn7172dTk
         6XoiNhp8ym6J5fkZq0NZTN/TH5Sf4Fcx6juNQMm3UWK6FSkqgMnjLUfprAkj7hdQ3jlc
         GG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334410; x=1788939210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=LCGx11A+ZhwOK7GZgBEMxhuUIbfWPkTY2zxktBmLqgaGXFkGJ2+bjIvTLCAaP1ZekK
         YIvtKJM44KhR5G+5HsE4DewwBE9YwmVfFJUE/+E1r8dijIAYYXY3UnoXrGoZI04vksx0
         fwNKGvIQDZHAHBoiTfaODXuVC6ryOVFt78eoj8oWUna20htQA/kka9vvVGcXBAWU70Ns
         Z8zGsU3xFukZ3XimMhcWiEkD+T5h8GBi1BiqlRbWK+w6eHOGm+P3rEAL5zkprYTlrscO
         00P81xc7RbT451REUnOdCRfPhEYvitVjcGtpmphs0ibanXskCKCap+YYn+eEAI3eH1Ot
         sTfA==
X-Forwarded-Encrypted: i=1; AKwUvBz18zqhtABORR+e5WEwctwAY3mgssJ2Rqr6Qmqtek41LnGFaZud73O0TM4CdhoH/zo1EAUHrm7JjhvhVg==@lists.infradead.org
X-Gm-Message-State: AFuF++n2ouL0S7ITdvtjaHY4e3zmU7dhNOfcpYq++tQrRxAOl9BYdDAj
	3OohsmSqbbwGD/ec2vHMhKRv97d3EZARsdzgX/r9BykeAQr/cBpzhYql
X-Gm-Gg: AYBFou24mlTNAyN18RXKYqLT+XTEN66/0q9j1oSPrg3G67pxNaGYqX1YYzKXPek7vt/
	q0DbkfeboIIvnW9xfbH5CmlF1nhAO2Bjd5W1E5KhQCRVdrDCT+DVOGqSKhjB9J7zK0WzQIpd9lO
	HFhzl3jhYjrjN3otvLJmB6P1ZZfzsE8LT7R6zE+nsp7KuVJVq1yteoEkLxQHID1Hb/RPdNyrKi/
	VmpxfEYIZ27PBCxKoqbfgoBSB5cL2pKWz3VTZSojnq3jO5O+4vWxOxATfUGpD4gEiy2ZpD9na2Q
	+2zUQZmswI4joolBGhElpytfst18jHo+NwesLfcF2ENQyG1M7Byajx94Fji/mEwNU1Bx0vFZmtV
	OCBVjBF+9KQVC94ybVMbB65GHM/pzQEYrN5t21BvtW/E+gYTtSorOG7OcH9LttDd91S1ZvM8KXN
	bJJaEAX/AhHDBkXZT7/2HUIuOzOb/GWbww9Yb6TR92TRXYSuKNgD7ocL2FwWLtT12ywGvvuLYj
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr5132871b3a.13.1788334410213;
        Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:28 -0700 (PDT)
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
Subject: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:15 +0800
Message-ID: <20260902073116.802752-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003331_268705_F0EB1620 
X-CRM114-Status: GOOD (  15.74  )
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
