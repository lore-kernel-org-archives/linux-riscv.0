Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B82C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 03:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BD620828
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 03:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pI9rjiV3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="g4m4GWyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BD620828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KjWp85aOu8nJd9lXZpkle8WouyQUqThQumvs5ifI9E=; b=pI9rjiV3ox/IA6
	32chVMf9VLTyz4YF5pglsRHGY22bvf13tdzciDQRy1WRTNghKd3z1mFJNxX5p+5QBObrHPjgjUJHB
	B/W20KHF+dZfIPD/gqO1x1Aljf4TLS7ZREnLrTdHQhw/V7UYhV7KrxQLz+t5BH9bfcMiVZ5mk6PnJ
	jba+gvBj6ufRmt8V6AAhn6ixOFmfDjSV7O2Lv3cLw6+gczMlvV6uS6rzDOlYV+7be4/ouPkLhFpv/
	m2yrDCnwMTk9g7BQ6MzIwi9aHkWJuQy9L5xgkRLh6cfpdQ8X1f6USEcl7nZ1ajyj1xPzllcC2KkS0
	0taPgTfu7XAslx67JZPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8dE7-0007fv-1B; Tue, 26 Mar 2019 03:58:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8dDz-0007eo-Vq
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 03:58:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so1392992wmi.0
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 20:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRH1s9YJiR31RJ2pG6ORxQtgVj/UdG3ppK8QCCdxAA0=;
 b=g4m4GWyMNOWkRVyfb+owJZVT4jIOlAsRd9tFpObihKfpMBk2r+gA09kyiKy7vhtftA
 Gp303w373mNuTgqCMyjNjIQYNmObPu7Y5fCeE74mockFkoKhwOaM+PCT1wzEe4+fzucf
 nsWmWXDPWlT7tLjdCsx5s8WdiI0aDxWOUf++Z7bSElLuSJF33gDapD09sDncRUK/0R45
 kIrtvdMYDgCOiMOnNOFhyzih8gK0H1VC89JGKB9DgHGIApuUvLvLSUZxnnSJd6cko0Ce
 JLuoz3j7whiOF/uzLTdSXFPTzE1ak0eoYKrYD9Bovk9tac9jEVz7QX3rV+t/BnL+nPEG
 swqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRH1s9YJiR31RJ2pG6ORxQtgVj/UdG3ppK8QCCdxAA0=;
 b=bOL7LjapRi6i0bMFrhQu74auG7vf0Wp8yu/oVblbfWOz42Ke29caPHK4Bx8cyNGw58
 IvUmFp7r4u+9QkkeBhRogni4Y3w4pqGF0G1RNUSKyo+0f3bZX0i91GpvPFtWLujTOcyU
 f40+YR8oM223oRE/AHQZ77zYphdHQ/Efz+tg+jKpA1xZpsl0Xvi2+Oty8eIj1DIiHGFa
 IEt4eU1M/4wE+LQb9AnjtD3ywPDnXilHYmy1qcZRPNUzOUSz0oufu5pvt+CCodlrJgTB
 bHmAXq4KqekN/m3lp3V5tdikeIe66M6fpWGkty/Ziqh3RSVEYs39uJrA3vAtLLmKJVO8
 RbGA==
X-Gm-Message-State: APjAAAU+ncFb3u8Ymgrs2UBw4r3rEt/y0EM/+lS8g+EcY0qOI2jR7lw+
 JvhrY9sV4ct7N2cGvnGsfxfH8fMjpC/5PQph+Umz9Q==
X-Google-Smtp-Source: APXvYqz3TE5j2MQ/ay3Y0//XjNpnqYEOIp9n6myVVm0DT6hB4/Awsu1fzt3kbP21He5Bv1wG4AWlxOkW9EvAGrFZanY=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr5300725wmg.132.1553572684717; 
 Mon, 25 Mar 2019 20:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190325083027.6393-1-anup.patel@wdc.com>
 <20190325113748.GA27843@infradead.org>
In-Reply-To: <20190325113748.GA27843@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Mar 2019 09:27:53 +0530
Message-ID: <CAAhSdy1XsLkrJRyzi9WV6uAi+WFC420hs_asE=1oQ5L2ZrTuOg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Always compile mm/init.c with cmodel=medany
 and notrace
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_205808_077577_6927B6ED 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 5:08 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +ifdef CONFIG_FTRACE
> > +CFLAGS_REMOVE_init.o = -pg
> > +endif
> > +
> >  obj-y += init.o
> >  obj-y += fault.o
> >  obj-y += extable.o
> >  obj-y += ioremap.o
> >  obj-y += cacheflush.o
> > +
> > +CFLAGS_init.o := -mcmodel=medany
>
> Can you keep the two flags adjustments togther, preferably towards
> the top of the file?

Sure, I will more the flags together.

>
> > +/*
> > + * The setup_vm() is called from head.S with MMU-off.
>
> s/The //g

Okay, I will update.

>
> Otherwis looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
