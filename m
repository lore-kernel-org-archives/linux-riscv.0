Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC12C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 15:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCF920651
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 15:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7JR4j4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCF920651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiyY7dUeeNIDyXl2tZF+VNKyG+PajhBuTWY/7/bkYDo=; b=p7JR4j4GwWYEDw
	YcJjGpNOUnK7J74cR9W1nLz0JzGefMrz7h9VLFSLrVhhe+I+3UkFgOK+4V8uroktmvPhRBHl3gNZS
	aNC1DPXnRbG6liqQ7vhsy+gHwtBcz1jnjosYRyV/j8iIhTgJoMILxcJpcDkF2awMCKv9EBujzGZzj
	/ty+TvO+xYzHlMqnd82jzDnAU+4R6D8WlJunnegYaazFC8iLLXVN920lQn05LRjmi5Nd0F0KHV1yJ
	Os4znDIG+hU6E31hlkWDxST9CMhZcrdwFgPqIQZYKRoG5KwsoGuevXMpkwQBzE3mj4xlYYUCS49SR
	FUN9vY1hrNNp6Z+FGQKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huf2T-0004XU-4N; Mon, 05 Aug 2019 15:36:45 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huf2L-0004DH-Af; Mon, 05 Aug 2019 15:36:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8610FADD9;
 Mon,  5 Aug 2019 15:36:35 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: Random memory corruption with v5.2
References: <mvm8sshcdwc.fsf@suse.de>
 <CAEn-LTpM-0TMxkNNh6nnLH9Bnr9Zm+VFLf=z1y9sER6RXrQooQ@mail.gmail.com>
 <mvm1ry8au3f.fsf@suse.de>
 <alpine.DEB.2.21.9999.1907301709510.4874@viisi.sifive.com>
 <mvmwofw68ji.fsf@suse.de>
 <CAAhSdy0ZPk1So_ieahn5dVaye1WajRmwkYHhSox4FcvuOuZchw@mail.gmail.com>
 <mvmmugn4sd4.fsf@suse.de> <mvmimrb4r5q.fsf@suse.de>
X-Yow: I have accepted Provolone into my life!
Date: Mon, 05 Aug 2019 17:36:35 +0200
In-Reply-To: <mvmimrb4r5q.fsf@suse.de> (Andreas Schwab's message of "Mon, 05
 Aug 2019 16:34:41 +0200")
Message-ID: <mvma7cn4oak.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_083637_543432_9C18B949 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 OpenSBI <opensbi@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This helps too:

--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -50,10 +50,11 @@ static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
 	cpumask_clear(&hmask);
 	riscv_cpuid_to_hartid_mask(cmask, &hmask);
 	sbi_remote_sfence_vma(hmask.bits, start, size);
+	local_flush_tlb_all();
 }
 
 #define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
-#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
+#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, (addr) + PAGE_SIZE)
 #define flush_tlb_range(vma, start, end) \
 	remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
 #define flush_tlb_mm(mm) \

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
