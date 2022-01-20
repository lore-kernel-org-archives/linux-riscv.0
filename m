Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BFFC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9bDJ3+WuRtaI/dbdk3FCByBsTGCbm9uEnV7oxuBZo4=; b=erbE0rZMYllKsH
	gwfb8EP+x48owPNDPDASvdIEWO0N3b7LX9FR4T8ZzCA2SRJvIydwiwGpL86bKDDYiO5FOD4NIbdW2
	ZyujGPflo4c9/Mn+XfZAGgyiWsbkq4RpmYavSQ7vwCEF3dUlkmdgv7CwPmHo+Nlo/CrnhMFMnG1Ww
	0fWYy61FgMNZ36Xd2lmo6q+5S1Mb15NNHZz43IFJesLDuYp3eLZ/cRFd7yfdAyBmjrrRXQ/eqjb7N
	tbwxYrVaJy1bCEl7uZwctrC+Jy2YUbJ2itsC3cVjGpc1KRx3YshQ/C/x8mxU4YqQlHakKrP+yF52C
	QLK+u5yeMrNh8jlOizlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUC6-00APVx-TG; Thu, 20 Jan 2022 09:57:26 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUC3-00APQc-NN
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:57:25 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mg6mG-1mfGma0L5K-00hgeu for <linux-riscv@lists.infradead.org>; Thu, 20
 Jan 2022 10:57:22 +0100
Received: by mail-ed1-f48.google.com with SMTP id f21so26202510eds.11;
 Thu, 20 Jan 2022 01:57:22 -0800 (PST)
X-Gm-Message-State: AOAM532Hs+miJrpLx1iROFDZ4AlPFwhpATUgKmPiMETE5lkXfuNydqzR
 SIisRsOw8SbiJ5Fe/UEMIfkRChiEYHxUKLyBAdM=
X-Google-Smtp-Source: ABdhPJzWEQOVmrSCBjLkthqjYvCekql2pWig3E9/sv1NmQbjWn/17+5wGi2Yo7L626/g8+PxrkZBITeqW35NrwNIykU=
X-Received: by 2002:adf:e193:: with SMTP id
 az19mr26654977wrb.407.1642671389935; 
 Thu, 20 Jan 2022 01:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-11-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-11-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:36:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
Message-ID: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
Subject: Re: [PATCH V3 10/17] riscv: compat: Add elf.h implementation
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
X-Provags-ID: V03:K1:QInHwpZTgWDNqrkYOn05OO7koO/mTAkpB9VxVlYMk7E4C+2w64a
 6gCV6DgUvwYxoZ3okMraO3me/Tfnt6MV8M/MYRoQMXPHbmGWMZdxu2hXWYgMCraPFfTi/9b
 Q67oWi7bKxUSVFvBTETTUhfRYBD4/630avdK8y3BhTnV4kSL4MVqM4l5tJ/5fIDbmvLEmc9
 GTdDIofwmcDiUKJcQq5pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UHsfKbLxCLU=:ls0TnXVYAlTCxssTFuI372
 oe5W+M00lscEoOMsI5Q04aVEqJ56v5FyLzIK+Y7mI7AZq+FMgaFLMYnLKb7Crq8mMMsf0X4Hb
 mKlMZS9Odr8K74gEQb6TGC30Z8sfvUndXVpiI1boM60JjwMag5z+GqYQDzaBv5pXV81us3p/R
 omAi0EgP5zjGnsw+ZOctQmA6eHRsemc6J4cxSkfIQLDQIozkMKRSsiRxrfmMa2Uhic4vMq+il
 dHYUj6FMCLHgBM0GWkT5qB5eDtW/35NMEp8qCf5lsbceE0IJGmPpAiHvW8koLH6SgRua0K3DN
 ag3kkzToF4XOHmOJh6G20FB/UWlYDiY1W9aaZmFLw3AMSjcf8FKtSHBwuSwQKsbxAusmNWvYg
 GQH62q5fXtpS+fWhCYQdYwRZbk6kptCM0y5yk+wLOkRmFxtt5PSEEzDkOm99iXW5+lP7BVZOB
 imVG9FqJeudMpc49BPM/4+JM85QjhCDnkJx8eioCxTuOGQH+5Bvs6ur1vX6YWFaql2M0QNAfK
 PFPiBCK+QunS3/sKSxrg3PiqfDXKr3SWd8stTGFs60ZiOKf/eVCRn+KDrsnYx0F6SN3ztE4FM
 zdRPmIprVfDyFnKYCx7aefCrWPCGryIQO6vyXPbPwY/Q2pS3Sd7WB5cbFaReLq7UJaDKXyclQ
 i2gS1Gl3ZMgPrW1O3ldX0SSixRGPWUGs497G6jX4VlPvqzTJOo5SIbKYH4gVpHSpEZM1JKQ7l
 QqM7tV7VF7bYT+Zh1XKMffFCWjvaGPNMcEHVnCCFDLv8AEVBf83PU4deRISZ97cXVYG644R4d
 NhxQjJtLAE5tk33q7uofXQpxyzYA+t1Bz29SGK9liYpq7AeDsbMG2SrO3O/h4WeoeZLuEoL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_015724_081292_2A0F34AC 
X-CRM114-Status: GOOD (  13.00  )
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
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement necessary type and macro for compat elf. See the code
> comment for detail.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> +
> +/*
> + * FIXME: not sure SET_PERSONALITY for compat process is right!
> + */
> +#define SET_PERSONALITY(ex)                                    \
> +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)              \
> +               set_thread_flag(TIF_32BIT);                     \
> +       else                                                    \
> +               clear_thread_flag(TIF_32BIT);                   \
> +       if (personality(current->personality) != PER_LINUX32)   \
> +               set_personality(PER_LINUX |                     \
> +                       (current->personality & (~PER_MASK)));  \
> +} while (0)
> +

The implementation looks good to me now,  you can remove that comment above it.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
