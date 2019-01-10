Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F8FC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 20:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB79B20685
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 20:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nh7Sg7dc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="glH1iuYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB79B20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zDgKlewtJuHn4m8d2TDGxoYJebIxa7XPPGwHi6Od5Vk=; b=nh7Sg7dcdoN5IsP+h52x5pEL0
	auiznTqx5mh3W10XjEFkdlNPcfadO7WLfgZKyCnf/Q0pRUcHanvXl5tEY0PH7g7oDJxpTulQ5h1cR
	vpaQAZELkQMxwkBsm6OBfUZUVwcR9uOlPqe1ySo+CrD32MXIgK+NiqWqWacYggYJVjj0RFPH2ifZZ
	cmz2UdFuG2dG+vWCmWLToUv31ElsLMl+4FNyRxaL05vEqsq7J8oL4HECmMjEFucG3kb0y6G/CJOUc
	+sPCseAVEQn4BYhnV0ZOaS8wmZgJ5vmZWAazYiQOgmmAs1ns9knGeCMnaS5SpmI6YPfwyZLA2ZUAU
	IaxgYKOUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghhLt-0003HO-Hg; Thu, 10 Jan 2019 20:54:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghhLh-0003EI-Th
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 20:54:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id w7so5303355pgp.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=chBp/UJxnNpR33iIZVktfED5fzc5gbgR9UsUskuYUtU=;
 b=glH1iuYZk6oVDfYbYSwfvuDH7AgwH48SrUC5v93H6iTKUxdAo9ygM/PJGD8KoROHfb
 WUm6pwqVvp3IYVwNLwmQNl+1/68HyQugfMrfxVZGy476GhPXvjJLuREYwISYRoTuLMkI
 w08ptM+ju0X/qIPfSck3AhvnD2y7mEDcOMFj216ZcF8XgNSlD1yd86bhZkUnOd3dfdBQ
 HWDJnHRcZTLat4wqT/ejwfv1umsu5xg3PR5P55zo6SZrAFHDJOKQqDATTjac+r6uwiSy
 UNS2/ieAKUQlkbrwBT02TTvDNpq8I+J2XI9exKaNGukzkHtarMxIPu6M3LPLcYx3QgMg
 fmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:in-reply-to:cc:from:to
 :message-id:mime-version:content-transfer-encoding;
 bh=chBp/UJxnNpR33iIZVktfED5fzc5gbgR9UsUskuYUtU=;
 b=AkJy54c/s6aSzI1/e/tHKbZe7D5NOuJkyWc+eUDoP/JPiyRgRorgMvYIv1q3a77hcm
 ffU8PjDYnL373DGl4MoLr4Arpgg7kjXlq/qk7i74EnHFQ+VnrUUaAzD5dQgXUU/PMInn
 /t5BOioPv2eTEMgsrZKbYTrTDND3ZeZKkCCNZmdRMcsdQIJMG7QyDDwGloTem/rIgmS2
 04BTHxoQNbuG23eGjxD2tM1M8JhXvCNf3CHaxSYI7NXbA35+6idUhSt4Z+/VSAfZdM0q
 h5AL99XOBvCHY8snxqrNvwtYh1RTY1z3j0dh3X1SaAP+PjcU1XtOzHMREox86jIRgNJ9
 5nLA==
X-Gm-Message-State: AJcUukf8ApTYSixVp06VRKI+jjglaAWWg+4XeEIEtSNYEaFezqVX+ORs
 bvzxOakV2Dygb9ATaa7ptgzWCg==
X-Google-Smtp-Source: ALg8bN5RBxFmh1I+e/aFlQnq1tmywMaJAYiUv558ldgWbIsEutV3BYGgnwlr0K+qGgwBFqIEyXU3Tg==
X-Received: by 2002:a63:955a:: with SMTP id t26mr10889818pgn.449.1547153684841; 
 Thu, 10 Jan 2019 12:54:44 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 125sm98192116pfg.39.2019.01.10.12.54.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 12:54:44 -0800 (PST)
Date: Thu, 10 Jan 2019 12:54:44 -0800 (PST)
X-Google-Original-Date: Thu, 10 Jan 2019 12:54:42 PST (-0800)
Subject: Re: [PATCH] tty/serial: emit CR before NL in RISC-V SBL console
In-Reply-To: <mvm7efcedop.fsf@suse.de>
In-Reply-To: <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de, anup@brainfault.org
Message-ID: <mhng-e8479556-154c-443f-9d41-dc182aafa2ae@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_125446_033079_0D914DC2 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Jan 2019 07:26:46 PST (-0800), schwab@suse.de wrote:
> On Jan 10 2019, Anup Patel <anup@brainfault.org> wrote:
>
>> Instead of doing '\n' handling here, we should do it in BBL or
>> OpenSBI (i.e. SBI runtime firmware) otherwise all users of
>> SBI_CONSOLE_PUTCHAR (namely, Linux, FreeBSD,
>> FreeRTOS, U-Boot S-mode, etc) will endup having '\n'
>> handling.
>
> I don't think the serial driver should do NLCR handling on its own,
> without being instructed by the tty layer.  Since the earlycon does not
> have a tty layer, it needs to handle it explicitly.

I think it's best if we have the SBI interfaces be defined to be bit-exact.  It
does mean that everyone who uses the interfaces needs to do this handling, but
I think that's actually a feature because it'll be subtly different everywhere.

This also has the advantage of being compatible with what we currently do in
BBL and what we current expect in Linux everywhere but this earlycon driver
(and will do assuming we merge this patch).

On Thu, 10 Jan 2019 08:17:07 PST (-0800), anup@brainfault.org wrote:
> On Thu, Jan 10, 2019 at 8:56 PM Andreas Schwab <schwab@suse.de> wrote:
>>
>> On Jan 10 2019, Anup Patel <anup@brainfault.org> wrote:
>>
>> > Instead of doing '\n' handling here, we should do it in BBL or
>> > OpenSBI (i.e. SBI runtime firmware) otherwise all users of
>> > SBI_CONSOLE_PUTCHAR (namely, Linux, FreeBSD,
>> > FreeRTOS, U-Boot S-mode, etc) will endup having '\n'
>> > handling.
>>
>> I don't think the serial driver should do NLCR handling on its own,
>> without being instructed by the tty layer.  Since the earlycon does not
>> have a tty layer, it needs to handle it explicitly.
>
> I tried to investigate more. What you suggest is correct
> but we should use uart_console_write() API.
>
> Instead of explicitly doing NLCR here, we should do
> something as follows:
>
> static void sbi_putc(struct uart_port *port, int c)
> {
>     sbi_console_putchar(c);
> }
>
> static void sbi_console_write(struct console *con,
>                                                const char *s, unsigned n)
> {
>     struct earlycon_device *dev = con->data;
>     uart_console_write(&dev->port, s, n, sbi_putc);
> }
>
> The uart_console_write() does the NLCR handling.

That does look cleaner.  I'll expect a v2 :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
