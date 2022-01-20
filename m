Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBDC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKfnJ1SA3+B0fM1f768vfKuI7oGM8F+a3XHB9GX2rt4=; b=RMjCLGKpwqSnlK
	B+pkR/OPZo5PNYLlv0Himq4z7suh6dvVhFP65LUsQXiVpFWVQx0LVJPJVXoXC+u+Xs2SUIeGMmavj
	5wBeaG2KJml6kmvEP//JBbjb56bnxTsOhX3pA5np1yFuspQtoNwCqady4Dj0amqTO7OBZR2WPd4/I
	6q82F93ARefPWtap7m6vM8xmYuUF+D3rzN0Y/0E/6accdFvFQCuD9X1Ek0rj1NzMUUEDvAwZexuHJ
	0FAoUIObWfSnLkOCJqIOk9pLCIXWVwySV6te03kv7dumd2leUS9WiTHuquJaVyk2mCYClWFHKzqPb
	sktwaSG7pjMLBGkRHnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATlV-00AEUD-4I; Thu, 20 Jan 2022 09:29:57 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATlS-00AES5-DR; Thu, 20 Jan 2022 09:29:55 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEFjJ-1n2TQA1rYT-00AHwQ; Thu, 20 Jan 2022 10:29:51 +0100
Received: by mail-ot1-f44.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso6832330otf.1; 
 Thu, 20 Jan 2022 01:29:51 -0800 (PST)
X-Gm-Message-State: AOAM530M31Cy5grkhxKdIp894bJqNIsU3RCCokt+8MWzg2CyepQYX5wE
 HK6dZzjYb0w+jA0QZ1qLkBQl4+S5ntFamy5tHwY=
X-Google-Smtp-Source: ABdhPJw23cQjee+wzKe1BZuP5Egl38StW0xVS2Lx2CrxQkm8C96LIXXcbD+ld7BJcIRLzViPyYDZ1TVXzpuf+zNTwjI=
X-Received: by 2002:a05:6830:2095:: with SMTP id
 y21mr25066257otq.368.1642670990087; 
 Thu, 20 Jan 2022 01:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-7-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-7-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:29:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Subject: Re: [PATCH V3 06/17] riscv: compat: Add basic compat date type
 implementation
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
X-Provags-ID: V03:K1:JVurDN4Y4Q7f+fI//N+MnlkhEvfNIom4M5T0JaW0UqyAqISpzsc
 uXZvUqRLm0qPCgjJmxVb4Qayyr2amTekvPUvV+EHw/wEz5xo87Ecb5ogwuqXJxip3/FtSEE
 BWWEqkrwg7UqdTxcVBWrmUYqaT5hdWkAms66bYsjqCyOqd3jblfZ7etbhCAZ+T/uP+NUqJW
 nkeolOs0xDsDZoKtTA9Mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VP+CxMDm6V4=:Bs9vqMcmGnQ7QZ/n+FwIrB
 JzA3sd7hN7Cg1wyFNaiJ04N9BaN9RDJJDibV1zbuRn4OHdJqDGE0tY6lbP966Eqh1Zd5FzSQC
 FtRa82Gd9fJ8PUBKGWjTzPCJQm8NxJOSFs2/rQHpMY2cskO20TpIFms2XEgaxD1uLtNmkcOFW
 ppn3zNIMWxpgoe2oDOLHhgQEzP6QF0DGhqw+bkTvJtU9IGol0HRqNaH2nJQaajfVtx8O4m3Ww
 HLLzdjrHlEy2xBgeNyoL1SenZWTGkPiLh44xlMSdhDwCCeSVAeUb7bRSQIPv2N856nSdK4TiX
 V/Ampr1HVew9Y3WTbueAx4ATGKu/+5cxDIOfQ1qScxmhiIxnp5+RF9jMOpEUZJuTXdcLZuaCk
 xO19UONguOoEp5oS/OGYJTiJxdfkAT2Oy8h2VlHEYrNbibMPV2dJAXwAsSJj4bnlTW10ixREX
 IMQwSmzsfz84m+AhS4XD4dQNbVLpY8s2idB2CqoyyKkSyPqPlxFzEpJv8BEpfXAwPsWjN22ry
 lrdmcQiMNj6PPMsqDivQ7+jpiXxSPezjktkHMOSVZYOjpAS6mLtdxckaYHKXRK1vdCdFtL8iz
 /bbXjBAZ8hC1PaFVGdyI7sNEC//e40rtQYRUhbrWKtQNRn31A3z5ZzIQrcspffEl0vQrK54TH
 M7tlRP8NkDGyfKuYio+xj1OyWEbHFCVDDFrp0ejoZF/0WyqPDQFLqzBmR5RWNCfZvtRpQqh0c
 QZlydvLZ2VeyqidU0PI7g7avnkA7QYkH2Dgb2o1eEdpkJEKQ1nNU4m5fkG0lltgq8OINkP/q6
 yGeCxsBlzUBl8NR4MfhH/utNCSBLPu19SI5GBdVodjuhU7B4yU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_012954_781723_0897ED36 
X-CRM114-Status: GOOD (  10.50  )
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

> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_COMPAT_H
> +#define __ASM_COMPAT_H
> +
> +#define compat_mode_t  compat_mode_t
> +typedef u16            compat_mode_t;

I think this one is wrong, as rv32 should get the native definition from

include/uapi/asm-generic/posix_types.h:typedef unsigned int     __kernel_mode_t;

I think it works if you just remove those two lines. The rest looks good to me.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
