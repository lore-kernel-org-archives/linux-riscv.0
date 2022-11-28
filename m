Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D5DC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 06:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I63u9Yj+KQe1forSQW8fORJSDb3Hl2gAv07Sh3oTsVg=; b=YeQkdeC8/+JQoo
	foKlkl8+Gg95SJwwCFdBo/9MoQAD0+4gtzNswvGBBPSRi7CO2DGJEUvjyv+1uZn65w1/cH/stfI4+
	o2z8nz/pgx615QVCe9XDDoLaOkr/dvlD5mtgRWdapJ3c24U28BvrUeUjv+Jh7+wNtSai2d747RpsD
	xk1AcGeX/C4fg80zilMKs0cJuTlNx/Xg3yq12I097h2ie97ZbfdS8Ws1d/FLNfGswbsfxubTKaOiG
	Z1svHmgX728J3QwWvX/4ZInAW+gCyaGolSSL5GqcS87b7ftXDpRUqkmQ4v9aXP84ECJXKrq6EKEZc
	au+QhFT1hTXb4IRmC8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozXLu-00GfuA-V2; Mon, 28 Nov 2022 06:10:50 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozXLr-00GfqZ-MX
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 06:10:49 +0000
Received: by mail-wr1-f48.google.com with SMTP id bs21so15086106wrb.4
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 22:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNcHyBDLc5jdtnLBN8748IdlIq3jeqAUsM7MsspQYq8=;
        b=wHEJfkMvVNDAJP41lkdi9OyHnSza9Rf0znQwCJ5ZDqszHtb7t+oUVEqNyyMsr3WpWT
         FRnrAHsFBXp+HhNNCTfufWwqX9uoHWLnQQ3KPLOzr/T/j6I8CGJUTbX0kZ2NRKzsKxKn
         qD/WTwv6JHS+23U5TryM3RVx2ELYNhd3fZS0nPZSETopujOYLFz0s8d3ZlNCvhPdk6zF
         Y1Z3TndXb6zeR7P/CE8NzYQVCLB0eyTX+T2AkWStnQGl28PM9xsKSb30NktWq0jK4tIE
         1laYiAMWxHACo9SNyHfPQZ9fFOU5KymjiV1waHYMB+vu/URXj2GFrwusb1c7ztDS9Csu
         8Jww==
X-Gm-Message-State: ANoB5pnunrvb3f2zJuiAUpwfa3xCAZvNxBFLBAETtsDlFHaLJtWEFb4w
	dGkjtcYwbYUJiEd3fjowIM4=
X-Google-Smtp-Source: AA0mqf4U7mqwsR/kHM0iUuatuXazzkLjLDSblw4PHIluzbs1vltm1jgpwfhnnsZFOTu0BmvEDK3Osw==
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id c12-20020adffb4c000000b002365270735emr18959992wrs.659.1669615844299;
        Sun, 27 Nov 2022 22:10:44 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c4f8800b003cfd64b6be1sm21801135wmq.27.2022.11.27.22.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 22:10:43 -0800 (PST)
Message-ID: <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org>
Date: Mon, 28 Nov 2022 07:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/9] serial: bflb_uart: add Bouffalolab UART Driver
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-3-jszhang@kernel.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221127132448.4034-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_221047_763894_7928CA6B 
X-CRM114-Status: GOOD (  11.76  )
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

On 27. 11. 22, 14:24, Jisheng Zhang wrote:
> +static void bflb_uart_tx_chars(struct uart_port *port)

Again:

Are you unable to use the TX helper? If so:
* why?
* use uart_advance_xmit() at least.

> +{
> +	struct circ_buf *xmit = &port->state->xmit;
> +	unsigned int count;
> +
> +	if (port->x_char) {
> +		/* Send special char - probably flow control */
> +		wrl(port, UART_FIFO_WDATA, port->x_char);
> +		port->x_char = 0;
> +		port->icount.tx++;
> +		return;
> +	}
> +
> +	if (uart_circ_empty(xmit) || uart_tx_stopped(port)) {
> +		bflb_uart_stop_tx(port);
> +		return;
> +	}
> +
> +	count = BFLB_UART_TX_FIFO_TH;
> +	do {
> +		wrl(port, UART_FIFO_WDATA, xmit->buf[xmit->tail]);
> +		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> +		port->icount.tx++;
> +		if (uart_circ_empty(xmit))
> +			break;
> +	} while (--count > 0);
> +
> +	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
> +		uart_write_wakeup(port);
> +
> +	if (uart_circ_empty(xmit))
> +		bflb_uart_stop_tx(port);
> +}

-- 
js
suse labs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
