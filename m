Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78571C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ikz/fzHNHhYGB00KXsU9aW2hYD5NLEWWOSPmdJQ0Y0E=; b=W351aNVpv9OWPk
	yCQk18pWedRdP0uWPMpFgxX9+8bSxA0bSu2PXFl0v6Q3kJwl5W0n+OlWqFPP5IemF1JQdghokqS9a
	wUr5dKHV0iNtb+juIhT1wU+PRUPPtCrCbS53Vst/K8DSFusxLTizdPe/8a/htJbjGgKuuZG9FVGtH
	kAzlu9nivvqLTFmoGegMjp01qoiwpVB7r6Ng/qmvksJV4MCrsco53a/TA7XABe4jcgh/h8swqYQsg
	V9fssIiW74nRHweYhwOItOf1PyLqm4iKKDZJLwagVNszGxjsnLPV8V7YPNuMeYEzQYG5ZAG5sClXC
	pxNl/+MhOZX9NkVEJH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAVJn-00B27R-7u; Thu, 20 Jan 2022 11:09:27 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAVJk-00B26j-4l; Thu, 20 Jan 2022 11:09:25 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M734j-1nE6l53rYd-008aOg; Thu, 20 Jan 2022 12:09:21 +0100
Received: by mail-oo1-f46.google.com with SMTP id
 k15-20020a4a850f000000b002dc3cdb0256so1936740ooh.3; 
 Thu, 20 Jan 2022 03:09:20 -0800 (PST)
X-Gm-Message-State: AOAM533gezVJLf1+rnGFnob9t882+RmIdWVagcGSVRj2IXF9gSw86Niq
 bM5TvgM8x8Y3XRV0X2z9Jq2a9g7agOC3fBJ/eMA=
X-Google-Smtp-Source: ABdhPJxdLg6SDZjsvGmAsYmn2qy9+2h/ODrSB5K/8pY/EXdxIA8KLQS4DyhVSmna3jImvkgL6VaV1O46bPcTyjt0SVc=
X-Received: by 2002:a05:6808:1490:: with SMTP id
 e16mr6881848oiw.84.1642673470519; 
 Thu, 20 Jan 2022 02:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-18-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-18-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 11:10:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
Message-ID: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
Subject: Re: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
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
X-Provags-ID: V03:K1:/ygnp9wnM8bllkw94Sz4y/bAwp18M2wm3iDvf2JYLHYJpRw40nP
 qIdrrz8vVjD/6DMsX6EU6a2hRqROd2RCFoiVWYPx/3F5FRIZDsGYDggPzOe8VDt2UwdFHUH
 zqUbspeEm6cMaTm0nsCxGAeJO9G0jd2hswA3lqPwgI/MS5+kYM4tkJ/LdbpO1Odt1fGLYan
 BflwO4iHBVACpWhLpPsaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JWTUWwvFb/E=:JhQiijpClKpdUsAyJGc/lk
 oSR2NqjOhWiEnpNInBb5XQpV07wqcPMN6V9BZL/3hTIfmJzsJ7ipy/QrSo2o/TNsdHP5GVm5y
 EQpCnwEVbDOLpLm12mtfkJhUblNYS8In6g3HJ79z/Ww7yh4pmSJ06NdU/dFUY2LVo6wkZgKQ5
 rdX47/SKQ6wmwpebPTnKCG1H5gCChQfDbvsMXBf/08JW9mmmN4DCvQE0YacGaje7Po6pXvgc1
 88TZw+JueE3henD9UQdIhyRsc3wkt/zlZZ9cXnJymNsRs7nENzouFwXEh3DC/hplWB7QMfyCn
 A0J8YTTdNHQ50dSEkDbGpMbX4EV66aUPhw3JqFaOIn2wsry2swQwYYIjW/OpujkigaK19yilm
 8+k17pdC/iHmEyF7ZtzWzePLNXGqh1R4TFLUZPvsgEeNy8CUAFDhuI+VT8uHwim2fmrg6k7bM
 1XDVKRMmWxO6VYVwlc/EAKg/ARNjiaNNhu5D+P3PTY2QQNqeybP5vvhZwN3OuXHkc37GpmyZI
 +w99TmavdGdNxXJZNtR/CqeVVHTJ9JBIJ4bR8XT4PF0BB60GU/AgEoIRM4qNxGvHeqQDWWVtJ
 r2iwSpXAYb2C7XBRZ8UGc6OyLT7NqvwBi1/2uHt0V0ewoHt+GpetL39+3A1eT2iaxVEzjBJmk
 AFF8nH7jgPxcT71+GONFTg/sesRRkK9lz+MBgXcBpfwWsScX7I0BYIuGi4/04C4bHoaMUmcIl
 uhWR3BcVIaYLx6LQ/3dOGx1saXravNrrm01BOWk4kjZVxW3JnoxzXa10GJwSJlla3ePKZG3mE
 CWxJzhQ+5OQIg7Hty41f0K/fKQp73wz2sZlzGS0++higyg1B0Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_030924_489656_FDD90BBF 
X-CRM114-Status: GOOD (  17.56  )
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
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM/arm API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)

Maybe this should be flipped around into a positive list now?
The remaining architectures would be mips, powerpc and x86, but it's unclear
if this actually meant to work on all of them, or any potential ones
added in the
future.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
