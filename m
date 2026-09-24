Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B412CC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H/KPTP4flMhYKTyA+B3FrZaCb6epdVn6ZjctLmn+KPU=; b=ATeZzdTyrzEHiV
	12aeIIiYm9i4s+2yKGAyfj2dS0p+UJ5YZuCGRWJgvKQ5KsS+ndZXARwCShXEzZFAJtpUo2saxTl9c
	HVHT8NYDwQO+ZU2WUxXMxo+xU/OkqNLq+sR+83yyqzhHgzqcX9cSBY9L//u4tes+9ZEVstU+OaZvU
	u2CBk2hf+SQC0SmQ0xaj+AxlxlZfqY0M6fdkgmqBWNYGGj5aYVvw0GvIzyuiIPc8V7xQKNogucY0W
	5nJqjAK1qJSrYEpovucgAXwLD182yL7No352kCTkdMTymWbhGh09AfWnpwQGSB31FxXXdZu5g68+4
	RS+UPeNIj8/eZtADTOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBJ-0000000AUyu-3q2O;
	Thu, 24 Sep 2026 08:51:53 +0000
Received: from out-12.mta0.migadu.com ([2001:41d0:1004:224b::c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBG-0000000AUxS-3Tq7
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 08:51:53 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CviuPqAogpjkevgINuLKWVWxQ4ifJ0EssNBV97Y1Xro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239906; v=1; x=1790844706;
 b=CpLGmZbHqb8QhRyiT+fqu8Q7FPiKdK6TbvCQ3u2Tcr5McqHtvmrnuUHsPPCu163SdESjyTPH
 ddEbQLOSkWNIvDbgr9it5O6GALD8TP63H7vPtPHabBqIaE3W2axMNjJ42zQQnLzcmhyHqycNiu4
 mk/9CAfm0NAQJFkU2oOmYpPk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3762d0d9dc2c72df;
	Thu, 24 Sep 2026 08:51:46 +0000
X-Mizu-Trace-ID: 3762d0d9dc2c72df
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v3 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Date: Thu, 24 Sep 2026 16:51:38 +0800
Message-Id: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJrktGoC/32OzQqDMBAGX0Vybkqyij899T1KkZisNUUTSWqwi
 O9eIxQ8lB4HdubbhXh0Gj25JAtxGLTX1myQnhIiO2EeSLXamACDnFU8p2EQfW9lraZhrG3zpKp
 kFSuzrEjzimza6LDV85683TduhEfaOGFkF0Nf36FQ8bzT/mXde38g8Cj92QqcMloIkTFQAJlqr
 70203xWGEjcCnAIAP8RgBhIW4lNiorL8hhY1/UDBG2lphABAAA=
X-Change-ID: 20260916-vmalloc_dump_obj-d80908447369
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015151_935256_155C6F2F 
X-CRM114-Status: UNSURE (   6.88  )
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

vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
allocations.

  1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
     and outside the VA lookup range.

  2. The function searches only one vmap node, but allocations
     larger than 64 KiB may span multiple vmap zones whose VA
     is stored in a different node's rb-tree.

Patch 1 fixes the alignment, patch 2 fixes the cross-zone search.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Changes in v3:
- Patch3 drop.
- Patch2 Extract find_vmap_area_lock as a helper to simplify the code.
- Link to v2: https://lore.kernel.org/r/20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev

Changes in v2:
- Use is_vmalloc_or_module_addr() instead of is_vmalloc_addr() to
  avoid filtering module/BPF/execmem addresses. (sashiko-bot)
- Link to v1: https://lore.kernel.org/r/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev

---
Ye Liu (2):
      mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
      mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup

 mm/vmalloc.c | 113 ++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 70 insertions(+), 43 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-vmalloc_dump_obj-d80908447369

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
