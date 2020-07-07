Return-Path: <SRS0=Os/g=AS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D5EC433E4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 22:51:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717612075B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 22:51:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzF1/ahU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HX0enkAR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717612075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9/5ZJcgH0QF7JWhyZ0ZQJl3mDU+iTlSQc14EqhiM19M=; b=DzF1/ahUSsX6vewWEJ7Wl/RCd
	CXOB1JRi/QBlhmSiUoXVtjUM3eprtV27pbWo3hASUCTVzgMR0cLYM0U/6JDS8ews/gf1NLP/DmrBH
	l348KV17W0MdcZX30fXSi0pwmCVbQm6IKG8Vg4NW+Qyfor+Z8bddEG8bLXZY9SGFVeDLn9sOaTHlq
	vGtLVvZ/M8E2DnPLgvRIEoLqL72+0cXDVwlAXmzJjRQPIsOdcDyvcCAbS9JVobCcwIWh9x9RUKObw
	YIlLwZlge4lls5aRyy8oQ5bUAGl3B+XWvixh2ykJvjipGI9yoWkLuePw1uYN5UmNJABfPOs/waF10
	ruWFcIt1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswQV-0006DF-FN; Tue, 07 Jul 2020 22:50:59 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswQT-0006CG-7j
 for linux-riscv@lists.infradead.org; Tue, 07 Jul 2020 22:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594162256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=118ZuGBADe17DIOE5hd4LPbyDCcCNPIhXK0NF+I4+G0=;
 b=HX0enkAR0yDxMdka+3xuVQTrKTYoqGrtM0Gar7HLKEGZuQuPey2dShdBW9B9CpFt7u7/mB
 SELh1/ip4gOTgD5v8eWLjKNDblz9YhH1q7l0oB7ChC2168JFToxDkXX11kgytT3l21Nter
 DDUM7uVudKmkAHwLrLwYoqpgiPH25TU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-SWIeYkFYNFq2LJ0lUHRhXA-1; Tue, 07 Jul 2020 18:50:52 -0400
X-MC-Unique: SWIeYkFYNFq2LJ0lUHRhXA-1
Received: by mail-qk1-f198.google.com with SMTP id k1so26405259qko.14
 for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2020 15:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=118ZuGBADe17DIOE5hd4LPbyDCcCNPIhXK0NF+I4+G0=;
 b=faWzXpk8tRzssQnpe2dIgnn8Hph9qksUicvkjLNzuw6f5ojCKSPm9UD5SdESIfqLvD
 XUSmd6z38q0te2Mc22rPhAAjssRUZqZdEW7KJ27YiEYNMjP65K+8Ps9Jp1eaUvj1N8qJ
 yelKzNLMoUg+aY7bApmY1eoc2IlbkQXogLbPO6fjFD6JDNtS93lxFfVdbnau68VQUUq4
 6QfNwOV3+/rbkUynlcd1aiyz+P+oTCNr3M70RYmcuFd2+ul7U6wImHfNdCnCuBp4OBKa
 lVOP1I+0lF3ixzJVOitJZJ/oeSXxMQ8ZMZPSqmGdo+CVaaVhqe0oBctX2GVW1W17lMwj
 wLoQ==
X-Gm-Message-State: AOAM533Xsdq+oQVU/hxsyzGyFmlCxubZhiIY/nqpBScA7zzAIXyYadRX
 2tp91qbetlDnw6j4LhvX1JmgASyh3vNramNDRoojcRMUJRIRKKEib0bcxbPdnwjZtgMkIGnmfWT
 AHxlT8/H96G/H5F4lEXeam4aP6uL7
X-Received: by 2002:a37:b141:: with SMTP id a62mr48028569qkf.201.1594162252350; 
 Tue, 07 Jul 2020 15:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK7Y2DUfTKdLNV2DO9bFAUkgaqmVbLuA9xFf6I5zpI0aGjlm1MfWvVmwIY/UB1dT9vqIFjlg==
X-Received: by 2002:a37:b141:: with SMTP id a62mr48028550qkf.201.1594162252137; 
 Tue, 07 Jul 2020 15:50:52 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 15:50:51 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5 17/25] mm/riscv: Use general page fault accounting
Date: Tue,  7 Jul 2020 18:50:13 -0400
Message-Id: <20200707225021.200906-18-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_185057_347504_D2996D6B 
X-CRM114-Status: GOOD (  12.08  )
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
 John Hubbard <jhubbard@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, peterx@redhat.com,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>, David Rientjes <rientjes@google.com>,
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
Reviewed-by: Pekka Enberg <penberg@kernel.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/riscv/mm/fault.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 30c1124d0fb6..716d64e36f83 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -109,7 +109,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, addr, flags, NULL);
+	fault = handle_mm_fault(vma, addr, flags, regs);
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
@@ -127,21 +127,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
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
