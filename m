Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F3C4320A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 22:44:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D566128A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 22:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28D566128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTA6Ch1Hig6wCZP1resT9Tr/7Fg9ryvAkTrip93dHMk=; b=fdKAdehrUISfPu
	BcpZmWWMEgN+8x1HPfWQwh2qOgsoCDUz+QNxUYvVvnN88yaDi3mNTVMWU7/Eaul9hcyHsZYn9QwbQ
	b1chxmWQrLBD5wzX5Igwvl+DjKTv8yIsdY24yEvULMwpvuRchOhrGyRV0pA1LSXy3omNHTj42AJAP
	SbS2fnQ1FqnO55s7OtGqxNTCZj6YPotYgJmGZy74RHFfrlxGj0Ab+EY53l/zmzAIcV+LaubaAkav6
	BnLDedASq5llAh4bRkDlKaLxwQIWOW4nrMM+jKeP6y0qoqp1pOtdRgTUuYtjWzJBURKUPzAcLqmMH
	TyUWcZzGuO1zJ1nTq4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIf9W-004pRt-QX; Tue, 24 Aug 2021 22:44:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIf9H-004pPx-TI; Tue, 24 Aug 2021 22:44:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05FAD613D3;
 Tue, 24 Aug 2021 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629845041;
 bh=GgSuJcA7bFVt0ybi6Nstz+q4perrXRwFyg1qNEVRquI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A+y3yb1gB8N4a9X3h53nIr9drqmQVq8eAqvLCie3+AHGhFLoyv5ZHeL3741dn5t+D
 vhrMUamnAeHtLawPmPCFjQUExuJZo+Xa6/j07S8DqpouiAR7kbzoQwNvs1BWuYJumO
 e8PjLoy/zevqg0w6JcqOXne1rleflq1oxbfioeI7yFz8nn6JpIaCY5XoUp3DwbNhjB
 QLP1regIKQsJCxLxFqnjX3Z6nTHIh+jzAgoYId0r0siBbQerhgBTZNCAU9KxYDy6sG
 n8pp4aNNZKKVsK12P7TEYGoL/3yYEBiBGDzHZBv3reLdAqanlFJtiPpBl+yWupe2pz
 2CLKUyccNc3Ig==
Received: by mail-ej1-f47.google.com with SMTP id x11so47617226ejv.0;
 Tue, 24 Aug 2021 15:44:00 -0700 (PDT)
X-Gm-Message-State: AOAM533I1aThpnc+lZZdgoTjBKP4hgO+Cq7Y4PqGebm9aphtoIJOx4sy
 Y2IreJl3t3STIokaBlmx+iGkoQELAU6kMGQg9w==
X-Google-Smtp-Source: ABdhPJyUY2L4QJTbPsFYD+ikQSi/9Dj0VJmplebp6jADpQGcDDA3Pj3knpdqSPXaTaP34wTa4JhBo1wA1Rnk6ojOk9E=
X-Received: by 2002:a17:906:b4d:: with SMTP id
 v13mr12333564ejg.468.1629845039486; 
 Tue, 24 Aug 2021 15:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be>
 <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
 <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
 <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Aug 2021 17:43:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_D85DWrbOEghNqbqdMaCabSJ5X7zKKJjn2uoB7=XN6g@mail.gmail.com>
Message-ID: <CAL_JsqL_D85DWrbOEghNqbqdMaCabSJ5X7zKKJjn2uoB7=XN6g@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, 
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand <frowand.list@gmail.com>, 
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 kexec@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_154404_028509_A2B67F9C 
X-CRM114-Status: GOOD (  24.90  )
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

On Tue, Aug 24, 2021 at 6:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Mon, Aug 23, 2021 at 4:52 PM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > > > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > > > This patch series adds generic support for parsing DT properties related
> > > > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > > > cleanups.  It is an evolution of the combination of [1] and [2].
> > > >
> > > > The DT bits look fine to me. How do you expect this to be merged? I'm
> > > > happy to take it if arch maintainers can ack it.
> > >
> > > I had hoped you could take the series...
> >
> > My current thought is I'll take 2-5, 7 and 8 given that's what I have
> > acks for and the others can be applied independently.
>
> Note that Palmer did ack patch 6, so you can include it.

Right, but Palmer should have taken it if it's for 5.14.

Anyways, I've now applied patches 2-8. If we want to improve the
handling over what arm64 code did as discussed, I think that's a
separate patch anyways.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
