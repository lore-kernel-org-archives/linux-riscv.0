Return-Path: <SRS0=sWS1=6U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48882C28CBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 May 2020 23:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18764206D5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 May 2020 23:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGxV/Wav";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="oG+i2CBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18764206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDpQtsjDOMEKBEnfQJyT920DKqtyp3TV7XvJfeZy4QE=; b=XGxV/WavbFlx0gCGeNFY0luk3
	z+NX/Ry7Uuil0VUiqPN+IxEpl7KZ50nbDCW/rwAQiC/NW7bghePY4V2ZvTB6rAx2BAMKix8ixjSED
	dBGNE2rHE7ZY2V5pEoqRGigoMSARDtTPsQyXvAENHXX6zmzks1a8H1hK1tyMe5hUasjzOA3RFPrfL
	JeF7IliJ2q5N/H8BRZn8pYjrzqjgDdfF6sBeZSZpuhC4gy1fDjovUNyKn5guTkqdOHqFOmhsJtLPf
	deRQcVPcjxiXLkkAx2z1KKJP6icT5J1fCyGVwzMEWQ5efPcuMzxlsuKOTlpD/4E0OQTcPPUuDSL8l
	8aQWbht6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWTBo-00067y-R6; Wed, 06 May 2020 23:10:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWTBl-00067K-Im
 for linux-riscv@lists.infradead.org; Wed, 06 May 2020 23:10:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id i15so3678699wrx.10
 for <linux-riscv@lists.infradead.org>; Wed, 06 May 2020 16:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDpQtsjDOMEKBEnfQJyT920DKqtyp3TV7XvJfeZy4QE=;
 b=oG+i2CBywG4DZMiYzWm091lLtSWssC5VyUiImlC72UxBYmmKvz1L06u/0QN/umyUGc
 8vI3DBqCPR1gMh/yJuQ++2A9Q3F4K3+Sa4XuGj9aDjrEUpjusbGsD1sptKMsT/N6dN20
 cbJzjcKRTT6qj76iLXtm8BwKnEW2kJfbogEvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDpQtsjDOMEKBEnfQJyT920DKqtyp3TV7XvJfeZy4QE=;
 b=Tg13FhbzVQRB4bGUirX+CghcQ6oDZv11ZpJHtFEFdEpBHYkpfmHY2M72jabEtSTSSY
 bVEJGQPkPQtMSHPylsyCrO+51KpETCi8IJu7yT8S8WA0cM5jplftGNRMU/X0r0WwFt2/
 Y5jF2QVo8a9ADbkG0Qr1W90cOQmxEuzzW/rHHILN3CyUnJnD+5IYdMG5YUHcwkIzSHdF
 mPg+M/kZfgwvhujruzS8WoEp7CR11fbNlaWr3Hj7phV4EHG740rT+EsQ/VvZ9lJLoaRr
 XNOfvR3Fa7fnl4l0HadsBE3Eq6czA6VS4M8UPFx6XIGyyDfMIVTVIJhIxc1kjGOJXe32
 eYyQ==
X-Gm-Message-State: AGi0PuZIsUjmEbGj5xvcftSSekvquSVfhkKkX2hUbHj+maUpU3iP5VM4
 1rw1lgFGZWwJkgFILSs4W/iVuDfQtYES1kn8r91L
X-Google-Smtp-Source: APiQypJFUrmB9nXgc/QN1Zz5Ix2QbxPXqFgeyACOHLC+yUV5YYVAtayXnmxnhSwYrvdk6GcDzUpgtG7stQ1IyDGGbDI=
X-Received: by 2002:a5d:4687:: with SMTP id u7mr4575471wrq.53.1588806651485;
 Wed, 06 May 2020 16:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <1588793212-5586-1-git-send-email-sagar.kadam@sifive.com>
 <1588793212-5586-2-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1588793212-5586-2-git-send-email-sagar.kadam@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 6 May 2020 16:10:40 -0700
Message-ID: <CAOnJCU+tLfDB3k399K_jMYUQQ7qXyRchn2g=qsm+4sB9i-3jMQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: add missing spin_lock_init for SiFive UART
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_161053_688026_E43AB197 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 6, 2020 at 12:27 PM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> Uninitialised spin lock on sifive serial port (ssp) raised
> a race condition and resulted in spin lock bad magic as
> reported and discussed here [1]
> Initialising the spin lock resolves the issue.
>
> The fix is tested on HiFive Unleashed A00 board with Linux 5.7-rc4
> and OpenSBI v0.7
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2020-May/009713.html
>
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> Reported-by: Atish Patra <Atish.Patra@wdc.com>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/tty/serial/sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 13eadcb..b061bdb 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -989,6 +989,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
>         ssp->clk = clk;
>         ssp->clk_notifier.notifier_call = sifive_serial_clk_notifier;
>
> +       spin_lock_init(&ssp->port.lock);
>         r = clk_notifier_register(ssp->clk, &ssp->clk_notifier);
>         if (r) {
>                 dev_err(&pdev->dev, "could not register clock notifier: %d\n",
> --
> 2.7.4
>
>

Looks good. I have verified the fix on unleashed.

Tested-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

