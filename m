Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A566C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgLCZ/u7pr5YBMMZ4paUqOlwp4TBdwbpFN+wVDbBpbQ=; b=ss1Ft5XMb9pLMD
	lwAtrkQ6lqxznQoxh9LW/k/Wl/Cpqz56F3+B2aEyZI//H5LAvt6VkJfXgslUYJ1BpPTP+0SvJFY56
	DNhJbfvYs8GEt2MCngCEtPJQNeWsry5GeSS4K9HSv/HgHZUO7w1LVbTqp2zuZedk2c5PdfVVE70DK
	/3Gaxk0j/Yg829iwPw1cktgN5TKQU+n0Udi6rBh996ISra91kvVgOkwNZKm7twNjr4njDH010Dgyp
	X0syWRBzk+rUAMF39Z4VvrOkE2Wc4vfbMBn0/WoR2yjDKACSlKlzHpFtvTpZzSF8NFKRu5cVv5EZl
	hHw5gMtIekYQoRp7vmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBs0-006r5A-2m; Sun, 30 Jan 2022 15:12:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBrx-006r4O-It
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 15:11:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB5FE6124D
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA16C340F0
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643555516;
 bh=bjY5Bd8WmnLHJ0/+E+BfU396MaNZGVNtIYeOtwQvt6g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mZ0ZlJ/lU2kQQdZJe9lUTm5uIlQm/lY0zHmBxzHKgOsEruCpf2svcyi0SNqfmgbVj
 iaLel856SEz8fiB+B6LJae2tOUcOu9CELIlhAjC3h1wbRCxxkN3GeWvGObTCGtIJy9
 jodkfRf6SZV/ADfbpvozpjMxcwx+HoPFMW7Uzky3QWFBvuL3SVNtLDbb5CVL7ROW/f
 +VpSwqB8weruf1R3hbV/ad7Oz99myFABa2EUTS59+o17a5VWgys9iBoP3WFjGcdpNw
 t6h82+/TbPhnCG6A4uTjkaWbNEy/oXyZ82g+NATSCYw07jif2P2KEkKRDHzyYHfuAJ
 voFTwRfEwAQjw==
Received: by mail-vs1-f51.google.com with SMTP id g23so8845880vsf.7
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 07:11:56 -0800 (PST)
X-Gm-Message-State: AOAM532i6lLN+wYrRl8apbjGWB9S8xHAniCBamQ9aKB6315G3zi9rFFB
 xkkRgzaMJcFmwu44aCULmo6yqi4cwiMwmQdKYWw=
X-Google-Smtp-Source: ABdhPJwMK9DUIzKUAIOWlaq0Ta5XXx5E4OMuiq5shsMOycqIZItMc4Gr9hUgonYaoC8Fda1dzq199JcGzBkeL2fUibA=
X-Received: by 2002:a67:e947:: with SMTP id p7mr6666466vso.59.1643555515158;
 Sun, 30 Jan 2022 07:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20220129162726.1154501-1-guoren@kernel.org>
 <20220129162726.1154501-3-guoren@kernel.org>
 <87r18qxui9.wl-maz@kernel.org>
 <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
 <35b1838d-ef80-1816-46f6-9cba7afc813e@sholland.org>
 <CAJF2gTQsi6uT8ea6MTu6oDA-9xsd3fW5ETHAtpzGZxapLpLsWA@mail.gmail.com>
 <87o83ty0ti.wl-maz@kernel.org>
 <CAJF2gTR=Gyw33dt36g+uqDSMckqJW+bifpue2N_+FAMEn4NqAQ@mail.gmail.com>
 <87mtjdxoam.wl-maz@kernel.org>
In-Reply-To: <87mtjdxoam.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 23:11:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTROgAuj0j2qC6AZFgP+k3erU7erQRadH5ugaVPkj_=1hQ@mail.gmail.com>
Message-ID: <CAJF2gTROgAuj0j2qC6AZFgP+k3erU7erQRadH5ugaVPkj_=1hQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,c900-plic dt
 parse in opensbi
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_071157_718420_9A5EFD5D 
X-CRM114-Status: GOOD (  17.67  )
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

On Sun, Jan 30, 2022 at 10:59 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 30 Jan 2022 13:09:21 +0000,
> Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sun, Jan 30, 2022 at 6:28 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Sun, 30 Jan 2022 04:39:34 +0000,
> > > Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > > +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init);
> > > > I think we should give clear info in /proc/interrupts. I hope we could
> > > > keep thead_plic_init.
> > >
> > > Why? There is no material difference at the driver level, and
> > > /proc/interrupts won't be the target of a branding exercise (which
> > > this series seems to be all about).
> > It's not a branding exercise, the series just correct the broken code
> > & incorrect /proc/interrupts display.
>
> There is *nothing* incorrect in /proc/interrupt. If anything, changing
> the string *is* an ABI change, for no good reason.
I've minimized the modification to fix the problem, please have a look:

https://lore.kernel.org/linux-riscv/20220130135634.1213301-3-guoren@kernel.org/T/#u

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
