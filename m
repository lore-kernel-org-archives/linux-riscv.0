Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7462CC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXvvogh+Y1sS6S/0eQ9qCQGBKnJmP5w4Tg0HdBT3Cf0=; b=Vj+raMnHq1n/ER
	JT9kVAUt+lCzM8ibLnqIFjAUXRU1fQ9lscmto7rYx25IXqJd3KiVZCYhbpxvCPCluBgnWwkuQ9jS3
	NFTAnI65oolr94Ct743WQ8n4JZ2lLhDxmExgCJ8nA+0okY50khaH7GJLGTbINIshSvC1HEehazNcM
	utN9GZNUXgwn2HCmPwdQ0ChKftCE47z8nLNtGzEY3SnQiCFDMO75I+vZkpIg/96qaHqUzW5VGDk8e
	mfofm3C7fWSKti/3TS6YETYnZcab2GoVj0IIYQSlg+hfuwPIqHH3I66oGk0OB1LB+qS8LjqutsHZA
	iVazibR3sS7tik/KFNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjpB-0000000GLKk-1r0E;
	Fri, 21 Mar 2025 21:22:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjp8-0000000GLJm-2HYZ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 21:22:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742592157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oNseWKuGBEgshNs5P0talv9xg+inN17z1K2AF90QsY=;
	b=urekzMMtfA3kTy822lbKa4nufWzR1OXLr8MKXehncBoDdm+XaFkjEu7bTZMYsxv8ltVwoi
	lvGqR9Z+4hyzbhRh4AC896uxdlwHvHw0veohERNmwzCmdAQ04k4q/CHT/60zHV4CdzuzTA
	n6YkpC/n1jRVZjiX3ycpakTyHVyDhKkoHtGemUXzU9umIyUgY056GYou5iCqFHnXf8FjpT
	MXxRYQ9tHrj/Lojkqh8tvOra2HYQEqECrVf9+ATCAHPRq5ctBn54mBq/86YWqdn1cU6oNr
	KT/foI3j5FKmu9mdRZ04kF+JZgKJ/qOzzln5uAjmxECTHSDiRZ7wmLllDx7eaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742592157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oNseWKuGBEgshNs5P0talv9xg+inN17z1K2AF90QsY=;
	b=EZS5gE+VsWIJ5vRL3eP5Jndiht64acIE4ql10QAAbAlD7H53yy7I4AqzDTceNhmWCpRnL1
	9Xun/0Uq9tAy9gAQ==
To: Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Peter
 Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
Date: Fri, 21 Mar 2025 22:22:36 +0100
Message-ID: <87frj613kz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_142238_718792_3C3F462C 
X-CRM114-Status: UNSURE (   9.51  )
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

On Thu, Mar 20 2025 at 10:29, Charlie Jenkins wrote:
> Similar to commit 221a164035fd ("entry: Move
> syscall_enter_from_user_mode() to header file"), move
> syscall_exit_to_user_mode() to the header file as well.
>
> Testing was done with the byte-unixbench [1] syscall benchmark (which
> calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
> x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
> s390 a 11.1328% improvement.
>
> The Intel bot also reported "kernel test robot noticed a 1.9%
> improvement of stress-ng.seek.ops_per_sec" [2]
>
> Since this is on QEMU, I know these numbers are not perfect, but they
> show a trend of general improvement across all architectures that use
> the generic entry code.

This looks sane now. I've bookmarked it as post-merge window material.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
