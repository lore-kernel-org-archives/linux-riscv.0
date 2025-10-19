Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4424CCD195
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 00:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClltFEFxFyCbGXxXM4y285AjuVgMhBCZ5/Zvlq52vGM=; b=ul6i1ln3Q8uAwu
	az0XO9ABk8FyAIAPTbNsAoVyt7LDCoUMJMG9fPVnTtSPci9WunCnqfB5hyGsWXut5kFPBWFNXLKT0
	qo3h3E7CuzU0LSeTu3ZGJnSqtiPqY3Kigew5t+PAMLeZqUrjWbtU0Gf4IbRMSMBCcIoU5Pp/Hk1xe
	YZx9u48GtLlVXJfZkNzw0Pb07ct9kctcYBjHCBhW8uqBs8aU0DzRNHRmcu4HiLaDGkhKOfnFPw0Yx
	mOlDgDp51l/clGtVkcrkV+5h3N6GyTJ+nbK2sIBZqG4kSOUmO0W+dtCB0OLlxwcYqLkyOlFj6TtNh
	JCiAB5G0zZGqcUPoa2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAHBa-0000000AZTt-1tOc;
	Sun, 19 Oct 2025 00:22:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAHBY-0000000AZSV-0qbK
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 00:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18DDD43DE8;
	Sun, 19 Oct 2025 00:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8990EC4CEF8;
	Sun, 19 Oct 2025 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760833315;
	bh=/DQSoeqMlzJoPx5szU4pSCM9zENLUWybjjLypAojtB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kg8hymdX+9c7oqXIk/+/K76L2dCjpX7wHjcu/QUTDyJsZpiC/QH05mDPUhOuBNA8a
	 kzvRfyrUif8eT28L2+JVVK+C7XV+PYR3AX0jjEtBQj7LQKZWxB6MeyGl8+QxIJZyIt
	 KePDz513qfXYyOag1Inb/Yr6poJ4Qn0bRRWn9djuLJMAJhDF/Sh/LPahMjU9nGfHI/
	 wd8i4NMnZwp1gZWlnR+81SgnwBSXYDsYeW0/+pP5JjBkSDmkUFsHfTdnHV8P18qQ/N
	 CljPn1RgqDTcTh29FqtQDCLy54g2SR6cWq27st0vWgX2Iqwx4oo1PxEhPVDgxR3MMW
	 d4z0ZYL7zvjOw==
Date: Sat, 18 Oct 2025 18:21:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Josephine Pfeiffer <hi@josie.lol>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: ptdump: use seq_puts() in pt_dump_seq_puts()
 macro
In-Reply-To: <20251018170451.3355496-1-hi@josie.lol>
Message-ID: <2eaeaa69-b2cf-3a3a-0239-2aefcaa836aa@kernel.org>
References: <20251018170451.3355496-1-hi@josie.lol>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_172208_254560_7E8D6276 
X-CRM114-Status: GOOD (  14.19  )
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

On Sat, 18 Oct 2025, Josephine Pfeiffer wrote:

> The pt_dump_seq_puts() macro incorrectly uses seq_printf() instead of
> seq_puts(). This is both a performance issue and conceptually wrong,
> as the macro name suggests plain string output (puts) but the
> implementation uses formatted output (printf).
> 
> The macro is used in ptdump.c:301 to output a newline character. Using
> seq_printf() adds unnecessary overhead for format string parsing when
> outputting this constant string.

Hard to accept that it's a performance issue.  But I think you're right 
that generating a newline should be done with seq_puts().

> This bug was introduced in commit 59c4da8640cc ("riscv: Add support to
> dump the kernel page tables") in 2020, which copied the implementation
> pattern from other architectures that had the same bug.
> 
> Fixes: 59c4da8640cc ("riscv: Add support to dump the kernel page tables")
> Signed-off-by: Josephine Pfeiffer <hi@josie.lol>

A better fix would seem to be to just get rid of pt_dump_seq_puts().  It's 
only used once in arch/riscv.

Taking a broader view, both pt_dump_seq_puts() and pt_dump_seq_printf() 
look completely pointless.  Is there any argument for keeping them?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
