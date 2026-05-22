Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D417BCD5BAF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 02:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GqHfBN0bavgLBmqR3X1mv5HbrCqj8z1Qncjj8t0ayE=; b=vN3Br+68H1s6VW
	6j5QIDpwzFxUz5f7GiDDTtju+4jHgFQEKyGAW8MWqnId6+lzbsfkAusFS9tuTEpNTcL9WAOjhpszb
	QbSNKloMRCiSS0mkZzVmN744cDpd2+JEIuXqMxnOL7G7/IF0x/NJlMOnQ1SuvOYil0L+Sga32AyCQ
	zkE4/dyogcO0R8qEVdQHwCw7Utc3pteILpePmvBoYgL9oD7MLNJMTLWkAav43LQNeqlWrWIP+mHVi
	vwQ1tWRsmmpMagMtujRzDPsoCYGX9AfZ82OjEIX7MVuaLzxJqdw5BwYSXWT2QYP/Su6h6wd7kyHMm
	hKkGr+ihAERaHAtUl0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQG1v-00000009auy-1x4R;
	Fri, 22 May 2026 02:54:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQG1s-00000009auP-3A8b
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 02:54:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E317243B37;
	Fri, 22 May 2026 02:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED551F000E9;
	Fri, 22 May 2026 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779418467;
	bh=6qrGUnO5eE4w5Sno2HJxlsUH4/eLOzh7/tAwH9w7x/Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EpUNuzhETd0ykpxy1efaR/zxcb55+5PwaOXnCs8T9y8D6wnPATW7LEagsLlAN6cfn
	 Yq/naywrJvfvRQahbP8wzMgChkCwc1pSUrNsNq0vjv+JLqLFRBVOJcWXvVEn7qZLlr
	 QOAyhzT+Fa0MfDvRUMPGGOMlPBlcJgjVjt2BTizfL3QsY2yxqN4akenwNhBbe0jRuV
	 MNJdGHBBK15qJvjYyjqXkd5aknfejfEobg/Wqb/hbqerp9C0d1zjXG83P/94YnBrbS
	 sRFrmQgsoQxnu3lz2YfByFaX7uKJ4IQTUU+9THP5okcK3Td0yAhxUE4ZlBxi0gjUwR
	 3lhqSqkdSXBbQ==
Date: Thu, 21 May 2026 20:54:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andreas Schwab <schwab@suse.de>
cc: linux-riscv@lists.infradead.org, Oleg Nesterov <oleg@redhat.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/ptrace: Use USER_REGSET_NOTE_TYPE for REGSET_CFI
In-Reply-To: <87y0hcxuh5.fsf@igel.home>
Message-ID: <0a24060e-e4cf-9659-fa13-77550f7a2c13@kernel.org>
References: <87y0hcxuh5.fsf@igel.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_195428_815510_93B67C99 
X-CRM114-Status: UNSURE (   5.69  )
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

On Fri, 22 May 2026, Andreas Schwab wrote:

> Fixes a warning while dumping core:
> 
> [54983.546369][    C7] WARNING: [!note_name] fs/binfmt_elf.c:1771 at elf_core_dump+0x910/0xf68, CPU#7: abort01/31982
> 
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Thanks, queued for v7.1-rc.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
