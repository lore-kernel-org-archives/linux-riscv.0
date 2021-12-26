Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532A3C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Dec 2021 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3owXxSvIjQZMC6LJpP9PHiceJfka6umbHYBOWNFGvo=; b=A/0IcnPRCv1eca
	xhZde2mFrJZlVrDWLU9mESsAW91Rpz6hV4MShvIiq3XmszykaWHjlnzmqAH2etmakN1fkvsHNyEAz
	Cu4k30h3fk28zCDui5FPjmtU2shBXFPgyhrE4X9ozG+JC83mD7tATUv6X97jv7rd3IOQmYIpcgx9U
	QDYR8Azc9L2J9bwD4kCeqFqrCzBJoIIi40iUOELsvyi1fEVhf60huEQrciS14zEenavlPOLVRxl05
	D+HyKo+pitDvHTZlFm0hQdDTIVJJTlysnrXWfZWPetlsX2fa5krtiZkMVMfUrHIQHQD70OwlrLPFg
	bqFJbqmeOJOQE/xKC+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1SnT-00FZPN-6c; Sun, 26 Dec 2021 12:38:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1SnP-00FZP2-TD
 for linux-riscv@lists.infradead.org; Sun, 26 Dec 2021 12:38:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3BEAB80D93
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 12:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E00C36AF4
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640522315;
 bh=o76Bq5CH6JQYJurwTN9je+XT2iTobUiIxe/Uui+wias=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=axouHMvAD+06n+Ys1vxkhakSE66du65vKMVR9JaqpQcEGtR+OtBv8OFA4MTuU7Yi5
 Z065lUIWSARqElBcbA7PMKAlRBflNQxflLMrT+KpHTd/rWhpM/jVuFbDATRkmK0D2j
 MJOiavy8zhz+GWNngL1ayVtN4w7GhXufo5I4d4UkxDD6Ek9bUPuPFOB9r2KWhWWQLV
 FWN6eaCconXiFMOjFWoIQyEDTB2wm64+EOR5ehYKGmx/pOorBuA6ombIqUwPWYKAr0
 utR+MhT0cHa6W9+hv60KMrSyosxXOaD4s369R1pFbF3K2hdAWB+jeTNxAHJUkLhd+9
 5+kmD9Silgvjg==
Received: by mail-ua1-f47.google.com with SMTP id p1so520415uap.9
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 04:38:35 -0800 (PST)
X-Gm-Message-State: AOAM532NrO6i4aZPMT3MsDbOkIXVmZaHOztgKM/DVpW1PIfmGie15+ND
 1mbyRMfDcyxP2JjLbF/YeJ/nUy0AKrIPLroadMU=
X-Google-Smtp-Source: ABdhPJxYXL57S/1WWUdbZ3QalfrT+pnzWcLsk0PLFsmPywHotfGGswokAC8FpojTD1DtObuaVVBfBUXqawlVoiBv9qY=
X-Received: by 2002:a67:f94b:: with SMTP id u11mr3298864vsq.51.1640522314246; 
 Sun, 26 Dec 2021 04:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
 <20211226162223.795f9417@xhacker>
In-Reply-To: <20211226162223.795f9417@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 26 Dec 2021 20:38:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
Message-ID: <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_043840_276498_5D4697AB 
X-CRM114-Status: GOOD (  38.85  )
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

On Sun, Dec 26, 2021 at 4:36 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> On Wed, 22 Dec 2021 20:59:30 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > > >
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > >
> > > > Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> > > > s390, mips, sparc) have supported COMPAT mode. But they all have
> > > > history issues and can't use standard linux unistd.h. RISC-V would
> > > > be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> > > > /unistd.h.
> > > >
> > > > The patchset are based on v5.16-rc6, you can compare rv64-compat32
> > > > v.s. rv32-whole in qemu with following step:
> > >
> > > Looks good overall, see my individual replies for minor comments I had.
> > Thx for the review :)
> >
> > >
> > > I think there is a bigger question to answer though, which is whether this is
> > > actually a useful feature for rv64. In general, there are two reasons for
> > > wanting compat mode:
> > >
> > > a) compatibility with existing binaries and distros
> > >
> > > b) reducing the memory footprint of user space in a memory constrained
> > > environment, either deeply embedded or in a container.
> > >
> > > For the other architectures, a) is clearly the main driver, but equally so
> > > this is not the case on riscv, which does not have any legacy 32-bit
> > > code. Without that, adding compat mode would mainly introduce a
> > > second ABI to a lot of environments that at the moment only need to
> > > support one, and that adds complexity to the implementation and
> > > the extra attack surface of the second syscall ABI when an exploit
> > > may be possible only in compat mode.
> > >
> > > There is still some benefit in b), but it would need to be weighed
> > > against the downsides above. Can you explain in more detail what
> > > use cases you have in mind, and which CPU cores actually support
> > > this mode?
> > The most reason is about b), see our customer's product:
> > https://www.cnx-software.com/2021/10/25/allwinner-d1s-f133-risc-v-processor-64mb-ddr2/
> >
> > So I think all our next generation rv64 cores should support
> > compat-mode. Compare to releasing rv32-full core, rv64 compat-mode is
> > very cheap for our CPU design.
> >
> > You would get the answer when our new generation CPU is announced and it's soon.
> >
>
> What about adding RV64 ILP32 support instead? This don't need HW side
> modifications so can benefit all RV64.
ILP32 is another topic in C Language Data Type Models and it couldn't
replace the standard rv32 ecosystem.
COMPAT is a common framework in Linux (7 arches have been supported),
so let rv64 support COMPAT mode is considerable.

Customers would choose ILP32 / RV32-compat by themself and that
depends on which one has a better ecosystem.

>
> Thanks
>
> > Currently, only qemu supports rv64 compact mode, that is my colleague
> > (LIU Zhi Wei) contributed.
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
