Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDD6C54E67
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySGsj6kCyAZbohcJ9dEyL9aDUOy1LfuXsCVcuAwyEy0=; b=D2B+7eHvQ6Dxi8
	MFcpEO4G8p4PXbTCeu2iSGKlw8i4vtExtE0WrzC9wg5UrkinakUJHgUjAjNCn7HaUiQsFFcMxBfIu
	yDGtYboQAI8T5aHdSfIx1BSn9twrpMnRbs/8uc0v54FFqpUerGnQoIuce78+3n3KmysnvqfQGZcad
	X5xh4yclQmcRpZBGbG22gqu5cbMLSesz4dMY2lVRR3zF2AE/Zb2+GhrolKk7mXlufMx3+pZ3U60S2
	/ScaPa3hxN00Emeh49lE6DBApsWBVEdHFqA2wcjncfSVD+jnTNHOSvoIOJiFfMEnJRGICSZVXSq6Z
	FHbJrzxWMNJSh6vJ0BxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roApq-0000000BOlP-0At5;
	Sat, 23 Mar 2024 23:31:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roApm-0000000BOkF-3SRY
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 23:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63412CE0934;
	Sat, 23 Mar 2024 23:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC63C433C7;
	Sat, 23 Mar 2024 23:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711236687;
	bh=zaCzTXTmfGaOIRrExHx7AGoKpSQHIl2a+NZcwpR6yNg=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=B+CT/nGKhqVVameavzKkjzu7u2X4gajroTTT/+9VaH8ooN8jgr3lBp9AdNC2aoCgd
	 kORqLGS6Sb91q55FOXkNLnRjnRAYKKhEUNsJndVRAjnxEjlYQZEI9A3IvT5HyIEbko
	 CBHJL+hMcBuZTXCdXE+FQZUVRop6QsIJjso8TMh4KTniE9zxoZzRK4hEkrVUxTcQ83
	 +sEQf7sSKFkvoVHN8oM5BHI1ShLRhgtnFiIkSvYdWr2fwihvXRZLd2Zu53QE4A3dWd
	 daE/S8+bPPNci8N927EFua7d8rek8C3Ov3g3xelOYZNJoAedMQXpfXXuzDEz9RL8Nr
	 sB/UNVvMbWksg==
Mime-Version: 1.0
Date: Sun, 24 Mar 2024 01:31:23 +0200
Message-Id: <D01IRZK3V45H.3594SKXE83TN9@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240323232908.13261-1-jarkko@kernel.org>
In-Reply-To: <20240323232908.13261-1-jarkko@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_163131_131744_37042E85 
X-CRM114-Status: UNSURE (   6.86  )
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

On Sun Mar 24, 2024 at 1:29 AM EET, Jarkko Sakkinen wrote:
> Tracing with kprobes while running a monolithic kernel is currently
> impossible due the kernel module allocator dependency.
>
> Address the issue by allowing architectures to implement module_alloc()
> and module_memfree() independent of the module subsystem. An arch tree
> can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
>
> Realize the feature on RISC-V by separating allocator to module_alloc.c
> and implementing module_memfree().
>
> Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

As for testing I tried the kprobes example for boottime tracing
dcoumentation:

https://www.kernel.org/doc/html/v5.7/trace/boottime-trace.html

I.e.

ftrace.event {
	kprobes.vfs_read {
		probes = "vfs_read $arg1 $arg2"
		filter = "common_pid < 100"
		enable
	}
}

kernel {
	console = hvc0
	earlycon = sbi
	trace_options = sym-addr
	trace_event = "initcall:*"
	tp_printk
	dump_on_oops = 2
	trace_buf_size = 1M
}

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
