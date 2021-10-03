Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3366AC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 15:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD5461A38
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 15:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAD5461A38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFa19PO04vPhdTIxTUTArESPKkLIhcRiTKf/sk2z9ys=; b=m5bsahvDsa/2Hh
	30Zg7yd9Sbks+hm07DkE1UldVycFjyETlYHv8AgdVy9y5YZaSOyCqwSmnFgfJMDIiXmIdeewJ4+xL
	x6xBZ27Kt/E52FBnzYYJwEdruPiVSeXgb0Zo/Wob7yzXbByCWQ41OCFmvdHTBBymI5++sLEUAuowc
	hDg9UBl9iCQtjp9bhn56ytVzfc4M+GxOzG/m6RGaURo3t1OwzbP8PbjyaR6ujRxJkd4LVnljOxYAp
	Z5T2RXU6OWUPl/qEA2YO0Hy0wphcp8VGCYzAxvilUTMilBrdU7GWUDIoLEHRBAH2Y9fGD0Rpuy82H
	dd0PENqKpsR/Q2nJhafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX3SB-003whN-Kk; Sun, 03 Oct 2021 15:31:03 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX3Rt-003wgY-Kx
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 15:30:47 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MElhb-1mZZkZ21oh-00GKcN for <linux-riscv@lists.infradead.org>; Sun, 03 Oct
 2021 17:30:40 +0200
Received: by mail-wr1-f47.google.com with SMTP id r7so10109200wrc.10
 for <linux-riscv@lists.infradead.org>; Sun, 03 Oct 2021 08:30:40 -0700 (PDT)
X-Gm-Message-State: AOAM532OjlfwLh15NZNfGleIzt/FWoi5l1bDQguM9v+zkC4qKO+XSM12
 a0E5v2urk+SdGYOmy00jNodOeXfzf8CIirrTNN0=
X-Google-Smtp-Source: ABdhPJwJGaMMarFg1ioVjxCZ2/4wMv2JVL+5Fcq22wk7PQqXZw0GCeAokU19zp848kd3HeQyLietiBcO8YZxvzJvNCE=
X-Received: by 2002:adf:f481:: with SMTP id l1mr9039258wro.411.1633275040200; 
 Sun, 03 Oct 2021 08:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211003002120.198752-1-palmer@dabbelt.com>
In-Reply-To: <20211003002120.198752-1-palmer@dabbelt.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 3 Oct 2021 17:30:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rwMWQSmdW4ARkk6swT9VC2Fcx5nBWVugSOuhv8o7QHg@mail.gmail.com>
Message-ID: <CAK8P3a1rwMWQSmdW4ARkk6swT9VC2Fcx5nBWVugSOuhv8o7QHg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Include clone3() on rv32
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Brauner <christian@brauner.io>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
X-Provags-ID: V03:K1:UoOMVv59Wu3qwcjnF1BVH05WcGT+aHO0ydqXpko3TURlQMaiq9Z
 a96mlhaGaIDIsHlkpYcbHRE8YCvw7Llk6SP3cxL/yYJRbQFIXiaAFZlfLYSWu7ihJ+RjDPW
 aZNHByQkMGSLJ93qpN9QaR2PrZnxRo9D7L6WmrE4wzV5Tb6O3w3RepuXiJuL4xfcLEBhFpm
 pgHElL/LGCTeaAaBUVPQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VdnTWVJVKEI=:WISIFzHpfhU48oOtdK6Ewb
 P7pySdAFS7vGoSJASPnNu+VwCHeGA6wciWpUBwNoJqrWuGpnilz/A/SOEZHXdYcR/QiBov7iM
 Y2LmIo5ISQ9w6GXcelRrF31rdz3atJ4c7dI5Aj3qY5hq26QHniPjtMxADKJ+5+ldAWp1iketC
 +HQPclSZImLQzRf6qpMbIdTCEnRfcZoamaojFykhCu5BTTUhQZg93ZolSce2Cx4WjVbSWu+VM
 6ZJKA2X2HsPQO0IhA7L7yIkQ9nahvP4sCsXHP2ul0k7DJ7/YZXFrWik47GMv7eowTnEj87w3H
 vjmAlKrhBt8OkxrrsAckOzqWcc/Z+bPMk59Kgou7OtIV0Yryjdfz49++mPpbO4bQcS/Q/wlGV
 MDCmqSLn1ueBbC/ICd9l7HVsfPFlFp2yDMB0zwOYuo1V8wEXPdaIMseIbQCtv4cjltAGuazCo
 wTmwac2quA9VYh3lE3mFX3AhbhLcTuusx2E8TcQZHWpmUYsmdM7BjI+EJZLGDZeeYkg9D6TwF
 /jHlDYdzcSvAD1g7Of0D7v5NJOBboI7vfdhRwjTFTd2Jy8PWiwCyoGV98plhCYi/iMRzZRkvm
 3diD17JvQSL5ZN0Vue3PL9q25NbkhUDpqyJtPDqAR05SoLlZo86HoXhqEqeePojuCAPva+tWG
 e6Jj9AU18eWVAKXqEElZ8SU/YH87cyavOGqFbJw+nfYZh6dGs749lZH6itgYlIWbtf/6EuS3D
 5mQUIynesoURzbnBDfKAorzgOWcdpAcBz9kUVHMqgF/ZxHNeI2DJ2fJ8xDr22UDHUqlMvNBVw
 aAz75wGnRm2D9QqjAjatldjrNOqShxFSA6t+bdz4iXOhbvJ9Kpim3/v2YyoqWzUkDo3EBqVUi
 V7uTTWEPVVwJe1zQUPzg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_083046_040401_121AF55C 
X-CRM114-Status: GOOD (  11.95  )
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

On Sun, Oct 3, 2021 at 2:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> As far as I can tell this should be enabled on rv32 as well, I'm not
> sure why it's rv64-only.  checksyscalls is complaining about our lack of
> clone3() on rv32.
>
> Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

We should probably reverse the polarity of this symbol and force
architectures that don't implement it properly to say they don't
have it, but for now, it definitely makes sense to treat this the same
way on 32-bit and 64-bit risc-v.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
