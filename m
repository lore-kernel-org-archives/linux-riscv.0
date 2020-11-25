Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6555DC56201
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 09:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4995206B5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 09:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WU54xG91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4995206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qm+K4FCFCgko1qvFjj8LFDu5rC8OZCcX7DC4v6GMXtI=; b=WU54xG91tYMFR1Hu5xn7U8RZf
	CnxstTxVm4C0JZIVguJubqOHLm7VD04t+9vTJIGSyQwMO3UT/6B3XF2vAJ9PCX6xKJcju9OQ936HH
	k5XDgcIKrSkfYwkR5d3nIrJbtCxAXaNGbjxSLWAdFo0mrEBQsU2rV2jHJRDJlW62MReQHMNgD3NGW
	8+9P6iwluEQI8oqIRSnV0Ynx/7kQJCSz+IJXc4NrRCuZZMPpGetKunxPNZYBk3J3WS9NRaIs1eO46
	UIofnAxXrHBGCozsZQ4N9Kou3+N4omQR7RUNiEynYBSNGd12bKu+TZewmwfvx+EqflWzPMrwZVF9f
	y2+ALsFRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khr48-0001pP-KP; Wed, 25 Nov 2020 09:26:20 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khr43-0001ly-1T
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 09:26:16 +0000
Received: by mail-oi1-f196.google.com with SMTP id c80so2139457oib.2
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 01:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0naYcgOV/DJ+KlBgbco2JRHU2RQrz3Hzd4fGpqCjFY=;
 b=DNd2C5dGQVa10O8JrwsQT0SXkK1CKobV7ANnmoZExxD8nAW5piL1okZio8QmxpYel/
 zLmxCZa2TkkP0SdDha8n4ENBMKzj0RlgfS5R2pvKKj0BET/0DPuwxaciwt07iEcUvC9t
 cfGZOP3fIU2fmh00BFcYgVoa/VTSHpxFs6jVpzCtsUkTIYjWx1jzzQWrDwblrADnUVJA
 Hvg0NJF6URWoL9IomHq69YxTal1Bi0PPKzvvcsSatm/W60I5eoB22cfq9HuMyRhfIpge
 /WiuWOUm35LyMNCLvCZkDTQE+PWKZuN9vPZO8f2v/JKWQdUxVnTE6bvuAZTG5dA0EcS8
 oa3g==
X-Gm-Message-State: AOAM530JfYk1P8GL0GwJIyj7PURKIYr+bGSzfQf+eTHxZzK5GWgkSTdJ
 7A5aNHuMAS4jeTrEp23Ua+kSZOwHdxxXGcsbfJY=
X-Google-Smtp-Source: ABdhPJx18RYQTxCsRgCfIAFtw7e7+lJPxNNjSOT84XKGNRcQCOcw9TVuqcmzURk/G9pefApf8Ugv7JxzIsZsRQ6643Y=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr1683258oic.54.1606296373860; 
 Wed, 25 Nov 2020 01:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdW9dySq3y_Uixv8_7e+Pe2VKw4iGV36mx-DbX6-yzk-Gw@mail.gmail.com>
 <CH2PR04MB652268FD0FB44AA5DF36ACFBE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB652268FD0FB44AA5DF36ACFBE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2020 10:26:02 +0100
Message-ID: <CAMuHMdXEzo4EOw_=MgskNXPrbkP4Ui+dHKZ5iyJ04h453BUAhQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_042615_184440_2438B893 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, Nov 25, 2020 at 10:02 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/25 17:51, Geert Uytterhoeven wrote:
> > On Wed, Nov 25, 2020 at 7:14 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >> On 2020/11/25 3:57, Geert Uytterhoeven wrote:
> >>> There is no need to enable Virtual Terminal support in the Canaan
> >>> Kendryte K210 defconfigs, as no terminal devices are supported and
> >>> enabled.  Hence disable CONFIG_VT, and remove the no longer needed
> >>> override for CONFIG_VGA_CONSOLE.
> >>>
> >>> This reduces kernel size by ca. 65 KiB.
> >>
> >> Indeed, nice saving. Just tested, and all is good.
> >
> > I used my old script[1] to check the impact of disabling config options.

> > I haven't done enough riscv kernel development yet to assess if I need
> > CONFIG_FRAME_POINTER or not.
>
> Disabling it significantly reduced code size for me. Since the series is more
> stable now, it is not really needed, so I disabled it in the defconfig.
>
> I was just fiddling with CONFIG_UNIX98_PTYS. Disabling it is OK with the simple
> busybox userspace (no telnet/xterm like app running). But it saves only about
> 1KB with my toolchain (gcc 9.3). So I left that one enabled. I am surprised that
> you see 16K size impact... How big is your image ?
>
> For me, it is 1.768 MB right now for the sdcard defconfig, with CONFIG_VT
> disabled and ext2 enabled.

It might depend on how you measure.  "size" says 15 KiB impact for UNIX98
ptys, while bloat-o-meter reported less than 7 (my script uses "size").

I'm at 1.88 MiB, with ext4 and without frame pointers.
I also got rid of the EFI partition support, and a few I/O schedulers:

+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set

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
