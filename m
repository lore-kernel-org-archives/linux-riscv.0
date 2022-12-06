Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E37CC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 06:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+t7cyIuRRhyznLu+pzYMu/zvAvNIj4+/HpubqRV8Ms=; b=xu2jZkdUNetEEQ
	aIoFNgo7IHTgpGcNqCS8DslMloRAk+8+xV3iotS3pmazGNPwt8UYYCEN1FhQ/aG9BfFjgZxCSJsXq
	KU6O2zlbtNFndPB+6HncNQhD4JHCVn4LVlCaBIwTbumqUOZ9hs+iaHeFDJ533/A5ts5Ha4q9TwH7Y
	CtOSbzcWWN/Bed7du5xsWTE9dF9orKpL2LIVaLwrk8yYmGGHmbb26rMXzwA/XMiXky97FJoTyiV6j
	wBmjeoVRhvCI8xVM8+4sBJjfHBHKSWKYyFI3UYZhJ203NWULw4/Pw+hbBcUZlcgKlATWN5cz27pe0
	4bQJp61lT427I96xB3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RXx-002El4-96; Tue, 06 Dec 2022 06:35:17 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RXp-002EHh-QX
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 06:35:15 +0000
Received: by mail-ej1-f53.google.com with SMTP id fc4so3753722ejc.12
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 22:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpnQoUu9q4dFU9fd5dKoOeViJZYTdUELrMbvm+lIUes=;
        b=hJ8S3IZcKNSFln5lzIF/OyoMwBtOHW9HZaKw5yB8G0IVa/vx7BDlp/USZtXNr4CoN7
         10s+aBjP1+neKnI3C8p5FNbHKh3BtsK8wQ2pi2QffjlpC+onPvez1Wuf6GaNMQs1gOod
         IhLocrkELLXySgc3XnFIHA+brze4sEMZjbrNXzfArljoIrZSliNIyxRvTWKKbBZg8Eod
         qzQXGelycwcEpU63F5PVVaukGdBy9onK/43xfNqWBnr2WrVDkKVx+iNMQXHnE1NTYWjZ
         RdCt5Ri2nO4ddCLheQ4xRJSVRcgkQQ8dxxbqBVc0GDzVhU4INzgNdlg1nUaCGgHSeK5V
         gGrw==
X-Gm-Message-State: ANoB5pmOwD3bqkVHfa3rg08sPw+QxEBKajxzIz0WJNdXREtRr/IaZDri
	8E4VMTpfQd6eYzba8fxaJVFVheJT4yQ=
X-Google-Smtp-Source: AA0mqf7yArbjielBwMBLaQxWoE6QrvZhv1NGCA4k1c00+nH6n+Lo2x5YH+IBjHfZuQ9spSLA0SU+sA==
X-Received: by 2002:a17:906:2b81:b0:7c0:f716:e395 with SMTP id m1-20020a1709062b8100b007c0f716e395mr5959496ejg.160.1670308505447;
        Mon, 05 Dec 2022 22:35:05 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id a20-20020a17090680d400b007c081cf2d25sm6995881ejx.204.2022.12.05.22.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 22:35:05 -0800 (PST)
Message-ID: <b3aff238-c473-e587-dd04-cc5ef4517722@kernel.org>
Date: Tue, 6 Dec 2022 07:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] serial: Adapt Arm semihosting earlycon driver to
 RISC-V
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20221205050038.195746-1-bmeng@tinylab.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221205050038.195746-1-bmeng@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_223509_906167_49899EBE 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

On 05. 12. 22, 6:00, Bin Meng wrote:
...
> --- a/drivers/tty/serial/earlycon-arm-semihost.c
> +++ b/drivers/tty/serial/earlycon-arm-semihost.c
...
> @@ -23,7 +27,18 @@
>    */
>   static void smh_putc(struct uart_port *port, unsigned char c)
>   {
> -#ifdef CONFIG_ARM64
> +#if defined(CONFIG_RISCV)
> +	asm volatile("addi    a1, %0, 0\n"
> +		     "addi    a0, zero, 3\n"
> +		     ".balign 16\n"
> +		     ".option push\n"
> +		     ".option norvc\n"
> +		     "slli    zero, zero, 0x1f\n"
> +		     "ebreak\n"
> +		     "srai    zero, zero, 0x7\n"
> +		     ".option pop\n"
> +		     : : "r" (&c) : "a0", "a1", "memory");
> +#elif defined(CONFIG_ARM64)
>   	asm volatile("mov  x1, %0\n"
>   		     "mov  x0, #3\n"
>   		     "hlt  0xf000\n"

Hmm, can we implement all those smh_putc() variants in respective 
arch/*/include/semihost.h instead?

thanks,
-- 
js
suse labs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
