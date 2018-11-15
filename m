Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F17C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 20:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D2320858
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 20:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kO127elN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MjtR7bSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D2320858
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VL+VP/4GrykC9DtkOEzOewBJnmAINhvfuNVUFxtvON4=; b=kO127elNHa/NmEGH4L6DihCTd
	PwZrasrFlJUg/YH746zCHzgjn5bDdtaNy+wQRjzGQwrQFpTj3V41g5QaNM29YP7WX1vOw9GGxgwYN
	+X/beIiY/Aui2oQyy1qqgNUxlpGs3sEyGQAe+/nt5j0pa2hniHUHUDqcljo70lJcpGfntz4cWAOM+
	o6XzXoXwry96ZLto34TQB+KWRbLUSolOhAhWc7EoX7l20tP/m5U5yEi4tprvJOWT70bHG9uuH+vRh
	ZgId7+O7+DmyQQE8UL4cSumMoM3xrolYXnMyZWwVYNGqPA3kzdpkBS+tfOWEcZcjXD5/21bI831OY
	Yy/1k+78Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNNz6-0000nb-Pk; Thu, 15 Nov 2018 20:11:28 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNNz3-0000iN-Bi
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 20:11:26 +0000
Received: by mail-pl1-x642.google.com with SMTP id x21-v6so7264087pln.9
 for <linux-riscv@lists.infradead.org>; Thu, 15 Nov 2018 12:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vAevjgMoXGxymF5+bZHqF1QU7oU437ycHKufbSxDchc=;
 b=MjtR7bSIuPtEtgHY551xH2t3SmmeidBvI7uWV6WYZq6/A5GnnE0kTa0w8/4fsfKhLK
 +SK+pRkAKNDBbwCH4DjIy4oaA2IIDcWoN3inYiOM7+Rsx6nu3+4Sr1ohhwaA3CGXJaaQ
 H6vcjmvIJwcQJWfxKgXxDcI5/NKtrzCUgZYbXpBtzgLbqnhoxP8dv5bJAl8V40lo9BvR
 6vFEfZugjyArYGClH8wAAWzluwJbZZqOwEOJekQurtM4xR6RsXhOvwL8a4WcQtwtiEsJ
 gs+/0iA6a4kclql6uF2KKsGKgn6yIss7hET7/m1/FgP2G0ytug8/THM9IQ283/yJacCt
 xN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vAevjgMoXGxymF5+bZHqF1QU7oU437ycHKufbSxDchc=;
 b=jkwl0DjSc2HsUPOM1+YV2J69d4QUbVJeE/AwGc+8YeaYIx6gA2WV72sxsNj8LCEjR2
 nIH9TBr0gzK8/L8hRSogzI74m7v8zru0JyeHDaLt40QaJNvPZeQPftGCEpI6ROXZ60s8
 dk+M5UlryBmfHmMZBKK8n8e/FG51aTMjqXy+x0bqPceEj01Ars7nqjUtLbQ6tiWEq2fX
 oh+8HcVIhI5SLCqua9StwzFAXEv+Q2f0eoj/fqN3sqitMlzm320XZRMO2ZC34XE16Xsi
 jMxxJ6taf5SJZGTgJr4Hb7Ee4dTDU63qNUAG0mledkrrs+3z+PeRSXHBfD00SaWEuw+J
 GJcg==
X-Gm-Message-State: AGRZ1gK9Fbr/MQ0OaIx5vZeZRN+nHUjNyiB9eQJ0YrypOgc9jLs2U1+2
 1wOLBLUS9+vvDE3dM1vKyFFsfQ==
X-Google-Smtp-Source: AJdET5fQia1OGaDW2lV5wjEtUuTtNrzg8K6KZ2Q0Xh/xFtyc9UJWCNHAhlIp2ptCNUlnOYuWRiflRA==
X-Received: by 2002:a17:902:9045:: with SMTP id
 w5mr4013858plz.32.1542312674330; 
 Thu, 15 Nov 2018 12:11:14 -0800 (PST)
Received: from localhost ([64.114.255.97])
 by smtp.gmail.com with ESMTPSA id i189-v6sm49605953pfc.16.2018.11.15.12.11.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Nov 2018 12:11:13 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 15 Nov 2018 12:11:12 -0800 (PST)
To: Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v3 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <CANBLGcy9WoBqBKQnvz-YGQpXossP2HDmW_go8WZD7FfBZdr5VQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1811151146530.25598@viisi.sifive.com>
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
 <20181020101045.15991-3-paul.walmsley@sifive.com>
 <CANBLGcy9WoBqBKQnvz-YGQpXossP2HDmW_go8WZD7FfBZdr5VQ@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_121125_394921_FD158459 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: paul@pwsan.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 wesley@sifive.com, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 paul.walmsley@sifive.com, julia.lawall@lip6.fr, linux-serial@vger.kernel.org,
 jslaby@suse.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115201112.Rh25c-4kqdJHNjCmJqiL91k0Z7MRvRYzZMAVJzMxBWo@z>

Hi Emil,

On Thu, 15 Nov 2018, Emil Renner Berthing wrote:

> Thanks for the patch!

Thanks for your comments!

> On Sat, 20 Oct 2018 at 12:12, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>> +static int __init sifive_serial_console_setup(struct console *co, char *options)
>
> Unfortunately I get this error unless I remove the __init:
> ...
>  GEN     .version
>  CHK     include/generated/compile.h
>  AR      built-in.a
>  LD      vmlinux.o
>  MODPOST vmlinux.o
> WARNING: vmlinux.o(.data+0x14e48): Section mismatch in reference from
> the variable .LANCHOR0 to the function
> .init.text:sifive_serial_console_setup()
> The variable .LANCHOR0 references
> the function __init sifive_serial_console_setup()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> FATAL: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> make[1]: *** [scripts/Makefile.modpost:98: vmlinux.o] Error 1
> make: *** [Makefile:1040: vmlinux] Error 2
>
> I have
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> CONFIG_SERIAL_SIFIVE=y
> CONFIG_SERIAL_SIFIVE_CONSOLE=y
> and it happens both on v4.20-rc2 and v4.19.
> Without the __init everything seems to work fine though.

Thanks for the report.  There are some patches to address this:

https://lore.kernel.org/lkml/20181115005602.30746-1-paul.walmsley@sifive.com/

>> +#else
>> +
>> +#define SIFIVE_SERIAL_CONSOLE  NULL
>> +
>> +static inline void __ssp_add_console_port(struct sifive_serial_port *ssp)
>> +{}
>> +static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
>> +{}
>
> Missing "inline"?

That is indeed an error, but the other way around: I didn't mean for that 
inline to be there.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst

I've dropped the inline; thanks for pointing the situation out.

>> +static int __init sifive_serial_init(void)
>> +{
>> +       int r;
>
> If you're sending a v4 anyway, here and in the the probe function
> using int ret; for this kind of variable is a common idiom and
> hence easier to read.

Precedent exists in the kernel for using "r" as a return value also:

$ fgrep -r 'return r;' linux/
4491
$

which probably traces back ultimately to Torvalds' guidance to keep 
variable names short:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n284

But I am not religious about it.   So if this is a big deal for you, I 
guess reply back, and it can be changed.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
