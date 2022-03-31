Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E800FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKR/fx8JX0P90Hx6hV8+vt5r0UVoTEy9UCH1shPK73c=; b=KApF6T2EXKJTXw
	2LuO1Ij03OYWlonUo10qUDErh/k8aouBGa+Yc4q3XlpCqZsZKvB3HYO/UJn2FRtLqmRHq0PPrMp++
	IqpU4VGkePXJVeYVqrKR76/tPsy8WKCj17xZAa8Tzcji/N156uHsbSdPFaF/wXoZLLNfwOVpc0dxK
	4kA9k6sqeArKiakkmAvsCMw42k9uiv5eMNJmsMU8Zrqj/dAYjKKf3L1iJDvtl5xFWYNvcdv25+dyK
	ChQpvD42bNRLg4VAuulZO78868Az2FWa4jwZ1mGmI0myRrZqMgfrLwxK358oNR6ge7zdlo0IW11YJ
	CGJPnngRikGqr1J4IWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZqPT-001Kpf-Iq; Thu, 31 Mar 2022 08:44:03 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZqPQ-001Kmt-2I
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 08:44:02 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAchM-1nknhr2Hzk-00B6ca for <linux-riscv@lists.infradead.org>; Thu, 31 Mar
 2022 10:43:55 +0200
Received: by mail-wr1-f46.google.com with SMTP id u16so32688974wru.4
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 01:43:55 -0700 (PDT)
X-Gm-Message-State: AOAM530U3mZ/tl3HF4R4bxOuVjNWWhrC5utUwdWN9BHoEft8ejLA0VU1
 7Tlzmh0Urpa7x8Ib5mKFSoCBeY9QR7jKIhxGtAA=
X-Google-Smtp-Source: ABdhPJyrtpQlBduGdImQtwl3TfY7OVK8ndVvnJ/5XRBmxDFBRN2DthMS2Ieu+gTrPWm1ExwDF53U+Xfq7QQVJM2Ifeo=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr3269024wrh.407.1648716231569; Thu, 31
 Mar 2022 01:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <202203281004.InhLOFxn-lkp@intel.com>
In-Reply-To: <202203281004.InhLOFxn-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 10:43:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ShMf+QCHWishO9DbvRrJ5x9f=9cS9kwm_tkBqwyWtEw@mail.gmail.com>
Message-ID: <CAK8P3a0ShMf+QCHWishO9DbvRrJ5x9f=9cS9kwm_tkBqwyWtEw@mail.gmail.com>
Subject: Re: drivers/pci/proc.c:150:17: sparse: sparse: restricted __le16
 degrades to integer
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kbuild-all@lists.01.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-Provags-ID: V03:K1:WhKDSMmnUGRVwmpFF+YvPEiIMGLlsIpJNJxO6wuyYpP2eogH4ue
 x4Gxc4BfVKdX4u8ujFwAzUrN5/i8W+6B0r7vDxgzphN9UtQPo0HpJS+EER5G9d3k+/gL9Wl
 C/KFr3Mln/DdLcdRXJb4TbIAfIt8cUgENZdQ7NjVL5y7z1NhcIYtQ6iB2yGQIa+IjRpz/ec
 CoDhFuh1hE1omkb67A02w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BytufjHdzIQ=:Q5xSV0/0RlVbD32IMMIWW2
 R2pUlDhcUXAFSX2yncoMZuMnBuxM8HvSA9IJ1cQUQmTHmSB+4HdXCN9h+IfMPY0tSh3UONgTn
 M+vmNofHDwafg9Nc3gm2xeqsCeuaDzQiDGCQFhbSkwcQ1HU/eO+3HtVNDglLYWJuf0hZ1qCu3
 YbOLBlksiHnERZmJNtJzKEYClieuB2cG9OxFSeGVQfDAfBMV3Y24tJmDnJyhJe9SOaQMbGz4R
 oAvySjw/7Vu6FiZFZUZgbn44alDSinCpuNf1uVfR+c5CoLHEbs1Mcaf0kuWgqh4ACdEW4G6Yi
 f3kb8bzHAXU/5rr1WNjbvoyzmH/SxfGItSp+SRf8J3TakvYNz4VQc6/dMxbeGSPAdEOqD+Y0v
 tpVy+KhspuRd9DbYazSUXy0RzfyM0A4iK7M55Di3BmBPh7hV9oBGoeWhZ6oF6FnXuDgTm+LiE
 6RATQlvtbaZP6spObIdBIAyHThzmC/NGC2bjUuK1nBZGTQ8M5MZ9oDgfWQyEFPE1ygvhKKnJ+
 24dKyF/5eLIylhpY05dDXGvjT+ic4evXIQ8ASG0Gx3XnNuovigz+gYZ0JN3nAtEp56c8OgCXW
 N5QsyBLV1VfJmA/jfFOUrH+eEawrzKHzb/xYZ2DlshzPeRTzIB40o9BYO7Spn5RGp9RpWhX7W
 YQmUd5vd5iUvnwvV5YGA8xU4xAfJwxc+dEuLzrn20a096JzU+o5z8JrLkjSw0ad6kjhB583Bs
 0IfXQpQj493GdpF2CPEj8i2I03y95mRB0g0dYnZmqAP3gKKxD3yxUnZk6Ys/VFcpD4ASzFu8F
 LeaVyU0TvwnPn//t/PrVZ56GUjfHD/34EGbkZpFcHnMENjC4Xw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_014400_450146_3EAD5365 
X-CRM114-Status: GOOD (  14.70  )
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

On Mon, Mar 28, 2022 at 5:04 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f82da161ea75dc4db21b2499e4b1facd36dab275
> commit: a97b693c3712f040c5802f32b2d685352e08cefa uaccess: fix nios2 and microblaze get_user_8()
> date:   4 weeks ago
> config: microblaze-randconfig-s032-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281004.InhLOFxn-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 11.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a97b693c3712f040c5802f32b2d685352e08cefa
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout a97b693c3712f040c5802f32b2d685352e08cefa
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/pci/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/pci/proc.c:150:17: sparse: sparse: restricted __le16 degrades to integer
> >> drivers/pci/proc.c:150:17: sparse: sparse: restricted __le16 degrades to integer
>    drivers/pci/proc.c:150:17: sparse: sparse: cast to restricted __le16
> >> drivers/pci/proc.c:159:17: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/pci/proc.c:159:17: sparse: sparse: restricted __le32 degrades to integer
>    drivers/pci/proc.c:159:17: sparse: sparse: cast to restricted __le32
>    drivers/pci/proc.c:168:17: sparse: sparse: restricted __le16 degrades to integer
>    drivers/pci/proc.c:168:17: sparse: sparse: restricted __le16 degrades to integer
>    drivers/pci/proc.c:168:17: sparse: sparse: cast to restricted __le16

On Tue, Mar 29, 2022 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Looks like new uaccess code doesn't handle sparse __bitwise annotations.

Right. I copied the line that caused this from 32-bit riscv, which has the same
issue, same on openrisc after d877322bc1ad ("openrisc: Fix issue with
get_user for
64-bit values").

It sounds like we should fix all three of these the same way, any
suggestion which
architecture to copy from?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
