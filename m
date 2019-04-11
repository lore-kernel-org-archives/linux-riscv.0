Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3D4C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:13:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8436621850
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 21:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btCmUhgh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gHdiPvs/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8436621850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1JDx2SzyJtwT/OXKdJdYt8yoV3DczLQseSZn4kPVt8=; b=btCmUhghbLqPp4
	qPUloPidzakjHC02jWTWS7r9kMonZYmE9hsQi4CSnZVj2OgLw6cluIEdb56ZxNgQRwk7/5yu/v/QR
	2opC1IXCjOe3V32BADc25Xc3mw+UIhFsYTOklbvZ6MC+aMS54z2UKMdcgHlnEO28MqAw9kIDKTM7a
	tYaTmFhyDlOoYZkYD5dQ0suKeJR/RpYO1T5E1XXLfVoL+9cHl8pUzymVrjK2DTjifDNphNx9jhOOZ
	ei1tXnplztm8sLmVZ99NvHbtv/YHiNtiVPm5tMGWZ5IB0P+cTdjUKLTHUnrfL6MHquA0LXpGsTcCN
	FpR9lkSYG/FhdjEsxUWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEh0k-00087P-9b; Thu, 11 Apr 2019 21:13:30 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEh0g-00086l-Sf
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 21:13:28 +0000
Received: by mail-it1-x144.google.com with SMTP id a190so3794100ite.4
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6qx4oaDnhlAJm0gPbdRpHZo/sIlRW/ZqdOGZf+3EXyw=;
 b=gHdiPvs/z5uVjxn93EE9Y7hMgiKe3l23ssSQ5QcR2pSngVy9C6JkSBacoWdbgR+1DZ
 FLZd9pBlNLZsy5GlUNWYo00QOyHiG7MlTeqxuJ3Z3VPhUKpQhWDB3TaRdFIOoAA4f9Y2
 KMm4cTGFo7cg1du/FwVDao1EMuZIB4ssOezbqks5pbb+fEPzKN4PylwxLXlBYoz802V/
 PYLaQLVpmkz5YkSpjdYbcIEi2MPTHo8m39jVin+Oj1qYu8huzF6D1MswlxuqVurUUpDk
 4hLwCN0VVPl1NW5xVWbg6+ZgvCpRZPLlF/VWLKx9aDzIqSMHpmdgV+cbr0ddF/7ZutPr
 X5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6qx4oaDnhlAJm0gPbdRpHZo/sIlRW/ZqdOGZf+3EXyw=;
 b=tKTevdqgBZS6Jp0EMFLSnP1GMAp1wdIfoyvMxQfSugPPUTIwXb1DV7Z8Of6+DZFmj6
 t80PiiSHXgU2kWic2vHsXaORHGHGULprXx/lyrASyNwIOd5NlqSHWMTwZqljqxBTDbkR
 BelZDqoy93hWwhMQI7sSkk38IMh8zK0FfkKSZigz21yRnQK68V+TtB19H45ldXkHS67S
 8UcQQgnhsTA8Zotkt77LU2IxaGBBHvWHW1l+UDaxLOx0GPgjEWix9wbsnoy7gtPBqxN7
 TrufDxfPl+BYpKANNGVC5xxlgumjsj29veTFK+KHRwvg+4daBPnNc/2aSd5kgiqJqD4a
 XXpw==
X-Gm-Message-State: APjAAAVPgxpZiet0VFUHLIQxFA5wb6Qx70dIf4QzO6qJHGeV8G8jqboE
 3FwhptaEiIGCgFlopXJLLY4mGg==
X-Google-Smtp-Source: APXvYqxLoJaQYhkEB8QLVPaPigcYEdRxkEBX2VRIdVSwPKju3j2jH3/Q+K5LfItzmtw8C4hjUHXccw==
X-Received: by 2002:a05:660c:78e:: with SMTP id
 h14mr10028752itk.49.1555017205762; 
 Thu, 11 Apr 2019 14:13:25 -0700 (PDT)
Received: from localhost (63-238-229-145.dia.static.qwest.net.
 [63.238.229.145])
 by smtp.gmail.com with ESMTPSA id 67sm3261210itz.37.2019.04.11.14.13.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Apr 2019 14:13:25 -0700 (PDT)
Date: Thu, 11 Apr 2019 14:13:24 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v4 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <mvmtvf4ecvq.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1904111412210.19990@viisi.sifive.com>
References: <20190411090027.8670-1-paul.walmsley@sifive.com>
 <20190411090027.8670-3-paul.walmsley@sifive.com> <mvmtvf4ecvq.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_141326_929061_A883FD64 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Wesley Terpstra <wesley@sifive.com>, gregkh@linuxfoundation.org,
 Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019, Andreas Schwab wrote:

> On Apr 11 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > +static void sifive_serial_set_termios(struct uart_port *port,
> > +				      struct ktermios *termios,
> > +				      struct ktermios *old)
> > +{
> > +	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
> > +	unsigned long flags;
> > +	u32 v, old_v;
> > +	int rate;
> > +	char nstop;
> > +
> > +	if ((termios->c_cflag & CSIZE) != CS8) {
> > +		dev_err(ssp->port.dev, "only 8-bit words supported\n");
> > +		return;
> > +	}
> > +
> > +	/* Set number of stop bits */
> > +	nstop = (termios->c_cflag & CSTOPB) ? 2 : 1;
> > +	__ssp_set_stop_bits(ssp, nstop);
> > +
> > +	/* Set line rate */
> > +	rate = uart_get_baud_rate(port, termios, old, 0, ssp->clkin_rate / 16);
> > +	__ssp_update_baud_rate(ssp, rate);
> > +
> > +	spin_lock_irqsave(&ssp->port.lock, flags);
> > +
> > +	/*
> > +	 * Update the per-port timeout.
> > +	 */
> > +	uart_update_timeout(port, termios->c_cflag, rate);
> > +
> > +	ssp->port.read_status_mask = 0;
> > +	if (termios->c_iflag & INPCK) {
> > +		dev_err(ssp->port.dev, "INPCK flag not supported\n");
> > +		goto ssst_out;
> > +	}
> > +	if (termios->c_iflag & (BRKINT | PARMRK)) {
> > +		dev_err(ssp->port.dev, "BRKINT/PARMRK flag not supported\n");
> > +		goto ssst_out;
> > +	}
> 
> I don't think it is a good idea to print something while the port is
> locked.
> 
> And I think set_termios is supposed to apply all applicable settings,
> even if some of them are not supported.

Agreed.  Thank you for your help debugging (some of which was off-list).
Clearly there should have been a build-test with lockdep enabled. 

I will send a v5.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
