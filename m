Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA45C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTG4uWIoSPc71xm0vf5bSpQfOAhPxoNJpJCP7RswtNc=; b=q8b9Jh1Y+eYYUS
	j49ldqyXfa+CFQ2m0oqKFpIdMB0P1Dzv/bImIykgCSC7sMf8oCJKn1x9MHxfIbV7b92LOA5841gHs
	vBjwQ/2rXKUaAA2ZXM76/pLSqQo3j3IQLBOiXHOn1mCasKgDxuAKurMxeLHWtoV1daZgdVtuiEkZl
	3Q/cArrdPXX1JaGMh2Lqkp5UjXd+V2GBB3tOhd+SaYX2pymqivT6hX6Piy7fyeM2TWkFGEMvdA/gu
	Rc+6FOaLC5JlCXZ7YRJ2XcjC+Kmu1aweGkcJcllEULEuc8kB55O5sjuSHtOvo86kJMl8GCWD67onG
	47eeqaB/S3pXvQIlkfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPbS-00000003bBy-3eRr;
	Fri, 23 May 2025 10:26:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPbR-00000003bBo-43Ja
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AK+EJDvvd5AljdjD7isL+zEpSV7/XSrQxGsCRQ6yYBY=; b=hLwnd6aiGHlR8iJj+h9Vl35YJV
	nfrm6pZISay+6M4B5BhOrKGWmxdFbv5FNXBHph/ZaG1ihG3SoiM4RNyINj7l9uMFY8efm8ClduDo3
	9JstONT1Fq4Hz8znAzWWR65Qt1Jw2pMqWTIYwzMITvCGpGMlJ6+MvUYVbvKEBTM/0ODpb6IFuvt+Z
	EZBFrD09vsqNmlW6Mj7+RZ0GKMzcQFHB+DVCZ4TqcJcWJjU54A50QC5LOQLTxHdQwc9xuXglXeZEC
	PnfeEP4dU23p1EiQ87hR0zXh3yEsc7U7z8R4yt70sQFexpJzJX4nOh0lu4GkbpT0FVdJNgnf4Dg3j
	HGlmN3Nw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPbO-00000001GU3-0RJV
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:26:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23035b3edf1so73634195ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747995967; x=1748600767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AK+EJDvvd5AljdjD7isL+zEpSV7/XSrQxGsCRQ6yYBY=;
        b=NWPAQGSqnqB+1gYczAP9Nhg4OqnJ9UsbIHZV63X/rF09U5xXnGu8rIP5jXTQ1scSs4
         TwOkMbjTmuUTlhIUeCGcF26ofON6mwxfq3W8GUEC4sBWMD3RVOmM8w/H1noiSww8pMNF
         75HNIm6EidNY9egTkOKcM7giA9S2+OzIqaZNnW1VmkZ67smI/k29T19jxtCPWPuBfd4z
         FaJleALSXAL+iQRaT1wJDALf6d3cSFJszNfs2LA1cz/UatZoeJbXFbeWseZaCs56W3JK
         SrQ/o9YrmFjMlOQd3rt2czfeRR5rvwVFbs3DzZGtgmTFPp4MAfgJZ2Im4KxUvQasO1Pg
         UodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995967; x=1748600767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK+EJDvvd5AljdjD7isL+zEpSV7/XSrQxGsCRQ6yYBY=;
        b=fZCi5JH7AIHW5N8LCVqDN5QSxUEh/6gKLz3/2eRSyJrcpTii8l7jt0hFOjGaMIwxR4
         hdOW7pIbtew4Yro3Q6SBUBCIHz156UPzBHrkYXJc/wO1bECJFui2J/soXSh0QMvLriVj
         dwUhjVrXyoKud6wsX7RZ6StWbDnqHBvJSUYdOXcDXaHeXtDZ9Ws+24n4LWub6lrJKyvU
         +Rt7truIM9h0WFrorl6/v+zFNKSA6hlnjyBwGJbDXieUW2jBLl/AcnDaU8DFL7QXdpSD
         rxksJFBHMj+V+yz/YPtuCZKgXPQSIN01hxuzfe9I5qYeqZATqNmmvcRBHFX0NNn0NpQ8
         memA==
X-Gm-Message-State: AOJu0YxRyf2LjBemrcu2swwitT/7BgmZg/Xny891sVxnhzsY1XOvKJ7I
	MaS3PW5uVdRvyQtNTrxCW9tyvJtetOuSsAZmH7mlyVPgOc6BAWdrIA38nfXDebeRW195TA==
X-Gm-Gg: ASbGncsNIcOFLhEYXsn3WDkHGG/xEgeVm6d4sDB4gwtqN1Z2niwVNevZzXE+o5srvCw
	JIPZ1PhpAKBqsgUEalNxeprY/+5FX+7H+NhrnGzP9XFUn8bFZ0WkU+HKtzHeoiYi/mbKWKyXn9M
	Tf7aITTC+8683Nw4Pf58KDEz3ceyEu+g3n+cjGFPxS7fs34JCK78/otpM3+lgnu7uAJyLToPtLe
	R30X1hq5uzKItPIwckx1zXHX9BWMh8nsSW88jKmJ2nt8T95hoa3d04w2KUdI4vhQkZC1P3hhaRq
	v0qJXGE0mAteOA4DB77BNsf+199b1Zb1PI2bSs1XVDy0wzHsaDFcadqfWcwHQA==
X-Google-Smtp-Source: AGHT+IGYZ3xu64EEpf40Lpn20P4asck9u2uViBBVoTKBG4PoULWz4zZWgr27PM3ydvGtebRsXF2kzA==
X-Received: by 2002:a17:902:f791:b0:223:501c:7576 with SMTP id d9443c01a7336-231d439b01dmr439171545ad.12.1747995966386;
        Fri, 23 May 2025 03:26:06 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f3e046bbsm8181845ad.50.2025.05.23.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:26:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: vector: Fix context save/restore with xtheadvector
Date: Fri, 23 May 2025 18:25:56 +0800
Message-ID: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112610_237746_B6BBC980 
X-CRM114-Status: UNSURE (   8.20  )
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

Previously only v0-v7 were correctly saved/restored,
and the context of v8-v31 are damanged.
Correctly save/restore v8-v31 to avoid breaking userspace.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---

Changes in v2:
  Add fix tag
  Improve commit mesage

v1: https://lore.kernel.org/linux-riscv/c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com/

 arch/riscv/include/asm/vector.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..7df6355023a3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VSB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
@@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VLB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
