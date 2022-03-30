Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC71C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGRnJC3Pj73SEwSdCf1ua4fMBkVD9Rt5h9+0jcAxpZs=; b=g+HbVJ2QURCI1a
	eZiiV2d0bCUYISWNhFk+lO3L9W4eLgCB+mz3sypotmqFQJgfPzcm/7GHzZMKgKNvW30gefT64K4AF
	i3eC4wKYOklt/l5R27E8wOyDC+muY8hzjxKTD1jkh1c8v5DxtKBcistBqK4Tqw+qE4pQ2FcaEvx3y
	6T6s782Eq1KmramTuUEXr0yhQSPflldBsSYNLiNP6u6DmFvhfKfF0sK+MesNRZHWsD17Vx0KxnwJb
	6SY+xDw9CfSsbOFaD/WPriEmFFYGbKBrvLnvpLseaZ/izpK33KOaIswjZJ5i2poEvyG8eH2xHcp9X
	o6DxQQ93h451I7716J2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZbqG-00Gw3s-69; Wed, 30 Mar 2022 17:10:44 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZbqD-00Gw3Q-1s
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 17:10:42 +0000
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so22711009fac.7
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHeCRC20ST7Kyb/hTyoPyq5l0EvclDmpT7l3wHzPBNg=;
 b=Ft5SQZA6Kio+tm8cnThYUFtc8MJ52ILODJ4xhtr6LhrLeoD8qcgnooIttfebmSE03x
 eSUCiqfsMFae3xjpIvgSc2z5cW0p/zQjwberHUHDKs1Fbb+erU0sdhK/RZ/+5K2f22Qr
 ytDRUyzJM04jF9goPSwicTi5cgK+6U6bAXcIcQeI+G/hheEBAsvkmNgWevbpaQDm9PlX
 DudqdnzTQIz7Z2DSMu9fkUkB+mtqUncHVJjgd/jVQALTxKwKa1jGCl/hQZwwj9YWQqqf
 ris5c/k28zXJvBv1cl/b/WMVZ2hWOhs3ooR/jWpYPoOkyA2lT9nPC+NBm6HeKjS8DQ/k
 X/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHeCRC20ST7Kyb/hTyoPyq5l0EvclDmpT7l3wHzPBNg=;
 b=OyyAagIAE/8DvaIeAw0Fy/xovwrPFazJ42SFxCcH5JlZMOWKBegTGeimtopFxzU+0E
 k/lUJOgx5xoj9MzAlppaER7zInIgIMZn+ZeNivmdjuCBd1Ksh06CWV+dFE4+YqbaPE5f
 EsOrhC3FXqaQNvxc3Mw6oPMA2n8DNH4HGUXwQNn8Qzb3JHU/ztBQJiINc7Jx8MrFG8m1
 v+gZD9LyHYNkVgNgIEOn/fwg/48VeVoRwrylD4evnkv4itvsmnmyl4ROi7B71Sz4y4OH
 nYIlyI2f/pQxkwjV8O52Sl7xBjuieOL7WnlziUngo5Uw60mXkTJ+eXrMahf7carToWwd
 TjIw==
X-Gm-Message-State: AOAM53160pXP26GZtHBXRdjCynV3aMb+dteaEYAusc+YKrqaU6lD0PUJ
 /NVugvuyBSyyT6e4OpFYajSVITyquC3rNELJ3Ds=
X-Google-Smtp-Source: ABdhPJz/qRqJABaRDW6hfj2wuXCY7z9bFyU8DaKwPf8JOfX3D3HtZVvI744Vr0reqiRlPneG+aNgYULtQk44dY5FjYM=
X-Received: by 2002:a05:6870:d0c5:b0:dd:ad86:85ee with SMTP id
 k5-20020a056870d0c500b000ddad8685eemr337415oaa.10.1648660239156; Wed, 30 Mar
 2022 10:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
 <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
In-Reply-To: <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 30 Mar 2022 20:10:28 +0300
Message-ID: <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_101041_121982_807BC92D 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>
> Presumably you mean "revert" here?  That might be the right way to go,
> just to avoid breaking users (even if we fix the kernel bug, it'll take
> a while to get everyone to update).  That said, this smells like the
> sort of thing that's going to crop up at arbitrary times in dynamic
> systems so while a revert looks like it'd work around the boot issue we
> might be making more headaches for folks down the road.
>

The opposite in fact, I did not suggest to revert it, but rather undo
the revert (as Alistair already removed it from the apply-next tree),
since my original patch fixes buggy behaviour that is blocking the
testing of some embedded software on QEMU.

Idan Horowitz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
