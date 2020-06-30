Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7293C433EC
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 20:46:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD1C20663
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 20:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnHPbmE0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HYbKdRb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD1C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUspf6Ee3/dl5a9SJXPrhijxSq657ms9ocv2MHyTruM=; b=jnHPbmE0caoglia639TJ8S7Hyy
	ilNn7ZMEDdeweZPwWenOHgIlpdz/jPB3hn0f5T9GIMWcgLNpFncu3oGt3kml55q92n4oO5PafQ+nl
	XBM5XAm+KbGA2g/PiQMO29WyPzEh6JoS3Bs0mxPJtzizL/rpRxXsDuDViIPEF1k+PmurWm3xJtNNv
	o3Rg8u3cZHWwFzgAZzjzNDye0sYxqLSP/64qQTC4SI5kyJM9ChgKqkhh1n6cbBx5ZzTAW4L2hoVCK
	oku6HDvTL9Fn1QoBGgELwnOlGAQ8Fs/p5karaSiFsdRVvNoj8BcfwP2G1J7d58KgLDid9Id69iHNK
	DmG1w4Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqN8f-0004LP-T0; Tue, 30 Jun 2020 20:45:57 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqN8a-0004Ii-G7
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 20:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593549952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mfudH1gu1GL1LZqxVEZK8L9MFfxsg/gHPxv1OKTQK3E=;
 b=HYbKdRb+2PgyIQPbdWg6PVXIyP8sY3hiuzqCoSA+qgdVOLsuTrZIYptvAtT14Ppph0pFys
 TkcHv7DGYHv/YkFoGBSxLn3mPC/z4RgOh9Y+G9a1f+lRip5OJbZhnHPmBzfsl3W6ieEmJX
 MGZWcwarbT+vHJqXL5IeXM0qOuH2FvI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-AdIIf4x1NSeIJy10N8lMaw-1; Tue, 30 Jun 2020 16:45:50 -0400
X-MC-Unique: AdIIf4x1NSeIJy10N8lMaw-1
Received: by mail-qv1-f69.google.com with SMTP id 59so14673036qvb.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 13:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mfudH1gu1GL1LZqxVEZK8L9MFfxsg/gHPxv1OKTQK3E=;
 b=PadjsROKRlBO91b9y/Ho+6JHnZPPEcB+psFdIWrU5BboSy9BzKME0G/Pp1LW2sBPzR
 cuMYc00tPQ4cGn0dd7IXBoRHX9G/BpQIlRnagju7UhXseG4q+uu3hpekNVjFM/A8/+Uw
 KoupeBfgnVxmmA15BNYCzcg5xSDTWfLDjfrZ8JcBc9RoB3TAtmhqbloySnVg1lA35mtw
 2rW8RVd9g22xqWZGvCgz82Q+sJ0FJqRU0+ohRKCVbOuM4SuPmlji+EWR2HpCH7OUEG9l
 ilDhf6aG8HTQaNjyaqolyop9A4Ex58P6iE2ts0XqjMpIMiodBnveWnQYv990Iy/XuKKv
 207Q==
X-Gm-Message-State: AOAM531N/QNwmWnePBjtf5MR/afZiWefiXjIL3gRlKKeSdQs51LTItiL
 IZ/hj/EC6sXB9lZvOeBir3FLYFhHFNAowkZUpK0WlID/J+oYr37OfJ2FUPEMliecs0iMilL5s/3
 6oOx7sUlFMikTKOpCnA2lc+pNc/ZP
X-Received: by 2002:a37:5c7:: with SMTP id 190mr21417894qkf.479.1593549948398; 
 Tue, 30 Jun 2020 13:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyumlFzo2DUqNktzirguzAlyAPQFn8TaOIfLX5bHcMtCXo263dv1sp1iQI8Cs0ZPWsxzyNVig==
X-Received: by 2002:a37:5c7:: with SMTP id 190mr21417870qkf.479.1593549948141; 
 Tue, 30 Jun 2020 13:45:48 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id p63sm4107348qkc.80.2020.06.30.13.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:45:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/26] mm/riscv: Use general page fault accounting
Date: Tue, 30 Jun 2020 16:45:45 -0400
Message-Id: <20200630204545.39293-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_164552_618088_00AC9953 
X-CRM114-Status: GOOD (  11.60  )
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
 Will Deacon <will@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, peterx@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
index 50a952a68433..e72cec09d55b 100644
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
