Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47762C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7or6U2tnPrspbMg+nGrnQskYG0/2gUd9XgSS+vEqxL4=; b=jyUjWHXGQd8N/B
	b2OXdcgurPZnsgE2yMbtiyX11wf9XyILgetm1531igToHqZ51PPA3NH71q4Mhvncv1IA5vfl5KRzB
	cyrZ5oUn+8p9z/GHOML0XJPTeAsDXUDVj6V7yZQEMGEDmF2FqoIM6fCXOd9FjtYMn0xP/Lqytq10/
	JmInVGrWMF7Aza9dDaBoap+glK0nghDT7cRc/RanSyG+SSqCCx9uPIICwwafvPzhAKQWCLotGcCZu
	5P0oQJRxiPyCgevhkGGb14WNzHocnbJops1910Cwti7WrTSu91J/HoujYX7/ui7HGi7+4y+JUlQX9
	MNb2SHWh/QZOVxJZTLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGQuT-0034sJ-Ic; Tue, 26 Jul 2022 20:12:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGQuR-0034oK-4s
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 20:12:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id z18so6648703edb.10
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aqW2jQ+Akji8N/AJOWkQoEhPnhEDdU8RvQcZ00uEYJo=;
        b=ZG5zQYj0tD9ykZ3Z3UzFvSYkW1evxRXZfyYL2+l+05i8v5KOUb9pDU+JxPb3YIpNDT
         sQWPHRM/lA4J508Wa0zqu8qFiq8WUhvP1BPyIwjATYDJMzx6HJtsyWGSKVsW3xJA3QXY
         neSHF4ZOOHkmVfqA8QtIr6oxkklc4RLZfrvT3zmusJxGS4+gA7u6t15YQEvm/eTB9Nev
         rtfL/x7+1yuZ9+4o4YDl0bY6TTnCXHrEIrb/L5LCAkrQ6IKl4AQDUXN9IlXRcGbKsMjS
         S2kNNvCDHai2la0ddMcrPFgqEB6Jep0KyJLJYvHh2PscEY9eJaz8DzCSJr3LGj3k/6Kv
         4VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aqW2jQ+Akji8N/AJOWkQoEhPnhEDdU8RvQcZ00uEYJo=;
        b=4uNPQjur854jPLMVF8fjG9wbnl8qrulxtwv+BcveeGDh7RcN/CdcBW5U1y7us6/vKk
         sGxCgWhEGW2QLS3sUujPhXnUEj325d5rVNSyS75V4gB8OYKbvFn1Uh1Rs6oMV4VduH9W
         iqPBk+NutmSo0Rzs9mNIGbV766/atiGwucaBZriyfEehnbdBBDhSW54zeHcDdO/CXEyu
         abxDgSNiT/Oy8mFoNYgfOjG/oEGx7LT0gB+OFm+wRNJvHohsIPa2sv/rxTYJx48OMfVk
         7BHwOILolepMT4DGagHIvERQ5A63kfb/Pm8/VC93Ro2JQALQsTgw98vo+AM8iEScNrp7
         4PQw==
X-Gm-Message-State: AJIora8AEjp/RheuuE7F/VKwTTJsQyrQmOeJE0zCq18jqpLqEN2dJbZ7
	pLR1VUa+pvH6wfAnrPZ+nPA=
X-Google-Smtp-Source: AGRyM1vGpFkmv1bsXHo6g9sRYLgWWV7T7/PMkLzh3P4QVXtNc+H+z4ZdLYjvn6IP4DHhIKvqctzVfQ==
X-Received: by 2002:a05:6402:51d4:b0:43c:1742:430b with SMTP id r20-20020a05640251d400b0043c1742430bmr9621483edd.212.1658866320152;
        Tue, 26 Jul 2022 13:12:00 -0700 (PDT)
Received: from bhl6zntu.conti.de ([2a02:908:2525:6ea0:4afb:53d1:2272:b50b])
        by smtp.gmail.com with ESMTPSA id wj22-20020a170907051600b0072af2460cd6sm6863959ejb.30.2022.07.26.13.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:11:59 -0700 (PDT)
Date: Tue, 26 Jul 2022 22:11:51 +0200
From: Wadim Mueller <wafgo01@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Conor.Dooley@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] checkstack: add riscv support for scripts/checkstack.pl
Message-ID: <20220726201151.GB17701@bhl6zntu.conti.de>
References: <20220713194112.15557-1-wafgo01@gmail.com>
 <fa77d640-a18d-ca77-ba57-6735094a224f@microchip.com>
 <CAK7LNARu4OU_hGQHu8B7F=5jLzU1jp7L=RHVcyo3eLkEyWNcQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNARu4OU_hGQHu8B7F=5jLzU1jp7L=RHVcyo3eLkEyWNcQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_131203_230539_D2A481F2 
X-CRM114-Status: GOOD (  30.58  )
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

Hi Conor, Hi Masahiro,

thank you for your support. Your help is much appreciated.

Best Regards
Wadim

On Tue, Jul 26, 2022 at 01:47:47PM +0900, Masahiro Yamada wrote:
> On Tue, Jul 26, 2022 at 2:40 AM <Conor.Dooley@microchip.com> wrote:
> >
> > On 13/07/2022 20:41, Wadim Mueller wrote:
> > > [You don't often get email from wafgo01@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> >
> > I feel like you might've been mislead by get_maintainer for this
> > patch. It looks like the maintainer covering this is Masahiro
> > Yamada <masahiroy@kernel.org> (at least he's taken the last few
> > patches for it).
> 
> 
> I can pick this up.
> 
> Applied to linux-kbuild. Thanks.
> 
> 
> >
> > I'll be honest, I don't know how to verify that the output is
> > correct - but I did run it & it does output something that looks
> > sane /shrug
> >
> > Thanks,
> > Conor.
> >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > scripts/checkstack.pl lacks support for the riscv architecture. Add
> > > support to detect "addi sp,sp,-FRAME_SIZE" stack frame generation instruction
> > >
> > > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > > ---
> > >  scripts/checkstack.pl | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> > > index d2c38584ece6..d48dfed6d3db 100755
> > > --- a/scripts/checkstack.pl
> > > +++ b/scripts/checkstack.pl
> > > @@ -16,6 +16,7 @@
> > >  #      AArch64, PARISC ports by Kyle McMartin
> > >  #      sparc port by Martin Habets <errandir_news@mph.eclipse.co.uk>
> > >  #      ppc64le port by Breno Leitao <leitao@debian.org>
> > > +#      riscv port by Wadim Mueller <wafgo01@gmail.com>
> > >  #
> > >  #      Usage:
> > >  #      objdump -d vmlinux | scripts/checkstack.pl [arch]
> > > @@ -108,6 +109,9 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
> > >         } elsif ($arch eq 'sparc' || $arch eq 'sparc64') {
> > >                 # f0019d10:       9d e3 bf 90     save  %sp, -112, %sp
> > >                 $re = qr/.*save.*%sp, -(([0-9]{2}|[3-9])[0-9]{2}), %sp/o;
> > > +       } elsif ($arch =~ /^riscv(64)?$/) {
> > > +               #ffffffff8036e868:      c2010113                addi    sp,sp,-992
> > > +               $re = qr/.*addi.*sp,sp,-(([0-9]{2}|[3-9])[0-9]{2})/o;
> > >         } else {
> > >                 print("wrong or unknown architecture \"$arch\"\n");
> > >                 exit
> > > --
> > > 2.25.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
