Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5012DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqrDxDJnCZhgyn91hycy+dfNFEazO5+v+Ox5FAGmM8g=; b=ixxJnxhfPK2Nbn
	Q7067PNXe9u1FDADvxEo/RI1xmvecXRcQm4Jh2BRwLe7gz1+Z1lQB2N2TUzmFQPb0EYt15u9W/AC9
	mNZYJwlj91DSL5hbWrJSHQbphaSv24PMm7qEvkNA2iBeAz+uEsH6v9yVxuUT+7Ws7qA5hbfd71kS/
	NEgXggFkARNHiC1o6olOPka8ey9qjAQl59f8xcgyXj1de04yKcybRiXaz+9zdoAWpQekrxCOk/PWw
	80SsFlFQwUyRYqIBCG9V7jqFyxQYzO6PzFAVJUL55UAUiSJtjdd5ZOodiGpZ8yReewESCaBZ9x5n3
	1BfkAlNHF9Z3UhAyPK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gsR-00E0jw-W1; Fri, 24 Dec 2021 09:28:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gsN-00E0hm-Hp
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 09:28:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91CCB6202F
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 09:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F52C36AF2
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640338113;
 bh=PLFbhEnthe2tnia9t8u1jYkAlCDJSzqn6fyBcMDKv1o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uKNEKY8/qLIxOIc3KS1/XZqJFJHYDGPb+1dwhzC/WlxSPz+hVEzHiJXip08NifPH1
 DGRFjrG/UuYim/Mxw9pF+qsY1TUkZrBU8WZERUoReUAUNUDYWQTAGXmVmNAfnqncl3
 txAYYvPvhzhz/Yucu+RAyqr1IQq0eF6hmHKmk+gse9szo7yvKzaJgSfxqlSEAo6Ijk
 axzK0OdGQHJOHzqOw/QyCRDYjWz2AM8XVu/7JfUPgrpIIX6gv2rysWj45SaQ86olLB
 +JHhZPwLgUDDRYrxFRAY2G6s9FEMQ8S4acNM0llT2g9xFsN2tSTo8epGbvTDamA7l2
 Il829e4Y0gajA==
Received: by mail-vk1-f178.google.com with SMTP id g65so4660345vkf.4
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 01:28:33 -0800 (PST)
X-Gm-Message-State: AOAM532V5f353GjYkODWU4vwEsI77dz+JljRi7Zp//7ufl+nezjoZize
 FwfR/CGakUUMNpqLYPZ58pk3fueNYeuqDYIJ+fk=
X-Google-Smtp-Source: ABdhPJwW7NSOoagEdqoBmUtuhDfgJjtWgSXSdapmfy6cK8l0WMX3tLWmnQIXstx9eCAaF/D3NeIIDS+4RysDGs/44Ns=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr1850928vke.35.1640338112154; 
 Fri, 24 Dec 2021 01:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
 <YcVuYEt2LQArK5iL@infradead.org>
In-Reply-To: <YcVuYEt2LQArK5iL@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 24 Dec 2021 17:28:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR=RQ_zhkUYXHyCkG26m6HasdwrsaXsUU-k8snO2rhh-Q@mail.gmail.com>
Message-ID: <CAJF2gTR=RQ_zhkUYXHyCkG26m6HasdwrsaXsUU-k8snO2rhh-Q@mail.gmail.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_012835_671120_51C6B697 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, Dec 24, 2021 at 2:53 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Dec 22, 2021 at 12:35:22AM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement asm/compat.h for struct compat_xxx, RLIM_INFINITY,
> > OFF_T_MAX, is_compat_task, compat_user_regset, regset convert.
>
> Much of this really has no busines being duplicated over all the
> architectures.  I have an old series to consolidate a fair amount
> of compat.h cruft, I'll see if I can resurrect that.
Sounds good. I hope you could do that after my patchset merges. Thx.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
