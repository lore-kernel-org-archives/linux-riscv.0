Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3d9POCoUvP/Nd2rRiUysuhBHLvRc4BW+RVFvohCxTe4=; b=MF0ZVDDW5HRXf2
	eo0NEPS4hFgmUu6pkDfUeWeUcvCEUclv5F65pF8mQI1uBT0vf/0/pi7c2CVz30mON76klEfEp0yCn
	+gHT7C1qQUsGnKtshz9/Abj18ojyfV1kQZqSY2uOIUjZ2bJQvIe6+Pk8wAjCTjqtJxxqLntUH53bv
	8SFvj8VB2zpRbUaVQKzGCUweRXMudoW+XxA9LZWYQSxJGpSqnvUVWApq8QZuHTazPjT693IiM4e3U
	yad0DHE6xIv5+hrVRPB84JZRrzwUDDtW351WWpZKRWEFE+ra8ZiNRP33UbJUWRRBB7gWhMuCVigr3
	EnS2KZiD7RRMMsoAeFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAX0R-00BSy6-5F; Thu, 20 Jan 2022 12:57:35 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAX0O-00BSwU-3s; Thu, 20 Jan 2022 12:57:34 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLi4W-1msrd32Rn6-00HeYe; Thu, 20 Jan 2022 13:57:29 +0100
Received: by mail-oi1-f172.google.com with SMTP id r138so8769883oie.3;
 Thu, 20 Jan 2022 04:57:29 -0800 (PST)
X-Gm-Message-State: AOAM533hg0iQ8AAdIBAdjB77tSVSacuC6He1n7rb2GaHEnaBTBHStvge
 aihv+amwfKPz29AkpWU4E0zZ20h/vmAXxkzRZiw=
X-Google-Smtp-Source: ABdhPJydc5loEDqeQgQKrusgbi1aGxD+tZ0GQwF7Qc/YGyFSxdDyRJjWKaddNyUDdWoTK5tk0vBiI2MFsnHozVbpMM8=
X-Received: by 2002:a05:6808:2206:: with SMTP id
 bd6mr7227920oib.11.1642679565024; 
 Thu, 20 Jan 2022 03:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-4-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 12:52:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
Message-ID: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
Subject: Re: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:9o1vuc8ryDuLYxJxpIeqanAqenSeeS5m6VFdtHDmdDefCCwpyNW
 FOSp8hon+D7D10lC5IWcKJhROAanVbprVz3cM5xiKkR4pqxenCNhSUwoRD/v5prQKN3qkWI
 DYss7mr1wu6zhB9mELaobiDxK08mM3AEWI13Ut6GLMAmHswBc59OMNBBU/SU8kLxOG1x9ll
 Lnnw3GkeI1/db4lP/TvwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+uOb1CVQUww=:auuYrU6u2OwIXP/fBvt8hL
 Acx5Kghbfs26fETdkC7gBjK7lg12C+Poh02CXQhMrHLOw2IjHfkvYXGydMEo/WHO323i44dy6
 us0L4WLFerLKmRbrYto+DzgropBu7Q0EwJ8lXVTupy6PN36Sj8xUYazn6vdB0ghHWQk7VzCMY
 hF5niIQO103M7ALgGPmNwAiLbuyCLkiDSIFb78OoujgG/rvXIJoSO7FePMtL8eO0SKonnuL2I
 PmxQmIWaY/5JNc/BkPaI5mAayiS39WH1OaE3VinksI3kB9AC2LWrysaW+RL/shwrLFTFDSUiH
 k/WCDyNuVC9YIcBBG8B7JT20MuCYkdfOqtS9Yd3unow0rQCoO5nWduyiMS0TXDkenqq7YA5K3
 Kf4bZBGMsUDtUvj1XTl0Gd8qM2HCaEtas/WjnLCebIam0a9eajdYDShmgcnKt3iHXjIe1mxy0
 NYoouFKEn7RGF+FMv1rM6lrJ0DBzxquiAgb5E+fc7/IHA+vvpkAwgQ6rGA6rZ/OLinxbxPuhs
 yMxVY3AtbKs6P4PvBb2bL9MKBj680fWIC6pK+Sq5TaXwBYojcsUkYE1++dZa1Dm12ll6Zv7BA
 o1PmU7J3sKc4vzLGyFq42rpCWYCPxWlquqgBFOv5FkDownKC57k1IXmNv0s+avXhaho4e5dUy
 LFLU2rW11MI2k5+zZkP5Z4g+73l2wNDaeUcmRlN62tKvewNNYw986ObCA8YAjR74kwCLFFWPK
 u8aSlDwKiyDvVgwQ3ebXA8/uDxQR9nEBEuFe5FiVc4t6+arSVRTtkVY44OJQwdOK7JUmDbYYR
 4bc3awypetdZSV8V5rXudtbth9Z2CbUwQ1ZYIu4WTnv3DSLRYY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_045732_478060_E5313C3B 
X-CRM114-Status: GOOD (  33.47  )
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

  On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
>           compat_msqid64_ds, compat_shmid64_ds
>
> Cleanup duplicate definitions and merge them into asm-generic.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

> ---
>  arch/arm64/include/asm/compat.h   | 108 +++-----------------------
>  arch/mips/include/asm/compat.h    |  24 ++----
>  arch/parisc/include/asm/compat.h  |  47 ++----------
>  arch/powerpc/include/asm/compat.h |  47 ++----------
>  arch/s390/include/asm/compat.h    | 109 +++-----------------------
>  arch/sparc/include/asm/compat.h   |  39 ++++------
>  arch/x86/include/asm/compat.h     | 114 +++-------------------------
>  include/asm-generic/compat.h      | 122 ++++++++++++++++++++++++++++++
>  8 files changed, 191 insertions(+), 419 deletions(-)
>
> diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
> index eaa6ca062d89..f54f295efae3 100644
> --- a/arch/arm64/include/asm/compat.h
> +++ b/arch/arm64/include/asm/compat.h
> @@ -5,9 +5,18 @@
>  #ifndef __ASM_COMPAT_H
>  #define __ASM_COMPAT_H
>
> +#define COMPAT_RLIM_INFINITY           0xffffffff
...
> +#ifndef COMPAT_RLIM_INFINITY
> +#define COMPAT_RLIM_INFINITY   0x7fffffff
> +#endif

While this is a correct conversion, I think the default should
be 0xffffffff, to match the asm-generic RLIM_INFINITY
definition, with only mips and sparc getting the exception

> -struct compat_flock {
> -       short           l_type;
> -       short           l_whence;
> -       compat_off_t    l_start;
> -       compat_off_t    l_len;
> -       compat_pid_t    l_pid;
> -};
...
> +#ifndef compat_flock
> +struct compat_flock {
> +       compat_short_t  l_type;
> +       compat_short_t  l_whence;
> +       compat_off_t    l_start;
> +       compat_off_t    l_len;
> +       compat_pid_t    l_pid;
> +} __attribute__((packed));
> +#endif

You are adding __attribute__((packed)) here, which I think has
no effect on the layout on the structure on any of the architectures
but it does change the alignment requirements needlessly.

Better leave it without the attribute.

> -struct compat_flock64 {
> -       short           l_type;
> -       short           l_whence;
> -       compat_loff_t   l_start;
> -       compat_loff_t   l_len;
> -       compat_pid_t    l_pid;
> -};
...
> +#ifndef compat_flock64
> +struct compat_flock64 {
> +       compat_short_t  l_type;
> +       compat_short_t  l_whence;
> +       compat_loff_t   l_start;
> +       compat_loff_t   l_len;
> +       compat_pid_t    l_pid;
> +} __attribute__((packed));
> +#endif

This one is different: on all architectures other than x86,
the added packed attribute changes the size of the
structure by removing the four padding bytes at the
end. x86 originally added the attribute here to work around
the weirdness of the x86-32 ABI that aligns 64-bit values
on a 4-byte boundary.

The easiest workaround would be to have x86 keep its
custom definition. A slightly nicer version would drop the
attribute on x86 as well but instead change the compat_loff_t
definition to use compat_s64 instead of s64, giving it the
correct alignment.

> -struct compat_statfs {
> -       int             f_type;
> -       int             f_bsize;
> -       int             f_blocks;
> -       int             f_bfree;
> -       int             f_bavail;
> -       int             f_files;
> -       int             f_ffree;
> -       compat_fsid_t   f_fsid;
> -       int             f_namelen;      /* SunOS ignores this field. */
> -       int             f_frsize;
> -       int             f_flags;
> -       int             f_spare[4];
> -};
...
> +#ifndef compat_statfs
> +struct compat_statfs {
> +       compat_uint_t   f_type;
> +       compat_uint_t   f_bsize;
> +       compat_uint_t   f_blocks;
> +       compat_uint_t   f_bfree;
> +       compat_uint_t   f_bavail;
> +       compat_uint_t   f_files;
> +       compat_uint_t   f_ffree;
> +       __kernel_fsid_t f_fsid;
> +       compat_uint_t   f_namelen;
> +       compat_uint_t   f_frsize;
> +       compat_uint_t   f_flags;
> +       compat_uint_t   f_spare[4];
> +} __attribute__((packed));
> +#endif

None of the architectures use the packed attribute at the moment,
so please don't add one here.

Changing compat_fsid_t to __kernel_fsid_t is harmless, but seems
unnecessary.

Changing the signed int to an unsigned int (regardless of notation)
may be a change in behavior. s390 is the only architecture
using unsigned members here at the moment, as of b8668fd0a7e1
("s390/uapi: change struct statfs[64] member types to unsigned
values").
The description of that patch sounds like this was changed to fix
a bug, but I don't see what the actual problem would be in the
put_compat_statfs().

For the moment I'd suggest leaving this with the signed version,
with s390 being another exception next to mips. We can follow-up
with merging s390 into the common definition using either the
signed or unsigned types, but I think that needs to be a separate
patch with a detailed explanation.

 +#ifndef compat_ipc64_perm
> +struct compat_ipc64_perm {
> +       compat_key_t key;
> +       __compat_uid32_t uid;
> +       __compat_gid32_t gid;
> +       __compat_uid32_t cuid;
> +       __compat_gid32_t cgid;
> +       compat_mode_t   mode;
> +       unsigned char   __pad1[4 - sizeof(compat_mode_t)];
> +       compat_ushort_t seq;
> +       compat_ushort_t __pad2;
> +       compat_ulong_t  unused1;
> +       compat_ulong_t  unused2;
> +} __attribute__((packed));
> +
> +struct compat_semid64_ds {
> +       struct compat_ipc64_perm sem_perm;
> +       compat_ulong_t sem_otime;
> +       compat_ulong_t sem_otime_high;
> +       compat_ulong_t sem_ctime;
> +       compat_ulong_t sem_ctime_high;
> +       compat_ulong_t sem_nsems;
> +       compat_ulong_t __unused3;
> +       compat_ulong_t __unused4;
> +} __attribute__((packed));
> +
> +struct compat_msqid64_ds {
> +       struct compat_ipc64_perm msg_perm;
> +       compat_ulong_t msg_stime;
> +       compat_ulong_t msg_stime_high;
> +       compat_ulong_t msg_rtime;
> +       compat_ulong_t msg_rtime_high;
> +       compat_ulong_t msg_ctime;
> +       compat_ulong_t msg_ctime_high;
> +       compat_ulong_t msg_cbytes;
> +       compat_ulong_t msg_qnum;
> +       compat_ulong_t msg_qbytes;
> +       compat_pid_t   msg_lspid;
> +       compat_pid_t   msg_lrpid;
> +       compat_ulong_t __unused4;
> +       compat_ulong_t __unused5;
> +} __attribute__((packed));
> +
> +struct compat_shmid64_ds {
> +       struct compat_ipc64_perm shm_perm;
> +       compat_size_t  shm_segsz;
> +       compat_ulong_t shm_atime;
> +       compat_ulong_t shm_atime_high;
> +       compat_ulong_t shm_dtime;
> +       compat_ulong_t shm_dtime_high;
> +       compat_ulong_t shm_ctime;
> +       compat_ulong_t shm_ctime_high;
> +       compat_pid_t   shm_cpid;
> +       compat_pid_t   shm_lpid;
> +       compat_ulong_t shm_nattch;
> +       compat_ulong_t __unused4;
> +       compat_ulong_t __unused5;
> +} __attribute__((packed));
> +#endif

I checked these in detail, looking at the seven architectures, and your
conversion looks exactly right (I had initially missed the part about
compat_mode_t that you got right).

As with compat_flock, the packed attribute has no impact on the layout
here, but please drop it anyway for consistency.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
