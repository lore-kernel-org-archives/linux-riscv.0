Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0169EC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:20:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D0E20857
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3g55HkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D0E20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mTAeTPRh9XTMBBNWDQM5zD3/1qMsMktwsROebeSwyMk=; b=Q3g55HkBpqDgR5vG4UcnTxdsG
	y6pMJUUe0kJCX8DL6naW1mz5ZZfvsFwwjIsWFqUtePUIWb5tevPieWarZKquTg0YvvqigFYuEeKyn
	ubjysf4iZPtsEBSbUxuokqjlqm8XyEpwouQCMXzS2dBybyXp6l1FnwUI1FAgUvId15o65DyZaQhMD
	a6+GDHhN9r8WsKUk920ocT6nB65Qfh8eVVAIRbpSbPM3WemnnypAI+8hygW7mKwzcKUTPCYJ9BHiL
	ILVid9pRHnBQ0TqsA75UBSE5b11vwu5fLTJ9sHQZl9zQ9caNUnWoaou19zck49Vv7yhpT2Lom2vVZ
	T+xp5MGyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khq2U-0003uG-PZ; Wed, 25 Nov 2020 08:20:34 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khq2R-0003tr-VS
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 08:20:32 +0000
Received: by mail-ot1-f67.google.com with SMTP id f12so1464206oto.10
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 00:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zoLRFUA0UOuCTDy7THZUgyhBhgqkrrondnvPvdrtcFg=;
 b=fDR3GXySoF2//0Ntg2apiq9ZkVncfNuOQ871GbuXeA+ZoyVO/wRsfZHjVzBL3dSy8T
 AXs9wjf+66xqS4pbjX77Xw/lTep3+8qbqu9UT7i1Dn4+UJmMME7SK4jzV25Zr1nZ3RpE
 faoAw/p26G7Gm6WXvsQHE0h/djyUnlcNa9sgzPr+/c08O0uJKcUisFH0TWgFEoSCEPrY
 xSoVHzQRCSeDfi964HhwrePq6NtCDqOmeaW9stpy9w++lu8Ws8U5idFPRSUp5DkD/jio
 DM0skZqnKSvm5EvDyhqm4nCqfKs4VVFeiaVKiOmG+GIRE6fXLpwS9KO1k1c6lb7xDUBC
 KD/g==
X-Gm-Message-State: AOAM531ZyeAPZEA1YV8kN6VpqOCVv/y0W43fvXqWUeGitYpvcTQgg8aa
 4RoBrjAZ1t/3nfHAE2aPjA7iHMdcY1MQpo1fHCw=
X-Google-Smtp-Source: ABdhPJxwvqnk8L+RYTThMXySQlr48viGfbU8m6s+yiQa/XSMu2Zf8WqhbfSOwgVCyYMHbrR/H3486uXECtcjzMisV+Y=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr2041047oth.250.1606292422883; 
 Wed, 25 Nov 2020 00:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2020 09:20:11 +0100
Message-ID: <CAMuHMdX7FvJAPtGaAa1=V3X-LVA9oB+MK7GNg02pj5874MMLVQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_032032_060252_CED23FF7 
X-CRM114-Status: GOOD (  14.98  )
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

On Wed, Nov 25, 2020 at 7:14 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/25 3:57, Geert Uytterhoeven wrote:
> > There is no need to enable Virtual Terminal support in the Canaan
> > Kendryte K210 defconfigs, as no terminal devices are supported and
> > enabled.  Hence disable CONFIG_VT, and remove the no longer needed
> > override for CONFIG_VGA_CONSOLE.
> >
> > This reduces kernel size by ca. 65 KiB.
>
> Indeed, nice saving. Just tested, and all is good.
>
> Can I squash this patch into the 2 defconfig update patches of the series,
> adding your signed-off-by ? Or would you prefer that I keep it as a separate patch ?

Feel free to squash it into your queued updates.
No need to add my SoB, as the full updates don't pass through me.

Thanks!

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
