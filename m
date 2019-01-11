Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5039DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 11:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCA920874
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 11:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BR2gT5J9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="mvNnOY5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCA920874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oveh8EthQ0N9AAH9HRSRKZYFxr2C5wU2dYOB0Y2TdMA=; b=BR2gT5J9959Mab
	mJRAc9y+WQAzATic8vL85hGFbUfKPUzsgR7Ierbv8dKoEnhe1ZsuQ9eYaHUgne8duB+38qHSTFyC4
	Cardy54kdTm4+AjN4yhvjilD83U4ThWXkUgRjRvC75JTDscgI7BwCU9GLu99oL4hQ3yRIyd2Rw3Go
	qXnEt0s+zJHuMDFkaRlceKbnhHLl0oqWQbh3TnhjAeWyQi8kwDX3HhilSVJ2gFDFls/F9cmbBB8Xg
	sWWZzzhUfg6i/C5KajMUfol1OaS4sAoMU6JmMT2YDws27vDP7ZI1K4GqXYcfz4aq5kLZUBy4xJX0b
	8T/38dxcMS8wcAzsfTVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghul0-0001wt-3z; Fri, 11 Jan 2019 11:13:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghukx-0001wU-N1
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 11:13:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id v13so14752973wrw.5
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jan 2019 03:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCboTPOZEsIJhvmech9H+xpyazvbxiQ3ukJhOtVy2aI=;
 b=mvNnOY5KzGyN8P8YNvsZEJ4Ct9MEd8+eoEzDhrsjmnn/QF9XNOaP0rbwsZXrIevrSv
 lZaFre1lAEzrucFLWyzk2Z85iUlWnoDrcWcLDjwUCDElC5QbJigb41S1Ak6gNIAsXE2m
 A9GZX/zne+xt/vb522i2HTvAYmaYTR4/z+RViGQvRILyXopUg9tipBtUO4iTeuRkhvjj
 GdcngrN2I19NsJgPvkwUr77+DycOrKnxQhWpcqyEYXzZRPqZW8DO/8rVwJIyxJbBIRfW
 CdsAcV9rKvqMnKh4f4TpsGGM8vgkTZg/dF0i4Usht2KGiLvixzEU6Pe80sHpufq1q4D3
 LJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCboTPOZEsIJhvmech9H+xpyazvbxiQ3ukJhOtVy2aI=;
 b=qgP54dMfNNEaWH+xyceGNm1TlTN4V8VHtmalh1ISk5BmIKSbDFY1COx4PQOCwEu4Su
 vMtET+UaEPqLjDzRcPusk+WsmTayR/cpG8362V5ENGPp3wuDxqWCfuNiCzyxOg8ankKs
 84aDepQvoM1JbNJ+o0MGRGFGPY0sowsi7yT530MKouyhdqGLYohlPgJntEEDKO12wn7A
 HgUDulfz1a9uWs3lWvwuC4mvONlhYf2EUQtkvR1s8dde+HzxQLu6Hm3Msv3CRPl3Y3ZW
 tM2APaVJSLKD4wMZSms7KtpcEOKrbKJ42wvq0YjLsmgayl2vYuUdd8TTRMD0Zq4Jzqe+
 opOQ==
X-Gm-Message-State: AJcUukcLMfZjbEuJPiNInoHSUuOtKkRsfxdsr37LaF9Ickgd3J7KFrbl
 xB9XCIfO0O2vdjRD7hhOj+ZHdM+8hnKSjyqEV6tpYw==
X-Google-Smtp-Source: ALg8bN6Ec1kojcYvFeUW5rr25UH7Wf3VukkfEoGqS1eg/+zwFHebDO/0IWOt/Ya82T/KTYPn2fT49egMVw7cds/mRXw=
X-Received: by 2002:adf:f785:: with SMTP id q5mr13771853wrp.9.1547205221410;
 Fri, 11 Jan 2019 03:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20181204135507.3706-1-anup@brainfault.org>
 <20181204135507.3706-2-anup@brainfault.org>
 <mvmbm4oehd5.fsf_-_@suse.de>
 <CAAhSdy3-SaP7RBbgx7kZgkkxeN2W-Ue8QDFXkOgFG5GiAg52-g@mail.gmail.com>
 <mvm7efcedop.fsf@suse.de>
 <CAAhSdy0suSgKpdz+NUrXzS9Ozp75hMC6ovW4yLf5s0KYJwwocw@mail.gmail.com>
 <mvmsgy0cu9g.fsf_-_@suse.de>
In-Reply-To: <mvmsgy0cu9g.fsf_-_@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jan 2019 16:43:30 +0530
Message-ID: <CAAhSdy07AeWeMxQJvzRGzMQ84Sxc6O899T0dWO1vz0LB89ORyw@mail.gmail.com>
Subject: Re: [PATCH] tty/serial: use uart_console_write in the RISC-V SBL
 early console
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_031343_887069_628BAD89 
X-CRM114-Status: GOOD (  12.23  )
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

On Thu, Jan 10, 2019 at 10:41 PM Andreas Schwab <schwab@suse.de> wrote:
>
> This enables proper NLCR processing.
>
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  drivers/tty/serial/earlycon-riscv-sbi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> index e1a551aae3..ce81523c31 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -10,13 +10,16 @@
>  #include <linux/serial_core.h>
>  #include <asm/sbi.h>
>
> -static void sbi_console_write(struct console *con,
> -                             const char *s, unsigned int n)
> +static void sbi_putc(struct uart_port *port, int c)
>  {
> -       int i;
> +       sbi_console_putchar(c);
> +}
>
> -       for (i = 0; i < n; ++i)
> -               sbi_console_putchar(s[i]);
> +static void sbi_console_write(struct console *con,
> +                             const char *s, unsigned n)
> +{
> +       struct earlycon_device *dev = con->data;
> +       uart_console_write(&dev->port, s, n, sbi_putc);
>  }
>
>  static int __init early_sbi_setup(struct earlycon_device *device,
> --
> 2.20.1
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
