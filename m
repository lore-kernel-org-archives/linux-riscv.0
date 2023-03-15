Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAC9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNi9ixNkzgNhjQA9XGKOSFxej+gdLCWgmDY2Rd9ua+4=; b=sLOCvdSqHjZFpW
	n91li0rWM8CRn851aDlZ+EcwOYDcxBF7wY7okuDn7SZ1NBRkyf6oRJhBVbwF7Q1h6B0vJUUw9mHCp
	KeusitsGHp8Ox8YDViuQ4GjAk1V/sDM9IC6e/vX2MTUTtbpeSJVlPPw1Jvf1OV0Juw0RC5yXF6ea6
	VslLywbvhpOfsuST1fz8GFhZDqrI4GaFY8w+HT8tyq3sUm2px42+q/CogzXfKVAUIm+z4vuu8vIFH
	1p1mqfIIRtJrn7BKM4tFbKWcrf2DKhdqPVjW/WAeMEcIDhzSeruQaelH7E/nz1dd8NERRqTWM3D+n
	sqnPeK+YWhOYAG4KaqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJHd-00CKfl-0Q;
	Wed, 15 Mar 2023 05:02:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJHb-00CKfP-2h;
	Wed, 15 Mar 2023 05:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ahxRYQ1+4b3SShQsQkAVmdrJ+ZogUunkpbD0sM5voZ8=; b=gFvcXaDvg32/Hvg3izMFoYnjbm
	WPV+qU1/4jrUVdF9F8CNR2FIHFUFZ/glIL6SJRcsY6dR+lSG8wfJcv/IXZvNzknTHpVRTBX+4en9f
	iTOA2K6hJ75j2VLawDl6xrHMX9M75dBvPoL2YHgQY1rJg7cZOlKwKz8w9eBL0c4L6TlUsIfUKZBW/
	gqN2tDHzYjKaaaoxmDdhsWomPM0m/lcKqQxJ8OAbW4uGDWXCrkximAdJYy2ciJGhPiR23NTqKRd8S
	vwSp6d+kxVGIWzJDBtLh/AwELdoIvhB0G0w89CmpDtVa8mGEk79rLznUTMaVXFnbShCgFTi8uHwDR
	649jEg5g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcJHZ-00DXlj-8v; Wed, 15 Mar 2023 05:02:37 +0000
Date: Wed, 15 Mar 2023 05:02:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v2 1/6] riscv/mm/fault: simplify code for do_page_fault()
Message-ID: <ZBFRbVJDK8p5nelT@casper.infradead.org>
References: <20230315030359.14162-1-palmer@rivosinc.com>
 <20230315030359.14162-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315030359.14162-2-palmer@rivosinc.com>
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

On Tue, Mar 14, 2023 at 08:03:54PM -0700, Palmer Dabbelt wrote:
> To make the code more hierarchical and readable, we fold vma related
> judgments into __do_page_fault(). And to simplify the code, move the
> tsk->thread.bad_cause's setting into bad_area(). No functional change
> intended.

I think this is exaactly the wrong thing to be doing.  Please _stop_
using custom internal VM_FAULT flags, not adding new uses!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
