Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BE3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDn4YrjZ7qn9B1OyKzB9RCC8zvKJHyVmfSGuDuiQljs=; b=Yz6zvY/2DcULzX
	7yLbYCSEacpRUH9cPZaT5TMIns2jMCc/cFPlaTvtOPBpZIdV1ytL2iauHLxKvT0BfXIrp4wrC4wve
	AJgjcJ9qt5NLjRpH/2kghXCFgrQjouL5G9a4Lb/gZJewQSVSSIYjqRlgVxBIk8LqLmb1xMTlxAqvF
	OZTJ1+6zutyviwCMHeW62VTmzljynkAzaYXt/0VR7gIn9BzGtF960f2ty0OpAjqGvJw1vdL2uGAtE
	unxRqzrQGlohSwY4trVSvb8K1czePE9OTpXVa4qGSXE3y6VdtDVHkfQHVjM21nWUJgq1LyOaNtKdm
	DfIXWkPkyFoXmNUXbPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUgq-00AjoH-11; Thu, 20 Jan 2022 10:29:12 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUgY-00AjhC-Dp; Thu, 20 Jan 2022 10:28:56 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Md6hP-1mbi6B0H9H-00aFCY; Thu, 20 Jan 2022 11:28:52 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso20842148wmj.0; 
 Thu, 20 Jan 2022 02:28:52 -0800 (PST)
X-Gm-Message-State: AOAM532Ovfx3t5QC3sDkJ261/uVx8/DT9jCfxxQjF7G36IKKYXbTnoEK
 GlymNI9MdgZsjz+7ZWVx2eIIuYSA8Jw3GTvu9Kw=
X-Google-Smtp-Source: ABdhPJxuH3ieTJMrWvtM18t+kt/eQKxNsX0S1JRfafUu0rov1od6UeEmq8/soY26aK2ZvAh1u2FgbOu1pscCT0xGmKw=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8086318wmj.82.1642671086465; 
 Thu, 20 Jan 2022 01:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-8-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:31:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
Message-ID: <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
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
X-Provags-ID: V03:K1:InLv69xx4wPy67avgckcjfWSzdfp/FoSSz9K7Sh41lFRBT7Inp8
 K8X6e6xH1qYEkQpKwIOOylSVbNdnB0zxm13+31VLZSTzh/stjczTy1r1NiI6DwIaey+YsT1
 mYMDxwVewHF783QQdcECnGaYSsIL2MyBqbToHEl1yv4gTKcWdwPXMdxbekKcBMLQ5c4qX2F
 haII7R0DD13SW/l31l3kQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:46IHhuTRsSI=:F2u06semMJEa+9NN5GVRFT
 WQcgZFjFZekHbDkHCc2tBDS3/XhxXM3hUExaEh948IThwRRSVdxcE/CqZDTAoh9ff0NwpA8IS
 7zkBeN6HsnTXWsM0KeH+i8TDz1GREj+zJJ9QKfb5Sz7P/TssHaNUCoK2xEBvjvTyPLeeXg7js
 9bxwnzsmT9JpnTRN2RzSY1SkuUCpuMjjq9Y9rK1F95/EXp5oivZ74HQic0Ui1d0Ep6XtdN2jj
 OWyErxxtWnB4a9CpqUHA+xYE7dhMSesKaK59LQBsswOLLd0O4qEZrAOasJzFRelZ/zixzBDje
 1NT5JmCCOT/FpkgSUxKHPCGCPTChqgt3HM9dtBtrKFDSNrWj59YP8BFjtdtJ60jvaN0X0a6Ms
 MaVhJfGpIcZJzVX8/Q2oZX5ivEkxf8Ah170AuUARZ8kawC9zOIdBhmnnCQlpyMZ3WWAqIrqMM
 2artlQAWazdHFbvx5ui1KjR9b+6/Z2uPsLRn3+lYAQD1o8g6EP1iUY2HSNlLRVj9k4+Prglkh
 VSa7DhxBPOoMuylZwRv5E1mLYauuza20UT9LT2XkEyFXJhq1HjNdt7Oxbv/UZwWGjIYV3qhWl
 +7yuIYg4C5mPv2rJVxx5qeVlcuq9VKOTzdS39a+BO/CB9yfIlbmi+cto/2JRrulnPrBcR5BKR
 bnPIdGB0Or8/KLwg1FPsPS+rjTtrdF/38//Tace8oGMDW/3AP+ytfkGcZbPNWD5txMQH5aVHy
 DGwzlulpVopTSsGZk3O4e/VaBjD2Urs3lY6Y+RYWRgQftQXop/Hv+EHjuet8IuonfzmMxUEn2
 EIQIl+DHRNPsNPMWETbvHKtra0lQDAIdiV6t3/3E2yS0Fj29kH/FE0C/y83ZFDUix2JePdh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_022854_811256_FE424079 
X-CRM114-Status: GOOD (  12.24  )
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
> Make TASK_SIZE from const to dynamic detect TIF_32BIT flag
> function. Refer to arm64 to implement DEFAULT_MAP_WINDOW_64 for
> efi-stub.
>
> Limit 32-bit compatible process in 0-2GB virtual address range
> (which is enough for real scenarios), because it could avoid
> address sign extend problem when 32-bit enter 64-bit and ease
> software design.
>
> The standard 32-bit TASK_SIZE is 0x9dc00000:FIXADDR_START, and
> compared to a compatible 32-bit, it increases 476MB for the
> application's virtual address.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
