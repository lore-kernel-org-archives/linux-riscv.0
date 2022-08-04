Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F0FC19F29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me8o1pfs3XEwpT8LM4nw+nCqqukl8EO36ch0sZRL7rw=; b=w1dNUbfy5msxre
	tL1c6JgO5GFKQcT6/mv9Qw1FTnyFBKbCaHgcqvxGqUYKBJ5ETU7P8NOJyFQROJ/Ndh/VVdBHe9kUZ
	KKPz8dBwBfCTCoV52Rt6/1SRv2DRLmt2NaUX6QvOhfrWPK61XO373llBOaMQxpoFYyaZykXaEWwDj
	uppV8mt0kWuCYivZGK2RSJY6xA9MTDfbCseFQ8FvJh4AOY3QrL5iHIF9S5BFWPJA8CCfvSonb7Zr1
	LIt+Ger8+ixbZUexOd9K4RaTYGVt4UB3SOJYXW/c6p7JSEmgiEBQtMaYtiqXs37EfO+djoQEojyem
	EHdx7SIwUruLAvxWTESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQJJ-00Dm5I-7j; Thu, 04 Aug 2022 02:10:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQJE-00Dm0D-U2
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 02:10:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65CAD61781
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B10C43142
	for <linux-riscv@lists.infradead.org>; Thu,  4 Aug 2022 02:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659578998;
	bh=fUku56VQ2QJ/iS0vukKD33SzPJmyHQRWdFJILjyWgdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XbBugSmWJvnJ/F0sEnNDkbqI7NQrMy3jdjQbJ80MHgMUwTr0vRtcP+B1CaiS4WxBu
	 Hx7mgaJJGqh0U3+ZPHOu2StmBipPmhV/VjxZuZsTQXMEoqEXUX9N5AsEJ8nqZcugsz
	 Jd7wcLFvhxueZzeRljkup0+sWkQ6KQ82weBGGAsJMMRYGCkikTniYAJZyiLbKgrATH
	 EZ5k/+29P6nAnXF3PaeT/RnnMsEUldxKAL0Wx6VnduGe54+JdRLTB1xS5xXwx4bANV
	 f6rLKoY3O+QCR9sCYeMDxL0RROQi4c+gyGJ1KTT3FrwetDUcitEATybAbh1QbzE+lJ
	 qYR28iqSO/ANg==
Received: by mail-oi1-f175.google.com with SMTP id bb16so21786780oib.11
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 19:09:58 -0700 (PDT)
X-Gm-Message-State: ACgBeo2zXBw5xiOhEkpP4C6M5tQ8fTSCkXv7HVFua44xcssj8jjK1qwX
	Uffo64HiMP9mxk1kxCA1w/wlzUkLefUcxA2tuOQ=
X-Google-Smtp-Source: AA6agR4+z8qNh9gQH5GYsp/nQ60cgGpjBe6+LMaLKEYQwTGENsFDC/lucJe1wCE0kICaI6NGXcudgjmukq14S+LsnGo=
X-Received: by 2002:a05:6808:1a26:b0:33a:76f6:fc19 with SMTP id
 bk38-20020a0568081a2600b0033a76f6fc19mr2862221oib.19.1659578997421; Wed, 03
 Aug 2022 19:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220613013051.1741434-1-guoren@kernel.org> <20220613142947.GA4110@lst.de>
In-Reply-To: <20220613142947.GA4110@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Aug 2022 10:09:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtnMoeb62-63Ou8y4DBrdYM7iztdtfLuXX9U0LTWUHLA@mail.gmail.com>
Message-ID: <CAJF2gTQtnMoeb62-63Ou8y4DBrdYM7iztdtfLuXX9U0LTWUHLA@mail.gmail.com>
Subject: Re: [PATCH] uapi: Fixup strace compile error
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Eugene Syromiatnikov <esyr@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_191001_031096_3C2864C7 
X-CRM114-Status: GOOD (  11.76  )
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

On Mon, Jun 13, 2022 at 10:29 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The change looks fine, but the commit log could use some work, please
> move the notes from the back to the front and make them a standalone
> commit log and just drop the rest.

Okay.

-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
