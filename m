Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06EDC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpoBkJoEDd4ZH/OMz7fCzVeM+nWf/RcjKSuIkWkuH0s=; b=UoBzHqO0tEqEox
	YUfyo4fVGqDaMONArubM6icusXZW0lp5YeDCVoEXGydxsa+gBRVSEFVmI+zjS1e8aeqMGfQoiGo7x
	28PdDsfIXp8ULTNU2voucAr7/BO4uA4ONDyQIOgQIok9qyyb+q0G51HOan9aDXri7W9hMxTYw32sV
	zJoyMXhm9fVqMiEwui0sk6DTGgKQrVgh/JkXwpAjEdE5soskg4Eg6uNTaSRvWH2IHxcXIqvcwYk6J
	6uoavMdHSYyr0mFRWu7urTTxmhxQkF5VpuByhDA1s4ycgCvM9+dqiqBCdhVQvBWK+oJuC+cXWdP8M
	1MXrT2oCIjjpsNhIilMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfAN-002DF3-Be; Mon, 28 Nov 2022 14:31:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfAJ-002DAL-DF
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:31:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 52D6BCE0ED9;
	Mon, 28 Nov 2022 14:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8F8C433C1;
	Mon, 28 Nov 2022 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669645877;
	bh=o6vs9x16gtpUsWQXrNUt1RAdeTIsOsJrIh1//CI7WcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvl/V8Cdke02ytFWeQMSOfxV3zHGc1NmsEpKtrNhyfgGO1lEP62W2rmIndHnkful9
	 lDAHRxaTVcId6ZfW8aNbYOBso3/cQccmdpjo1ztEEqiWLPfaGwPGlWYeR2imhWUSy7
	 rSXLFrTckP8/lbRuNZuwnaqZ2eGH66mZ3Kl3WFyzSnGlGJCsr2eBMKdKhfBsdd/76S
	 n98FZztU6y9Btv0HpPpxEy0FfVIUPvSXLpEMKttXHdLtim9fhJ1rnUE9S5YXj5OEV6
	 01bOaG93q2gw3gOPcdhXAQW4QcXmjg/Uu/C3zrcERB5q3obnQwXku1CjvvpX4fDOf1
	 AJ27pLmtsPKzA==
Date: Mon, 28 Nov 2022 22:21:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 2/9] serial: bflb_uart: add Bouffalolab UART Driver
Message-ID: <Y4TD48v84CJcMS+S@xhacker>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-3-jszhang@kernel.org>
 <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_063123_672652_68EFD37C 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, Nov 28, 2022 at 07:10:41AM +0100, Jiri Slaby wrote:
> On 27. 11. 22, 14:24, Jisheng Zhang wrote:
> > +static void bflb_uart_tx_chars(struct uart_port *port)
> 
> Again:
> 
> Are you unable to use the TX helper? If so:

You know serial subsystem better than me, may I ask for more
details? For example,
Besides uart_xmit_advance(), do you expect other TX helpers? If yes,
can you please list them?

> * why?
> * use uart_advance_xmit() at least.

Do you mean uart_xmit_advance()? in the do while loop below?

I'm not sure I understand the meaning, correct me If I misunderstand
something.

thanks
> 
> > +{
> > +	struct circ_buf *xmit = &port->state->xmit;
> > +	unsigned int count;
> > +
> > +	if (port->x_char) {
> > +		/* Send special char - probably flow control */
> > +		wrl(port, UART_FIFO_WDATA, port->x_char);
> > +		port->x_char = 0;
> > +		port->icount.tx++;
> > +		return;
> > +	}
> > +
> > +	if (uart_circ_empty(xmit) || uart_tx_stopped(port)) {
> > +		bflb_uart_stop_tx(port);
> > +		return;
> > +	}
> > +
> > +	count = BFLB_UART_TX_FIFO_TH;
> > +	do {
> > +		wrl(port, UART_FIFO_WDATA, xmit->buf[xmit->tail]);
> > +		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> > +		port->icount.tx++;
> > +		if (uart_circ_empty(xmit))
> > +			break;
> > +	} while (--count > 0);
> > +
> > +	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
> > +		uart_write_wakeup(port);
> > +
> > +	if (uart_circ_empty(xmit))
> > +		bflb_uart_stop_tx(port);
> > +}
> 
> -- 
> js
> suse labs
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
