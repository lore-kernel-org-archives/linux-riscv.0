Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C21C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhTgMvqV759YO3Xpsu7LFzx5CJN3GMYmUUKsLCgCqWI=; b=BRFSsd0NB8opep
	Z8/FGVvFD9/t8y4yXSPCxPBXH6kAwMGmsMv/lWSE5VpSxyJoiiRaKdG0/mDyGIigJHh9/Ut1uD1QE
	juqh3i/MSpE+Ud5EW5y8KzXIwtdLH06hFRokqZOAsnVapt4o6lUw6S9+piSXXuAZF2434HqV1bFe2
	blleTWE9WWlRlchVD6C1PS0Tu/fn/WgBEvZvXtoPiK77KOP2QyMQDRxSisX1BlIi4o7hSTqR1aX0i
	1wpVa2sJ2lydZW/pUGSW1AKhxm6uURZevWJrhOUV8F2GwM0h1Xz5Gh30pGy7V5zSgPZ3mEIXGDHNt
	6IcAtixJf8AZlol/sQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n028Y-00AcGR-2W; Wed, 22 Dec 2021 13:58:34 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n028U-00AcFC-ME
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 13:58:32 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8nnU-1mNAZe187i-015tPO for <linux-riscv@lists.infradead.org>; Wed, 22
 Dec 2021 14:58:28 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so1535303wmc.2
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 05:58:28 -0800 (PST)
X-Gm-Message-State: AOAM533gYnz0sJXrgiR1hgb47tYO4uk70e12RvBZ4drGBAT/MzSt8Lz9
 Rtp5Cwcb6OGJJvXEqB78X+HoAbvt7c0QK4db/9A=
X-Google-Smtp-Source: ABdhPJxHZHEwLAEwqHridYfJm7TlWCGLjIEDeHHUir8Cs1kP3HuMbH2jN9G4hTgoKteiOAzPC+bhvI86kuxZaYPixlc=
X-Received: by 2002:a7b:c198:: with SMTP id y24mr961837wmi.1.1640179840757;
 Wed, 22 Dec 2021 05:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-3-guoren@kernel.org>
 <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
 <CAJF2gTTN1HZeycK-WOFH0EjmjtBB4T=9de6Qrjs=uhAsLoOFaQ@mail.gmail.com>
 <CAK8P3a3m2Mz4Tvu+3cdji6iq_wvFZsYoyKvnaNKTEjE+ivex6A@mail.gmail.com>
 <CAJF2gTQEp0hEousuEyp5cPCa5Remb_8HMZ-BXZ393_z7hbne7g@mail.gmail.com>
In-Reply-To: <CAJF2gTQEp0hEousuEyp5cPCa5Remb_8HMZ-BXZ393_z7hbne7g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 14:30:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a165oWeGOgsM=U3F54e4HFvhJxr2sG0qoGLOe_WK8qAtw@mail.gmail.com>
Message-ID: <CAK8P3a165oWeGOgsM=U3F54e4HFvhJxr2sG0qoGLOe_WK8qAtw@mail.gmail.com>
Subject: Re: [PATCH 02/13] riscv: Fixup difference with defconfig
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
X-Provags-ID: V03:K1:ApPev+x1RamUVDBVRTMhmVxWKN5tdNPHUgMLzIIzeZGMVCxnKub
 LMAIyyPIjNimyXnRL2hlesVxAxfJUirLzcNWSr/QIBV9c4dZnMO5Qj3eKK5VAyDYPZP4z8v
 YjVMlL6QNj/hbQH6ZEgmgfogxnmowAd6kVpWpWUcmptFVvca6ScpnOcmghVk6P16Io1Bp5x
 u/WVUPIPflKjUt68dvKKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r7hUe3hKOQA=:/2TWLu+NUwEgkpFBvhLxxK
 nr3bm1sFifPwoUoDr1SW7S5Xb273NEvuV5K4TV98MPgdszsfBDwcBdeafGDmMbntSXBBODhLr
 0NFlr0932wfiYMpa/Qv3WVuaNrXgCK2SsQPvaUTVzuCVioFL5TDCmhvdXCrx2eXZE9bN3Dfil
 m5v2U1ePSoIxAvbr89i00lQGi7gbHzrH++cIeYT58BazgjXqgWHgVd7b2ynqIVDIib9Yr40eP
 0Xfv084byC6d03ASFNrRPYq4/YIcVAx2pp8pFMe5r8ftg4GMgBtciwsThstQ28i7+B0u6QQ9u
 2uHFqR6cqijVFxLAjufv8rNJIchT5cXyKIMTm0rFZHo3AnuT43IFurSwcjqSIq7Uvm+Swh+iA
 uy+TTM0SUj7+epsa2Bwt8P1Gf9MRO2SPZcAM8lVdSR/R4pmY1ggGitCdEu9FUYGXhy/aKd1Ov
 mBM1nQb1XhLF1YGGbv8DZ0lLshSSbdr16OLWdveCm+gdLBkAAWK5B+4P/5de6L1+PPqE8e3i9
 GF4DQlQ9g4OOZOJ3C9XeMab15ZDUL1J8aBT2su159tNGumODh+wooZJ1bY5po6bzIzbD24ddy
 YDSVfymYVu/f/gcOZs8U4ix6K8VMSeqfFl86IKFII/fsGlyqyqBQ24g7vVWMtMD+DzbuJMRjN
 aI1Nszr1Jh1bmveXdAYx5SftQ8FvEmdEzGJ3lmEbjRRYu+FclKT+M7UVo+QIa66aOOSuc1DyS
 GLvdd4JxITYZqX5rxv5b5gMbP9IpMRKWHqqB4CQcbvoT4W6MmkWk+6hSCaTy7lP4ih7IWN0Kk
 OnV222LYQBm3PJJWbGZ0o3WHMpRYNb49mFjvQBEawrk+oROHF4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_055831_038036_387EF7D7 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Dec 22, 2021 at 2:06 PM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Dec 22, 2021 at 8:51 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Dec 22, 2021 at 12:34 PM Guo Ren <guoren@kernel.org> wrote:
> > Given that there are no specific rv32 SoC implementations supported
> > by the kernel today (other than SOC_VIRT), the number of users
> > would be close to zero anyway.
> I really agree with you, but we still need the rv32 user mode
> ecosystem for memory footprint.

Sure, I just meant there are few users that would have to relearn typing
"make defconfig 32-bit.config" instead of "make rv32_defconfig" even
without the added Makefile target.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
