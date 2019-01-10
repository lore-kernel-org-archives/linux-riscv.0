Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324C3C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 15:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3591214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 15:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DA8DX9ys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="CLGlrGmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3591214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Z+Mj9afLD4Id96uRbYgMPmDkfpRkOBT/J9io6fyWBM=; b=DA8DX9ysIPrbWW
	lrQrW8giVo+i9pUfww2oeG5BA5E6h5t11mz6ZSOQWBPcqpO6JpcP6h61ccw7kOz7e4qeHh0CsIJAk
	Wb32DKOsM9aNOL3M/8PUEaQONDULWGSnpFiKQku04Kcwvw3iBQVt25uNMVasaQRDQw3bBPXQJCuTA
	mmF99kLQ84NZRdV/+aom3dATlHSjrbGi7RmdCzZQpgJCmho6geafDA1CJB25m8fh/GGj/2wePiE+Q
	Oav4JcSEJ5RU7uTCUAACCEufRHIiZAyf1En+a9okOGfaZi5KFNG+E0VnD1iOV0I9OXzrq1QNNl77B
	7qM5vTz5sPNuG0VcuB9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghc50-0003iS-8V; Thu, 10 Jan 2019 15:17:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghc4u-0003i3-TV
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 15:17:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so11799362wrw.5
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLob20iXtV9X7gzcBBmME2TKZCOWr+JMlcZgUCIIS/8=;
 b=CLGlrGmU/fE47yJC3vvgHYxs6IZbObwxvuEHj2kbL3oe8qZD9l53a/Kwe6Bk2FgaIp
 9xhXyueKPowmdUuSEU5VVuaL9D3TX/FsHNn/9hmmHiPlZdA0sWWZukhEQbqEhECiYsIN
 WT7jeR7AlwUyeyq/73ARJzgv/tk53UEQriCNroVKgClb78mcXnhyAhCF7TBMr5giV8ru
 43gf+XkYWee9+UBCgjHTcsMqHlYzZdcxFKq3t/5zvI1Jj9jyXKUoVvHXZeuTmrVJz8/f
 OCW9mq4yDCJlx+DeIK7DQCFh1XDaRkaehXQ6nPBEWN43lj+zZGHTXrXbCpLFZjKAtcZ4
 Gwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLob20iXtV9X7gzcBBmME2TKZCOWr+JMlcZgUCIIS/8=;
 b=cb3VXUisWR0KSfjw0A3bwyq1VkKYYe6ltxTIN/H258HR7jCWiIb6CwXwenj44Wjco9
 Uo+T9M0DM0YpcRnKUBb4a2w16Wv3WyorUtk9h4Fn1Wmc6lOEtxTrg6VZOwH7d/XCePkd
 7h7Xw547ErY3el9+yUErnboLizcOEq0/JJ6YMGiTVH/xVxXksEl4DxuyTqXNDSE7cd+K
 QpY/2br5Hf5mOhTjY5YAtt00tAVEcmxKJbNLurBl0HmQGPTWU7ba6IX+e4LZUy2hISJi
 Falgsupwrl6UNfxev9seabna1BonTepskg7h6lshs08TK95UqHcN0txHeJ3fkWPufqvd
 t00w==
X-Gm-Message-State: AJcUukcQig+8HxZb1sTtKpIjudppU1Ow7r8EkDht7Ac0LB2dUmzokJP4
 +TD8t6JbU8o6wyYOePYyXh73bEVu65A9IBMZ9hCZgw==
X-Google-Smtp-Source: ALg8bN5ZocbycUhIhtxfAD5g5576IxpG75CRbU0PSgI/nKYxXHffObzlesBrmjU9pCsreCJcH7UYxVmM8Mc0OYhKeHs=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr10352859wrp.59.1547133422301; 
 Thu, 10 Jan 2019 07:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
 <mvmbm4oehd5.fsf_-_@suse.de>
In-Reply-To: <mvmbm4oehd5.fsf_-_@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Jan 2019 20:46:51 +0530
Message-ID: <CAAhSdy3-SaP7RBbgx7kZgkkxeN2W-Ue8QDFXkOgFG5GiAg52-g@mail.gmail.com>
Subject: Re: [PATCH] tty/serial: emit CR before NL in RISC-V SBL console
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_071705_008196_65413385 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 7:37 PM Andreas Schwab <schwab@suse.de> wrote:
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  drivers/tty/serial/earlycon-riscv-sbi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> index e1a551aae3..9c51b945b5 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -15,8 +15,11 @@ static void sbi_console_write(struct console *con,
>  {
>         int i;
>
> -       for (i = 0; i < n; ++i)
> +       for (i = 0; i < n; ++i) {
> +               if (s[i] == '\n')
> +                       sbi_console_putchar('\r');

Instead of doing '\n' handling here, we should do it in BBL or
OpenSBI (i.e. SBI runtime firmware) otherwise all users of
SBI_CONSOLE_PUTCHAR (namely, Linux, FreeBSD,
FreeRTOS, U-Boot S-mode, etc) will endup having '\n'
handling.

Currently, the BBL does not handle it but we have already
handled this in upcoming OpenSBI.

The SBI_CONSOLE_PUTCHAR is comparable to ARM
semihosting early prints (refer, tty/serial/earlycon-arm-semihost.c).
Even in ARM semihosting early prints the '\n' is not explicitly
handled.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
