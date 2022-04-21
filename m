Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0E6pcqZnletpGyxXsPHxpYE6wscWYm6sB23xDipqFaU=; b=IBlqeEeQrNkNNt
	J51h9I4Mk/agwexc8Z4dxJXKJ9RJrV+CbmdPqNPMgARc7eX/nU3Eq2Mg6N2HuNwzsK64ij6AohgKe
	ThrWrVwKW/kiatOEJ0WclHyam8HdKi+jws9yDKrrxm4jOLzqoJ48szriFLTQwgigEnkyCN6M9Shhk
	lhcr7RajLbq7CT0BI0cSlyS2QAb5fv6ilBy0oJPyg3K0+9kzhRBU/ahsjRXR6k0mbfHdKtIU6XY7g
	bAGmTsV2UEqsVygKw8E8iRaEr+SLahUcDELet9Yfj97ts5RPhWrt6pgwjLUa+5haxEMpxQ/EMRbKg
	xAmW8NZnxU/mrzYeA8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQzY-00BxmZ-Kf; Thu, 21 Apr 2022 07:12:40 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQzV-00Bxl0-E8; Thu, 21 Apr 2022 07:12:39 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mkn8B-1oBaXO1GEJ-00mOTt; Thu, 21 Apr 2022 09:12:33 +0200
Received: by mail-wm1-f54.google.com with SMTP id y21so2605059wmi.2;
 Thu, 21 Apr 2022 00:12:33 -0700 (PDT)
X-Gm-Message-State: AOAM530piPBxi3FyUXptuyqBQ9I2bwkR25sxRCDQCA4SF+7UodcK2yQv
 4U1icYpBi9twmL3KJsQbWtbHXMruDomOQUL/XmY=
X-Google-Smtp-Source: ABdhPJyiDq8vDuHIbY6D8eienOMlm5JvlAwo2YuDKmIos2MBFwy3hSQ+D3GAoUjwkE1kjA32vI2wLWEQWYui85aMEb4=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr6996684wmc.94.1650525152760; Thu, 21
 Apr 2022 00:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
 <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
 <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Apr 2022 09:12:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
Message-ID: <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Niklas Cassel <Niklas.Cassel@wdc.com>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Mike Frysinger <vapier@gentoo.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Rich Felker <dalias@libc.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Patrice Chotard <patrice.chotard@st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>
X-Provags-ID: V03:K1:vXiOoo6HoFuLj8erP6SRp8RTaWYtF+e+dOLADnfFYvsFbovfab2
 9gEZWrVpk2oZsTrUiDGuHiJiJXmKFk54yjLsWlsHecleBY3aYth/WmaaJJHFZNRfFyWJAdt
 zcR0dHaZvAgrC3Sp2uGWG/dRSQ1XJCMrAmle+eyKWaH6riKkHQ2eXcH1tufI1XrARN8hp/t
 XHjQBivaKhD6FIQHbcoTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IHtkTw2utv8=:zUc7HsgtdvxuCU1lJbhK+d
 4fJPzdm0JUbdGJNHR9pbAQlG6O5wM0nunB5Owtb07X1fCeYYZWNBNAz7/zsaJotd1WPGm0CcF
 hsH7kDA5acg+E582O5IzfMuNgYHTUH0/Hv2WEbt6/dglSwrpXZ0DUmj9AJoi74XgXvtKAQT8t
 fljp38WjCb3Vp3Ybcu4JXgnhvrSnBOOgnRDfO8lHFN8aXLpkAqJIouE19r3eWdm38qrXC62U3
 aKtJ53xqpd5FkIOpg0JQDngzkZ7cUWOyLKZJB+K+Bl691ETWXEiFTg1TXIKN3xTLsvNjllgOF
 bfUYlY9dlwwa3Kx4RGoDw8UTmXIcTSt6s4TFWKVxAmfzdw4uQfTK/cDdoK2nBndkaEc3PQv1D
 BzysLGHw7IXjlnwb8Kfk2Fn23qVDzyKJwC5QPerpuJHNICWxmX/PxiRPIIn7TWxNiaKTPUAkf
 J/XLdclT9LAP2viMdgT4GhKD+jXSBNzsKsM9vAUTLYNohyS/CjkXyP/Sv/XuXkc7RJMzcqdIG
 t/YEBQgKvrD3EHUibQObmzbJA3DlDUPv5PMY1G9KfaKeiKprO1iq3j8jT/Dx//xrjOkGWzJd8
 2VUnzhvtdnhLM93GxDmCHThkFgH9WlP6NOo8KHUjWGeWVVfNtZiSHjNJWD0oe5vH2GGu0YpKb
 t9hlycViHGv9ymkeLuFzmwpDmEolXJc/zNI/CzHUxp9a0lralo4PX3xo3y+UVNRQmQExW3Tio
 E6VBKcushz1S5XFfHBUbfxocJFkJCO5rt6IS/u2hpeNIyh6siwBZ3IlWY2wbNoIkxJJGa5B59
 RYxt79nk7hoLI2w6YjxgNOVxmii9H4J7xEtoG8lllKXTENNXxg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_001237_798417_E3032F5E 
X-CRM114-Status: GOOD (  26.88  )
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

On Thu, Apr 21, 2022 at 8:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> > On 21/4/22 00:58, Eric W. Biederman wrote:
> > > In a recent discussion[1] it was reported that the binfmt_flat library
> > > support was only ever used on m68k and even on m68k has not been used
> > > in a very long time.
> > >
> > > The structure of binfmt_flat is different from all of the other binfmt
> > > implementations becasue of this shared library support and it made
> > > life and code review more effort when I refactored the code in fs/exec.c.
> > >
> > > Since in practice the code is dead remove the binfmt_flat shared libarary
> > > support and make maintenance of the code easier.
> > >
> > > [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > > ---
> > >
> > > Can the binfmt_flat folks please verify that the shared library support
> > > really isn't used?
> >
> > I can definitely confirm I don't use it on m68k. And I don't know of
> > anyone that has used it in many years.
> >
> >
> > > Was binfmt_flat being enabled on arm and sh the mistake it looks like?
>
> I think the question was intended to be
>
>     Was *binfmt_flat_shared_flat* being enabled on arm and sh the
>     mistake it looks like?
>
> > >
> > >   arch/arm/configs/lpc18xx_defconfig |   1 -
> > >   arch/arm/configs/mps2_defconfig    |   1 -
> > >   arch/arm/configs/stm32_defconfig   |   1 -
> > >   arch/arm/configs/vf610m4_defconfig |   1 -

Adding stm32, mps2 and imxrt maintainers to Cc, they are the most active
armv7-m users and should know if the shared library support is used anywhere.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
