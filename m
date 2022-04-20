Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB09C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 20:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOf4m6kLjDD91jWGF5EbsSHS0PFd05j+CnJRjYLpIUU=; b=f8YWfdF1XQUYfH
	JCj6jUvYI7GL7Wa68/R7jpE1Ku/Z6IhORSdiXlpOVYzRrNLAIE4p1crM1mv3K+uLBtRn+X+Z+CeDc
	PXQubldaF7KZMLeBu9Lfq4pcFA3vrGbMA1lJ8jDhUQj/udRmLLo8qATIoE8xnqUEOaXk4nkL5upEE
	kVsEv5Yu6g2AoObFxxBNSLd3aizbFUxtv01/roGLob/9n0ka+tCXgcCpiHP0HQ1uMqRRpddojtT+M
	Rkqvcn1ysspl4vXS3UICn2S/VtnwUIgrL/l9d7225Wp3yIXm/w8tmhG0KtPrezAyd0QrfjPTru6Uu
	vHBw/eytc3USH3ORaEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhGZY-00AHJr-Pw; Wed, 20 Apr 2022 20:05:08 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhGZM-00AHG5-CH; Wed, 20 Apr 2022 20:04:57 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MeTD8-1oHhJZ2xi0-00aRoP; Wed, 20 Apr 2022 22:04:53 +0200
Received: by mail-wr1-f53.google.com with SMTP id k22so3757494wrd.2;
 Wed, 20 Apr 2022 13:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM53309wieczEfL+2z+Z6dEz2uesN66NFGxT16ufAJ8p3Zqzj1MRCP
 74RXLrexyofHrzoU1IjNWeK2YP6iZ3eGrCCTYSw=
X-Google-Smtp-Source: ABdhPJzQqXetCmaGkZ0VLDQKkxSmuQBexNxn4+LtaoO2pmxTQhac0Nj1iF3iDiepN/wJPA+ZQPYKZ600Fq7P1vAaoZE=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr2425684wrz.219.1650485088720; Wed, 20
 Apr 2022 13:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx> <202204201044.ACFEB0C@keescook>
In-Reply-To: <202204201044.ACFEB0C@keescook>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Apr 2022 22:04:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
Message-ID: <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To: Kees Cook <keescook@chromium.org>
Cc: Rich Felker <dalias@libc.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Niklas.Cassel@wdc.com, Al Viro <viro@zeniv.linux.org.uk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Mike Frysinger <vapier@gentoo.org>, "# 3.4.x" <stable@vger.kernel.org>, 
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
X-Provags-ID: V03:K1:kLt85l06rxOdos4j+C13WfK0FyuoPaHhEdsNll8WBMRiet/cH+5
 sBCzhkvCMiHhVURj3UG+5Fl4wXXdYB1y1pXn9N8m6gQs9UIBbl9BrR5ROjShrW5LCmzn6l8
 bTbaXwfmHFjzepetrU8dy04hCZhXEUnA0egpmSaTyTu466xhwW1QbmeF62+L1SJrMiBR5Sk
 qQLMRdy05capxujxb5GIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DEXdsx21aqM=:nh9Nb9E7etNzuahV3tidEG
 7NboENUCB5Aex0icRiqe2rBTIXLSVVugd8OOEWBKafeHEGYDYdcUnIK/wbVedQ3vnrtT2HFOU
 3ExiRqO0vavBg508FS9G4SQ7vbHGNJdhO7SwqaCj/VQEKpMeILbbRHQ/LP31Xc2qyJLGYODI4
 nQgnc3Yy3HD4ECIyj1oD63mLfXSjmDvYJImS9sEh4zl6+IOiLRXzWACwNfmnP4ANYd2yYffu8
 7i27epeM+6JpFJ0xwJjlNDMkqyUg/Z5l47GGlGEyvUqnjYls91Nu5zxDpU1mDeNfXWKHBl3wD
 R6NdqScrOqC6HmEKLEa8gJLbfwhsV7r3KXzRD135hxmtEoTpiA2yIHGMvr1Zn/uw9duyzY1l9
 EOAIivdlu/K7VaevfEMRGynmkZ2B36jDHEd+YFUVaGm+OaZv0Jfa2tz/HXbFoJ8aAtuPTLI+b
 kPyIaYimnMuiVkOt/eHKS5c94TnpayweeXo0ITPVN8V9MnaaQXqcSXYPhiQYtZ8Fx67CHKe3B
 pxxEvJkdKeu75Me6rcsVbTnjaVUZ0FPqg6TmaRIysW5x5Rg3ynwdCKkZtcuEaS6nWdDkFFiGN
 RV0zs9+POvBy+jy/090DrSJ/cOTg7JhdiSYbT0yibyFGu+rNF2Xv0Hn9VwUUeAfKhC/fHsP9U
 gkO4VteoJVhkcC5T0mfvGbt6O00bH40W0uIUQTgP7pu9GMhL7oNRmWWoGBIRQK1vZ1vru46gg
 K1+CT7l140Et8Zd/tgSLEGHo84/8eoJGdQDk5r3gJm3g9RCRw91u8dVICHzlWsH5Xc0pYbBNF
 mmUMS0Xv5+b+7uUN8YMlfRHOqEq3M6+aMW41BGAQVm5ykS2Ztc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_130456_756988_F6BB6CEA 
X-CRM114-Status: GOOD (  10.63  )
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

On Wed, Apr 20, 2022 at 7:47 PM Kees Cook <keescook@chromium.org> wrote:
>
> Yeah, I was trying to understand why systems were using binfmt_flat and
> not binfmt_elf, given the mention of elf2flat -- is there really such a
> large kernel memory footprint savings to be had from removing
> binfmt_elf?

I think the main reason for using flat binaries is nommu support on
m68k, xtensa and risc-v. The regular binfmt_elf support requires
an MMU, and the elf-fdpic variant is only available for arm and sh
at this point (the other nommu architectures got removed over time).

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
