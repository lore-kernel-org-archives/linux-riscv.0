Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A21C47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9867A60FE9
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9867A60FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWVF+vAUV9UEGh2tw6PFy/bAZStGHmMejgwKaihelpc=; b=f6cI5qLV1BxogW
	zAjmJPrDR6jINuaGXeGpPjCA/WNd3hUUImZwVLBLlZjDooxNIQWgsRrh2tnvBTZFIANRbEZjotIwm
	uV3TCmELe4jHuwHpgooHiRu6L05m9Ad9Us7Rs0mXDnxCgUwQ4FTVoEoRCs10SODbiRjJ1xpg/gHbP
	dALBc+gUEeN6ehhyx+WtJFjkWkn3U1tXnoFbQQsxoWhc0Q/DXpaL3uszzNM2rAVdxxwENfC6un0ri
	qb+4DorLEp2ooKS1XSgfNE5keSZVO/bzAWWh23PeFzk86rKES8KhoLEB/0qQZ4HdWNZkh2+T6DRTT
	YsI/0+2xdAZA/ZacTVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9xf-002831-36; Mon, 07 Jun 2021 07:46:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9xc-00282Q-RH
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:46:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56E2761263
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623051972;
 bh=aKh9TrwohntWukPeb8eXG9QkpL0E7zlN5CxzbKaesVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AQqPz/xdXabEyCypW5iV8x+ZQjmQJ3JYdPZ1/ERiY4MRQVB7z0XY3bt0kmrqADDl7
 QAQ52nTSWW5U3gyaQ2uHlr+z9Juebvnrs745xGIe17jY9R7k+rdqUOmXJiqoaUhuHa
 DNhdfXkJI9UNPbU0+TF0XgOdFM+Bwy5v8s+BZ5P1LFWTE+BSv7CJjQ9uXtjeCSdXXF
 S/+PRqSjoiu6Ylb3/u6FocwnENvXx8NZKzReJxdbYOe2u14HF8L88s1YuT5u80LDqv
 KOIFDgs8NBMk7oeJlac/AvSYxR6yG/C2FnCPCAxbYQo+RUWClFlHLNewbSRcX4o/U1
 5E5GijghcFuxw==
Received: by mail-lj1-f172.google.com with SMTP id o8so20929054ljp.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 00:46:12 -0700 (PDT)
X-Gm-Message-State: AOAM531lcMLnCncfbjxu/Oa1EFHTq/z+pUGa3U47+lM6boy5WmVSxVgu
 RgrUmybOKrCdX4lcLa9k+1BIaXMB3ljIlSPhuIY=
X-Google-Smtp-Source: ABdhPJzxueGqIP4yyWtEMyoXRqvhk8OiKmBujjKQ9JamOA13E8TTZrWry7LLQ9qEzkhD8kBUPmRAPlNuYHUWxcCixZU=
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr13832361ljp.105.1623051970623; 
 Mon, 07 Jun 2021 00:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org>
 <20210607071916.kwdbtafbqp3icgia@gilmour>
 <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
In-Reply-To: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:45:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxVHYS8m4pWekttRCSbE8O6g7ySDs5YJ=-BtqXZwvYBQ@mail.gmail.com>
Message-ID: <CAJF2gTQxVHYS8m4pWekttRCSbE8O6g7ySDs5YJ=-BtqXZwvYBQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime@cerno.tech>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Chen-Yu Tsai <wens@csie.org>, 
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_004612_916637_9723D70C 
X-CRM114-Status: GOOD (  17.57  )
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

On Mon, Jun 7, 2021 at 3:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 7, 2021 at 9:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:
>
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index ed96376..055fb3e 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> > >
> > >  endif
> > >
> > > +config SOC_SUNXI
> > > +     bool "Allwinner SoCs"
> > > +     depends on MMU
> > > +     select DWMAC_GENERIC
> > > +     select SERIAL_8250
> > > +     select SERIAL_8250_CONSOLE
> > > +     select SERIAL_8250_DW
> > > +     select SIFIVE_PLIC
> > > +     select STMMAC_ETH
> > > +     help
> > > +       This enables support for Allwinner SoC platforms like the D1.
> > > +
> >
> > We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> > looks good otherwise.
>
> Correct: those subsystems may be completely disabled, which would lead to a
> build failure, and a platform should not force-enable drivers or
> subsystems unless
> those are build time dependencies.
>
>        Arnd

I see, thx. how about just leave. I think the user would make mistakes
and waste time here.
select SERIAL_8250_DW if SERIAL_8250

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
