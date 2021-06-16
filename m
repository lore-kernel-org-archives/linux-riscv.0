Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E8BC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 00:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C970461209
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 00:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C970461209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFVXi9gqSmCNdn3EzADBzdP2wSzbLlHf8q5gpjMgzuY=; b=nNPLEctt1WszU9
	LtuQlodr/vRyEwTcVj3rURxqfhEqyaHj2NEeoeB1/YAx6csGYRmJQtJPvaIdjJpumc8SsvKFpP0vg
	DoHW1MpD0zpYnBUHj1F0PpfzOW7QOmbExa4HnfA/o9w2VAGk1VwSntnxS4n40ab3XRdPHVYjM53Ae
	/fnc1wWe/3wbiPk3bDaXH59DzSD04eK+6KGMx7jnC5bAc8t4ZELcVDQW6ytRVRqUrtMLIvQsH96U6
	EHqQ0hyxbXoa3XU+MO/dsQgWQ4OKts079NiKDDH6reIuLnzzq2ZkIKnY2bej12lRc26oYhCfMEVvy
	ySNWing8T4vvChJId+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltJV0-0048Q1-P1; Wed, 16 Jun 2021 00:33:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltJUx-0048P8-PO
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 00:33:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id n20so293270edv.8
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 17:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TsSNYVIozB9ftiPAfUMSru47aMNYHPLKEsM4T0oQcRY=;
 b=LG+tI/+5s00/IZs+iLkyZfcF/Px7Xc90vcaaxylci9OBEgbg7hXT091ejP96knZxDg
 U+ZFY8qCwsixshXHnzEt7/eTGh+vHO3LIxv3xvlZ+0V9Fgdt3NkaqSg1enuDfzmZvPdi
 tlYFm0hfGI0nqBodCt7kZ0yuC3RIsvX1oLBQCq9vnIU9xXIFMKXea0ezU4Ksv4yFhMOe
 VgnWSyqNIh3vtiYkBJ/2MrJOTrZl7GLi3WGb+s/PmJLbr4v1MUWpU+tv4wOM92DksV7V
 XzU59GR2t+HHTc8UxRTdrJMldU7rTTta6m58oOA8aDczTPgmJc/DZs10u50PU1C+ZlCw
 SPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TsSNYVIozB9ftiPAfUMSru47aMNYHPLKEsM4T0oQcRY=;
 b=BPZOhzvA1PBvRWC5xWQlCfb9sEcgXAPRkjW6dd8IeroDZMuuOnA64EE6+808U/CkQg
 Y4LXcrb4HCu3YPrqI3VcripWBJ6gc9Mvwzpu1Gd47Sm4oAkMDwuwXkZ5XrSxjTCS7ezP
 U2jRBH5tqAv5ixUI/Jwvcd14kVeU2dznmBHorBUlJCIUSr1FHiGWcRnQvr2jmFiu6ZlC
 dqFAyicdWGTF9FQzQRXu5xyj0yK6VW93TiKo2Y3dYdqnObxurSGkx6qXsY827Tas57Ak
 xYLtngzkIbJs5nmqCSPVQhTqiyMaW7CVYN0kkBlX+PQe4N24y9q3gIeLlvEJuh7N8W3J
 rGew==
X-Gm-Message-State: AOAM531guEnNpNlpOUIBlhq0zHB8/087g9q/plyAX810PeM/ntTxbpS8
 kcyBxktVDkNoB9i0kC1VxwvQqChk9OKEAlHXyGI=
X-Google-Smtp-Source: ABdhPJxp8c+7fCJGxOWx1AGZi8f4Stfs5QV8Zrs1O3zUnOCyQIW92wTOm+Xpq7nUzLcWUqzeTT4Np55x3Nv7aEI1g2c=
X-Received: by 2002:a50:9345:: with SMTP id n5mr898254eda.289.1623803613192;
 Tue, 15 Jun 2021 17:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
 <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
 <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
In-Reply-To: <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Jun 2021 08:33:21 +0800
Message-ID: <CAEUhbmX_wsfU9FfRJoOPE0gjUX=Bp7OZWOZDyMNfO6=M-fX_0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: David Laight <David.Laight@aculab.com>, Gary Guo <gary@garyguo.net>, 
 Matteo Croce <mcroce@linux.microsoft.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_173339_869528_56F4D468 
X-CRM114-Status: GOOD (  13.21  )
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

On Wed, Jun 16, 2021 at 12:12 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On Tue, 15 Jun 2021 at 15:29, Bin Meng <bmeng.cn@gmail.com> wrote:
> > ...
> > Yes, Gary Guo sent one patch long time ago against the broken assembly
> > version, but that patch was still not applied as of today.
> > https://patchwork.kernel.org/project/linux-riscv/patch/20210216225555.4976-1-gary@garyguo.net/
> >
> > I suggest Matteo re-test using Gary's version.
>
> That's a good idea, but if you read the replies to Gary's original patch
> https://lore.kernel.org/linux-riscv/20210216225555.4976-1-gary@garyguo.net/
> .. both Gary, Palmer and David would rather like a C-based version.
> This is one attempt at providing that.

Yep, I prefer C as well :)

But if you check commit 04091d6, the assembly version was introduced
for KASAN. So if we are to change it back to C, please make sure KASAN
is not broken.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
