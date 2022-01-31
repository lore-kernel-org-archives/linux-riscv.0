Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDBDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLzMY6YqJ2Euut2d6fpJXiAYD9TDyhrnio+avMAuknY=; b=f90UczVIFBm74e
	34CmcM0i4ZTVfs+N/JhVXs/LVG5igzWtGEkkKqFpvp3ahhWNHivM1SxTEo1wS7Sgfs//RlkvRGY9i
	A2mF4I/wT0GOVVP/ZVVT50rRpz4Snhl0W/ATIoi2FsMgAvENB3LZ3zJhUw/LDK38lT9W/pkuBMplW
	pMDOhjGtQ+bjqyoiujqtQ+vVy6sgduo/jR17rZuClghPNmW10N9Qs6hWRDrUGpUsG4PQlx20ZBX/v
	KrInGaK6/h38vlWH/2wjcXUIJ3TS9bsMcml/SuE0yiJSCaYe2YorxFt3zDswJrjPOhbu9ZJt8qkIW
	+W5VJsRdTjn6W3jbNxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEW7Z-009Nvg-Rh; Mon, 31 Jan 2022 12:49:25 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEW7X-009Nu8-8d; Mon, 31 Jan 2022 12:49:24 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MODeL-1muLjz1Z7Z-00OVx9; Mon, 31 Jan 2022 13:49:18 +0100
Received: by mail-oi1-f175.google.com with SMTP id r27so4228804oiw.4;
 Mon, 31 Jan 2022 04:49:15 -0800 (PST)
X-Gm-Message-State: AOAM532/WRSktVktM7oXaLtqyp5mHU5RiSleWwI4i/kmnBNNK0tVct8t
 0EfAgdY4j7c/E1YMxJBwtFVXw6MT5xZef1d8HbM=
X-Google-Smtp-Source: ABdhPJy98n+kDWK/9SbbjWdkcIPv//3sxAoIsXTByqyfuSFCJCabGM0ZH14kpP64umFfYvpncQnk8rPRUpmA1wB2kjw=
X-Received: by 2002:aca:2b16:: with SMTP id i22mr15607147oik.128.1643633354113; 
 Mon, 31 Jan 2022 04:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-6-guoren@kernel.org>
 <YffUqErSVDgbGLTu@infradead.org>
In-Reply-To: <YffUqErSVDgbGLTu@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 31 Jan 2022 13:48:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
Message-ID: <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
To: Christoph Hellwig <hch@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Anup Patel <anup@brainfault.org>, gregkh <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
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
X-Provags-ID: V03:K1:cwK847hzz2DyKCNU/+exbf2iC6UscejLO6ry2dZT9Kp+DqC2igW
 Ofs5Ko1sH2UgOyp/Af0rdJfm4wxKxoZkqUEiqdS88HDNBhW8aBDPPQNsGjIlaKGIiHRw6up
 BStZm5s8Y6KU0volzx6nX3uRzONeZUq16+sBkxiE3VkefD8eZaTXbX0fXpLho8+HSBg8wS0
 +2S1kiOj/pcKKxxdtb7Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IyL0Xknfevg=:NysziHAHMK9AncXU8dVNEv
 lFSXGWGB22vsCFeWmUZMJULDyAufOdzepryZbEAiI0Z1fjzYsr0jEfQsrLtOytrxfYSj4/sTZ
 s6ffofgXc2AUowQgQsD4fq9MCCpFocPWd3jJ1H84/RJCl/7crdFphYp6yP9k2iyAMb5Y90bJh
 2kJjb6gg1U34TMgbtn4qcGKm5X37ia0qx1sSnqdg6FZU4NcmRVG4E2olXpaLMk+UYNkawjm9j
 77PDMYW/1U0YuEQmGur3uMda7ykLVQRGFP0fVtoh9GjRwyCBZMNN0Ek7zfgfBd5aX8D08MdEw
 HRHynCb73+AHf6MJY25snIQa6XCLL+ZQx/eSMPt6Ve/ai4z5SBLUs1uGZIW2jxOKxX94Loybp
 bh31Aur+YQJMwMnefodFdVcHx1gm5tA/4HqqTLATpSfAb6wI/ehS4S/K3Q+CcnX1Nx4ENpFxx
 nlNTuMO9AQlrYtCdEvjStKDqapW0ZEVQsgRaXw2opJeKP5A58SNMWa83I1Af7TH9r1YcmtxV5
 YxeAGjFYtB4rAP+4DTK7UYvTrdDz8WSKRzZzYHbHWJNK6SmfLO+i9K1g7P64Cj6HR+iujroy8
 dhFR12XEH+xz2dYl5YAxJHDYA5hJR9kkxyMmH29n8E5tKSRRXxgQhvElCNu5xhbK5DOyJtrk0
 zWeS/5iJzIr7DH12MXo0KdDAHyXefwV15diC0NY2eLBi0Z66n2cTGV0sivhSrRsBTNv37xxrN
 qDs18dOSRHo4kxqeAirNqbYaVtr+Q5Iw/+ll3LzbuXMdH5PR1ngA6bc+6nn0vcaDRervmxhQt
 EYxSV2QGTlSx1ixuq4gc+nqnM3T94cicTDyhzQsn6Z09ZWvVss=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_044923_620079_7BDD4B01 
X-CRM114-Status: GOOD (  16.68  )
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

On Mon, Jan 31, 2022 at 1:23 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 29, 2022 at 08:17:16PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Let's follow the origin patch's spirit:
> >
> > The only difference between rv32_defconfig and defconfig is that
> > rv32_defconfig has  CONFIG_ARCH_RV32I=y.
> >
> > This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.
> >
> > Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
>
> Wouldn't a common.config that generats both the 32-bit and 64-bit
> configs a better idea?

I thought that is what the patch does, there is already the normal 64-bit
defconfig, and the new makefile target makes this shared with 32-bit
to prevent them from diverging again.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
