Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F03FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0199U1K1fovbBiyusxwy9v/NJsmsVJnO1I3hMnev1o=; b=MyEggu4qhelZWm
	YLbtqh1g0m1EnA6M8CwgWjRyMkvI4RLgz1RvR6z3VpCDYxPKoo6TqKz7qthDgOM8dvhe0/i5LEgWI
	j37kUlhNbMXxytz0TZWrxAN7ZrQ/lIGyyGXblXHoBbuYsWCXmgZQtCb+joFpEM6sLTW7a+xlM3MHf
	X0pO9OXhSRabPB2JO0g5NVzcxhJ3jP/8RFhX9LHE/PVj88Q2oE8+PI9VZs2rExP/Bl+l1a9oZiOR4
	l9anaUpLozoU+VsIQUl3CYBz9RmX5z09xpSTl8n3sJnabi2SioRdex0if2JkHmw5xDm6Fm+e5gBN1
	U/1dFniYJE5uZcEGACkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKmk7-00Bvpm-AW; Thu, 17 Feb 2022 19:47:07 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKmk4-00Bvp3-QI
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 19:47:06 +0000
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2d646fffcc2so43924687b3.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 11:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaFgdGApNlDvtZyiIfo82SRxAus8TF8HrqjXlvq9h8Y=;
 b=SuxQdh+t5+fvwh5ODRCj4O0o5dFuhnXt8wycvDS/oc9U/RxDeBZ3bX5ZeesGn6+oJY
 CgPo+r2zBBVKinwJc2jONuwupZkCPpbAswzez7svHTfufRM0UpnHc0JQysuQUpfg39SP
 AhXLqSKJ8RK3c/iQgxWFs5sMqgai7dSUoqMso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaFgdGApNlDvtZyiIfo82SRxAus8TF8HrqjXlvq9h8Y=;
 b=lZ1sPtdU7A1LquvSdrqxIG7CeqWJFmJ7QXV2JmwK+SUV7W/mogpd0rGZWCrjUzgaLL
 MNPj7KsDyawt2HHIfyuMXYm8IHEsAPFnzpIqFkTZuH0cqIaw4UnF7oOOGnOUnMc5HTTO
 tS4eGw0wuw0hGm96ELjzq0wJpHIMFolw4Ff4Ro6puu7YLPAGNG5nPaTCHQdn8EHByqPY
 C88kpMzzTWbLssQRFJ6M/D9iBx3uiialOq2SAqZAZz6dvq8wPQoG3ZPd4kkyWTk8rZCs
 BWxCJd5br5qIVjdcGXJGuRSE6jyUVNLw0Z4Zrne4LIVqCIm9E7bnvgo0tmu5C6QiUn1e
 oVLw==
X-Gm-Message-State: AOAM531lbeTE921g4WrJFQkFKE1VtMPXhFNr2lqkKF88ujz+6jnjcNRR
 oyUCpVG4Lo/DPwk24fyw/vs+3cIYb47BRftWLpDN
X-Google-Smtp-Source: ABdhPJyYFJ0q/2SlA60syxammhFOBpSQhcIB9lrLmw/nIlWery9i8zrN9e9Vgg9W2i5AsrahmkX7VAebgSiqcHvfTL4=
X-Received: by 2002:a81:924a:0:b0:2d6:b588:bd0e with SMTP id
 j71-20020a81924a000000b002d6b588bd0emr2097858ywg.402.1645127222718; Thu, 17
 Feb 2022 11:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home> <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
 <87tud1vjn4.fsf@igel.home> <49d3aeab-1fe6-8d17-bc83-78f3555109c7@gmx.de>
 <87pmnpvh66.fsf@igel.home> <20220217105450.GA20183@sunil-ThinkPad-T490>
In-Reply-To: <20220217105450.GA20183@sunil-ThinkPad-T490>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Feb 2022 11:46:52 -0800
Message-ID: <CAOnJCULWjCHCCS7wzTBVsYcPzWPpL9jmS7xx5LUFT2tRvAZk6w@mail.gmail.com>
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-efi <linux-efi@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <apatel@ventanamicro.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_114704_919334_1F87FCC3 
X-CRM114-Status: GOOD (  20.90  )
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

On Thu, Feb 17, 2022 at 2:55 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Mon, Feb 14, 2022 at 12:09:05PM +0100, Andreas Schwab wrote:
> > On Feb 14 2022, Heinrich Schuchardt wrote:
> >
> > > On 2/14/22 11:15, Andreas Schwab wrote:
> > >> On Feb 14 2022, Heinrich Schuchardt wrote:
> > >>
> > >>> set_boot_hartid() implies that the caller can change the boot hart ID.
> > >>> As this is not a case this name obviously would be a misnomer.
> > >>
> > >> initialize_boot_hartid would fit better.
> > >>
> > >
> > > Another misnomer.
> >
> > But the best fit so far.
>
> Can we use the name init_boot_hartid_from_fdt()? While I understand
> Heinrich's point, I think since we have "_from_fdt", this may be fine.
>

init_boot_hartid_from_fdt or parse_boot_hartid_from_fdt

are definitely much better than the current one.

> I didn't rename the function since it was not recommended to do multiple
> things in a "Fix" patch. If we can consider this as not very serious
> issue which needs a "Fix" patch, then I can combine this patch with the
> RISCV_EFI_BOOT_PROTOCOL patch series.
>

IMHO, it is okay to include this in the RISCV_EFI_BOOT_PROTOCOL series
as we are not going to have hartid U32_MAX in a few months :)


> Hi Ard, let me know your suggestion on how to proceed with this.
>
> Thanks
> Sunil
> >
> > --
> > Andreas Schwab, schwab@linux-m68k.org
> > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> > "And now for something completely different."



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
