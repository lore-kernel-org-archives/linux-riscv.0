Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB4C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA902073F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7APirHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA902073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHLxYiesL9ptuAIaICQVMbv/jtf5kxHNGQ6GrNBLCX8=; b=E7APirHs62qn4h
	V4gCpgqX2ZAHD2h7jhJK3wbdLnxmMY2EHf5vCTbYMgtynkhjdeb0C12eGtdrbcmA4ijZ/svno7INc
	1XgvEws6Con1Y+oQ9TJ3JswutwRGHFAKhOnPKrAMk6TzbKIJUd1CzQTI/+G5DVCYytkfqqcnMddHv
	KtNhBvqcd021Uq4thSem5ubi+chcRbGcyCaP67r7XCPqW5T19zQ1rsOWY4B7jbY6Zv794ijwkVogK
	KqJS4k6MmRmlFM8iO1VyMkYfUVYIe3wcqqIRtt2x//ynk+jh5oLq3rPHzCqRN5pamRWpzhf3H0S+Z
	WY0imP8BmX1FEwTc8wVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcN5-0006i8-CE; Thu, 11 Apr 2019 16:16:15 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcN2-0006hc-HI
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:16:13 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5ED6AC3D;
 Thu, 11 Apr 2019 16:16:10 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 2/2] tty: serial: add driver for the SiFive UART
References: <20190411090027.8670-1-paul.walmsley@sifive.com>
 <20190411090027.8670-3-paul.walmsley@sifive.com>
X-Yow: Four thousand different MAGNATES, MOGULS & NABOBS are romping in my
 gothic solarium!!
Date: Thu, 11 Apr 2019 18:16:09 +0200
In-Reply-To: <20190411090027.8670-3-paul.walmsley@sifive.com> (Paul Walmsley's
 message of "Thu, 11 Apr 2019 02:00:30 -0700")
Message-ID: <mvmtvf4ecvq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_091612_714313_6C135F5C 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 gregkh@linuxfoundation.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Apr 11 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> +static void sifive_serial_set_termios(struct uart_port *port,
> +				      struct ktermios *termios,
> +				      struct ktermios *old)
> +{
> +	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> +	unsigned long flags;
> +	u32 v, old_v;
> +	int rate;
> +	char nstop;
> +
> +	if ((termios->c_cflag & CSIZE) != CS8) {
> +		dev_err(ssp->port.dev, "only 8-bit words supported\n");
> +		return;
> +	}
> +
> +	/* Set number of stop bits */
> +	nstop = (termios->c_cflag & CSTOPB) ? 2 : 1;
> +	__ssp_set_stop_bits(ssp, nstop);
> +
> +	/* Set line rate */
> +	rate = uart_get_baud_rate(port, termios, old, 0, ssp->clkin_rate / 16);
> +	__ssp_update_baud_rate(ssp, rate);
> +
> +	spin_lock_irqsave(&ssp->port.lock, flags);
> +
> +	/*
> +	 * Update the per-port timeout.
> +	 */
> +	uart_update_timeout(port, termios->c_cflag, rate);
> +
> +	ssp->port.read_status_mask = 0;
> +	if (termios->c_iflag & INPCK) {
> +		dev_err(ssp->port.dev, "INPCK flag not supported\n");
> +		goto ssst_out;
> +	}
> +	if (termios->c_iflag & (BRKINT | PARMRK)) {
> +		dev_err(ssp->port.dev, "BRKINT/PARMRK flag not supported\n");
> +		goto ssst_out;
> +	}

I don't think it is a good idea to print something while the port is
locked.

And I think set_termios is supposed to apply all applicable settings,
even if some of them are not supported.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
