Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNzQ8jvc9Tcbcm2/9aoCDB/6LD7NTlEFVa+HQG716L0=; b=LcdVcb6j07tKv3
	p1SH2/Y98LUS7S8a9V1F0mUeiT3sHHJNpR9kcb8PUK0TcxIiq53bYURnYHt7VBMRyy/1xbZaWMb1v
	OD3+r2bOU9fEpdcCmjuaMPgY+T1wul/QqO/tmb8+AOwrm+04t8Bqn99RhET0LDboQHdhCnT3yDrUg
	8aAXsfVe4VMfD1pWNWyItWGZe1zKvhAkAHC1R2PkLgKfVAm1E5myyYWkULcS5kPJ466YX89vJdfxc
	ko92iopHtZNanzj40V+xj/2gDANANqh+bG7vq0gusdJreMjRFdgoJcSvmLKawnbfHlkTK1ljUOizd
	B46XDRX2RvaaCLERPWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrPQ-00ENNW-S1; Wed, 23 Feb 2022 13:10:20 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrFE-00EJmb-I1
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 12:59:50 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MV5KC-1nldMy0GD0-00S7WE for <linux-riscv@lists.infradead.org>; Wed, 23
 Feb 2022 13:59:46 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 o62-20020a1ca541000000b00380e3cc26b7so2890328wme.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 04:59:45 -0800 (PST)
X-Gm-Message-State: AOAM53077btrmUzAgKpbRydtlWPLgMgQYeFMLQ+aZe4O6iz50AqBdDh7
 uzeMWanXnGXUzAIMBY9DEJNssicIS9lBFveLszQ=
X-Google-Smtp-Source: ABdhPJwrXMZ2Sp+1Yv51dw7LJzOihjOcH8LsPOt8g857TtX9P2CjdxvZ6l9BpnSV+7TOp6DTTWj/oYgAaIYR4u/i5CU=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr7466945wml.173.1645621185080; Wed, 23
 Feb 2022 04:59:45 -0800 (PST)
MIME-Version: 1.0
References: <202202231910.H30peLyl-lkp@intel.com>
In-Reply-To: <202202231910.H30peLyl-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Feb 2022 13:59:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3dL3AJ31c7znroXH+hZaEJvxdqszxTU6D6Q2BgcV0Mog@mail.gmail.com>
Message-ID: <CAK8P3a3dL3AJ31c7znroXH+hZaEJvxdqszxTU6D6Q2BgcV0Mog@mail.gmail.com>
Subject: Re: include/linux/eventpoll.h:81:13: sparse: sparse: restricted
 __poll_t degrades to integer
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kbuild-all@lists.01.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:16CruLWUerO7eK/FIBWsDexZMYMKmW2DXIMaIsGCRw/dFc+u4eh
 S1iAO6DOCZk8oyNY4PdHE0GtHQQNfTQk+/QSCAP6E6MXkwVnczIpMmkDxdlM8k0v97RUD9b
 WsX0O9Xy/AnfatXvWEuFwCuQIEImfvmWaPM4hvNEo2L/JU3P6l4jC/PqNHEcku/jHX9HHz9
 mI2pJy9Vd4oKGG+W+h/FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:82ZVjInlFo4=:R8WarU+pJYKf3nanYDpJ5T
 j+sURMapulySkij3EE4Cv0UBNuafXBiv1HmnLjbDcSAFny9frI0nXewI3jOoUcNgJ7sMA0gMi
 uOx2/vAkXkpBaWDY/De1CrPx3LvwyQYGdESDT6YPrRLsoyL4F9Knt8HDJ89RV8cdgnxdQytFI
 fy08vqrP9crCE36Ic51CKsvHRXSPrbk6LYFyO/zzINN0QOxRtIwLeTWPndrS2Yl4lDfzysH/G
 ROsXP575fExKNC+2/IPziGZX+FiM9/RdJvS9Z7vk4pQr1BLuEHBWzNjDR7xffjjk9qIU6914i
 s1sTedTa7U1iY2KDcqMRtq9XLUguq1tJEXmpSW4yij6G7H1/E/1uI20ecUedymMx9ykqKCeur
 Q0wIQjdTDQ1AxuW/1KauV26PhMLnBdJV9tXsoB7QP81vytCgYh7BB5xK/qTGKjtwosa4wBFGj
 w6jVCNbdhNIupn9rqfoeHJLdu16JWxJuVkkrDBkBUNXi5hpAvtg4Pjlml49sydSVzEnI5GqUK
 NiZr+m2rBr+owbkbcpVn1VF5FhGAUj9LQdpj21hiLWdr9//AFAnyNcOBL6xQryS9jDrnUQdT7
 bZ2TTwlh9uAV9Tc9Msglx/bUFlj/snL+8dwURtLY3+/kHushTu9XrmQsiB/YZ0miEbveSEDV5
 9rUL+5/glM/fGgU0qzUbeeBWWrL7vocB/AR96l+lK7RfPJHtOI7SFNuW/Ifa7dJJbz4k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_045948_949417_D65C75F8 
X-CRM114-Status: GOOD (  16.27  )
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

On Wed, Feb 23, 2022 at 1:47 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
> commit: 249dbe74d3c4b568a623fb55c56cddf19fdf0b89 ARM: 9108/1: oabi-compat: rework epoll_wait/epoll_pwait emulation
> date:   6 months ago
> config: riscv-randconfig-s031-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231910.H30peLyl-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 11.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=249dbe74d3c4b568a623fb55c56cddf19fdf0b89
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 249dbe74d3c4b568a623fb55c56cddf19fdf0b89
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>    fs/eventpoll.c: note: in included file:
> >> include/linux/eventpoll.h:81:13: sparse: sparse: restricted __poll_t degrades to integer
> >> include/linux/eventpoll.h:81:13: sparse: sparse: restricted __poll_t degrades to integer
>    include/linux/eventpoll.h:81:13: sparse: sparse: cast from restricted __poll_t

The code is only moved from one file to another, so I don't think this
adds a new sparse
warning but only changes the build log contents.

>     77  static inline struct epoll_event __user *
>     78  epoll_put_uevent(__poll_t revents, __u64 data,
>     79                   struct epoll_event __user *uevent)
>     80  {
>   > 81          if (__put_user(revents, &uevent->events) ||
>     82              __put_user(data, &uevent->data))
>     83                  return NULL;
>     84

I think the problem is the riscv __put_user() macro, this should not
warn when storing a __poll_t into a __user*__poll_t pointer.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
