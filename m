Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59450C28CF5
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjlkVjM5el+drcSvF2fBQCM9NbFsNu6WhVxY8DcQM4w=; b=JKRxv8qwvlQ/5P
	N/Old1PHZxSPzdygLnxyS9tIMTXWeWuD77fkzBA+Ma3tmLOZX2jMeD3xNj3Cc195wMa6cM7R1gcic
	ubExioLf4mWmA4DzGl7u9x+6YepUBcB02Z3VmoWsqj3er2CGIPtDIkv2gaOAAGyqZQNk9HuTfgxYK
	2PrZacsNH7gThTYQ33iC8sR/OBtYrf/F1HhAHAyZX6jRmQMMvSozYs9583rpY/+rKxuCZECaKCDtc
	ENivT6RXc3U5979ikYGXS7wjD5xGnu2ktRuCMs1nJ6taG7KeVxLxNpw6p9EhDlI8VnWQPjAXKNb3O
	uj9DMqaMQLEHXMvUFtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCo6J-00DOmf-7f; Wed, 26 Jan 2022 19:37:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCo6H-00DOlo-Al
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 19:37:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47354B81FBE
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 19:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17351C340E3
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643225818;
 bh=FX4ycAoQ1Kx85m2fAggwF/dB1ZrkI6hhsraoivrg4v4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m8gbUXGPpJdJS8OapXAAZcQt2i3/3+PMvgDfJRpDX1OjSrB/hny0Pir35k+D1pIK/
 t5kV4j3NKaombI9TG1VzqViFb9WZvoBxeYULKInkMpsHwaDsEreXT1rz6q8VE/st53
 rtJt71BDkx6Z5Kleckul57cHE/fXOpOhXS0uTw7KnBXWAR0JNuLKSPFx1roLTSJTlV
 20BkHyKTgJ43fNfKCW8somfRYGo/DX4l/UG9qUBIKdPdFPspYgds7vu/aUJIjIUUue
 pqg8mFzeLC9qKajXh8VRm+lWKBKCbf4hj2Po4YVrtH0VRSVlyR7Y8cY73N+5DGw5T6
 S6mPpKhBa9/IA==
Received: by mail-ej1-f50.google.com with SMTP id j2so803527ejk.6
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 11:36:57 -0800 (PST)
X-Gm-Message-State: AOAM532V7Boqd1CCR3NH+Lx2dzy8/3vAQ7wNj7nJFT1o9t8jlyErM9Rg
 ri7zY4N3HxOjcC8ypRhuOoq6Q48HQT5snF8LYg==
X-Google-Smtp-Source: ABdhPJxCkKeplWRipuk7FYPCNtGWq3C0aDwhj+I3Yngm5B4DjN1t4ZcmJr+s62lzu5ahhDGTjWbImmlIaR86QPECXo8=
X-Received: by 2002:a17:906:4781:: with SMTP id
 cw1mr258583ejc.264.1643225816453; 
 Wed, 26 Jan 2022 11:36:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639744468.git.geert@linux-m68k.org>
 <4f409ac939e260a4657a0e6e6518ef8736527822.1639744468.git.geert@linux-m68k.org>
 <CAAhSdy3g9WsBmQk7KOgdVNSw9qUouxF2i==q9M3WQq3iabXv7Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3g9WsBmQk7KOgdVNSw9qUouxF2i==q9M3WQq3iabXv7Q@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Jan 2022 13:36:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq++-Sp45vna5-WhPsnrxp1_J1krrBUPgd2y3xkp5=sTSw@mail.gmail.com>
Message-ID: <CAL_Jsq++-Sp45vna5-WhPsnrxp1_J1krrBUPgd2y3xkp5=sTSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Anup Patel <anup@brainfault.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_113701_547160_43E7A473 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, Dec 17, 2021 at 6:48 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Dec 17, 2021 at 6:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > The number of interrupts lacks an upper bound, thus assuming one,
> > causing properly grouped "interrupts-extended" properties to be flagged
> > as an error by "make dtbs_check".
> >
> > Fix this by adding the missing "maxItems".  As the architectural maximum
> > is 4095 interrupts, using that as the limit would be unpractical.  Hence
> > limit it to 10 interrupts (two interrupts for a system management core,
> > and two interrupts per core for other cores).  This should be sufficient
> > for now, and the limit can always be increased when the need arises.
>
> Same comment as the PLIC DT binding patch.
>
> The "maxItems" should represent CLINT spec constraints so
> please don't add any synthetic value here.

I agree.

Geert, are you going to respin these?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
