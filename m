Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F9C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIaydn73otaEwsL8Hsaq9HFcYmw5V2p4rb+cV34IFvU=; b=XO/Iu+1w5habh/
	AwRNr9krTRkXEn4ZJiewYl+K7rApM5Gc/ehFeIdoChfRNJh2YAASPf2u0gWgfoSSANZODDRmU9h07
	r3KQTyrIi8va7Qynr8hNCARaC8ykwAXQqq+Az3ie/T5qO9WPMnp6eNm07syZ3RY2bOO/KFrff7LGx
	OiRXN9AYEaBhV/ShStyN/1l/a/gBz0sv4s+29JffR7PSUlfLlR4UV/YBrALefx+vE+E/A5h6QfYMp
	OwBPqPAiDjEEgoI1DyhZgwbusrDu/Ws792r+UkxhlvggunYsps5hqC7JJ/SfGhyJCLBmrz8NkOuuz
	nhcLEQBMC9evauXXOUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVte-00A9qT-En; Wed, 11 Jan 2023 07:51:42 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVsr-00A9QA-Sq
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 07:50:57 +0000
Received: by mail-qt1-f177.google.com with SMTP id fd15so3191430qtb.9
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 23:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIW3eC4dm34WLZNTDGAO2r34POpI2t79Eavo6bsYDq0=;
        b=JN+Odh/iswdCLFovGOD04wNy93prM2AOluEZUNq//lNU0uysuS5LjgzMzTKFdwkM/m
         fxUaLn8zWUIEdmOSlpDAEvcTjJ08+WQ7NX/hU3hYGZWCuFm57JDu5sg4Js0JSqC9jnYR
         LeHS2T372UPAIQPJJlGZCNbCRdYhTzyQVaE/HJRAoUvevB5IqJYYRbOgU+cQbiuQHxdP
         LxB5cpWZv0jz3D1V/4sa6wAOFPIBD8hpua6XnWwrnqpmpYJAFMOT3AW9ar1SWdpYxr4j
         yED5KEeD/yqtG8H+7pBvXm3XrGFz84irpMlbwGXPACY7MZHf+wPD33ycMza79IhhtDpJ
         j7aA==
X-Gm-Message-State: AFqh2kroqV3s3t3VpmqyMbIeHvMNb7qmqXV5rOMN1uXKJR3SsLxSqIh3
	7CyCKQC5i4iFuK4QyO9hi/S/y8Gc/pv7ZQ==
X-Google-Smtp-Source: AMrXdXufGq6I0HPw0F0gZgA3GA2+c+/4xgiN5vJnDQvFxKd8Ljd2Av3Lue1AiXrvyZUmQqX9tddQmg==
X-Received: by 2002:ac8:4447:0:b0:3ab:d179:d4a2 with SMTP id m7-20020ac84447000000b003abd179d4a2mr23786673qtn.66.1673423451219;
        Tue, 10 Jan 2023 23:50:51 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id t17-20020a37ea11000000b006fef157c8aesm8678341qkj.36.2023.01.10.23.50.50
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 23:50:50 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4d13cb4bbffso64950497b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 23:50:50 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr3669601ywb.384.1673423449946; Tue, 10
 Jan 2023 23:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20221121221414.109965-1-conor@kernel.org> <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
 <125360d7-9f06-05f6-e3bb-300514b9f821@opensource.wdc.com> <Y73oECczK3bklSyS@spud>
 <e63232e1-7340-7c68-7658-6e2b04b70a7e@opensource.wdc.com>
In-Reply-To: <e63232e1-7340-7c68-7658-6e2b04b70a7e@opensource.wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2023 08:50:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYMmb1nueorsJSXWeT=eWPP+UxUwd_fTetUgxZRDJ6-Q@mail.gmail.com>
Message-ID: <CAMuHMdWYMmb1nueorsJSXWeT=eWPP+UxUwd_fTetUgxZRDJ6-Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christoph Hellwig <hch@infradead.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_235053_953227_5048EE6A 
X-CRM114-Status: GOOD (  24.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Tue, Jan 10, 2023 at 11:47 PM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
> On 1/11/23 07:34, Conor Dooley wrote:
> > On Wed, Jan 11, 2023 at 07:22:47AM +0900, Damien Le Moal wrote:
> >> By the way, I recall some pushback with the renaming of SOC_XXX to
> >> ARCH_XXX. I personally do not like it and Christoph suggested the revers
> >> approach of renaming arm ARCH_XXX to something else instead. I did not
> >> follow further on that discussion, but it looks like the riscv SOC_XXX
> >> renaming went through ?
> >
> > We asked the ARM guys about it, I think on IRC as they'd not replied to
> > the thread, and cold water was poured on the idea.
>
> That is really too bad. Naming something ARCH_XXX that is not a CPU
> architecture is simply very confusing I think.

I agree it is.
However, fixing that means adding backwards-compatiblity symbols,
updating the few thousand existing users, and dropping the old symbols.
And handling all the fall-out of people who didn't run "make oldconfig"
in between, now wondering why their kernel no longer boots.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
