Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D5C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 16:17:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2C2620685
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 16:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MPgqpGjR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eU/+6VpX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2C2620685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESGuSrpQvWBjNOc/MlseGE3Jr6QSI6/LZ94JDryuuBE=; b=MPgqpGjRv2LZmN
	P0dyBKApqapQPXroRGDS9jxqfE+hGaiikZ6+q+/H6ih2qlmELE+O4S6kiPxL9PDt1u40BU00vFhre
	Fkb3xLGGHleg/YS91GT+y681q1aybNNuS6z8yHgjWmtm5fnTyHTU/KBczd+4lxx/rFNuA4HvxcQ2u
	tCe7d8uZqPFx9L6ZYB0Gz+RTKNS6EtOrfRUReJuCt/ojtOg42AYcFiAfrKEyLZ/wpVptq89NjB4GH
	JtCxctbEBQYZNIyVsf2PgCpalFE4wTjRlKzJ4HUCqnh7/3I7IcPq6ahuR4fxaa6Kz7SYKYIyc0cip
	1sAgyjKCmcXq5d+6piQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghd1I-0000e9-21; Thu, 10 Jan 2019 16:17:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghd1E-0000de-JL
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 16:17:22 +0000
Received: by mail-wm1-x342.google.com with SMTP id y139so11733967wmc.5
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7zd4F4iCg7LqUJrAtDsKz7+E+kJNDA5tf+6CtbsY7Q=;
 b=eU/+6VpX2yaywkjodLF6Hqp2XAB7DKmZTsrA7KnUGxFncAS2CJADrKxdofrFgLRw4P
 eHTNOAh1gHe46rsFeSp2MFaNJM2XL1q1hbbBBgVLpvbebUHzGaDuhyTaQ6scTu7gK7W+
 JO4pL6k/kY/3+Geqs0v2vSmuQwVhq1eoIXJZq8Y2GOAvx9G2mRE3hymg+A25pc9zOe5I
 +T5/SlxjLqqM0IiV4vfUPBow9aT+D4DYXMyuC+UYOg4rSBbYgRzB1iQgfuE66Xl9b3WF
 HZDIv757/25JbpwnUqO3hbQp4zUVnHUQ8DLs2TNClWyUnMCGMZ5iAvE6T5Y0P+hoUkJK
 H0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7zd4F4iCg7LqUJrAtDsKz7+E+kJNDA5tf+6CtbsY7Q=;
 b=AmZFmvY2HPZaPOeqOmZrDoqy0ebDV6V1C+NKzTeDGfpdEmf26gWNTs4GDU9S2TSNE5
 /0V88LgmwpD2ndADlKPYVTLa2xOAOP8uuEHvEsaQG4Do49JqJBlzE78oVV/M+gj8d8xL
 roxynbzduB/JNixwfxqfmJ+7XwDP3xtKqOX5j+vyzEv/9czNuga18jOlODZFAs/vPLjB
 BwJ5K8e1T8l92x/O2xl0u8S0YvRmHvauAFTyAIfyXOBbqCdKYcRffUbGRSsE15PmeoYl
 WN2W9dJ9aAKkigtl8/0CeVNGeszGJyQ14a21YBL6QzFCTUJMkTsrEndk1fQ60PcDOypY
 7Kcw==
X-Gm-Message-State: AJcUukcCb52MNC6qGEey+e5j2q1WzusQAOKJ0OK+PL1a+5gr4kL4O4/4
 wBfLA6EdK5vORNNucRNYNQlyQw/1aQs50CKbSzwUUA==
X-Google-Smtp-Source: ALg8bN6AAzhTc8eiJ5/RdCwaMAu4nfBEQKLa3Fg3gFECP6GCQfpAJuksSHlEu/FiybRFHYBOZWIeRK1cc9EwWF5FhM8=
X-Received: by 2002:a1c:f509:: with SMTP id t9mr11115100wmh.76.1547137038333; 
 Thu, 10 Jan 2019 08:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
 <mvmbm4oehd5.fsf_-_@suse.de>
 <CAAhSdy3-SaP7RBbgx7kZgkkxeN2W-Ue8QDFXkOgFG5GiAg52-g@mail.gmail.com>
 <mvm7efcedop.fsf@suse.de>
In-Reply-To: <mvm7efcedop.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Jan 2019 21:47:07 +0530
Message-ID: <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
Subject: Re: [PATCH] tty/serial: emit CR before NL in RISC-V SBL console
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_081720_699578_B7C33A09 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 10, 2019 at 8:56 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jan 10 2019, Anup Patel <anup@brainfault.org> wrote:
>
> > Instead of doing '\n' handling here, we should do it in BBL or
> > OpenSBI (i.e. SBI runtime firmware) otherwise all users of
> > SBI_CONSOLE_PUTCHAR (namely, Linux, FreeBSD,
> > FreeRTOS, U-Boot S-mode, etc) will endup having '\n'
> > handling.
>
> I don't think the serial driver should do NLCR handling on its own,
> without being instructed by the tty layer.  Since the earlycon does not
> have a tty layer, it needs to handle it explicitly.

I tried to investigate more. What you suggest is correct
but we should use uart_console_write() API.

Instead of explicitly doing NLCR here, we should do
something as follows:

static void sbi_putc(struct uart_port *port, int c)
{
    sbi_console_putchar(c);
}

static void sbi_console_write(struct console *con,
                                               const char *s, unsigned n)
{
    struct earlycon_device *dev = con->data;
    uart_console_write(&dev->port, s, n, sbi_putc);
}

The uart_console_write() does the NLCR handling.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
