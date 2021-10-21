Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49C0C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 21:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEAD610EA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 21:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DEAD610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6Nu/XYJFHh7gJaU7h2vA61de/vKZMhWmZq3TImxnAi8=; b=MgIk3Cc4KhosldLrO6DaGDgAw+
	KWGmq0cilY3tymy+CdwXq5XjE/BK9nRUhbivOVMb1HV5Ntaz7lgMXax2gzLrE8DG5Dzc+oLpitRHq
	+ECNXRq6Nqb+lG5xb9Ib6MNt0QpLE0TpNdZwugn7SooDJ6JNxat4Pnw9HDeFEYqc0cy3ONzPmD98h
	ZRmofNyzQTOL79LuNdAJoLslcUAT8q2Vmqz/vYmX1BSYBwn4Cp+bi8BN6vWaRl/OiiDJYw7EHt+m8
	xh+7EZLH9gFMasxoFbIyd74Q3pbcqkd8vB+mme97eWrirW5iBNQBbWXrZx9wytSxKMu7mIzpPxEHN
	Jw1fzPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdfyJ-009DJJ-DW; Thu, 21 Oct 2021 21:51:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdfyG-009DIX-JY
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 21:51:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id t7so1481060pgl.9
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iIjOjRuuF69t6HmfV6mNW7nAeVgMNixa2oJL1/ZOiQg=;
 b=Z5m6QWz3AQaqJWA63h4Y1HANpmqTbvh8iX2KIJi1KsrNmJV61jA6eFzYvAa9OmdFr2
 CSQDgS9+cij1C9LrSPJ1Zp5ahQyWdi2P05pyAajvpLDq9ZeA+v0xxlcNw8RfdFl7Y9TQ
 kMp5brDQeT2CghqocReyzqfzk/18jbPr6ggOjPtmRjQdAicM2N4zAV2fHgFv2LcwRj9y
 umFzGoS2bdMqdN75/arbJhubAmjDGhvnqe8SDGQrxyvAIOf1o+m83gzPe4NRjx7J4ogq
 dSqjnnrSkoiLUDEjticgCK+46rTNdwXe+mfJ5Y7hZv4kBQg6FWWe6MCSSrOAQfbe3Ji9
 vDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iIjOjRuuF69t6HmfV6mNW7nAeVgMNixa2oJL1/ZOiQg=;
 b=sic8UUUE0VZgFVRFujcRmQe5rcWyOtCQ1qvVqwhnfYS9LOcuTPFmHtXrPPZhnw+VUr
 twuhe1HDWtG2r+EYd4jgjTxcfAAwzu1ZBh0umL44MzvhmbQehuNmZCMo+hR4ZfrCa/zi
 OyhEww7cZ15F/rjm3A+4g6yHKMxls+6YsrZ5yEDhf9VAGDrua2gFoileRsYziq9gDXYQ
 hX6QIKLcOeVVubrtuJbuUB7e/HlFwV4JTQeM1lFGGKht1nnnRuOq8LXQb19sV/TntCHM
 OfI6tm9z4kNWDoeaHxdLRB/3vL0bWUUx9BbBJUnHu64x+dJXU2kmQSY8sKJ/bMdClleL
 0GKQ==
X-Gm-Message-State: AOAM533Chu9oBBBWL4sD2KSKBCIIdow3Y4IddEW7E3X2oBtPThzeAWym
 qqpgzrnkYPbKHpnxJPhaFbXcMA==
X-Google-Smtp-Source: ABdhPJx+KdjsmowFFTshMv4kNktiSr9Nyaw7YXblCPr5iXukUmhP3B3jLEvS4as89EdK4LJkjWJ9yg==
X-Received: by 2002:a63:df49:: with SMTP id h9mr6314184pgj.198.1634853089868; 
 Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:4ba5:eac8:81d9:3e28])
 by smtp.gmail.com with ESMTPSA id i8sm6943807pfo.117.2021.10.21.14.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
Date: Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 14:42:25 PDT (-0700)
Subject: Re: [PATCH] serial: sifive: set pointer to NULL rather than 0.
In-Reply-To: <20210925224726.183360-1-colin.king@canonical.com>
CC: Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: colin.king@canonical.com
Message-ID: <mhng-f84d7cb5-9eb5-40e2-bdc4-9bfdbd67f6d3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_145132_671763_04A70CB5 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 25 Sep 2021 15:47:26 PDT (-0700), colin.king@canonical.com wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Clean up the assignment of sifive_serial_console_ports[ssp->port.line],
> this is a pointer to a struct sifive_serial_port so the assignment
> should be a NULL rather than a integer 0.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tty/serial/sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 0ac0371f943b..b79900d0e91a 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -887,7 +887,7 @@ static void __ssp_add_console_port(struct sifive_serial_port *ssp)
>
>  static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
>  {
> -	sifive_serial_console_ports[ssp->port.line] = 0;
> +	sifive_serial_console_ports[ssp->port.line] = NULL;
>  }
>
>  #define SIFIVE_SERIAL_CONSOLE	(&sifive_serial_console)

I'm assuming this was aimed at the serial tree, but LMK if someone was 
expecting me to take it.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
