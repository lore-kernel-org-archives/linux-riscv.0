Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDD0C388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C397206FB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkPThW9x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ZnuWFkcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C397206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YbPKM99CfX9+HAfzQhGf+56gotxR2Z1AEjnBeT+OiOo=; b=pkPThW9xEqv7EJ43XpYGjlOOA
	sPV9A3Dpygo1JyiTy6bz6VpAnOrwtdaveRAPmR1mIxWZ0QVZAUJxrfOBafU3CmgiReBLfRUuvQjvB
	5v6oB7cpf7bKbRiqh1MSXZlFq4/P6ywGc53H+m3ZsR265/k50g3jlb7UZdJB+Uw77AS6OKK1lcH3Q
	Meti9p0GGkEUnuinoAXqVi0+r1jAwlcMunsKef13zyKYkeKuctXhFSO6HoVK0kn6K6mlWxD7xnVfB
	tX7XxWg80S12yshzqykYhkNermo2CVffBS9UP2n3fjgWmlLrzEfeo34U+BvcQ3dGmM7BS/YOOu37j
	9GkuWszsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawqj-0008Gf-8s; Fri, 06 Nov 2020 08:11:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawqh-0008FI-2u
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 08:11:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id e21so340727pgr.11
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 00:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HHJAJLjMVDY1DujoeUnO+C9eEb3S0JmhzShIpUxjhD8=;
 b=ZnuWFkcZgEedhFpjoe1Fp0i6IZ6b0Wqz4aX+o4pNc6MspP9Q2JW6dBaTYwy80SUGfK
 N0ygQTw/Tf3vhxS6EGHa/t2h1pUaMidMHiZHU3BEs+T0ndrw+N/1gyU7pjY5Y0QEm23l
 AlH/457yuR3r6CmbG7B/2NL2dL0J+FCezdqQ9icfry1c49ym+5vFVptZ7ZkF1hbMCQHc
 X/M1r9KeewCuXJ4iNcshzJ0GsWj14728L/Zv+ndCKRmAQKbSLjmdzDpPi+jRbaGSQ20Y
 qFT3+AaICo6aEoVGZlTScD3gqMFUsqrl/zw8mr14+qGctjfNQ5ExsFOFzZJZ/jO5W1fP
 XOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HHJAJLjMVDY1DujoeUnO+C9eEb3S0JmhzShIpUxjhD8=;
 b=ZwNR4arDCgvsQuhLs4J9TmJ/btClONiVubBQPuIZgd6hgouUTqDbVXYkpWrrLBXphz
 XipaXBYpP1VGRvpb0ti7V5o2Z/8TxZSZFwoJqxNVyYXumGDnhOGJvaS7lUaVBYJQPnFs
 kzbghdeoEdiMYN1yPeckLQYYCBbpX6Lp4EvO9CAN+ox62E6vd92uGM5ukzGISmCtLZf/
 48FQ/+DUXKi5XmfwOeXnPDUTPuLNb6WnziVbH1P4G+ASfaG2QNHIKN/OOMBtoA3dfwVG
 eitKYxVbqZN2JbnwJALVebKU7xXmalUs44VM4Bm5VbnGmAkMaDiGfHFsOE5irft4iFJd
 SuEQ==
X-Gm-Message-State: AOAM530uDTVB2HqzEJ3k0OGafnf1eXvC8bqTyvudis8q0H0xDtNy71/8
 8nNQr6X/xm+J7KbHbZixJIWwrQ==
X-Google-Smtp-Source: ABdhPJwt5a0y678zPi8K5483EPDvDwp5QyUAH0SCfjKoCBvsK5bMlCVc0O4B5yjQCrzageGZlkrqfA==
X-Received: by 2002:a17:90a:1596:: with SMTP id
 m22mr1227948pja.189.1604650312541; 
 Fri, 06 Nov 2020 00:11:52 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q23sm1021810pfg.192.2020.11.06.00.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 00:11:51 -0800 (PST)
Date: Fri, 06 Nov 2020 00:11:51 -0800 (PST)
X-Google-Original-Date: Fri, 06 Nov 2020 00:02:56 PST (-0800)
Subject: Re: [PATCH 25/36] tty: serial: sifive: Struct headers should start
 with 'struct <name>'
In-Reply-To: <20201104193549.4026187-26-lee.jones@linaro.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lee.jones@linaro.org
Message-ID: <mhng-ddfc93f8-d5a0-4f6c-99be-db3c62cc3c24@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_031155_159193_25814DCF 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: jirislaby@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 04 Nov 2020 11:35:38 PST (-0800), lee.jones@linaro.org wrote:
> Also supply a missing member description.
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/tty/serial/sifive.c:157: warning: cannot understand function prototype: 'struct sifive_serial_port '
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-serial@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/tty/serial/sifive.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 13eadcb8aec4e..1066eebe3b28b 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -144,12 +144,13 @@
>   */
>
>  /**
> - * sifive_serial_port - driver-specific data extension to struct uart_port
> + * struct sifive_serial_port - driver-specific data extension to struct uart_port
>   * @port: struct uart_port embedded in this struct
>   * @dev: struct device *
>   * @ier: shadowed copy of the interrupt enable register
>   * @clkin_rate: input clock to the UART IP block.
>   * @baud_rate: UART serial line rate (e.g., 115200 baud)
> + * @clk: reference to this device's clock
>   * @clk_notifier: clock rate change notifier for upstream clock changes
>   *
>   * Configuration data specific to this SiFive UART.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
