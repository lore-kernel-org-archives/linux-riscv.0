Return-Path: <SRS0=iddv=VA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357E1C0650E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 18:43:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FAC32189E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 18:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qvwfO/Ud";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON3AqXpT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FAC32189E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79CjsaHnH6ED/3o8PMViiK0tQAXw36nO9CR+Eui9OoU=; b=qvwfO/UdN/PXDV
	yKtKlQvTae4cBU+WNOacfEn8yFbjSJT8O44yKY+KCQx6d/KuxZzcs3ojihWvpx1u3OAGifFBo633R
	XaHvM9sSTsrzFAfrgMxfSWbUc3lLrPMNa4EBL/GO8iFB4PVJ457++tRqvC2zZ7wcw1EJfbjZX0yBr
	lLejivrvCPpC8x7NPDQjmPgpfFt/vrC1p8tNJkNML4OxjQQQEFnlxkcd3B2gMuWTg0w/ZuYywsbax
	gO8xSzXB/iKlTALW9qzRaYhKGqTOmpPIMjB7+e95qvw4EiIvnO6mf6sPsvV7Gy3WhbwEj7/PU7RfZ
	18fcWvujMYdFV4SYWcpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hikEP-0006Ox-2K; Wed, 03 Jul 2019 18:43:49 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hikEM-0006OM-E0
 for linux-riscv@lists.infradead.org; Wed, 03 Jul 2019 18:43:47 +0000
Received: by mail-lf1-x143.google.com with SMTP id p197so2516325lfa.2
 for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2019 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+1ik/vvOveRHv6gC+vDCsa/NHe6vb//8HQCEW5cYfo=;
 b=ON3AqXpT0V7isG9+j7JZBvuqy4Kap3GDnft3GXOvwOEvAH4TZZ/Eo4sp5enHq9mcK1
 xYgaHeZ1s5Z12So406hFfrw+DQcBIj8VhduCBb+4Bkx7My8FsU2wmNHWiJN/osCBKthw
 6x7O2b/tkLQ8KRvUw/iD9Gp8gShZQpqQsJo+ImQIq6YbleUsyiIPTuSvRtfpr4YBy7hb
 53v6O6RmJAc3h5GslmR5dSdLqf+gQzuw0VYvoEVyV06CBPoF52GEPnG6mfXEZLLa3+jQ
 RsaW/o6aLqQxidSpWMECeGAf4cDvDxHnGQiwHouPN8us1AZ6Kf19a+81ruAuMXfLWOh0
 T7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+1ik/vvOveRHv6gC+vDCsa/NHe6vb//8HQCEW5cYfo=;
 b=cyddhvfMZUAR+b6ZLLk/NsKhbyEVZcOkS32+IqMjkCktIe6zARm2h+y91Go2LPZrE7
 cJkpnI0JMa+kI0dhtNcYY9P96hhmdapGlJxjLxhE5/H9GdCfJrMr5166sjwYQCs2Horr
 jr5e3ury5XT2/h7vYIlhJrrZB69gWNeQImaaGxwU0hxXA+sHzJeCwUpDn906hqH5vo2e
 nDB7HwHYzyX3eWFqrqWGTiohn5mwzAJTBxGTExbx71vblIDi2i/sjdOb0TVDXmvE1Cg5
 OxRp1aEbwExGH68QTTK/wlE/WxfGWXU0n2OUQ/dCpX9svAAUltjiKpk6LCnTB4DpkEIc
 8+WA==
X-Gm-Message-State: APjAAAWFi6b0DtBRyLkq9rwSGas3CxQck1vd71njcP0qzGD/aT7p4ph/
 sLvi6nXmaM2J/f79HB9u9gl7EHbbsl18AMjq35U=
X-Google-Smtp-Source: APXvYqzajfNogCiazIdQFJmJhPWwHxWc+Z5wwmTmzYBOWXkIYTk3INMO8TqgM5RbVH5cV1J3m23oX2p+tF/cALTXTXQ=
X-Received: by 2002:a05:6512:29a:: with SMTP id
 j26mr363525lfp.44.1562179423948; 
 Wed, 03 Jul 2019 11:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190703005202.7578-1-alistair.francis@wdc.com>
 <mvmk1czh9y6.fsf@suse.de>
In-Reply-To: <mvmk1czh9y6.fsf@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jul 2019 11:40:39 -0700
Message-ID: <CAKmqyKPn9GBg=n1j-ZpEdCN4Qfi5qfNtEVgpgF8rYRpof4eNDA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] RISC-V: Handle the siginfo_t offset problem
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_114346_495926_71C30459 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 3, 2019 at 12:08 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jul 02 2019, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> > In the RISC-V 32-bit glibc port [1] the siginfo_t struct in the kernel
> > doesn't line up with the struct in glibc. In glibc world the _sifields
> > union is 8 byte alligned (although I can't figure out why)
>
> Try ptype/o in gdb.

That's a useful tip, I'll be sure to use that next time.

Alistair

>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
