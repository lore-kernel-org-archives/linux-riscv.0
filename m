Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F099C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D477206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtzRUfiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D477206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymW6PZ3142LGFFq/u11wXFiTyqtIwCtgUDwJeqgueAc=; b=QtzRUfiwTuI0cn
	C8Mm013lvoaKNSMBjGjxUMXJPBUqQkMDdo092i46pGizBQAbd9tz8ua2rjFutFfx2i8WYM2NmQwpq
	lY5PzDNw4sptVdgqua5VqcfiaT2s/2jWrnKoqQdgFNZK6tW4/iSTNEkjdMPnxQyroUbZQq8W0PA5B
	37peC6Kw+NuLHGSP0uj4zEEzYK9MdmIBn+N24bxCk7HGVjLtet+W1rl7u8HXTssmHw6iv71e8Nmft
	uXY3BKOmLWbBDlYCvPPbQG2qBDozcqbXmo+uFV0StN7zsr/HbYaoUCzxZZ92dbeC3Kb5tpduRzYB5
	55EVmRqSnCEz09pLI6tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7LlJ-0003nT-T0; Tue, 02 Oct 2018 14:34:57 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g7LlI-0003nF-22; Tue, 02 Oct 2018 14:34:56 +0000
Date: Tue, 2 Oct 2018 07:34:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH] RISC-V: Implement built-in command line feature
Message-ID: <20181002143455.GA1476@infradead.org>
References: <20181002140449.24147-1-mick@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181002140449.24147-1-mick@ics.forth.gr>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002143455.fojwFXfW7N02H5p1Ic0EYUZeirv9d96r8wtPre9kJLM@z>

> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
> +#else
> +	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
> +#endif
> +#endif

Why do you need two variables here?  x86, where this same logic is used
seems to get away with just a builtin_cmdline command line one.

Also please don't indent code inside cpp conditionals.

> +	/* When we return, cmdline_p should point to a temporary

This is not the normal kernel comment style.  Please keep the
/* on a line of its own.

> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	/* Built-in args override boot loader args and
> +	 * boot loader args are being ignored.
> +	 */
> +	strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
> +#else
> +	/* Boot loader args override built-in args so we
> +	 * need to put built-in args before boot loader args.
> +	 */
> +	if (builtin_cmdline[0]) {
> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +	}
> +#endif
> +#endif

Even if this seems mostly copied - it probably should be #if/#elif
instead of this convoluted magic:

#if defined(CONFIG_CMDLINE_FORCE)
	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
#elif defined(CONFIG_CMDLINE_BOOL)
	if (builtin_cmdline[0]) {
		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
	}
#endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
