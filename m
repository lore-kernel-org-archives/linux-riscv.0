Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018CDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 01:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfBOn60i+Y9PtVC+5SJf+O2HoKUXCfZPGA+CVwPvslE=; b=l/6+qJvzcBBNFJ
	eLY+bHx2qM1gzU28vrBR3+PwnqsvljNFzjajN0fCQTWwGVMl/oImBfOpRbwAazqMvE8NQ1datT9a1
	LEYkP37jzrG7JTCbVO8+SoVePBiP13sWRLrsHCTxjvjA/rBVh3/sIDUnLlrPWvCmFK7UGOgKkKttt
	DHN8ILboqp7Ap9wU1w7gIr2rRtbHMUBlQX/pzxDvuTWSkeFGQyOHOnwKcVy8+Z+scItYxw4KxLnqv
	A6bMgV7SQRYtI9tq6QbEJs2Gu6dbsjzP+RqVRXleH6rQ/D6DIxaa9H/GVx7iIbxFGlOwl5tWFAmzo
	lTxZfUscr0Es2NcxNDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1ecd-00Fz7h-TY; Mon, 27 Dec 2021 01:16:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1eca-00Fz6s-M6
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 01:16:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 940E0B80E67
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 01:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0EFC36AEF
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 01:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640567772;
 bh=/z7kme4bAiwTLDdXUCZwIBJQhAMqQrAiPXS4+K/K59I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KQtMqOjbQ/OdSkeUH4PBiKSq7gjg3i+63PKzbqlFEos0Z0Q4cZxxwB+NsdbDrp0E1
 GjCYdqcMVEUBLPeEpOp3Kctg/KAci4YC8HJ6Kc/Tw3r754wphyVOE/grAEHJqeqDBy
 +zmgvx8r+joB8av4xPPkuJOlekE/MHRCuTPbBRJBJDrdYS8vtHI0z4aUI2agrNXj7X
 qV6heQfcBVXMTyP6FV5v/AuEfn7HiBLd+d8xYFX3ww8ZK0gssr2ud9WBlaveKeWsYL
 DJlUvkVeS9t7NWjzqzyVfIZHEEGirsTqbdZmiHPAM334NqdL7PEQZG/8PxjXSLDbBI
 /nzF9SGXyQCmg==
Received: by mail-ua1-f43.google.com with SMTP id p37so24377172uae.8
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 17:16:12 -0800 (PST)
X-Gm-Message-State: AOAM532MBg8JyXk9k0JsJ5rb12HLJFAE+9gcTOnDICnrZ3f7RAQJw3ua
 Xw2+FwReq9BBuQoxITC+eMcyK7QVlpJkpKosKAU=
X-Google-Smtp-Source: ABdhPJwCZOVhpDI9dtpcpVNVGGROplltq8Ye3VEk3SxSC9+3ldiUZ6rezfBGzESvhn3WsG4SgZ6YkH+M5aBUejD1p70=
X-Received: by 2002:a05:6102:a83:: with SMTP id n3mr4298119vsg.2.1640567771713; 
 Sun, 26 Dec 2021 17:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
 <20211226162223.795f9417@xhacker>
 <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
 <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
In-Reply-To: <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Dec 2021 09:16:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ04utyOc9=q9Tu92togGuyygKgq3tWwfPBCuyTfLh2SQ@mail.gmail.com>
Message-ID: <CAJF2gTQ04utyOc9=q9Tu92togGuyygKgq3tWwfPBCuyTfLh2SQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <anup.patel@wdc.com>, gregkh <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_171617_023732_4942A4D2 
X-CRM114-Status: GOOD (  21.79  )
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

On Mon, Dec 27, 2021 at 4:31 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Dec 26, 2021 at 7:38 AM Guo Ren <guoren@kernel.org> wrote:
> > On Sun, Dec 26, 2021 at 4:36 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> > > On Wed, 22 Dec 2021 20:59:30 +0800 Guo Ren <guoren@kernel.org> wrote:
> > > > On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > What about adding RV64 ILP32 support instead? This don't need HW side
> > > modifications so can benefit all RV64.
> >
> > ILP32 is another topic in C Language Data Type Models and it couldn't
> > replace the standard rv32 ecosystem.
> > COMPAT is a common framework in Linux (7 arches have been supported),
> > so let rv64 support COMPAT mode is considerable.
> >
> > Customers would choose ILP32 / RV32-compat by themself and that
> > depends on which one has a better ecosystem.
>
> From a kernel perspective, supporting both is not much more work than
> supporting either of them. We had the same debate for Arm64, and ended
> up never merging the ILP32 patches despite them being well written
> and maintainable, to limit the number of supported user space ABIs
> as well as the possible attack vectors when there is an exploitable
> bug that is specific to an ABI.
>
> arm64 does support big-endian mode, which is a similar niche, but it
> can't easily be removed after it's already supported. Supporting normal
> compat mode is the easiest here because it doesn't add another user
> space ABI, but I'd strongly recommend not to add any other ones.

@Palmer Dabbelt How do you think about supporting ILP32 & COMPAT both
in rv64? And let users vote by foot which is better.

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
