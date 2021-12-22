Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9EBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0pyymWcsTWuvWfsEuVuvZ+2PqnWgS7VhSRyFpCSnJM=; b=ljfymP5T7NKuiP
	D+w9t4HwiToVXG6IZ/NAUq9Yga4rKXqsUGk2MCLM/2/1m1zHBhWuXZBDIIqzfu+5kznl5z0cc4WiS
	DA0P+CcTACEsVTTdqct00e+XTJG2xVNX9kvMM6KmfvyqJR4aCtxPUsBgkkUX0cCRqI0OFwW5iuE3R
	PPbFT1ol7mQLXhVvRTVRPiob0gvC+OIJeTiYKTvVnUbUX1iwzplxiej0WTZ3S861+K50r9PI0so3+
	bjTKOXYGZdX3dTlcM67RGBO6NODcFeFMBFzQkKQZ7Nb4kAtHTrwqitEYvCDwQzBHrU7sxmGxP1uS7
	/xIaC95vP8wIFHzrZ2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n01hP-00AXmF-Pd; Wed, 22 Dec 2021 13:30:31 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n01gT-00AXJN-5w
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 13:29:37 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MA7Om-1nAR0516PC-00BbFU for <linux-riscv@lists.infradead.org>; Wed, 22
 Dec 2021 14:29:31 +0100
Received: by mail-wr1-f45.google.com with SMTP id t26so4949354wrb.4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 05:29:31 -0800 (PST)
X-Gm-Message-State: AOAM5303mi2+yTNPLhOdQzwIpTTA8SE1y1EmJJf0NTxjtvGFrX0X5/fj
 H5lND9kn0tvF20JYsv0+EtQT+UpFc2qKNijwdpU=
X-Google-Smtp-Source: ABdhPJw0nfzYEJHZ07y3vp99CtMxCtIx4hPphKIiW8tqqMsfij+vBR7u+JaOTSFOhAqaTYEbtHQeGItEWv0smRfi5/Y=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr2115267wrs.219.1640179770964; 
 Wed, 22 Dec 2021 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 14:29:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a07-v8WXxD7SHS0j42=bZgqDrOKGmisiuz=DbvYno5-SQ@mail.gmail.com>
Message-ID: <CAK8P3a07-v8WXxD7SHS0j42=bZgqDrOKGmisiuz=DbvYno5-SQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:Yx1sCrnTBUqhZncC+oVU+U/GJxG9IqaJNy7D9KmPUROdoKqKS81
 R46OQgAHBStvvLujbSHq+dy4i8d14Tkr7D9VAxny7MYjDqIBD778nc98OoXrqE1mR8xVtJW
 M29W0fPkGVRhr4MhIiPQtB2cmE3daEnV8G2IG9kyu8OjoJZbUZcbeu3g8rpKEraz7dvZM5H
 /q6MNpDKf7uIUnEUeAH/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pp3XHnKKmkY=:IDHmTQx5HqkyiXBuA5RQHX
 bZquvR3hGx00DUna37hZvdGYGQ8knlj1G+RNOlzKUpq/pWDQ48f0moORXb6dTO7UCdtSV6Q1o
 /GJwktbMkZZuJDpknM+sWj/b3YlrBffRE3d/Nyw1BZsY/wdGmNtrDw+DfcxqzrgWPKTw2bFzM
 rXeqLVMaTkJRVxaWZW4otUQuytZ+1ThhgBasHDVRn/rCMahGO4toT64V+yudqzEFVsaLmCkOF
 8zIm0mAnVG2cnMZ5QevUabvuIL+Mku6StovKWgmWfAnPJ7WjrVWyWA++DasNiALb3znQlJIC8
 +7ZqvOHdb5Omx/ncOrQ7rfmvEQsCg1Ee5peYltTs6MJankdYxeeAb4Lrh1gfQRzA7BMfNCR89
 8TnqVgdRIllDqEIRdKqio8xNadqhQS8tN1MrmjI4lbw4hp4nIIuUy62s77nMRpxoxMs8Am1kI
 cp0/7t6Irc4C7ygreUXlX+lLAzk6VIKAHz5LiLZvBnaD+8ibQKuseDvf1GHXycNbdQ0e5muRi
 Ah2PgZEDbFHndbTvu7ebsOjwAVI291TDUAHAfuF1Ov+mCYElL58J+VwK1jYQm6MBYyhbtCmyK
 +/2WYKH761ninvFONlzVwSw/sPrDKRaqLMqLN22+vs7eisRvP5ioK1wHNu2tm6h9w6LWVYQSS
 6LnX1+Uw8bojcrSp5u9DjPGan7mW2T+U+EbXmdGJMBztjuOQJqKx76Hw92uTmkkHwV5NwNhvn
 l7IdT2zG41euHq/b1KkvuysfJACzXGwt/0we0f3urgoMfLBXU1rT9YchNhUpH3ndYgk3bQP14
 a2c/Dn917yorydUFuIGGQLnA+Pa7rkmWREKku09EBHitG0pkH0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_052933_554671_5FB61AC4 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, Dec 22, 2021 at 1:59 PM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
>
> > There is still some benefit in b), but it would need to be weighed
> > against the downsides above. Can you explain in more detail what
> > use cases you have in mind, and which CPU cores actually support
> > this mode?
> The most reason is about b), see our customer's product:
> https://www.cnx-software.com/2021/10/25/allwinner-d1s-f133-risc-v-processor-64mb-ddr2/
>
> So I think all our next generation rv64 cores should support
> compat-mode. Compare to releasing rv32-full core, rv64 compat-mode is
> very cheap for our CPU design.
>
> You would get the answer when our new generation CPU is announced and it's soon.
>
> Currently, only qemu supports rv64 compact mode, that is my colleague
> (LIU Zhi Wei) contributed.

Right, that does make a lot of sense. I'm not sure we'll see a lot more of 64MB
DDR2 SiP implementations when a 128MB or even 256MB DDR3 configuration
has almost the same cost, but for any of those sizes I can see why you'd want to
run 32-bit user space, as well as 64-bit kernels.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
