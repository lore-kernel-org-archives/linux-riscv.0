Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F3BC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:38:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696162074B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5KCacf5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="SPBvOimS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696162074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6hWceDsN57cDKIAse6uJBxtRkC8CMES0B6dF8ZKeNo=; b=n5KCacf5jBbPLBUnt4Jf4l2iz
	7BQdeDG230H6kiKL1yEta/mmcuT36pGrOo2SR4wp+2LM9zIwyrKfXa0J5O0uuU8TMDO9rzx7zNbVW
	VJiYs2/2SZ5X3l80c4HlbfsF2UtOx7NizFd6PMzOGG+QwPveNpVJFIZbs/AuEo1K4K9W5kRdh0GFe
	KLzbuFFAvvHA4hD+E34U4SbLz0VJXFr4OybnZwjbzZp31KuWHvylU7RWcS0DkpI5nPp2apmPbIvHI
	qsvw/75khv6RQMJoyADvVS6Rapqjoqm780ds7221v/fEsi6b5vAq79VknAbMs0lf1QUSAPsgVhU8n
	n1nM0i6Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1Cc-0007Yi-C4; Tue, 03 Nov 2020 18:38:42 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1Ca-0007Vz-6g
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:38:41 +0000
Received: by mail-il1-x143.google.com with SMTP id q1so17036668ilt.6
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 10:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=isZW9UVRWMUdUxodMEQrPHM1tf21oSlSUVW3kI8aBBo=;
 b=SPBvOimS59fQpOncR96IiIRDP3yFCHyir2PmoQOcNBv1nA0ac/tsGYlF9nSpHbLlY4
 RQxbetSpbbDR8g+jOMYH7C/ZhD0ijLXbY6j4+4jM2Qtu5BVjU2ARNX4PG7PTf6HY+W+5
 c5P8Dy7kQvIMcHlWiagl6v+fXAl5Dl8kGsVYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=isZW9UVRWMUdUxodMEQrPHM1tf21oSlSUVW3kI8aBBo=;
 b=HFN6iroldnVyhY9HSbioTZjaveel6lgQ4x/Ows33fflFs0AYcKM+L1THx82x9rgVjB
 bO+U/K0Y7xhJLiNyoybjNy9a1y2Kqt98DHXSu+cP/QJjCDAEJQVehclnUVIzD0nemt37
 VPr1dJ+qLRMsDURT/Z/Wp5GkXo1qSHVA5PmBZJue+1Kwb3HQnbfiM7DDZ3rwRVroHOBI
 NQJ+2+eQniEjPcL/Yf5k7A9+v63jpO7wnYDuvAwFeTbYfNzS+2c7p7Xv/h3lMUOg5bq1
 lRXWFEOZpGe2wdsRR54I7E8NVI7CbeqML+OA56Ir4XTPBUUg0GzMzbjoJnQWzpwxfpx9
 9LYw==
X-Gm-Message-State: AOAM5334wgHwYxT5rWDe69+PORbwtN6dpTbgvMQSTz0u/CXsbItxMp3F
 hkFhhshNmAF5ysNp2eVwCrijf+j0l9gMRjypYFdO
X-Google-Smtp-Source: ABdhPJwP/4HvNurgeeX8oFZiCl1iSoi5erFepZ6/ponAvMH88+iqv0up8nMbyaDLWn5Niqr5+HH/Ks/yoC8t4gZnhD4=
X-Received: by 2002:a92:512:: with SMTP id q18mr15048300ile.147.1604428715567; 
 Tue, 03 Nov 2020 10:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
 <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
 <e9bad05c-db34-ba2c-df5c-ff2f7f53e15b@microchip.com>
In-Reply-To: <e9bad05c-db34-ba2c-df5c-ff2f7f53e15b@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 10:38:23 -0800
Message-ID: <CAOnJCULkC65FgOakjPgoACdpiQFWTiEPCox3ayMWWZwVa91fVA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Cyril.Jean@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_133840_324918_6BDE1C07 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <Daire.McNamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>,
 Padmarao Begari <Padmarao.Begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:19 AM <Cyril.Jean@microchip.com> wrote:
>
> On 11/3/20 10:00 AM, Bin Meng wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Fri, Oct 30, 2020 at 5:08 PM Anup Patel <anup@brainfault.org> wrote:
> >> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
> >>> Add initial DTS for Microchip ICICLE board having only
> >>> essential devcies (clocks, sdhci, ethernet, serial, etc).
> >>>
> >>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >>> ---
> >>>   arch/riscv/boot/dts/Makefile                  |   1 +
> >>>   arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >>>   .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
> >> I suggest we split this DTS into two parts:
> >> 1. SOC (microchip-polarfire.dtsi)
> >> 2. Board (microchip-icicle-kit-a000.dts)
> > I also doubt what is the correct board name. I suspect the -a000 comes
> > from the SiFive board name convention, but does not apply to the
> > Icicle Kit board.
> >
> > @Cyril, please confirm.
> >
> Correct. Sorry Padmarao, I missed that one.
>

Ok. I picked that one from U-Boot. What should be the correct board
name in that case ?

microchip-pfsoc-icicle-kit ?

>
> Regards,
>
> Cyril.
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
