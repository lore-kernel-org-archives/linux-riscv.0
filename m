Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA339C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCLybAibdje/i0x00Wg8HEBH+qrhPpHvjDHPERNUysA=; b=DyKaPiPNAP8MGo
	i579p/IlPty3y7k/bzrmBBxAm8rRlffhjrMzClaggH/tbVlo9thnadV7mmJlwlsC9kQHOE5RBdFhq
	ZCHyXNMvAS9XV9JEuaMJkcvq+yTG20UZu7Dxrf0tSGsN1ToK5vCMQi8gKRWtFhz4fui8XSU+SP++P
	itcBMNV2Y9LnmBvxOzD7iww/8Wvjt4kT203UeZgGnlRa+88q6YbUsblkjtSgrzyD3MLDVTJEWoVRE
	qXD9Ordax2TcqmGFT74YVqCylA3zO+ZhXrEBXICxMC0FDHicI42pgip4KMTHmiuwpkfyMKFkXumjQ
	nZJGbT578CeiSDyFMVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZn8K-000fy6-EH; Thu, 31 Mar 2022 05:14:08 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZn8H-000fxc-SY
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:14:07 +0000
Received: by mail-il1-x130.google.com with SMTP id j15so15965438ila.13
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/e7BHUn7ZHGxvo80hqqfbGEa/QzB5qbcKyyziRHWvOk=;
 b=SKNwHY4u581WKoinmdmsZ1MwhelyXUh4Gto8OamBKUfAdb20teGxg8HcJYRUU+rgKy
 i23CGX8Oewn6TDC/r99K9j9Bp+6KIqt7gGCc8s1m9jKZHfYT3KmPuOJQm6DlRykByCSH
 a6QPplDyOCNJJQDz3ffscpbJkNrUo8Ih4hvJLRV62okuSjcjuo/Mg09xPiH54HhuvFE/
 sy8j1O5W+Fzy9oUb3cs3nrSlUK/CTJNFsUmKpuXxkQC8ac6Aw/SqkCdQyKwSu+zDW7NK
 ioOvJx5p6hzB8v5pqxtX4/TFA25rVG6wW06iwFTovHDjQrBbJkwMaxN+zsvSA/XiJU3W
 OQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/e7BHUn7ZHGxvo80hqqfbGEa/QzB5qbcKyyziRHWvOk=;
 b=IXtoJk/cUgenacqFU+KfqLBiJXKs1slbeGox5NMO2a+Re5ESamrBU2SJjKkM88UaFV
 +kbnl9UtPo4dW3rjUF4H4ugFvIYkHprGQlG7yWr81ReoaQSAVPVJ5fyyBGBk3++AS/VK
 E6sNZxMGihRZDzqfB7ijFAd1AfVewAb7WcNa2jTOhsZBPi28UBRH4cOKo4J9iVs7yUDJ
 h9oC+F1fpp/GGXX5/T4B7zJjkizqkAk/lS/g+8uxu93kvPlSepScYn5p4dIXsZJ4vGZf
 ERqwNx3WFMehxDLpOCavogK2HTUGrjnxYIKY1oZV6eB1w8DaGWgRPVIZ7g1C1N61xQnM
 kwCQ==
X-Gm-Message-State: AOAM533vAVJHJzfwZ50wMLNJlqcjv58lPvfDJ/4x5iLfqkpbHwyFRTO3
 xuqLj6epV8NeSThK40ftw7wNGuf6+I0xOgCwlLM=
X-Google-Smtp-Source: ABdhPJxkPmOpqA0C22ahyk8Lv82MBr/+gzTT+dJagWxWcoL9yN/P4aK4Np5nynqq/IfzhJJVGyDzRz/NHnLR2Ad5CrY=
X-Received: by 2002:a05:6e02:1c2a:b0:2c9:defa:d061 with SMTP id
 m10-20020a056e021c2a00b002c9defad061mr4506973ilh.260.1648703645018; Wed, 30
 Mar 2022 22:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
 <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
In-Reply-To: <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 15:13:39 +1000
Message-ID: <CAKmqyKMsG6d7jaS2gxXxh+qONWkWGbHFwLK9tYb2q7eeQe77uw@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Idan Horowitz <idan.horowitz@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, phantom@zju.edu.cn, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_221405_952686_10EEB6C2 
X-CRM114-Status: GOOD (  34.65  )
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

On Thu, Mar 31, 2022 at 2:36 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
> > On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
> >>
> >> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> >
> >> >
> >> > Presumably you mean "revert" here?  That might be the right way to go,
> >> > just to avoid breaking users (even if we fix the kernel bug, it'll take
> >> > a while to get everyone to update).  That said, this smells like the
> >> > sort of thing that's going to crop up at arbitrary times in dynamic
> >> > systems so while a revert looks like it'd work around the boot issue we
> >> > might be making more headaches for folks down the road.
> >> >
> >>
> >> The opposite in fact, I did not suggest to revert it, but rather undo
> >> the revert (as Alistair already removed it from the apply-next tree),
> >> since my original patch fixes buggy behaviour that is blocking the
> >> testing of some embedded software on QEMU.
>
> Ah, sorry -- the QEMU tree I was looking at still had the patch in
> there, must have just been an old one.
>
> > So, this is a little tricky.
> >
> > We want to apply the fix, but that will break current users.
> >
> > Once the fix is merged into Linux we can apply it here. That should
> > hopefully be right at the start of the 7.1 QEMU development window,
> > which should give time for the fix to propagate into stable kernels
> > and not break too many people by the time QEMU is released.
>
> If you think this is a Linux bug then that makes sense, but I think this
> is a QEMU bug -- I sent a patch, not sure if it went through as it didn't
> make it to lore.

Ah whoops. I saw the patch but didn't read it, then I assumed it was a
Linux bug from your diff earlier.

>
> I also think the bug will manifest without the TB exit patch, maybe in
> single-step mode and definately if we happen to exit the TB at that
> point for other reasons.  Assuming my reasoning is correct in that
> patch, we may also be hitting this as arbitrary corruption anywhere.
> I'd started to write up a "QEMU errata" Linux patch for this, but then
> convinced myself that just adding the sfence.vma was insufficient.

Yeah, looking at it now I agree, I'll send a PR for 7.0.

Alistair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
