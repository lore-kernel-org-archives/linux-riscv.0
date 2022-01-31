Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E2CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRxgdeAdu7YPmqI2JD+R6vKISx9jQ08mIRalpjeL9XA=; b=rorEevyjE2uyl5
	tlGTY1UILwWbe8p5SNzgQBABYd1j38Q9adg1PJnTWuMeH5zNWWKmyIl4cZ0kuOMHvSHqotI9IAjKV
	lrprEbavjXgq9v6JX9KLzaIVS3QqJHfpxSDDN+em5eeAjEEoxuhfKjq5SxVbUvMB4AeiOYbBbLAPN
	WB5nyX89JBwPKcBYibRN/flPZD+f1NvIlT03ekTRyow5Uy63xjAgvV5IQAkpWQOCCJ+Aex4hNk1UT
	tzcJdgvIHYgmEyYlBDkX4dGzdw9Z781/ovtfFn9BUv3/HJd2zQ7m5hw5JGFW+a2zyjvTZ5iqITEdZ
	B7IyVLozRJS6uiWHklwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWbG-009T96-Jk; Mon, 31 Jan 2022 13:20:06 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWb4-009T6S-2J; Mon, 31 Jan 2022 13:19:55 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MZkxj-1mhikp0mRj-00WjFK; Mon, 31 Jan 2022 14:19:52 +0100
Received: by mail-oi1-f179.google.com with SMTP id t199so9949943oie.10;
 Mon, 31 Jan 2022 05:19:51 -0800 (PST)
X-Gm-Message-State: AOAM533wWtDB68qO723Sc7guJRx68C90OShuSpCjVY5G5J+8OWu0tOww
 +upRAH5TIFW0cbF8HIQfFTClu8K8CTRdqFaGWTo=
X-Google-Smtp-Source: ABdhPJxqzdad29yoPfVQVqkeuINyquIZpxlEvxSx06sdTnz4rryvUZKfSJUaDKGmBUmu6Be3uaLlJuvMhrTHZxz8Zkc=
X-Received: by 2002:aca:f03:: with SMTP id 3mr13235991oip.102.1643635190773;
 Mon, 31 Jan 2022 05:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-6-guoren@kernel.org>
 <YffUqErSVDgbGLTu@infradead.org>
 <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
 <YffdbErmAjAWYuD9@infradead.org>
In-Reply-To: <YffdbErmAjAWYuD9@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 31 Jan 2022 14:19:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
X-Provags-ID: V03:K1:b9hT9a0TQUfUQLetlu6/U8Bu6Q8zVNklrh4/Ey386BZ/z67MGmx
 F9MD7t+tn4JSH26kgrEV9AvqguKOo3Pg8mrz9lWAc5YDOmq975D56SiPddQEX5oRCxHcxrH
 Yzppe/6lFN02WPwfqsp9h+x8w9EmOaaHP3vt3r/AdoxpIqY/cqPFailh5kh6MGSDQ//1vE9
 iOKUlzMLBJX/KlxQeK2Fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XvGZ/xUwfMg=:PjjIOILOMAMgmIVoOW2ZCS
 2RhUahsRvBVbFNGj/QoPcuPMWOhkqBic//4r70TH5tjA1t1Am0HH8JM6EFMIl0a8ooJM30d1T
 zrFXwPZUCMmoIOyAIHY3cRQYj68idm28DEItBFTi3g3gM3D6owEQjTvWqnNnGWR2dJbpuN8Hl
 kooRaqLGdm7eQ4I9VC9IwLGwTm31gt3F+UCu/9HxJTanCLOkLhiJlHTl5mV79WJjgdSYY1Oqc
 h1VEuaNu/7XJ45iTtB3r0QubrNB6nrupYZiVwQm3JvzJllx9gdWZBsEKB/georSogCjk8DW10
 RF4fBaYrCldKYTwQmydZXiiQfhV37yHwtX71AAg5zcc1t/cFDs/bXm7Mcy828/m63u/rNjU0Z
 kFAXlw4u/KsukvFFb1MKNlQlrx5OiVoTKs84Cr6sGLd3ARG3+/wPTT9RXwmTq0HRO/N8/27lz
 yTYbHuzhS/6HLztP3wmOl+H7xwaZjmrbVPTw4heG5bQVXpWgjkpgw91LjcYBN4kyuO6uiWXpU
 dxLBYE0NteselqHGJ8S0HFiyd1BazrW4DWBWgQCqYnaFbsXXvL8uC5AjNdmUKpEQw7DSiuy8n
 6E5DeB+bJ8Hv2B56A43EqH4FcSH1heU+up5Yy4zm6CEKWJckgFwI97RIPddiLeTxBQUOSJc30
 sGOqsYXjP1WWGdI9YQZbsA0j66Dxde2ewlZI15MB+lrm6ru5vHNJVmlISSa2BXa91WE1kGjta
 hgvaLUj+ezD+5legz23bzno4zm30J7cVS7x12yi9HU1WyXcWLiUmbcjWysEvqWc4vnfe5uPxn
 TrjeZbLagR/VX77rxMkMEqbMMPIZUl9BiTrWiGQhpeq8IsJjjI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_051954_428349_0CEF2040 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, Jan 31, 2022 at 2:00 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 31, 2022 at 01:48:58PM +0100, Arnd Bergmann wrote:
> > I thought that is what the patch does, there is already the normal 64-bit
> > defconfig, and the new makefile target makes this shared with 32-bit
> > to prevent them from diverging again.
>
> I ment using a common fragment and the deriving both 32-bit and 64-bit
> configs from it. The 64-bit specific fragment will be empty for now,
> but we will sooner or later have an option that can only go into the
> 64-bit defconfig.

Ah right, that should work as well, not sure if it makes much of a difference.

I suggested this method because it is the same thing we do on powerpc.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
