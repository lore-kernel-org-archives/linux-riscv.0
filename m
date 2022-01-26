Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BEC28CF5
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvDDe+OcpnQjkLhWijzT/AR0eou6FdBPrhy8WgJLFvQ=; b=glpmDuIqxzV6Qj
	6duOtv79yGyFLvVw/q09d+K4CWEbwmuMu/UjtAihOwOVMDM6ugErXMcgf+VkUxsoRoAae4nGCwL5H
	MNVH3FzWV22qDT7BK1PTY5fC3K90yI+3bQijjObl0eAnpnBIn0wqsMDotvBLYsBpLaEFe8T9Va0Vz
	cIaKO3SkkKOygK0a4m1ZRNdll16VJMFCg2tZf0bA/vWGfb7E0ITfCD0tMkojYmYOQPbIkdLNaUf26
	JN9GsjhdO72FEfQrYkge0kbd7CkvddVTJroseYCe1kdpYwvnD4oA7LmwuT5622BGNnGqiW1J0Doqu
	CIX8BlaD/YjhETKwpXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCoZN-00DSHv-5g; Wed, 26 Jan 2022 20:07:05 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCoZI-00DSGb-HY
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 20:07:03 +0000
Received: by mail-ua1-f43.google.com with SMTP id p7so803419uao.6
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 12:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOMO0KZ96VSwI3Fjhw3+4AOK+IYIb4PO2J4HKTLIIaQ=;
 b=QN2shy6otP8DGmg84ZpfkpOB6TiiCb7En4VgnfXWV3ZUeHsCLuhDFio7o0Rsv2YMXL
 YfSka/jJUaPUNKms7+VBns7lJVqHQWM3+TkTWh/hOD2YGdYT4316/8JqpaLHf+auhraF
 /vmj9lgJ5JjMt6QCTnSADlcSbZ0o81kvmkxd65Ez1yqCykA14DnYZgTYytUPkhCQY6tc
 4ZWn+R/soB2SOe/bh397zPwcN1HOVZjZS49DNuuFxcjSJOEC7kCkO3k1EBKqNY8FmE1N
 lv8BlkVrU9KRgzqGBvgIFLSBSB4zbRlCItyGOxWNBO6GNb1Nx7Sq/pMS0ovjMAPtI/Kw
 ThRA==
X-Gm-Message-State: AOAM533tC8L8ePxs2PSpx6QmexaFprYBjHdItE7JHCplBMbyI3p0RDXq
 3ipbGNXkIG7U/fzqg2bR40C7tkESBi7kRKlG
X-Google-Smtp-Source: ABdhPJwfPVMfxweCwTZ81sjGVymtjwK/kKIQuK6b2W3Jc1UYEVkf7eYgDhPEHta0jY07Yo9EWvLkhw==
X-Received: by 2002:a67:ca0d:: with SMTP id z13mr359947vsk.9.1643227615982;
 Wed, 26 Jan 2022 12:06:55 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id z62sm57923vkg.43.2022.01.26.12.06.55
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 12:06:55 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id l1so783451uap.8
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 12:06:55 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr263175vsb.68.1643227615416; 
 Wed, 26 Jan 2022 12:06:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639744468.git.geert@linux-m68k.org>
 <4f409ac939e260a4657a0e6e6518ef8736527822.1639744468.git.geert@linux-m68k.org>
 <CAAhSdy3g9WsBmQk7KOgdVNSw9qUouxF2i==q9M3WQq3iabXv7Q@mail.gmail.com>
 <CAL_Jsq++-Sp45vna5-WhPsnrxp1_J1krrBUPgd2y3xkp5=sTSw@mail.gmail.com>
In-Reply-To: <CAL_Jsq++-Sp45vna5-WhPsnrxp1_J1krrBUPgd2y3xkp5=sTSw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jan 2022 21:06:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuM4wJKC7TgNd7VbZJ1xM0xBgB4os6S0WXpJUdsmxK4A@mail.gmail.com>
Message-ID: <CAMuHMdXuM4wJKC7TgNd7VbZJ1xM0xBgB4os6S0WXpJUdsmxK4A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Rob Herring <robh+dt@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_120700_604186_BE3C7FBA 
X-CRM114-Status: GOOD (  26.36  )
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

Hi Rob,

On Wed, Jan 26, 2022 at 8:37 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Fri, Dec 17, 2021 at 6:48 AM Anup Patel <anup@brainfault.org> wrote:
> > On Fri, Dec 17, 2021 at 6:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > The number of interrupts lacks an upper bound, thus assuming one,
> > > causing properly grouped "interrupts-extended" properties to be flagged
> > > as an error by "make dtbs_check".
> > >
> > > Fix this by adding the missing "maxItems".  As the architectural maximum
> > > is 4095 interrupts, using that as the limit would be unpractical.  Hence
> > > limit it to 10 interrupts (two interrupts for a system management core,
> > > and two interrupts per core for other cores).  This should be sufficient
> > > for now, and the limit can always be increased when the need arises.
> >
> > Same comment as the PLIC DT binding patch.
> >
> > The "maxItems" should represent CLINT spec constraints so
> > please don't add any synthetic value here.
>
> I agree.
>
> Geert, are you going to respin these?

Sure, will do, now we have an agreement.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
