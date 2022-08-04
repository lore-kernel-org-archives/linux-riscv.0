Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BEC19F29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 02:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4jktdXlZGUjo/Uu0lY7HQ6wjgiJPvZpxz5HQBR15fA=; b=MdPZTXTgQUoxjP
	/7oEA+1KJRPOUYK73iq2q4HNwGIKaoEUc9MFyTvfw59M/VehfEXq16Bq1vvTqa0Q4yCSZnBX7kJnd
	X8xWKvm24Ez5xU50Tp48yvc25Ijz2cFdC2a6Pk75cnj6w1iirkKO8NSlgnD6Yk2HEV8dB+QJSyMwH
	x6MfzOKT/hva8fll03B25sUw7WC3UGdP8jRTz//ZTJHGzHOvopVy8RUVRF+L9yEoNhp78dnyPqEFA
	XEIRs84oxcOrW1Gn8ymX1zYiMCODRgIF8q88MRkwi31dKWbc5RiKxvij43gbWJzV+3O4g3o9+u100
	sxyUiuR+i7PuU72p8puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQM8-00Douk-13; Thu, 04 Aug 2022 02:13:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQM5-00DopH-TC
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 02:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 587AD6177D
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9249C433C1
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659579176;
	bh=epAxio5diH96CFBkzTZwKEWSTogy6nSq9q1SQoW4viM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ceCGZfQWkWmI6GpvHGENHKlJTVKAuQBEnZSFMbNMwdL3adkcUOIQii3S0f4Kyp8Bb
	 KoXLuNDTPpeM+tbNcQ49P9oq8jVA9vMK4FMy6z8jR/3HCqVL1weN5EOOqETXge6yJG
	 nBFGD8bOrJmR9Mw5WhHCIO5W1I09DiyNemQ1xw8F2jamvkzlU7drDgbdstNxPtv0gF
	 Vixg+rpEEnKCDbYzHgOPtaX3dCOJO0pZPkL1wllA1/1afczoKpJ0EKktRsTh3uV5ga
	 i+abEpZGK1uyPnCu7xZC1uylg7v9v8aWRlyowogN82MXD6DXPnsGgaBQAXlS/xu4Mc
	 2iS4HY3nt22KQ==
Received: by mail-ot1-f44.google.com with SMTP id o16-20020a9d4110000000b0061cac66bd6dso13340062ote.11
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 19:12:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo1kHN+J2pIONlj6+4u3HvzCxQrLaOnj59MzJEe68qMPz1F8uHkT
	qmIhL+cq6vQ+q45+WQqKlnCgg+NvdABDu35G/co=
X-Google-Smtp-Source: AA6agR4F20j452D1vIKrFY4A90rWCSqTF2vNMheqHPpQqXXnlAlq4zSIa+r6cn2/wD2OCL0hfuxWK19txHwype4SI50=
X-Received: by 2002:a05:6830:18fc:b0:633:9af8:f137 with SMTP id
 d28-20020a05683018fc00b006339af8f137mr4813011otf.140.1659579175844; Wed, 03
 Aug 2022 19:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220613142947.GA4110@lst.de> <mhng-f091aa29-2a87-4d82-9bab-f35533de7161@palmer-ri-x1c9>
In-Reply-To: <mhng-f091aa29-2a87-4d82-9bab-f35533de7161@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Aug 2022 10:12:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQPX0bbFvkkXCA2hUf2ei0KK1ZCHtNWj+JMDgsMP-M4oA@mail.gmail.com>
Message-ID: <CAJF2gTQPX0bbFvkkXCA2hUf2ei0KK1ZCHtNWj+JMDgsMP-M4oA@mail.gmail.com>
Subject: Re: [PATCH] uapi: Fixup strace compile error
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Eugene Syromiatnikov <esyr@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_191258_014260_67C579AD 
X-CRM114-Status: GOOD (  16.34  )
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

Thx for the reply, I even forgot that patch. I would update V2 with
your acked, and Christoph advice.


On Thu, Aug 4, 2022 at 8:40 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 13 Jun 2022 07:29:47 PDT (-0700), Christoph Hellwig wrote:
> > The change looks fine, but the commit log could use some work, please
> > move the notes from the back to the front and make them a standalone
> > commit log and just drop the rest.
>
> I'm digging through old stuff and don't see a v2, not sure if I just
> missed it.  Either way I don't think it's really a RISC-V thing so
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> in case that helps.
>
> Thanks!



--
Best Regards

 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
