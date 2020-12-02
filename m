Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B50C71155
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 18:49:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9642173E
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 18:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9642173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z/4OKK6u9QqtUGb1606oB7aakqpFpLaQcGN1HlJCaiM=; b=FreHmWjh5EdhzvFDkT+lExFSV
	/2NMjhjg8129118xpw+Ey6cDFntBKZeIXAFEzMozv8a063LfnuVPmhhCUkmOu+HTd3o8ipKjKvDuw
	dTapy+Nff7BY77vBzUaq6T647pxh2PPvCKFAMjYZ0HiaG4U7PopdSi5HRTGvwdzNskbTqE3L0TVPy
	jH4qPFLfYBDaW5PS2AY+8PwMLu9KNBTGgZk4zaGfqPh1emAJiBKJIlIAUAvU7xIPlgX+Sub1mgM9/
	LvD1XFuNzpZyGY8LCJkEmBB6knZri09VpsUfJ2s57bwb/JjWHuyzmrmhd0xd8q592VmVsnRWQCkuL
	zHntpS4AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkXBr-0003wd-U5; Wed, 02 Dec 2020 18:49:26 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkX6w-00014y-5J
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 18:44:19 +0000
Received: by mail-il1-x144.google.com with SMTP id p5so2481551iln.8
 for <linux-riscv@lists.infradead.org>; Wed, 02 Dec 2020 10:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uARoucDP241L4eksuDPrkjlIJVSjlk7U2tzC251j7eQ=;
 b=iBcXkKsc1+A63PzEeDJ/UPDk1sbSz4QoQMmKXqHbU1T+IiCmA7lGgdoV5z/4ySyNUy
 vrAMD8SsMds2gRA8yi+8IjVN6pQzptoegXiRC7PsmL75yISYcfFnbK9vAfNkXDuzO9qM
 k0rt/ZFc9m5a3uaW0oGvSo9OrU8pHKs8Wg/LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uARoucDP241L4eksuDPrkjlIJVSjlk7U2tzC251j7eQ=;
 b=jZlo6RbPc5D7jDm28/f4WeFIhuNHG4IVWySvch+SKXQBMsD2PfmfVXLLqGbgcDI6L8
 sZJJxsqsebldFlMajsd5sbnO13rm3t+00MowfxwU1YfHAu4u5j2YT7cagunqZIE9rcag
 /W6otgu2/iYnzaPZZrJRE8Jl0tz3nzGXhzNaDWgrTP0fbiulsIQo54Op3LbvDR+A2DXp
 0dXZ95SVU3BDyFBx7PLaaz184+3wwfnbqBHwipNl2Dx/o94EsHA56Y5BgWR6j6/vPboF
 xT/I7L3g1MqS1jkHfqpiD4KgpoEm2CDBRqwGecwEuLEHm2ecl7xD2iIff8XxtQ00zkEj
 tcmQ==
X-Gm-Message-State: AOAM5327f1cG0eTdjWLnjKsCzooz5sc6kzGtfXavki+3dVuQjqW3iFoX
 PTIb26x3ssXZ0G+jyt4D9ZcpzBiCSwGbHFn0Je/1
X-Google-Smtp-Source: ABdhPJxk0FiDQTfyQ6fKrMsQ4RGI3WyhhJQOCYciecAv7LN9WwdpHBELyFYnkGhbAtg8yLVKGdDvsbhhBKxHkKVoqmU=
X-Received: by 2002:a92:d588:: with SMTP id a8mr3619797iln.79.1606934651573;
 Wed, 02 Dec 2020 10:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20201201110316.28656-1-conor.dooley@microchip.com>
 <CAOnJCUL3qELbuDAAgyGB8jMP3x6WB1qhubd3UZNKqE5zs1B2wg@mail.gmail.com>
 <1cb10c03-d5fd-c6bc-62fa-7eb854a31cba@microchip.com>
In-Reply-To: <1cb10c03-d5fd-c6bc-62fa-7eb854a31cba@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 2 Dec 2020 10:44:04 -0800
Message-ID: <CAOnJCU+8Mu4t3U7sVoegm3d=JmK7oBUThumazOZu1ytP82AJjA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add microchip polarfire soc support
To: Conor.Dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_134418_480445_2B7CC150 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Daire McNamara <Daire.McNamara@microchip.com>, jassisinghbrar@gmail.com,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Lewis.Hanly@microchip.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 2, 2020 at 1:13 AM <Conor.Dooley@microchip.com> wrote:
>
> On 01/12/2020 18:06, Atish Patra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Tue, Dec 1, 2020 at 3:03 AM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
> >> directory
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > I think this patch will make more sense in my basic SoC support patch.
> > Can I include this patch in my series as is?
>
> Eh sure, I don't mind.
>
> Should it be split and I add the mailbox entry in my series & you do the rest?
>

Yeah. That's even better.

> >
> >> ---
> >>  MAINTAINERS | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 2daa6ee673f7..2241bdac4816 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -14989,6 +14989,15 @@ F:     arch/riscv/
> >>  N:     riscv
> >>  K:     riscv
> >>
> >> +RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
> >> +M:     Lewis Hanly <lewis.hanly@microchip.com>
> >> +M:     Cyril Jean <cyril.jean@microchip.com>
> >> +L:     linux-riscv@lists.infradead.org
> >> +S:     Supported
> >> +F:     drivers/mailbox/mailbox-mpfs.c
> >> +F:     drivers/soc/microchip/
> >> +F:     include/soc/microchip/mpfs.h
> >> +
> >>  RNBD BLOCK DRIVERS
> >>  M:     Danil Kipnis <danil.kipnis@cloud.ionos.com>
> >>  M:     Jack Wang <jinpu.wang@cloud.ionos.com>
> >> --
> >> 2.17.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> > --
> > Regards,
> > Atish
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
