Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122BEC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 02:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOW5iCitZhzVP9gWgjO/+KiCVMzo8rDzTZWpwR6pdfA=; b=ZEm5p2WId4DEtu
	06neOHEGYkg6LWudVws48hcmuV64kr7YggXseLtMWTnLH08hEDpIJAJ5bcBJfAQ+N8W4CeGdcmooG
	HiBzAT3TtLWWfOkbbOYyOMAz0lrPu+V1kZVO9xF64VM169Zm6YT49XFP6VjEvzrCybWHimHJn86Am
	EUf0bll/8SSDMuN/WMFJ6DMt4GQOeXg2fZVKgXu8mQZ6zUFe0PeSRCJsjvpvijK4wt8Eds+SGfvVA
	kL2CYk6jGcsUyNpHG0gvzSQpdjO0wVk2DDnzIJTFUhg9cFW7JAkCSeHST0wU2VbEETSNrG1wCYO9Z
	k812bFWiEvoAiEhWbexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTBD-0000000AmOL-27KV;
	Tue, 14 Jul 2026 02:47:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTBD-0000000AmOD-0JkK
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 02:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C04C6013A;
	Tue, 14 Jul 2026 02:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B821F000E9;
	Tue, 14 Jul 2026 02:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783997249;
	bh=0fceUV7xDfsTEP1Ag2cwz/O1er8mo7XMPjMZGcxSXxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ErtBlSxbFig77uXtMf621X5RdDuRhWHUjt7hMOeHELxQxcisQ5B/fYECZ1XjExqvd
	 VIQGSA3EkKwddqOWsvHLC6SmRQEML8KXEwW+8azzvsq2dZ04SLaNFXG+GTO4qK4OF/
	 C6y79nlvshfE/q+juch3XG3CA8qwG4N2lGevwaT7H0fOzG05QBtXCjHEYZlu20lj+d
	 TPczDJOC5DwThg8S6EgGn+bxgY8QQGhE80rC02dojEzThnOA4R8vvhIJQEMo3ylOHH
	 8VuXFAMd2Px4+5PgFhW25et6i4tFgHlmOxfcftPRH00jDqrYtOeZMach13d9HAPW7r
	 XZICD16Dukfmw==
Date: Mon, 13 Jul 2026 20:47:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zong Li <zong.li@sifive.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    debug@rivosinc.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, re@w6rz.net
Subject: Re: [PATCH] riscv: cfi: reduce shadow stack size limit from 2GB to
 512MB
In-Reply-To: <20260522093634.3530233-1-zong.li@sifive.com>
Message-ID: <bd530966-3cb1-111b-c624-7c57956c8a60@kernel.org>
References: <20260522093634.3530233-1-zong.li@sifive.com>
MIME-Version: 1.0
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

On Fri, 22 May 2026, Zong Li wrote:

> Change the shadow stack size calculation from RLIMIT_STACK/2 (capped at
> 2GB) to RLIMIT_STACK/8 (capped at 512MB), following David Laight's
> analysis and recommendation.
> 
> Rationale:
> 
> David Laight pointed out that the focus should be on the ratio between
> shadow stack size and the normal stack size, rather than just the
> absolute upper limit. His analysis showed that while there are many
> functions with small stack frames, the majority have stack deltas of
> over 64 bytes due to saved registers and local variables.
> 
> Shadow stacks only store return addresses (8 bytes per entry on 64-bit
> systems), whereas normal stack frames typically consume 64+ bytes. This
> 8:64 byte ratio means that programs using a lot of stack space are
> dominated by large buffer allocations and local variables, not extreme
> recursion depths with minimal local data.
> 
> For example, with the default RLIMIT_STACK of 8MB:
> - RLIMIT_STACK/2 gives a 4MB shadow stack supporting 512K nested calls
> - RLIMIT_STACK/8 gives a 1MB shadow stack supporting 128K nested calls
> 
> Given typical stack frame sizes of 64+ bytes, RLIMIT_STACK/8 is still
> conservative and provides adequate depth for practical applications.
> David noted that this could even be safely halved again.
> 
> This reduction also better accommodates memory-constrained platforms.
> On systems with limited physical memory, allocating large shadow stacks
> can cause virtual memory allocation failures when overcommit mode is set
> to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Link: https://lore.kernel.org/all/20260518105725.7afe7a4c@pumpkin/
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
