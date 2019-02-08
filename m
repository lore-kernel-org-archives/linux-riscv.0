Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A512C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1781A2146E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXqFtd6l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TiM/zgQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1781A2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:
	Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hAgiD33MSeHYNuWKXrNfqD0PDQRUjYLM6+HNdRkSSLc=; b=HXqFtd6l+1aNuh
	yLrmID/vFjd3vgxOLF+ByaIDLJf4S8hGuJr78u7eS198SfvT8Jh1zZDrhUx1CgaoTN0+WH3Y0derW
	S9JYyqj1faXOuPIEoOU/ThZdw2AThihbh8X82rf7N3IAVVBzF/I9UGOqNK20pdi6JPVecOKtmXMAo
	eEB+WUiSUv1OrJ3ry4xPRivFr0ry/ll27s+lE6vRmCKBaqPtuhagBLNPOKnP7NYE0d2JBbHaqllNK
	D19C3atG/Mqxs1gEu2d172ABgzo7F9MZxySvLRphcfcBZm1l9kiQa9zmKm1d3TChDe5vCTddhHjox
	pRjfna459rcsT5HEpHVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs9xW-0003l9-Df; Fri, 08 Feb 2019 17:29:02 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs9xU-0003kR-6E
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 17:29:01 +0000
Received: by mail-pf1-x443.google.com with SMTP id j3so1957069pfi.12
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 09:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:cc:from:to;
 bh=gvE5OLxmBDKikSbyKqIGWLvWslgHt0rQLT/1y75HBHE=;
 b=TiM/zgQY/ZjZBOJrmA/U1o2ZQ5BCvRl2T7gk0HqjBnMlXYrZhxnAXoKtGSATNqMW2F
 ljlu8pVL9YaCTa155eHxeeLWsGtj34dzZZqPNqMaq4EhUYCK8Mnem76E4UbHu8v8YwbD
 ANjN65fJQhLH2Nrb3d4PgueG/MgBeNDOSxR2hLZXHToKxi4o4uLBhLyTlZy/HinfzXmj
 IA/dMWyYr6LEONniEPyvoIoPzdQ2SUwrR/y3H6vRK7aeVefOtahg3KTXADYO0m6EGx9t
 AYRcAP8Lg1dauSThy0rOstrX2eru73u6n0pAhbS8q790CEXDgD8zhxSwLLZyOAwb83eg
 3VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:cc:from:to;
 bh=gvE5OLxmBDKikSbyKqIGWLvWslgHt0rQLT/1y75HBHE=;
 b=DqfWuGtzv3E7OVaV02mXFjsnG5H7n1ZVFMBQW/xEp0M2zOt/VZK6pUzCREEQ5Pm/pL
 Z47OS2ZySjOFyglFJJapp5f/B0HpwtcwtbzSh24UjcH3pM3vmBKvQs74dyBdbCSPPNKm
 snhqQ8lN6ImtnKqHAtvTep0V5OLaJn0gdqvekGoqVWtHLICAcOJ0oK5iPydqPQVjpZoS
 zS2CABQF/0Jtn5la3B5ARmh8p8e/njzF7jCQh/aWrcZX6mEk9DzmfNi+7XqwVyPKiH+T
 zJ/NCwIR+vq89PWIZW9uE1PE9bOw4aAINAQPohZ2bO9n815xJEVaF0ajJalcBflc9sdU
 GR1g==
X-Gm-Message-State: AHQUAubG13wW2ITb1FzkzaKHwOnBvJPC+b4Gufs6ubbUPNufNI0xDOx2
 xdy4ceYPhfXfaKlBDmVPHUBqaw==
X-Google-Smtp-Source: AHgI3Ia3wL/nwE2/xVXmx7t+PzTISBeEZVYzPtpY9RdNnfz03M2mUDcIqp4wqqKVmaZhmEU9pVXXFg==
X-Received: by 2002:a63:fd07:: with SMTP id d7mr6049447pgh.163.1549646939077; 
 Fri, 08 Feb 2019 09:28:59 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k63sm5703510pfc.76.2019.02.08.09.28.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 09:28:58 -0800 (PST)
Subject: [PATCH] Revert "RISC-V: Make BSS section as the last section in
 vmlinux.lds.S"
Date: Fri,  8 Feb 2019 09:28:19 -0800
Message-Id: <20190208172819.944-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_092900_286686_4986D21B 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

At least BBL relies on the flat binaries containing all the bytes in the
actual image to exist in the file.  Before this revert the flat images
dropped the trailing zeros, which caused BBL to put its copy of the
device tree where Linux thought the BSS was, which wreaks all sorts of
havoc.  Manifesting the bug is a bit subtle because BBL aligns
everything to 2MiB page boundaries, but with large enough kernels you're
almost certain to get bitten by the bug.

While moving the sections around isn't a great long-term fix, it will at
least avoid producing broken images.

This reverts commit 22e6a2e14cb8ebcae059488cf24e778e4058c2bf.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1e1395d63dab..65df1dfdc303 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -18,8 +18,6 @@
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 
-#define MAX_BYTES_PER_LONG	0x10
-
 OUTPUT_ARCH(riscv)
 ENTRY(_start)
 
@@ -76,6 +74,8 @@ SECTIONS
 		*(.sbss*)
 	}
 
+	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
+
 	EXCEPTION_TABLE(0x10)
 	NOTES
 
@@ -83,10 +83,6 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
-	BSS_SECTION(MAX_BYTES_PER_LONG,
-		    MAX_BYTES_PER_LONG,
-		    MAX_BYTES_PER_LONG)
-
 	_end = .;
 
 	STABS_DEBUG
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
