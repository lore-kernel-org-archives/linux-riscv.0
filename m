Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21C0C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7707460FDB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7707460FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mW6rNPyzTOcAP52Z+0YdvlisXJ4wAS8iCwqZpQukac=; b=zYRWbMj9D+ep2H
	mEK8P/GnZZgW25X4rKZT+rxBjdfkt5A0dXx4XEikyrFB1YIwcvbmQc9WLJxuhwegBGhNueHr51oCE
	Y4uUdii+GS+rJgdwpXnArECdbHxgelqdKCAN45MD9um6OqIPTxFjzKTCCh9gZXs8nj50PZi+hGFKC
	duYFdfMA4rr6be6yNYMFOp4mSqxmMdKgQu24pn+yJ3DOAVZwJ9fT3XXsPYV32XwDHpO7wPlTeS7lS
	mOo2zeQvVYbNUxabcJnW0Kyb3sTGhroc4iKsxmeHK+XnNP1reds3TOFljvpAo5U731bcL0j0kzQMT
	1dZUN5t+/G/VG0Nk0RAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mNa-00CQot-TR; Tue, 20 Jul 2021 09:49:34 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mNY-00CQo8-4E
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 09:49:33 +0000
Received: by mail-vs1-f51.google.com with SMTP id u14so10906664vsc.8
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 02:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7Rrow7QuzFGdlxPoYmznnIEE3mNavblrdx/pok5ctM=;
 b=FZiRX71oZwFnUEEoEfGUBN3VWhkP3mdsJ/YnPEDCNfFgzqFDJtdW0crr8qXRbGkPdr
 WRf54Iyj0lNJ/OwSbzkDe0GPpauki06j+o8To60lt7GREb1Fu1jpof7iC2pBCr7UkYKP
 EuFkQbLj9AYH6wwogD800ThtKofP77u6evDCRM33TwbXN/yighazGds3VhjWSioJtD5w
 toE+zXlBf/Xu9PJMYqkaibdQiGZ3kCjMNR+0OSHmIelI3PUz20VhuQKkRD4kTKFE0Vbe
 wA2MrtSENZDpzW7fQwVDB25TA4JOg+4RIcb3qN1ybErXKsPwh7mgOQ9CeTH6g+dxoj8q
 jGmA==
X-Gm-Message-State: AOAM532PFCVvmJjCKBrThrMK7SO0gWoTFt+GePwUp/4BHQAMBb7odvKa
 Ycf1Z/KCCbVR1VDCcWdKvckG5eSKTuFd9OJN5T4=
X-Google-Smtp-Source: ABdhPJx6LeiuuZovJDBYwh5S5IVVbdCs9y03T5Nz2Hn82i70Tf8ig1LjFS3chKv5D7mo1ez7diN4cdECYpSeBh14oXU=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr28356150vsb.18.1626774569916; 
 Tue, 20 Jul 2021 02:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
 <93a6ae3b-3271-5edb-0a1b-260ba789f3f1@gmail.com>
In-Reply-To: <93a6ae3b-3271-5edb-0a1b-260ba789f3f1@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 11:49:18 +0200
Message-ID: <CAMuHMdUnD58W6qAbxnT3y-BMTHb+De+z29YNGYVA3mWD0B-37g@mail.gmail.com>
Subject: Re: [PATCH 2/4] riscv: __asm_copy_to-from_user: Fix: fail on RV32
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Guenter Roeck <linux@roeck-us.net>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_024932_206335_1C7C4F4C 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Tsukamoto-san,

Thanks for your patch!

On Tue, Jul 20, 2021 at 10:51 AM Akira Tsukamoto
<akira.tsukamoto@gmail.com> wrote:
> Had a bug when converting bytes to bits when the cpu was rv32.
>
> The a3 contains the number of bytes and multiple of 8
> would be the bits. The LGREG is holding 2 for RV32 and 3 for
> RV32, so to achieve multiple of 8 it must always be constant 3.

RV64

> The 2 was mistakenly used for rv32.
>
> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>

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
