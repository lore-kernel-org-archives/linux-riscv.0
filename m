Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1067C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2IF94gWbk5CB6udjaebY7otmThSipCYpuKmeEXoLSA=; b=X2muMlLmBvlhjV
	B8vRg04KP3YT+v4GffByE92M2foFzZa5u2PMJasGH85/7wM2Qam6FpPfxiVfjFhbqVo5ES7iBDBFA
	J+gk7ga62kQP7IEDr+3JWALlP8dv0uPBJwe0Lkt4B/9Wd0VFeokbLBh9uQliwYcHcq85fKRbMZWTF
	tzFSsk8vI3gfXkO7b+wS7mhrGphrRJ23mQ5TFocYDWru3+kiTQLo04WqIzFhZcICYp/q8tWKiXOje
	5aCcM0wbsbZCpz7YzuwFF4I7M3B6RDmfXyAmFPFS62K6kzbRniLm9fdHB8gpY6C7Pt1epYwllbF8V
	UDxqPKecffqPMK5XQpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n01Dj-00AN2y-9o; Wed, 22 Dec 2021 12:59:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n01De-00AN1l-Cw
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 12:59:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14C9CB81CA4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99CDC36AF3
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640177982;
 bh=yUSezh8Ez/4HnaaaU0t9sScXTKUzFtDICzw9rplOwh0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=teDDEUsCwvex4tZ2ZwW3mE3BDbioJzh6ah9QQqpJPQv41CnQfcZLSO4mR9ADrYSZi
 ywiW0eJE7onT76oEV1r0fbfbVBk6wT6U+LfCqCkAxl1ht5oLxzpoHQjBOd6ndI22tv
 dOs1Ux8E342t3H5L4D5E2PdoEulbF53NNKuX/9GWJdqQcpcbg7uUpHI9EGIqvRazQH
 G0JtLaj/utYbh+vONZJtGNQrCRQu0ODOdBP8sFcom9qi1eq7iaz6O1RxFoq46sO8HO
 RNlEqxnRN3hOlbScuipxCHUQUEIo0JlJlubUDb3c6fcx608RkfO5hdpSNVs3RBmP4T
 OVKOs8eeMQ6Xw==
Received: by mail-ua1-f50.google.com with SMTP id t13so3971620uad.9
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 04:59:42 -0800 (PST)
X-Gm-Message-State: AOAM532o3zZJafcxyW2a76sK0y/4a4K4T9WqJgcQBGIP0sd26FmkTR2t
 qBukhDLm29YfGj2tmx6A7SJoF6scLuzTseKGkNM=
X-Google-Smtp-Source: ABdhPJyvA90AYgsDJpACv4jKWJAgkxalQ5p2v7+W5kBRXr/Xc9BYymsguHUx4AuTbEdXG1Bmqk1TknlK03LuwOJei2s=
X-Received: by 2002:a67:f94b:: with SMTP id u11mr858030vsq.51.1640177981532;
 Wed, 22 Dec 2021 04:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
In-Reply-To: <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 20:59:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
Message-ID: <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
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
X-CRM114-CacheID: sfid-20211222_045946_741236_CEC8AAD3 
X-CRM114-Status: GOOD (  29.10  )
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

On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> > s390, mips, sparc) have supported COMPAT mode. But they all have
> > history issues and can't use standard linux unistd.h. RISC-V would
> > be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> > /unistd.h.
> >
> > The patchset are based on v5.16-rc6, you can compare rv64-compat32
> > v.s. rv32-whole in qemu with following step:
>
> Looks good overall, see my individual replies for minor comments I had.
Thx for the review :)

>
> I think there is a bigger question to answer though, which is whether this is
> actually a useful feature for rv64. In general, there are two reasons for
> wanting compat mode:
>
> a) compatibility with existing binaries and distros
>
> b) reducing the memory footprint of user space in a memory constrained
> environment, either deeply embedded or in a container.
>
> For the other architectures, a) is clearly the main driver, but equally so
> this is not the case on riscv, which does not have any legacy 32-bit
> code. Without that, adding compat mode would mainly introduce a
> second ABI to a lot of environments that at the moment only need to
> support one, and that adds complexity to the implementation and
> the extra attack surface of the second syscall ABI when an exploit
> may be possible only in compat mode.
>
> There is still some benefit in b), but it would need to be weighed
> against the downsides above. Can you explain in more detail what
> use cases you have in mind, and which CPU cores actually support
> this mode?
The most reason is about b), see our customer's product:
https://www.cnx-software.com/2021/10/25/allwinner-d1s-f133-risc-v-processor-64mb-ddr2/

So I think all our next generation rv64 cores should support
compat-mode. Compare to releasing rv32-full core, rv64 compat-mode is
very cheap for our CPU design.

You would get the answer when our new generation CPU is announced and it's soon.

Currently, only qemu supports rv64 compact mode, that is my colleague
(LIU Zhi Wei) contributed.

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
