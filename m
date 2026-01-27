Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD9DCA6CB8
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63cNnGMBAGWC5nzL3QbwLtWys+9g96Zn+8eBBeQMuio=; b=ednVJb1oovTLDj
	ZZpraCkInsyxFFTQdWu3+qpgXusTaH/qzdpwpuq2FAO2zUH3ceLGqNE1c7ccS0pF4cMXa+zdDSaIP
	1tKJbW5LTO2joIj5KcNr17FVJOfQoTfWxn9onzbNxcYryPTO8zmMlxbxL3Y2lgc30e95I7Yrv6Pss
	vUOAybyUztwpIF1q4uV0e7wWbIrzNHUpFcZc3uoaoApotfJCWYQEAQIivl/cpSaYXIB33wje0BNKM
	IrRRCiNiC2J+lWC2XBn2DOGIRn/39+4IN+vY5s2ebu0XjAOjVFkh0wkPmwcKR/ORSv0RnPbU1hDCO
	7xbIDR+PJfcfzfy6ZARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfPz-0000000DwOk-3moz;
	Tue, 27 Jan 2026 09:31:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfPx-0000000DwON-35S6
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 09:31:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7786d7895so36394675ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769506284; x=1770111084; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nvr2xv+8/kE2Yaa160xiVghqX5wMbpe9ZaewCjQfr5c=;
        b=Kg55ogZEKB64XrDI1fJBFh5opBSLRp4ftDp+Is3dnXqwKdzW87OenJsI0XHxoh5aJ5
         uYLXd0BGQAIWViSI2d794QrN5wjmxQWBku8QN71NTu7l6ipzGw1XkYccN1sVd2fTELe+
         icHBaO9yVYdhwVK84vCHUT7/wHk8cyvI4caU3mF5HjShlatqIHa4gRuvGd0aCUFOEtns
         VqPgXWkBjv9Baqapoyg3MS3XIntTu4ne2itptSl0Www9s1xcDfMyfdsNHTVBYhSkKnHU
         CR94f5avblr1IJxuqmRxAN1Mly4bS2T8XE/+9aouSj0PNuBP4U7uXdgiqgli6O1S0cJK
         phdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506284; x=1770111084;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nvr2xv+8/kE2Yaa160xiVghqX5wMbpe9ZaewCjQfr5c=;
        b=Dz3jLp1cXxadXWUeTSVKPpt45nJpwN0aJihqZIcBjaBe11ncW755Aiiwa1vnOwU5bb
         PoSAW6eaK+5N4T+nN3DlWMC9EMl9QMBGA+TwpnGkMIwC0HPwxHut4u8kTBoBKoOBd+UJ
         aaj2Loa5VN7Azwtj4e7PaKeJXqHGv+gjxODgraI1Y7XHKQictcgiurMjRSu/gZdulKHQ
         jmQa4JPoH0qpxFUlR5sCzBWX9yAp/96dYusZu3d5q7KmYCxs6otwX6IiZQBUZNXB+4Ki
         Y9XoBKbXQVvXcJ+yW2y6sTFzTuzSqgEBx7QC35e6rrNM/mNO7ejoUQzc60jJmlZDZoh5
         Y32w==
X-Forwarded-Encrypted: i=1; AJvYcCVsENhEzT0nqVNqukJpXcqhQehPOfOlLjz3dxsz5Lq/jmklEmVpVSglwZaBUTU1AvqU0v3vxJZN6sHU2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKmG8+KOohLc0Qy1RbsPZktFRF7nEsBgJawDId5e4f87kGjQNU
	xmbU9j1vSLgVi0+PZ52fNyG7gixYeJXITdMVgU4BFzsTWX7gQ1mDEi2G
X-Gm-Gg: AZuq6aLYpMdMOj5U4wESffwL/JZwsh48Y4VtxOcBF6WmVEKU2Ictv9on6Hs51WZ29en
	Y0zJ6AkuDxfPepb/NkeZJhiMoB4pbVJ17TEhcTOv9tpjP2n3znvfEmgxcG8Yof4vMxgp15QJpKz
	t51rDqhkhN6k+hGbI/tlLCZWZAvxfTZXX3CDRbLqnIjoUf3pV2pM72fCzf9vIYYD21msFI7nXfs
	rvDKdsL5J52p1UTgRSFVeshdbB+V53lVduvt1qvHv94kgrPyWXS6iIdTAGtd/wCKJfkRQ1IVFaE
	L0Q1zR1FlDWADfzA6EIzk3FlaCLYKs87a7iXBnb/UBEkyLDcyviDRpGltI6S5eqI+CD94Zgaul6
	Xqe0Ya3vVWemKhRQDbBrRHZjYyRLti+7D9eLYiWrz9RP/coYBNV7eTReYCNviIVyTFYniLq5SAL
	W4K5jwMjznK/KhVcSbbmGKfoEfWYk=
X-Received: by 2002:a17:903:2b0f:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a870dd5709mr10270305ad.37.1769506284518;
        Tue, 27 Jan 2026 01:31:24 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa8ecsm112363425ad.17.2026.01.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:31:23 -0800 (PST)
Date: Tue, 27 Jan 2026 18:31:19 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF notes
Message-ID: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013125_780202_692DC2E2 
X-CRM114-Status: GOOD (  10.30  )
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

From: Austin Kim <austin.kim@lge.com>

The following options are required by the kdump crash utility for RISC-V 
based vmcore file:

- kaslr: If the vmcore is generated from a KASLR-enabled Linux kernel, 
         the KASLR offset is required for the crash utility to load 
         the vmcore. Without the proper kaslr option, the crash utility 
         fails to load the vmcore file.
- satp: The exact root page table address helps determine the correct base 
        PGD address.

With this patch, RISC-V VMCOREINFO ELF notes now include both kaslr 
and satp information.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/kernel/vmcore_info.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/vmcore_info.c b/arch/riscv/kernel/vmcore_info.c
index d5e448aa9..682ba423c 100644
--- a/arch/riscv/kernel/vmcore_info.c
+++ b/arch/riscv/kernel/vmcore_info.c
@@ -3,6 +3,11 @@
 #include <linux/vmcore_info.h>
 #include <linux/pagemap.h>
 
+static inline u64 get_satp_value(void)
+{
+	return csr_read(CSR_SATP);
+}
+
 void arch_crash_save_vmcoreinfo(void)
 {
 	VMCOREINFO_NUMBER(phys_ram_base);
@@ -27,5 +32,7 @@ void arch_crash_save_vmcoreinfo(void)
 #else
 	vmcoreinfo_append_str("NUMBER(va_kernel_pa_offset)=0x%lx\n",
 						kernel_map.va_kernel_pa_offset);
+	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
+	vmcoreinfo_append_str("NUMBER(satp)=0x%llx\n", get_satp_value());
 #endif
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
