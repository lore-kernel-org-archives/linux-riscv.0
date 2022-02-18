Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53767C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GU578uvMq6/ZjFU3kHk2IOG/zbN3Hy91IfUC9tcOPUs=; b=wOMu05M+1HwBm4
	U6wrL/e4Zr/QXwZUEJvNU31VhszqUDi8UpdkQRIRa4ZXpcra6tyCXgz+J6aTKlfGCdsPXybaLpp1v
	XkhKicZh/LT0eJ/ivKVP/wsC3b6vYxWvfl0qfqjFQ3rqG/u5TXjzNrNFR4lo/G6h4/50xMkcjpZoW
	So4kBzOWNMuTZ+EhcoTvYpZP6Yrc867qaJta7Wu7rMBWG8gcpZp34/OGRauUskd0ZLz2nS7bfHug/
	Hyua2gw0VZLPzV3xt/yZl29HQ87caccjkHEyYB0UBpOIhyuiMvSD1BNim2njmTor4JRbS8nkJvaVL
	4gL/mNNLwZx1d0qMEW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKxQ1-00D9NV-As; Fri, 18 Feb 2022 07:11:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKxPu-00D9Kw-8q; Fri, 18 Feb 2022 07:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31460B82588;
 Fri, 18 Feb 2022 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A803C340EB;
 Fri, 18 Feb 2022 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168253;
 bh=U1L1tXaxAPzHw25B4dwwR3MsazfLjv3b5y7cZc7Ajbc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qI+HRm3Ho0Nxbma2PxlpgRfO0A/6ieKhWU6ysGAEhUqGgfO6Ke1HzoOjjnXcRszGl
 IkecBXQbIP4Vp6dSWJmIHMwHANA/JSpKm/QMPeqkKhQp0s4K7mkCeG3stF2bj4qOiC
 E+dbnhp1YsrOQYp61BuiKBpS3yXi+dDnHFXW3lC06VuJNVirRszxdkT18KXHI22Uwx
 lqAVcA4vxjZCW0CpW1Rw4M6WQ8/FexjV6WcycUpT/ViU02GC4X8kZtLk01olnX9M8h
 niA/PpUubG/0G4DOo0vb4DslesH8EHoRDcyp+TsobotIutgect+m5Hx+p/eZFoy38q
 d4NCWfUQGsP1w==
Received: by mail-wr1-f41.google.com with SMTP id k1so12918277wrd.8;
 Thu, 17 Feb 2022 23:10:53 -0800 (PST)
X-Gm-Message-State: AOAM533suuB+gg5EdsAiTaLZGVALyWesKGU7NYQQxb8/xgz+V7y7ut8t
 eyqVtTrIXWCl831hbN7WydZGNHLEfNZytfokoQQ=
X-Google-Smtp-Source: ABdhPJyoMw4CwWZhykLaKIetnvcgd+UId8rsi1OwYV9K65APKYAe4q4e2o9Z+APv3B5OF6xZqiLLay/ZUVAPiuS2n+0=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4956866wri.219.1645168241615; Thu, 17
 Feb 2022 23:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
 <20220218063714.GL22576@lst.de>
In-Reply-To: <20220218063714.GL22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:10:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ac9Wo6fs+Wbdw3-WHfzF9vu_CZs5EUUTX-1iALUr54w@mail.gmail.com>
Message-ID: <CAK8P3a3ac9Wo6fs+Wbdw3-WHfzF9vu_CZs5EUUTX-1iALUr54w@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_231058_669180_5FDB0BB8 
X-CRM114-Status: GOOD (  15.92  )
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

On Fri, Feb 18, 2022 at 7:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> s/maining/remaining/ ?
>
> Or maybe rather:
>
> uaccess: remove CONFIG_SET_FS
>
> because it is all gone now.
>
> > With CONFIG_SET_FS gone, so drop all remaining references to
> > set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
>
> And this sentence does not parse.

Both fixed now, thanks!

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
