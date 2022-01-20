Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFDFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2zHEPzx8uNiL6yBQUukPsuuZKai3yZzOuNbTjqO6wY=; b=Alum51+clI8PNF
	k9GnX5jr7oqv1LWAUFGE5giJqOr3WKrlf2FbxFVISewsabaFUweQ6nluXHbdyGFgZhxvWUiNG+ZO7
	xgqvuPMkxDTFGBiRfBJQMMQDsLisb9xOPSvW0bFgWhH8ZPOpuOgZC+ma2liN03ZQpJSiBWvFmneac
	1r2lZwcdAdhYjZMqp8p8aes25it/MITGUePb47PSYX8b5AyzeXGvXXvTqwgo8q9M6ilxZvOwy52mN
	3jmBHIAs+UY5LeFjx+dLCORbt/stKKOlyMPZM6TfCDgIfl0dVxR7TbsmG64n+1D5SEx0isI8LgIhF
	bi7PV23TZxk7holRPZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAVgS-00B58i-Tt; Thu, 20 Jan 2022 11:32:52 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAVgE-00B537-Hq; Thu, 20 Jan 2022 11:32:40 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2m7Q-1m9ugQ1mwe-0132HS; Thu, 20 Jan 2022 12:32:34 +0100
Received: by mail-wm1-f51.google.com with SMTP id v123so11441660wme.2;
 Thu, 20 Jan 2022 03:32:34 -0800 (PST)
X-Gm-Message-State: AOAM531AwUmNS2M/6E8xH0ERbcADu1H2MVtJilVkHn2Th0Lo2qDiErkY
 vWjyawpKAmlxSRGHo4fawT+y8vP3Y0bN5b9iSms=
X-Google-Smtp-Source: ABdhPJym7KyRCSRXKMerVMcQ/VMRiOiyKpoCP7tEcDc9DhkSEEWwSJxd9o5Jl5QZLGZ5wnpG9DwFk+lKhhVFjaoKItk=
X-Received: by 2002:a5d:6488:: with SMTP id o8mr12004975wri.219.1642671600998; 
 Thu, 20 Jan 2022 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-16-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-16-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:39:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Subject: Re: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
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
X-Provags-ID: V03:K1:B/KqdFf9Pn/jPZG5TS15eZTR4ufNQ+UZcoRvmvdzTGR1R1WZgTo
 PhU8oAParyk9+s1W1CElOixLlAvH2ii9Wq9Bp/0WbV21EU9zgIT9OOBsKsog0TQIf2UyuPS
 F1zwu2tB75GJxrmQWS2vGGU8fEfxUtSQHUpVzpH13c14qs16pZIRxUva7QxhtSVM4XLUa/j
 MzJbVQwltcwClUZqQXXYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zulTz5PfqJw=:AhwIYV9Lk1zt1NSnPIG6OI
 VqXe8JmUt/R0C/OnIHJL7URpWGMZTlONObUfB1Au1bBnkHWSGEkbbOu215+NbG6n2P8ip00uq
 g5Tr96jnZruF5XiZjYBWHE5oqLTrHaquu0AW843SB+xxW5dvl2o7dyijgSqqBiKQwtH0ibqQx
 06Bak2GLfMQc944ionx8TsytjOB/tnwgmBlGmmM8bO8Zp8cv9dfzmjBTrNokIbkhEhbGXwqqj
 L1zcWwh/0uWugO3JuHFb9ez4H3GL2UdyU9spROC3ismWfx47vns83mKBMgChQsCWxxivgf2Vv
 7OpWhEtsGOfU+SnQAIZXCIj4U3WmVUF6zBj9zlz8LKnOwjPA9Ly8B1BTpfM5+BEZM8BVztsto
 +T6AHRkE83tiDbtNUTIWZdjAJtspkMHHBvn/8CdtIYo9Ind+2mD8k060r5EFETrAzq71WVyBr
 mlL/2bitAED3+7Ti5f0IypBy8w7V2wkzINwaVvMRmErNaofYTJ92eaLE6mDM37DbrNTegGrcR
 45H/WWgtEGQ12ovam1th3/GALMtIkLXClYl2/HoZ5zSh3yD2OLUAg4f8hde5JcenVxtgGyyc0
 bmuz0Jslf/vihXzUP0U5sG4WlO0Gkd2C84hgxBrGMyc4O26MBUV3NT9oBjJ0z9EAxZP3OHv+4
 6slbbvlEmKHvhNomiykp67BwZAStVzjteqTPwq6qzFkCTq64fd+ri1kcjaVUGJXk+ibp0p8cj
 U86RcH6Hx3EcF1mqWXyXeoYuf7Ea5YZLOiyPNmFoLuACy43PvZq2htMH4RwqA7VcAAkbSOfVr
 mCVBp0txz8Z3LxpNZI44SqOaL6pAJuAIGkWavFgpptilbG92ok=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_033238_906165_AE2C5F88 
X-CRM114-Status: GOOD (  10.02  )
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

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> +
> +#ifdef CONFIG_COMPAT
> +       if (is_compat_task())
> +               regs->status |= SR_UXL_32;
> +#endif


You should not need that #ifdef, as the is_compat_task() definition is
meant to drop the code at compile time, unless the SR_UXL_32
definition is not visible here.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
