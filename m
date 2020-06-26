Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195A9C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 22:36:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9ADF20FC3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 22:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHc05dDH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dXLfhMko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9ADF20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sODv5Rm8PQLZjHJZaZwxKDlFP12Yd+I+gTYEQnY2iZc=; b=fHc05dDHFoZ9Ns6G2jqgGom9Q
	s49Tl2uQheb23J65MJ7A3w3+nzKy+xl+reYb4bTHERj5LYYKGDgTEC6UtyQjhm8gxZm+B/TLHUABQ
	k/f2OFuc/IeIVy9hUwP+My/6tAr/cBp/YJw9faL/y18q+UEooYe2EGop7sYmZMjyjqJF5nGvjNB3H
	AvL/rqTjSTjSZHMXA2KapmHNu+Bv6NiL2TTWbhT4c7MQUdFGFGcRVJlipqaCHqLv4abF537Wb3Bsc
	+ffUM0lL+ecx4LsJJCileBXRCsMro6y9qwfQ0Sk/ZQOHX+Lns53y1nqpFuewaTtLf9CygNPLZPSUx
	GhWyt+QJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jowxW-0002hC-Mo; Fri, 26 Jun 2020 22:36:34 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowxU-0002gi-63
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 22:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593210991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WnWhn2O9ddpmgT5q7yGLFrwE17K5+WMrtUB+3cLWEw=;
 b=dXLfhMko9PUPmo7MCmiBF3BTlDG+XWj9b57+rB3OMlVdDBzlQBWBXi88enve+NYjl26/iI
 JOKQSlNGNFi5vQLAML5fjOlZW7FJ6NjUw3c5zhnnXL9ZONDwcG21qP5HWEG/qSDBKyN9aV
 NoL8AwiRovHFFRJNxoHeXaVPfPlQCLA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-md4SOIQJMtSIR4ifQKOr7w-1; Fri, 26 Jun 2020 18:36:28 -0400
X-MC-Unique: md4SOIQJMtSIR4ifQKOr7w-1
Received: by mail-qk1-f199.google.com with SMTP id i62so7657308qkd.18
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 15:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WnWhn2O9ddpmgT5q7yGLFrwE17K5+WMrtUB+3cLWEw=;
 b=Ku8/wfuNVwMOlPjRbjsbKX7WjA+wJYZtffjJjOrRmzevZbbadXnyKAnJiUMFcsD3xQ
 kUbaoo25MbRYSgNbdUgXj+1VjTw0xIQbrmTMww0hw+kUb8dNG7oHkzh+lT59e1mW2xfP
 T50FwTMMvi+vWHjxJVHb/bOEENPeM10zQ8s9j+pCcjO6k8UcAISL9AGr/85B/IKbIuyd
 bqPIn2XfwlZkMuHvFqR3niGYxFb9+7QzMP9/skx1fe/byQ+Vg2Xv8p5bRrbs/WuHfwcF
 gO9SviF0liP99puu6AP7Q028UMr1exQMmbE8P2ebW5zRAY0vI/Pkbu/qfPGBRJGfGTqM
 2vJg==
X-Gm-Message-State: AOAM531gDpMVc12ZnODYzbnmTn8vrLZ3f8P6cNhCDDP4DiqbKLQHcEPu
 w7P+/NWY9/dsLmUbajppNkvyY1Nvm1WPIrkyS4fA8CGkPqH8mnobZOUnyxXuzZataGwGOCltawt
 JUQIMttcBIswHv136OnCWJctSyWj4
X-Received: by 2002:a05:620a:994:: with SMTP id
 x20mr2758437qkx.367.1593210987668; 
 Fri, 26 Jun 2020 15:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF7mXzjX2GYCldg8rpVKH+R/6CyjRUZNLT2pL9QW2hEVm9X8g93t+Jx2O/OTIhETTp/0bRvw==
X-Received: by 2002:a05:620a:994:: with SMTP id
 x20mr2758423qkx.367.1593210987471; 
 Fri, 26 Jun 2020 15:36:27 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id t9sm9463853qke.68.2020.06.26.15.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:36:26 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/26] mm/riscv: Use general page fault accounting
Date: Fri, 26 Jun 2020 18:36:25 -0400
Message-Id: <20200626223625.199813-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: linux-riscv@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/riscv/mm/fault.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 677ee1bb11ac..e796ba02b572 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -110,7 +110,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, addr, flags, NULL);
+	fault = handle_mm_fault(vma, addr, flags, regs);
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
@@ -128,21 +128,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		BUG();
 	}
 
-	/*
-	 * Major/minor page fault accounting is only done on the
-	 * initial attempt. If we go through a retry, it is extremely
-	 * likely that the page will be found in page cache at that point.
-	 */
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR) {
-			tsk->maj_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ,
-				      1, regs, addr);
-		} else {
-			tsk->min_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN,
-				      1, regs, addr);
-		}
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
