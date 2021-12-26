Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C4C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Dec 2021 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip+7mPdtcxHky3okWlya1xvPVRUKN17hlk5ETf0jzpQ=; b=W9SpTWkLkJhWnR
	mlhIHyyFj8C0rZoLYwPSvXenj8XekzKyhFgU5xX79wegLkYKPYBWVbCMGrAjYRY/qROrdjnZwBSRD
	NRhPeGW4fIKuE3At3wIdZocvOVGKWV8jplZLpHJNbtxq5i6WtKltm4WCQ7D9hxLDOoijX/LrdCIUS
	KcCmTfOd2Ki7SQG+peozakyOkgWeESEKqBhjD2ccwbGREuNgvVgFMCotYt/LJ3xLfTNqM2prpUiNF
	aQwP9BSApB5pIxGUyUuyE6VDCm7x1dIYYACIIOfPKdkWCaQJ7zC+duHA6H1QwG8lAfU1qbnk4V0Fv
	uVcns97SUiTyA6NF+Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1aBE-00FqWd-Rc; Sun, 26 Dec 2021 20:31:44 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1aBC-00FqVy-6b
 for linux-riscv@lists.infradead.org; Sun, 26 Dec 2021 20:31:43 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M894P-1n6n750TVT-005EPt for <linux-riscv@lists.infradead.org>; Sun, 26
 Dec 2021 21:31:36 +0100
Received: by mail-wr1-f44.google.com with SMTP id t26so28675311wrb.4
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 12:31:35 -0800 (PST)
X-Gm-Message-State: AOAM531/xvi4FRBDxP72Vngw52qWL44J+EzXJDrGsaZ7QYt8/hgNs/3w
 XpxW3RYW79OSDMm2nu82oUCYhNjr+HbTXSIvT6c=
X-Google-Smtp-Source: ABdhPJyO2w1XFqKG2mUoY/v29qgBpPCjDgTH702P8VhFGtr45r1AvPY74wUaZF5xCNebcMFHkX5hYE/0kqidQVo995I=
X-Received: by 2002:adf:f051:: with SMTP id t17mr10579480wro.192.1640550695572; 
 Sun, 26 Dec 2021 12:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
 <20211226162223.795f9417@xhacker>
 <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 26 Dec 2021 15:31:22 -0500
X-Gmail-Original-Message-ID: <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
Message-ID: <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Arnd Bergmann <arnd@arndb.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:xKPnmZ578AAF4I+xNkI1I0Y1WA4Ml//6OMFEAoVD7N/Fc2KUl9c
 iNE8li07riJXlxgFDYa9V9P1Yz5ziRH8X/57HJRp3fbgVsCVpYTxWRakhkdg0TS51249hDg
 cRvODJMdlojIS0KqXrH39fX0FkLZ58S65keB2E87OzafosGClqWdjhMy7q36lUtrjA5/YBN
 019Q7+lpN9I4LsLQ3kIiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SMiVmlRIQvE=:BE4opgtuB8v72K/NrUV1WD
 4zVaB5p81HxavITbvyBibWTKu6asaNCKFkx21Kpf1WMdklRKkUyTLUOxEwre9KdCDGG7ULlxK
 pWcA30mquSfQEn+6Phmvr84flWFh8EcN/0HY7erduYQfrlxFIrLbMoeg9vxBeTJbPWy+T+S2r
 jyxSQIenVxu4cZufZP3D36pcb+Yl7BOLYeYgnUmaBYk+zbvXNpiBZchwI/C/K2c/grHHjl/NO
 KD5vqcvjYuSaFrOT6TJUWm73Hh5FxUe4F9JfWXcvIZwy4qGKdmf1BeZueCXB/O+yj5di/jfNG
 RtGD40yKkx1tz6DAljIxAqfPDshKXrEm+FJWGcht8oFzYPLk5+2GiTCpXgxhSUxcmFZFODKDh
 e3xtROgbHe4/NufQgrK6QaQHFQEk1fkBLooXaBHJwMrG4HsiYsJUCenE6n9B+AiY7xfT3DUAw
 jX6WLAhO9f4t6rC0sRjzseMzvxv/moSAqR9s/EEzlWeAOeo05ONcEJJUk+fWbUEtaBXFfIr3N
 ydGm+5ZJXAdKiRD3+ei4e9Tyu8i4dUBH+v3YxHMhhZA3kUhD2Lh8nj2Z8M3wyDhw2YA+xKguF
 261sQuW0KQdyfl7byYjmumVaytHkkdNw7xmniv3WsAtikWeHUeLP2yIrQqc73EOyUG4F3KLB4
 NlJMFTN5DURlflCKl9/QynaClXXaT1Cye4Z7fZ3RgGBevzD7b3m1s4s1Cr8GEKRMDdNI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_123142_591435_46CADC03 
X-CRM114-Status: GOOD (  16.44  )
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

On Sun, Dec 26, 2021 at 7:38 AM Guo Ren <guoren@kernel.org> wrote:
> On Sun, Dec 26, 2021 at 4:36 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> > On Wed, 22 Dec 2021 20:59:30 +0800 Guo Ren <guoren@kernel.org> wrote:
> > > On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > What about adding RV64 ILP32 support instead? This don't need HW side
> > modifications so can benefit all RV64.
>
> ILP32 is another topic in C Language Data Type Models and it couldn't
> replace the standard rv32 ecosystem.
> COMPAT is a common framework in Linux (7 arches have been supported),
> so let rv64 support COMPAT mode is considerable.
>
> Customers would choose ILP32 / RV32-compat by themself and that
> depends on which one has a better ecosystem.

From a kernel perspective, supporting both is not much more work than
supporting either of them. We had the same debate for Arm64, and ended
up never merging the ILP32 patches despite them being well written
and maintainable, to limit the number of supported user space ABIs
as well as the possible attack vectors when there is an exploitable
bug that is specific to an ABI.

arm64 does support big-endian mode, which is a similar niche, but it
can't easily be removed after it's already supported. Supporting normal
compat mode is the easiest here because it doesn't add another user
space ABI, but I'd strongly recommend not to add any other ones.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
