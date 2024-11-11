Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B819D3ABD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVuvWvG+Y09+TgG0qc6uP45EenAOfChbnkhLwF1bFdo=; b=S+s9MFTzZ/VjEM
	81Mq4FutRpLv73a7U7GC3uibhRtVNKUDOu+LhaeUOZ6zuiTDdrDUzETMGbzLT7ZZX3pY80w7AUk5v
	cqxuzvl1gEjIRK5gaRNp8PHWxBZvZ1xdSEwqhFpg23Ra7wDABgLTGkhX9O/JgR7FAz9lsnKC7Offz
	KwLZ6wRwH5FIXGd6jt9MMqFw2q2XNl/bCp5a7QO96aYlM87l3BeSactZirs8VRAblfPt8hIrNCp+0
	dM8oJgcrsJESn2Gvw3Xibps+THnZt5A93gAN+0Aomabi8+gTmmZRrLjN5fdhTj08idZi2DCxhCWhj
	BBpMdJp3z17ujeYU+MJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXVQ-00000000cJG-1jfz;
	Mon, 11 Nov 2024 16:43:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXVN-00000000cIA-3kBA
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 16:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 841D85C548B;
	Mon, 11 Nov 2024 16:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4B0C4CED5;
	Mon, 11 Nov 2024 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731343388;
	bh=8LcuKBa4qQ//6vbLQtCbLIDn7Tu0SEyNaNQfDlz9+W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsUWRn5pQ9zAC+vEhSOk2nBLpS4RtWPGeYp58OoprG91H/lXfGr8fsrwrWCooDlHH
	 lt/Xm59Tj1q/Ulh309ingSrN0Ss6wiMuJnllOp9K9mMH7RsEorG5bz1bB4tIXZOivt
	 +mgoJyNBIKihujDaq0aQS0sDS89kOm4sHb9PxwWg1WZuK65C85ya+QtwqxSCFd3+SO
	 VLXSxq7SnJpAbc4JyYoGWbiMitxQW0PAxG54qACqB2jnl/jXw3PEU8yoqxQ+fTJ7/a
	 Tvk6sUDJSM4ss+TKDp0yD0NVXRRzojCU/z/5z0+iKjBmOb7KkHkgXV+ODF3NVGD773
	 pM2jefdJJcPKQ==
Date: Mon, 11 Nov 2024 16:43:00 +0000
From: Will Deacon <will@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <20241111164259.GA20042@willie-the-truck>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103145153.105097-14-alexghiti@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_084309_998089_8839CC7F 
X-CRM114-Status: GOOD (  17.08  )
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

On Sun, Nov 03, 2024 at 03:51:53PM +0100, Alexandre Ghiti wrote:
> In order to produce a generic kernel, a user can select
> CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
> spinlock implementation if Zabha or Ziccrse are not present.
> 
> Note that we can't use alternatives here because the discovery of
> extensions is done too late and we need to start with the qspinlock
> implementation because the ticket spinlock implementation would pollute
> the spinlock value, so let's use static keys.

I think the static key toggling takes a mutex (jump_label_lock()) which
can take a spinlock (lock->wait_lock) internally, so I don't grok how
this works:

> +static void __init riscv_spinlock_init(void)
> +{
> +	char *using_ext = NULL;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_TICKET_SPINLOCKS)) {
> +		pr_info("Ticket spinlock: enabled\n");
> +		return;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
> +	    riscv_isa_extension_available(NULL, ZABHA) &&
> +	    riscv_isa_extension_available(NULL, ZACAS)) {
> +		using_ext = "using Zabha";
> +	} else if (riscv_isa_extension_available(NULL, ZICCRSE)) {
> +		using_ext = "using Ziccrse";
> +	}
> +#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
> +	else {
> +		static_branch_disable(&qspinlock_key);
> +		pr_info("Ticket spinlock: enabled\n");
> +		return;
> +	}
> +#endif

i.e. we've potentially already used the qspinlock at this point.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
