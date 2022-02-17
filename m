Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC77C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22BN0aIzTweY1yYlShnAfMMUP+REwIjrErTNt7Go5E8=; b=nTqg/eUZ116/ss
	GRvq+TIZPaAuWyozbUNLkmldWRonCckSpRhCVnn8K5OUyR8TxoS0W9S0IAfAXC/qRuCuJkuoyIPwV
	TNr9SrXlczEAfsBB4/JSQlhFwBYlEaEiOQe8PDVTXmZlEnu5XutFzVW2fRBj64CnJhIBdzzTij7g9
	HQ6XJe5wX9VgUVvzzwLuJpaz/Bjo3tzyglUwa+XoaK69/VZwtlg8eh0DcWoUa80rWpcgm4+J2BQNd
	N/Ey9Fo21UPBAIwcI5bNQWa/9lkmzK8FEMRhv60GO0K/8l2gWNPOK3/4megSBlLiTXjr0Swu66juc
	Bv/XKbnW3xsd1RmHZfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKmpg-00BxWV-7F; Thu, 17 Feb 2022 19:52:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKmpb-00BxUa-F8
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 19:52:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CF0EB82439
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 19:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340D9C340ED
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645127564;
 bh=ZhQxF0tPXMlYqWyHKU+1EFwIzt/X85cBfMSyiNtLNwc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N3q7ZHzEir/9IK/PGW+3dMKawSKM3KHTVB0REMnWpIEazeg1BTxuWepTpRprIRKPI
 XmGpqTE40xrLD8tJkBKCJxDJFOHcr6iYvTnjlBsBBXMj3UbckzYkxN/7wU5Ygx5mrk
 ETE3YbdvQqT8R06yoKVRu6kMzrbvehESqHsLVNuR42qsb7LAj9NnFT2oA+kvsCETGt
 ox0NZV2AZw2DzmW07UuMa2RituDxee7maP037UT/LVLYS5cSaVkI4fklqI2IhpP5+V
 klEOQqAFRD7lzuSKdAr9w41EjgBa5tjoYjjyu/4ZNQJCNIfaK81rkYX9NflqCMGKSz
 ykTJRqwak3lzA==
Received: by mail-wm1-f43.google.com with SMTP id i19so3855022wmq.5
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 11:52:44 -0800 (PST)
X-Gm-Message-State: AOAM533gpstbHDjU2z4dg9/fq1ndmzhukBpr+4lXnHTFhUl6fwWDmp1E
 xRT0IYDPV8GiAyTM8Dm/TJGKdWu1rsRKnChtNZU=
X-Google-Smtp-Source: ABdhPJwiemEIjRKk4frN6QbDwgyUBnVeU/8bBRkvxFxBQULsWx/seWlsMA1hduXoxyV0dNHVRWvY1oHknvGbya8Zxyg=
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr4183906wmb.32.1645127562557; Thu, 17
 Feb 2022 11:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home> <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
 <87tud1vjn4.fsf@igel.home> <49d3aeab-1fe6-8d17-bc83-78f3555109c7@gmx.de>
 <87pmnpvh66.fsf@igel.home> <20220217105450.GA20183@sunil-ThinkPad-T490>
 <CAOnJCULWjCHCCS7wzTBVsYcPzWPpL9jmS7xx5LUFT2tRvAZk6w@mail.gmail.com>
In-Reply-To: <CAOnJCULWjCHCCS7wzTBVsYcPzWPpL9jmS7xx5LUFT2tRvAZk6w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Feb 2022 20:52:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFXu75cDo=rx4rG6WFwd=At+nMWRzq378EoLu7GuHU64w@mail.gmail.com>
Message-ID: <CAMj1kXFXu75cDo=rx4rG6WFwd=At+nMWRzq378EoLu7GuHU64w@mail.gmail.com>
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
To: Atish Patra <atishp@atishpatra.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Andreas Schwab <schwab@linux-m68k.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-efi <linux-efi@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <apatel@ventanamicro.com>, "# 3.4.x" <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_115247_844036_FB4386BE 
X-CRM114-Status: GOOD (  27.82  )
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

On Thu, 17 Feb 2022 at 20:47, Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Feb 17, 2022 at 2:55 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 12:09:05PM +0100, Andreas Schwab wrote:
> > > On Feb 14 2022, Heinrich Schuchardt wrote:
> > >
> > > > On 2/14/22 11:15, Andreas Schwab wrote:
> > > >> On Feb 14 2022, Heinrich Schuchardt wrote:
> > > >>
> > > >>> set_boot_hartid() implies that the caller can change the boot hart ID.
> > > >>> As this is not a case this name obviously would be a misnomer.
> > > >>
> > > >> initialize_boot_hartid would fit better.
> > > >>
> > > >
> > > > Another misnomer.
> > >
> > > But the best fit so far.
> >
> > Can we use the name init_boot_hartid_from_fdt()? While I understand
> > Heinrich's point, I think since we have "_from_fdt", this may be fine.
> >
>
> init_boot_hartid_from_fdt or parse_boot_hartid_from_fdt
>
> are definitely much better than the current one.
>
> > I didn't rename the function since it was not recommended to do multiple
> > things in a "Fix" patch. If we can consider this as not very serious
> > issue which needs a "Fix" patch, then I can combine this patch with the
> > RISCV_EFI_BOOT_PROTOCOL patch series.
> >
>
> IMHO, it is okay to include this in the RISCV_EFI_BOOT_PROTOCOL series
> as we are not going to have hartid U32_MAX in a few months :)
>
>
> > Hi Ard, let me know your suggestion on how to proceed with this.
> >

The patch is fine as it is. I agree that naming is important, but for
a helper function that is only used a single time right in the same
source file, it doesn't matter that much.

I have queued this up now.

Thanks,
Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
