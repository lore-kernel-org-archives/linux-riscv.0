Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D5EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtMMDcGHAtWey0OzN09UqC12SMRnVUJxJid5wdi7UMM=; b=0GJj/FGNEsHtKV
	4ryt5Okq+Ekz+BKJmTV3AiT54koDn37v7/tjZka9kaaOjUfvaVesGvl9D+HVUVp03wgPA6RYoeetu
	X3/VOlrUT15n45OcNr935nIHQmIXsM6uvHudYDUcwU/RoVj3QQYxFNmGWrq/O/e2nDm45ef5XgJiC
	pkajmJ8kz9YSO+NYOiqFERJaKxQLzs6VpSAwx/wB241mnq39VXUEE11Ko4oo6T5lAQ5srKXzJBI6A
	AGbFfvLzd5nDqMYEBXbqepQc9H7oUyUapzedaNd88pOp+ZbvD0ccBKQMfT6lVVaSRetXCHd36JnFR
	rgYplUpvs766PHB8054g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzt8-00A8MI-QQ; Wed, 22 Dec 2021 11:34:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzt5-00A8L2-Jq
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 11:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5120EB81BC4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 11:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCC8C36AEE
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640172865;
 bh=Fi3+odhuzWqyoIOsS4HSOvfce+S3ltBSyG1ZwqaAFn4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=foAIuKLE8FYEQkEdzpCYiOLK6T3NsAXvweIXkdoDP0AQlA60YQUvNdKHX73qrQ3+r
 3XligsoacZsbDkGcOGekamcCtPfav66NAXrDCoULGRo82yGsLOHSJYAxjWCLn2SPXA
 OtakQV2IKdorX1Ylu9I8F+GL8ghaCuG628jLZnkh7Ha61yr8t+djNhMQfvp7LUlTQ5
 YwIbePOX9xbXYfhteuHkueGTVY9h0lIwXnA17yNfiUl4As4v1pCY5ttgTt+wgYHXwR
 PaYEYquR3xiuYBaDsuXzYCy8zl1INANPsJ1kJMgaUzu13UzLIie9QccZJyb6hPm6EO
 cN/OhiqistNUQ==
Received: by mail-vk1-f181.google.com with SMTP id m185so1123136vkm.5
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 03:34:24 -0800 (PST)
X-Gm-Message-State: AOAM533qDiAjXUz3+QMhDMV2uOuP3HC+ojL8NOlMQVBr9nW9RifyRMte
 JD0au62gussAQOqa5NwznwXkAdejJDxuSP2Gxqg=
X-Google-Smtp-Source: ABdhPJxWEYRFXCwuHnukSTxHmYrUUDGyLCBZ+l40ti0zYBeaZ5biPhi2e3rHjJN/vnHepBjKUq7jC8D3B0E33xwBH1o=
X-Received: by 2002:a05:6122:a17:: with SMTP id 23mr853099vkn.8.1640172864086; 
 Wed, 22 Dec 2021 03:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-3-guoren@kernel.org>
 <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
In-Reply-To: <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 19:34:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTN1HZeycK-WOFH0EjmjtBB4T=9de6Qrjs=uhAsLoOFaQ@mail.gmail.com>
Message-ID: <CAJF2gTTN1HZeycK-WOFH0EjmjtBB4T=9de6Qrjs=uhAsLoOFaQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] riscv: Fixup difference with defconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_033427_820332_ADA4D8D0 
X-CRM114-Status: GOOD (  16.72  )
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

On Wed, Dec 22, 2021 at 1:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Let's follow the origin patch's spirit.
> >
> > The only difference between rv32_defconfig and defconfig is that
> > rv32_defconfig has  CONFIG_ARCH_RV32I=y.
> >
> > This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.
> >
>
> If the intention is to keep them in sync, maybe use a fragment for 32-bit
> mode, like powerpc or mips do.
>
>       Arnd

Some people are familiar with "make rv32_defconfig". There has a
32-bit.config fragment config in arch/riscv/configs/.

I've tested with:

make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu-
EXTRA_CFLAGS+=-g O=../build-rv32/ defconfig 32-bit.config

The above is tested Okay, do you mean we should delete rv32_defconfig?
I think it's another topic, I just want them the same in "compat"
patchset.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
