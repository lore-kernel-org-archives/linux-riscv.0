Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEAFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 09:18:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3E5613B5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 09:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA3E5613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tgu+Q6yEhFtrxokvJ5LOc3hZsWcH3xoyGUJpV5I5n1s=; b=N+GuZiYEpyMiNE
	Inj2wDI9TCvD98GBaN5tbhFr3o3czIYE1THi7f9y12bhxIcnv3lEK0HEoQ22vPmkx1kleeHv1H5BQ
	/OeXU6BOkLkWahl7TI+CzPqLvtuuMryXaEgHN8VcvwRvQ270AxLL6rtoUBWAz9TciPGRGU38qhRC2
	RjlSTKQ6eQYAMCjlqP+1/AWhP5NT9svoF7c5AcBBZYQkEEFFJLHm6hyfRxq8fHm0uGFf/631WZnVw
	05Pb7nF3ZLKn8NkMIxhy17PNkrt2KIEgDtsnAyTxwGZLKqzdnokHG5H770QKXBvZ9H/MVxFC6iuIf
	o7f/wbAhYfv6v0htTCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgaI-009jiz-OU; Tue, 05 Oct 2021 09:18:02 +0000
Received: from forward500o.mail.yandex.net ([37.140.190.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgaD-009jel-Ar
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 09:18:00 +0000
Received: from myt5-6c0659e8c6cb.qloud-c.yandex.net
 (myt5-6c0659e8c6cb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:271e:0:640:6c06:59e8])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id A206F941E36;
 Tue,  5 Oct 2021 12:17:48 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net
 (2a02:6b8:c12:2514:0:640:ca5e:c8fa [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
 by myt5-6c0659e8c6cb.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 IyV6tEzelD-HkDqMhNI; Tue, 05 Oct 2021 12:17:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1633425468; bh=CrnGMerQ4LBYjjGbgeqFgGHVtZrQ+QTtn5a0VX0cO1Y=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=dehZ7uZt+fO6YaaLE03MQykhBGAWbnTmJAz787q5v+kP+tnjCX9x7H9RnogO2XnQp
 o2LRZpnAlGHdRWJteqIyL14dh5xgLy2vRi3CnyXYsauaUBuFMzC+aXli5//Spgpk63
 AQfi00eYfDiMTtzwMWrmEkxl0sCLVfek9C7+wa9k=
Authentication-Results: myt5-6c0659e8c6cb.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 43frcM9OPL-HjPCRD6R; Tue, 05 Oct 2021 12:17:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 5 Oct 2021 12:17:44 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Anup Patel <anup.patel@wdc.com>, Ard
 Biesheuvel <ardb@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Jiri Olsa <jolsa@redhat.com>, John Garry
 <john.garry@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Vincent Chen
 <vincent.chen@sifive.com>
Subject: Re: [v3 00/10] Improve RISC-V Perf support using SBI PMU and
 sscofpmf extension
Message-ID: <20211005121744.728385be@redslave.neermore.group>
In-Reply-To: <20210910192757.2309100-1-atish.patra@wdc.com>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_021757_983427_8F8B6F61 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

On Fri, 10 Sep 2021 12:27:47 -0700
Atish Patra <atish.patra@wdc.com> wrote:

Hello Atish,

> Perf stat:
> =========
> 
> [root@fedora-riscv riscv]# perf stat -e r8000000000000005 -e
> r8000000000000007 -e r8000000000000006 -e r0000000000020002 -e
> r0000000000020004 -e branch-misses -e cache-misses -e
> dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -e cycles
> -e instructions ./hackbench -pipe 15 process Running with 15*40 (==
> 600) tasks. Time: 6.578
> 
>  Performance counter stats for './hackbench -pipe 15 process':
> 
>              6,491      r8000000000000005      (52.59%) -->
> SBI_PMU_FW_SET_TIMER 20,433      r8000000000000007      (60.74%) -->
> SBI_PMU_FW_IPI_RECVD 21,271      r8000000000000006      (68.71%) -->
> SBI_PMU_FW_IPI_SENT 0      r0000000000020002      (76.55%)
>      <not counted>      r0000000000020004      (0.00%)
>      <not counted>      branch-misses          (0.00%)
>      <not counted>      cache-misses           (0.00%)
>         57,537,853      dTLB-load-misses       (9.49%)
>          2,821,147      dTLB-store-misses      (18.64%)
>         52,928,130      iTLB-load-misses       (27.53%)
>     89,521,791,110      cycles                 (36.08%)
>     90,678,132,464      instructions #    1.01  insn per cycle
> (44.44%)
> 
>        6.975908032 seconds time elapsed
> 
>        3.130950000 seconds user
>       24.353310000 seconds sys
> 

Tested your patch series with qemu and got results as expected:

perf stat -e r8000000000000005 -e r8000000000000007 \
-e r8000000000000006 -e r0000000000020002 -e r0000000000020004 -e
branch-misses \ -e cache-misses -e dTLB-load-misses -e
dTLB-store-misses -e iTLB-load-misses \ -e cycles -e instructions
./hackbench -pipe 15 process

Running with 15*40 (== 600) tasks.nch -pipe 15 process
Time: 20.027

 Performance counter stats for './hackbench -pipe 15 process':

              4896      r8000000000000005
                            (53.34%) 0      r8000000000000007
                                                (61.20%) 0
              r8000000000000006
                  (68.88%) 0      r0000000000020002
                                      (76.53%) <not counted>
              r0000000000020004
                  (0.00%) <not counted>      branch-misses
                                                 (0.00%) <not counted>
                  cache-misses
                      (0.00%) 48414917      dTLB-load-misses
                                                (9.87%) 2427413
              dTLB-store-misses
                  (19.43%) 46958092      iTLB-load-misses
                                             (28.58%) 69245163600
              cycles
                  (37.09%) 70334279943      instructions              #
                 1.02  insn per cycle           (45.24%)

      20.895871900 seconds time elapsed

       2.724942000 seconds user
      18.126277000 seconds sys

perf top/record also works.

Tested-by: Nikita Shubin <n.shubin@yadro.com>

Yours,
Nikita Shubin



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
