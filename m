Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72616C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc5KRgRI/T2+xz1TssXra06Ou0iW6rcXHNFSZfsh8DI=; b=4WKaI4y/EupQhY
	CgMLLVwqbvRZQmzx+vT/1oR7K+oRNphzyacDr9yGs41LaJ8N5ojbZuucOSLAphnuyPuSEPeWTe4kY
	dTUasNjaeyMjLelUpz6dMljD9bM9TSztepjdEo5vAotJp1iogB7wpy4s3dGBPsQ0vII1AH11Pn8W0
	FfCANloYqx/s8za470lbn+SNKyM0SAVVLRStejZuA+2ZDM915LZ/Olp2HNM6XAyQ4htCT9Y+DzNNr
	j6PBteS03kzOONX5GXpiVnxu8DM7ezOhe0U6LOheVeHz/pon8EEp7fTBPLHn+StneAeXz0eQuijo2
	r5hJk6YJyMiIfHtBMMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0h67-00E2LX-0Q; Fri, 24 Dec 2021 09:42:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0h64-00E2Kv-UG
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 09:42:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61CED62032
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 09:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F204C36AED
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640338963;
 bh=Rdn9oXTeHcImgFihzpqZ1fI0UPcOuss6aruBMOmC2/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Laaln0yGIAIH+L6HGuF+pEObSII1GuNdLEi5TeJsNWdLMRNTZCrinVlmhbuXbXh9O
 VwSQRC4r28nlV1XnJ4EjF46CQmKFXM7uXnpcbJskuM6haToGgul40ePhSMZDh3Odun
 9z9nasLvEEeq8KvPGu9NfBTy6YCxsbsYJpc+6HWpvgXQnnSJDei7J80hqplkKJGfpp
 3Js/VfTf9XSonM1vNdMd+godShZ/m/b1rSb0sHasa89+JPLet8Ka8xMsnLQVvWz+YI
 db7i2Ow/3WhXXwQg62PVZV79hd4KyEKB2BJ3tlu0hE3uj9p9uxrK+uA7zNJny8LJ4a
 D6mzoKHafKYiQ==
Received: by mail-vk1-f182.google.com with SMTP id 70so4657870vkx.7
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 01:42:43 -0800 (PST)
X-Gm-Message-State: AOAM533PPYNejxePtO0fn3MjGbBz/P2fPD9e923GeA/RaGF/YpoN9Kgc
 HMDANbJjviMx2xds/TcRG5XGhdJNpFtGtQgWhvk=
X-Google-Smtp-Source: ABdhPJxcJSJu2En8JVFZ+Ldq0fMZSqfS1yBXDZhXIwO3+MFkNQtCgMAjeZ2QrdzfLYykbg9IrlsFHRLb9DfFS2fW7l0=
X-Received: by 2002:a1f:ae91:: with SMTP id x139mr2017891vke.2.1640338962651; 
 Fri, 24 Dec 2021 01:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-6-guoren@kernel.org>
 <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
 <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
 <CAK8P3a17A3MU_atWNEretDcr5sLRc7540tM4vfc=H4M8qVCDEg@mail.gmail.com>
 <CAK8P3a2b0zun=b84d=LhrjrwLDiKh5_KgyZbBAjTz+40NZri=A@mail.gmail.com>
In-Reply-To: <CAK8P3a2b0zun=b84d=LhrjrwLDiKh5_KgyZbBAjTz+40NZri=A@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 24 Dec 2021 17:42:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRG4wRTEb_YHuZo3Xg6gcShduD2WnbEM1M4wg1rVz4qng@mail.gmail.com>
Message-ID: <CAJF2gTRG4wRTEb_YHuZo3Xg6gcShduD2WnbEM1M4wg1rVz4qng@mail.gmail.com>
Subject: Re: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
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
X-CRM114-CacheID: sfid-20211224_014245_080805_EF173AF9 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, Dec 22, 2021 at 10:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 22, 2021 at 2:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Dec 22, 2021 at 1:43 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Right, I think the patch would be a nice cleanup, but it appears that
> > riscv is among the few architectures that have defined their own
> > nonstandard mmap2() syscall after all, despite using the standard
> > name for the entry point. Not sure how this slipped past my original
> > review, but it certainly can't be changed now.
>
> No, I misread, the calling conventions are fine after all, it's
> just written in a rather odd way.
>
> > Maybe leave it there and change the #ifdef to build mmap2 for both
> > native rv32 and compat mode.
>
> This bit still applies though, I don't think you need to add another
> helper, just use the one that is already there.
Yes, I will:

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 12f8a7fce78b..9c0194f176fc 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -33,7 +33,9 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 {
        return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 0);
 }
-#else
+#endif
+
+#if defined(CONFIG_32BIT) || defined(CONFIG_COMPAT)
 SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
        unsigned long, prot, unsigned long, flags,
        unsigned long, fd, off_t, offset)
@@ -44,7 +46,7 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned
long, len,
         */
        return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 12);
 }
-#endif /* !CONFIG_64BIT */
+#endif

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
