Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE0CC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 11:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB4020825
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 11:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJIYE+5b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p3FsYjKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB4020825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6Ijfln0sjjTPn+W0LNvd+iD+OmWePJnQ6yQJka6UbA=; b=iJIYE+5bKTwUm8
	vq3D/4ieloi6VSmzXMCDpasItf/lmkLnr9IHabH6/N9dhuXVmLv5PD+7pNt/Vz8LWI0rb5F41KJCE
	XawI865NKZIsmujd3uklN4LdQrHCeWt9dkIDZMI/eSEFIY3Th/7qmjFbxwMScGXRHrAtnxdMsydwf
	dt5IaX4KhneCvoQegMCtk7Bqmc1RXscNJjSVvKIGXImYo8gynVzwh+GbazTYK/35Vc47un092jgQK
	crlZ18GtN1q5R6PZQlicPb6YY/0hH2pwP8KxN118CBVVHmCTSGL811YpMcF+h+kEstfj+JnbN52ml
	5eVyvsVNF68HtSVSXEtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNFPU-0001HW-SF; Thu, 15 Nov 2018 11:02:09 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNFPE-00019s-4a
 for linux-riscv@bombadil.infradead.org; Thu, 15 Nov 2018 11:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3FHK8EvY+Zjy0akwJHZcKL9VGkiMyUmpn5Xcm9XYl0=; b=p3FsYjKDXRG/mcbNEknI2RS+S
 KQJg710mapQMBkfM02InzAH1eHPSiEFgJdgrhCB5ccSbAq64R5tATi9ibqpfru87YU9RdDdDObJNb
 0mSdm/1rwFd9KWmhsopFIOjtFPB0XtwHS6H+sKeRT+XwwerS123HQCeXn5aCISqXyCofjdwJnaZmC
 0r3yt9A5mYrFI6YdvCorE8HKI97USmbC6Yio315JFc9uiSLQbyli8SQ+IjzlKDjxW2xg4vvzxQVg9
 bBOhugPxbz5ToT9Was/dh+e5mrPs+7+r9TiAfyPyveEAONpo3q6geMD7mKZsHKxVZc476LuDj+esX
 dSbHJwhkQ==;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNFPA-0001lj-WA
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 11:01:50 +0000
Received: by mail-pf1-f196.google.com with SMTP id v9-v6so9531859pff.2
 for <linux-riscv@lists.infradead.org>; Thu, 15 Nov 2018 03:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3FHK8EvY+Zjy0akwJHZcKL9VGkiMyUmpn5Xcm9XYl0=;
 b=Bg8E4+tw4gptpv3+N6tOEiCBsLopy1GsT9IYkQQxn4r2EzGtCP/OggXHW2i+7JunLv
 6P+bs1nwEFR1S8j33fzZ3AmLCkJG0/W9Z9bxl+m/Vc8GzqrSoS7V4LEwmGdCOtxFWOZ+
 bDD+MISDJtC2hoHFhvJMUnKRexpxQHhxBA/7v4JS9kjE1Q1+XI3EzNbgUhFfeNJEYt7S
 OJvMhhm4MWK9NzQ16tCj7+/ofH/TLsRekOKbX6ACSSTgMNYgXRvtuc+EHg7ZOFmDfT9z
 8MEIaQunj5vE5p0xe9mZjtwc4l9qSVgsVjSLHRR03J2kaJ9BGvvlUfJ5+zar0wR/wCU2
 6MqQ==
X-Gm-Message-State: AGRZ1gL3SyqbsiXI1NCjCT08wuPbt+mHNcdRI/oEa9kOZYRJNlN23xdP
 xBNd6SNN4Nn7ZnLef1B0PmipRcwQSMY863GTO0iHU44dp64=
X-Google-Smtp-Source: AJdET5fbeO0WaXg34yZQJO9Sbkjzuh12ApiHQEVArRCqI6Y/VHA4n/h2Hk2784LD4/8Nerrojw2bcaUoZZA/7E2Vtxo=
X-Received: by 2002:a62:302:: with SMTP id 2-v6mr6085108pfd.135.1542279696518; 
 Thu, 15 Nov 2018 03:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
 <20181020101045.15991-3-paul.walmsley@sifive.com>
In-Reply-To: <20181020101045.15991-3-paul.walmsley@sifive.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 15 Nov 2018 12:01:25 +0100
Message-ID:
 <CANBLGcy9WoBqBKQnvz-YGQpXossP2HDmW_go8WZD7FfBZdr5VQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] tty: serial: add driver for the SiFive UART
To: paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_060149_057564_6EE64563 
X-CRM114-Status: GOOD (  14.41  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, julia.lawall@lip6.fr,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115110125.vbqNDlBRcGztu1hQPSoMRePiOaQeBPxo2gtrtj3ljZg@z>

Hi Paul,

Thanks for the patch!

On Sat, 20 Oct 2018 at 12:12, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> +/*
> + *
> + */

Interesting comment ;)

> +static int __init sifive_serial_console_setup(struct console *co, char *options)

Unfortunately I get this error unless I remove the __init:
...
  GEN     .version
  CHK     include/generated/compile.h
  AR      built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.o
WARNING: vmlinux.o(.data+0x14e48): Section mismatch in reference from
the variable .LANCHOR0 to the function
.init.text:sifive_serial_console_setup()
The variable .LANCHOR0 references
the function __init sifive_serial_console_setup()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

FATAL: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[1]: *** [scripts/Makefile.modpost:98: vmlinux.o] Error 1
make: *** [Makefile:1040: vmlinux] Error 2

I have
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
and it happens both on v4.20-rc2 and v4.19.
Without the __init everything seems to work fine though.

> +#else
> +
> +#define SIFIVE_SERIAL_CONSOLE  NULL
> +
> +static inline void __ssp_add_console_port(struct sifive_serial_port *ssp)
> +{}
> +static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
> +{}

Missing "inline"?

> +static int __init sifive_serial_init(void)
> +{
> +       int r;

If you're sending a v4 anyway, here and in the the probe function
using int ret; for this kind of variable is a common idiom and
hence easier to read.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
