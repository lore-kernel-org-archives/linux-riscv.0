Return-Path: <SRS0=IUit=O4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C77CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Dec 2018 12:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB7C217D6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Dec 2018 12:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jyfrydx+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="uBU5XUWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CB7C217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gCd2/8aAF6aCZ83dMxyBrZRZlGIoaLtwVxwiZRGJNpg=; b=Jyf
	rydx+PmXMnQmrPAJMaDULK/dBoGW+SDCNvGgvd+QzkCw7i5WzP2QiTlHAviaGJRCuLnstlVQCI1hs
	3d4G9oVw71Kj4kXgTEasDpjFdbqsbpa7BiUXI9FMdDb+xMKDxhiY+evrhfdpZacDITRUrddeSIQvR
	MSmcPriBfZA2tNBHOwpU1quNHX97GoPzg4o7IAeVaA8aswRVK8IYnpvJsBAq46SI1IlgVR20p6j6T
	GtLy7UVGp2ffYwI0AZog6vGRhL/RaU8tY8BF2tdGsWKruQELTG13NAixRAFAwz/4HOvS6isVVOSD2
	1KZdyh89O9lTLgKChvP3JC4EbEjvf1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZb6K-0005Ym-2y; Wed, 19 Dec 2018 12:37:24 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZb6H-0005Xj-QC
 for linux-riscv@lists.infradead.org; Wed, 19 Dec 2018 12:37:23 +0000
Received: by mail-pl1-x642.google.com with SMTP id u18so9410899plq.7
 for <linux-riscv@lists.infradead.org>; Wed, 19 Dec 2018 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=876CmMkVFCgLjYrQ0X6AShW5JqnqwBSR+DsbIhBCkd0=;
 b=uBU5XUWg7KvEDHR1fm9t3486h0yU4PmkQ4+37L4qSridL1mImgq1Y7CWmLAZTYd9yI
 mk69gjWBjX8ecF+TFnahT4J2B4o6sFbA9+a1yBNF3j2AjCzS9nc2KtTTbqiR3tTuYyoj
 ttLYk+D6jZ77dCIv3hOXgDk8SYLMPd4VCMpZYFLS0VJbqlC3AuZRAPHlhAJCUsn8odSh
 6nD/VLZ1V97KB85kwchFZ2OyesQ3EL5Iwbh9kqHGrzlBNVqokE5DE3JLkcbcqWL1lx/d
 gpAb50tHiim05LeQEHE5/iJi9+45CPRaDgDzkyWJXNXYVp8YkfPM3aR/BdKbZ1DmGhOT
 yGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=876CmMkVFCgLjYrQ0X6AShW5JqnqwBSR+DsbIhBCkd0=;
 b=Vp4fpKbMEMzLIFI7etaZiv1tjiF4oBhsws/4ThGx5effEMq1Lzv7YPFbE6SdnFsHP3
 DFYbpKMAL54uOHGv3TCLOaVsbc9fb41SdkVnuxaJrFo8rcZBOLG7OeARXTgwbYdTpMm1
 aCx8ooJprKp1Iy4qTiNxSD8ihddoidPMp4paM/jFSaTQRDXJAErYnvbkRZL2oFm+UdA2
 ubYF0a8PZiOmx0W3QjAeb5CqMdf7/bgff13Mjt9ZZv71lUJ1hkDrZreJyx+m7ClPh3Zx
 B2GHwm1dxcB4yx2zArk0O3xxh0jYPcOofL2wpQysWTCRhe+n92S+YJH2sDkzZZvApdPE
 5qpA==
X-Gm-Message-State: AA+aEWbJIurWNF4jUncAzqJGCXNByOtaiEVPr/ACckEU89FVD9aTqWjS
 QS+Rh/EwItUHjDopr7zRBHTjtA==
X-Google-Smtp-Source: AFSGD/XUc39wOjpxu/MD0OtxBuKALWgi982I+6PHuqFy5vRA9mzt+cy92cbYBwus32oocY5UVYfH3Q==
X-Received: by 2002:a17:902:2867:: with SMTP id
 e94mr20339041plb.264.1545223030407; 
 Wed, 19 Dec 2018 04:37:10 -0800 (PST)
Received: from localhost.localdomain ([106.51.16.106])
 by smtp.gmail.com with ESMTPSA id z10sm12471746pfg.120.2018.12.19.04.37.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 04:37:09 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
Date: Wed, 19 Dec 2018 18:06:57 +0530
Message-Id: <20181219123657.61270-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_043721_845531_3E8309C8 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The objcopy only emits loadable sections when creating flat kernel
Image. To have minimal possible size of flat kernel Image, we should
have all non-loadable sections after loadable sections.

Currently, execption table section (loadable section) is after BSS
section (non-loadable section) in the RISC-V vmlinux.lds.S. This
is not optimal for having minimal flat kernel Image size hence this
patch makes BSS section as the last section in RISC-V vmlinux.lds.S.

In addition, we make BSS section aligned to 16byte instead of PAGE
aligned which further reduces flat kernel Image size by few KBs.

The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
7991740 bytes with this patch applied. In summary, this patch reduces
Linux-4.20-rc4 flat kernel Image size by 809 KB.

Signed-off-by: Anup Patel <anup@brainfault.org>
---

Changes since v1:
 - Introduce MAX_BYTES_PER_LONG define and use it in-place of
   0x10 magic value

 arch/riscv/kernel/vmlinux.lds.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 65df1dfdc303..1e1395d63dab 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -18,6 +18,8 @@
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 
+#define MAX_BYTES_PER_LONG	0x10
+
 OUTPUT_ARCH(riscv)
 ENTRY(_start)
 
@@ -74,8 +76,6 @@ SECTIONS
 		*(.sbss*)
 	}
 
-	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
-
 	EXCEPTION_TABLE(0x10)
 	NOTES
 
@@ -83,6 +83,10 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
+	BSS_SECTION(MAX_BYTES_PER_LONG,
+		    MAX_BYTES_PER_LONG,
+		    MAX_BYTES_PER_LONG)
+
 	_end = .;
 
 	STABS_DEBUG
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
