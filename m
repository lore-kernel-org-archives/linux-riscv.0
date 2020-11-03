Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7665C388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 19:03:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26FB220786
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 19:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CujEIKP8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="cnjLzlof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26FB220786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2IbL6Bnj2fiGgzx9DVaj2EE8obpx5m6o9NDld4anjI8=; b=CujEIKP8wrQ4bpfntm9P8b55k
	fbyN2zAX9ZfrTxzmAzjGOWF75uKx5FKQCAtyG2MeVirOxOisNKtqI6hibDmLzyN1naKX/pNBWmRvN
	AElR9+c9og9K5CQ2EmjUx2hZeQKsmjqCgeyf0psh6cgnIa2vDL5cMDvH8IALDzqAl9Kqcf8uNKZud
	zEjHezuDEjdKwFTZl0T3A1N2RzPgpIB7LbvKa8RyJGKJfhX1kuxm5rvHu9xRDQlM8EZpCAp0mR4K8
	EN11AEcBYyl2LaQYBoBqAfRyI9ZNPWgRZyvRje5g82mxbOYG99MO6f++nVw1vN0kWAgO6KCtrWjjA
	I4NrjBgwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1aB-0004Bt-IC; Tue, 03 Nov 2020 19:03:03 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1a9-0004Aj-2h
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 19:03:01 +0000
Received: by mail-io1-xd43.google.com with SMTP id r12so10575691iot.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 11:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtAMmYu/vtZ7Po/bgeGbuB1WjXTOAIZ7G9Kh+0nnjEg=;
 b=cnjLzlof3WkkkRXlleGAb0gmtfoEWI9a+NHHysOgZPQGr3gcMPkYjbBFIRcc2X/5rx
 GTVKYiTG62LMp2mGXlrv+rOvjs8+UkiU/2exa+3Wmq548VVVtYyJyx7KVPtCtJkgF/PJ
 MKETOILQOekdJOwbHuv9R0oyaKIbbSGm2nu/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtAMmYu/vtZ7Po/bgeGbuB1WjXTOAIZ7G9Kh+0nnjEg=;
 b=qBGtiRgAC4ZYhmLOiTx+MxEWZzFHS9mKzQgHBgPDEXL7mZjEJ/mL4UpweTlCp2hKbr
 HPiaWH6ItAf7hL06t2dZIo//GkTctt0KOjXE8yJYU3GsznByeOaCIFmoREZuWh28qHcl
 ytHjefehDYJ7UUl/QDHMWNxEqNIduqD4B0BX0F2G6jLSaMWjGNyM41E8iPSpbzwkt1Ck
 Hd9AVZtWmNxfbCy6zbzNNSxi991NRxPuX6FFolkVTdd2t0nkQpyw6bE7Zb8HHeNGxBNB
 wIDB8rsogMHsmRwLCfeGsv2hqT3hvToWWYeBsmXMMPexQzGYPTToXhMhbCQ6SmOko7iu
 T6Ow==
X-Gm-Message-State: AOAM530WhQApqf7ZiGNTR4fwFj0So5Ll5HS/QtbtjpkXZpbG6HcZ3ZYu
 ZWfTNoNDkdVtPBF5LEhvFhZOoLw41pr5H7pP8hTa
X-Google-Smtp-Source: ABdhPJyOIhTQQ4hlWFIb+00TD5h4rC1h2+ADQIBifhBDDykkmQERUZqR99jOE98JolQXNQZ1o/EBkJzgYxDpg/3nPa4=
X-Received: by 2002:a02:6a5b:: with SMTP id m27mr15343703jaf.58.1604430178788; 
 Tue, 03 Nov 2020 11:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
 <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
 <e9bad05c-db34-ba2c-df5c-ff2f7f53e15b@microchip.com>
 <CAOnJCULkC65FgOakjPgoACdpiQFWTiEPCox3ayMWWZwVa91fVA@mail.gmail.com>
 <c137885d-374b-64ed-42a5-7e8efe004660@microchip.com>
In-Reply-To: <c137885d-374b-64ed-42a5-7e8efe004660@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 11:02:47 -0800
Message-ID: <CAOnJCULbax3VnqjmWq8j4vxf=UrpOK9TMjwzXdZVP1iDnZ+GcA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Cyril.Jean@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_140301_150977_28723B28 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue, Nov 3, 2020 at 10:50 AM <Cyril.Jean@microchip.com> wrote:
>
> On 11/3/20 6:38 PM, Atish Patra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Tue, Nov 3, 2020 at 10:19 AM <Cyril.Jean@microchip.com> wrote:
> >> On 11/3/20 10:00 AM, Bin Meng wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Fri, Oct 30, 2020 at 5:08 PM Anup Patel <anup@brainfault.org> wrote:
> >>>> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
> >>>>> Add initial DTS for Microchip ICICLE board having only
> >>>>> essential devcies (clocks, sdhci, ethernet, serial, etc).
> >>>>>
> >>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >>>>> ---
> >>>>>    arch/riscv/boot/dts/Makefile                  |   1 +
> >>>>>    arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >>>>>    .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
> >>>> I suggest we split this DTS into two parts:
> >>>> 1. SOC (microchip-polarfire.dtsi)
> >>>> 2. Board (microchip-icicle-kit-a000.dts)
> >>> I also doubt what is the correct board name. I suspect the -a000 comes
> >>> from the SiFive board name convention, but does not apply to the
> >>> Icicle Kit board.
> >>>
> >>> @Cyril, please confirm.
> >>>
> >> Correct. Sorry Padmarao, I missed that one.
> >>
> > Ok. I picked that one from U-Boot. What should be the correct board
> > name in that case ?
> >
> > microchip-pfsoc-icicle-kit ?
>
> My preference would go for microchip-mpfs-icicle-kit. I prefer "mpfs"
> over "pfsoc" as "mpfs" is the part number prefix for the PolarFire SoC
> device family.
>

Sure. I will update accordingly. Thanks for the quick feedback.

>
> Regards,
>
> Cyril.
>
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
