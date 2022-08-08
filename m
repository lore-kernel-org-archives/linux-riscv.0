Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35190C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBoS3TS9hlzHohrpbu+NMLNopYdGWSXAkoM0kdTNA5k=; b=oh/bzFmfRV5HgV
	yOj5tL/OtArq0y8Li9q5SRNtDWaxEyHnsR/b518yUMuwDWNMCOGJNcTtqReWAhPBzhhm9kd0lD6Jr
	CVFksxV8w2UUPbxZRkprXcCrg5BxEOSoIdwmibcJbpGKqAs0x4v4mCnbJn+2KPlfEfc49ET+xff2r
	ptpeisLcyq3sWHUEZkP75280/Ljb7rmmq1mMkNG+TBsgIRt48EYPu18BIsXsnc7VAeJNmMTEYDxeS
	JmhYtLvnNaENq9evItKjBDGParZ2WLpvQCGUtG7T9+U5WkhzX2HdceZz3swBnmngHguSzufb2oNSo
	BaknEhrZs3/91Q5ekQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxrU-00CLCt-9E; Mon, 08 Aug 2022 08:11:44 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxrQ-00CL9b-2o
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:11:42 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MA7b8-1oExVa3b6w-00Bagx for <linux-riscv@lists.infradead.org>; Mon, 08 Aug
 2022 10:06:32 +0200
Received: by mail-ej1-f50.google.com with SMTP id i14so15135690ejg.6
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 01:06:30 -0700 (PDT)
X-Gm-Message-State: ACgBeo0rRiMnCAZUa14P7txN9wFYpGrSnrZMsJCmomKRMFT4ADbAIDC9
	AEFL6u8AJ1dtyU97uU8Dcgj8qo1e9LHF2DaQ5KI=
X-Google-Smtp-Source: AA6agR4GgGd8n+xBtHZRIIZDSb3raNbv0NcwwkrbkWgSf6AjnZq/RmNzizI0Ihs+/xXm5AI+HvVE+1WgmC6BUZ+FEN4=
X-Received: by 2002:a17:906:9b08:b0:730:5d3c:4b1b with SMTP id
 eo8-20020a1709069b0800b007305d3c4b1bmr13057897ejc.606.1659945990183; Mon, 08
 Aug 2022 01:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220807172854.12971-1-rdunlap@infradead.org> <CAK8P3a0FR2ySLXAMGR1ZmaAQMbVwB4MFBPvBw4py_pbgtQSfgA@mail.gmail.com>
 <3a4dad85-1102-1bab-c0af-a2c6827663b1@infradead.org>
In-Reply-To: <3a4dad85-1102-1bab-c0af-a2c6827663b1@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Aug 2022 10:06:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a140FFhCvrOXbCtYKCW6BR6tEz6uy8Wqd0aG3DdHiZSXg@mail.gmail.com>
Message-ID: <CAK8P3a140FFhCvrOXbCtYKCW6BR6tEz6uy8Wqd0aG3DdHiZSXg@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: unistd.h: make 'compat_sys_fadvise64_64' conditional
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
X-Provags-ID: V03:K1:fovFJXG0TA0erzJDVdFv95qZLvBSuXZNkyMmW/4y81VQ6u+c0L8
 t4S3iMvTaHiD2hnbK4OMrzd/RP3cE7g08J9udi335H8tP7xlMt403Gb5wWEXE489lfrRsRz
 56MEJmdIaaoDzVt4jB3fejXxT0TftuC0p7O2lIZwAdFzYt7u40xfKyq8a85XmSvKNDOPBhh
 BBOT2UcjIKMWM9Wu3E3BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gRpWLqehVNk=:jQWHA5SxKEZ3AmCYSoi2M+
 Nai3Y7T+0ZE5VXtBYt961lnB977iOwRNrZUBw0Dr7FTTGZA3nz3HfD1ihBiQhWKVI9pulFxEP
 1DX3PwlX6t2UmpmF+Vh1s64xthIKn676hXMD8SWP/E8IJ8ltYJpbelhYNqH5EKQKS6yxt+p+t
 CTJP+wUS5EzZtY834oS1TGbhLHW9Ed+5kGSZt0e8JG6sE4QIcKXI2gjgMnrGHdMToeDXCuqNd
 yuyLQPjK8IWhT48+SyB8wWRHpW13UXBc2oAxjWGKg35QtrBIVEZZNjj14rpJ5KRDw2T0rzpMP
 ob4PaNLEEpfcmUGo/E3LZIGkVVk4brQuwr0Ue7my8VLWThbNGjqEWK74xKKMD3mgjc+KtujNb
 0Suaoy57AGD55wulfQv0txcOXYly/H+4qa9uJboIqGUj7xRt6LoKMJN9bc87iGdPIy66Q3voQ
 uZ8KrrPEtPYGqCmrt6Z9SimXD5xbA6waR1wEFj7Ke0rOz7Ik5boCbFD6spR97U382m8J0y4Sd
 DnytrQaf0nI7teeQT6oCP9HLSN7qXFbp0YB91eLSikxxIyo87rOHacFkrE5hK9aFy+4C8mpJ9
 arrjn/o3GlAKo/q2Pk7XF6zhx/RYh5KClfZ2wcwUwu/nxcjo5TVg2aEC4UXwUfm3xlFWE4o+W
 qT6+18izdpNUpesnzTeQ5y1o/xb9hhoeA1zSNNULiLEPbSXxXUcu69CAyqegf/l/8syb0USdg
 kdSYnZkQLi/ph417fbqzM04KWZaeM1+DfOaP1Zi4BiD3f1IZdLeMQjDD1P3rOsbEdxA4dxCbT
 OYjdBQtlwc3vI2MCcwRGkqckmyJMYT6H4bC8dpeFGloMCtaGVDSR8Y96IaOg4Qe4qWsIO/VNh
 cR/5hiHatSKM4qfQYvUg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_011140_446286_C1E83D8B 
X-CRM114-Status: GOOD (  24.88  )
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

On Mon, Aug 8, 2022 at 12:39 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 8/7/22 12:44, Arnd Bergmann wrote:
> > On Sun, Aug 7, 2022 at 7:28 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >
> > This does not work: __ARCH_WANT_COMPAT_FADVISE64_64 is defined in
> > arch/riscv/include/asm/unistd.h, which is not a UAPI header. By making the line
> > conditional on this, user space no longer sees the macro definition.
> >
> > It looks like you also drop the native definition on all architectures other
> > than riscv here. What we probably want is to just make all the
> > declarations in include/linux/compat.h unconditional and not have them
> > depend on architecture specific macros. Some of these may have
> > incompatible prototypes depending on the architecture, but if we run
> > into those, I would suggest we just give them unique names.
>
> Thanks for the comments.
>
> With the other patch to kernel/sys_ni.c, this one is no longer needed,

Ok.

> although I can look into making more entries in <linux/compat.h>
> unconditional.

This would be a nice cleanup, but it does involve making sure that
all prototypes are compatible with the implementation on each
architecture. I think we should definitely do this, it's just not as
simple as removing each #ifdef in linux/compat.h and linux/syscall.h

> That would also mean adding them to kernel/sys_ni.c, right?
> (if not already there)

That part should be completely independent. If the entry in
kernel/sys_ni.c is missing, that causes a link failure, while an
incorrect #ifdef would cause a compile-time error for the missing
prototype.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
