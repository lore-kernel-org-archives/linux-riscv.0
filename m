Return-Path: <SRS0=9/xT=LY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B097FC11F69
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EDCB61D03
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EDCB61D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSWdl16GYx/FWZ45RWLcRaVvAHL2u3oOmPlV46xD6WA=; b=q5ZkkxhboCyqee
	zPXpIFVON9wwtV6w0cBqm2T+FHVJRiWWug/ieVW07M8XrsTdU4fD0G4tk1u/B6u4t9SJNG/KngaBW
	E33oe9dN5+ms0lb5+gUyZR6zBNbtVWB3SBFWFKZG5+Ya8/p+oN4jkIQW6x45ABlNNTXqvanLX4VXS
	+hFDocW0u8iL0kP2/TT9fFDKy+s2L7cxRmZyONmmgrtjrspuey0lDG10F+05NwOSNrrQw6aqooq56
	e/9kVSVVaNCmD+ve+nO7lq1sUll7MI6IU3Fif2DlPGWLEwNYFjKyjTY9v81gzcm/FC64Rs7zNa3uv
	NG9Y4NPkpWbZjswA3OgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUg1-00D3jc-5a; Wed, 30 Jun 2021 07:30:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUfy-00D3hv-Jx
 for linux-riscv@lists.infradead.org; Wed, 30 Jun 2021 07:30:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E113561CD0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625038225;
 bh=LgLwRlM2vgAjiWG1CvKhmKGXiZHELEvEd1+PAclEGZM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cbubElthuvDlQB1LHWO6FW8GGsopz4SX7tKIdQK0TxDO74KeBFtcx0/DPVOwyYQDN
 6qb8Mtw7D4qae4jShR9NApX3uTZoOyileMkHMDufA3sHz4RGhjJ+166IMMsRbDsvcn
 3pQydfyZiKTr/Uzg+22NwSIz9uVBxlJuiA1XJYcE9JOE8IOY1BPgoAs3EmS/SbGJyu
 rS/UpDJjN9vsTtspBOy37QpJ+j8W8XsuHa1dca/JWKB9TUIie2tB++xh+VebD6ncoZ
 wHWGUGbqvHFJE3vQQrLZw72st6Bo3oqY45O4hCr5tgZ4ii6ZOBc1IWF0uIvtEAVRqn
 qy64a4TG0mRjA==
Received: by mail-oi1-f170.google.com with SMTP id k206so2041370oif.2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 00:30:25 -0700 (PDT)
X-Gm-Message-State: AOAM531+IFKS0/tXjVa5oKg5/vGykMQrgqg5J55LWheX2STk9bGRC5Bk
 vX2HFwVt77WPBhYWIRMAQ6JwKw63dsJEaGzmj9Y=
X-Google-Smtp-Source: ABdhPJz4vMMdAJ6JJGe6ILpvyoclvoJOW/dpZm8I2fUqYOw2PoCl+WKEED/i5LKogGBU687vnmdSi3bTOuRd7B2gAf8=
X-Received: by 2002:aca:5a04:: with SMTP id o4mr24661915oib.33.1625038225214; 
 Wed, 30 Jun 2021 00:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
 <CAOnJCUKuHGUZi-13PpnZGHKkXxhj3asVJgaNMTv3=830eVwi=g@mail.gmail.com>
In-Reply-To: <CAOnJCUKuHGUZi-13PpnZGHKkXxhj3asVJgaNMTv3=830eVwi=g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Jun 2021 09:30:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG-O5PLnEWGWXzYf2r471ng7j-jZ2ziTwLdSgdVFdJNaA@mail.gmail.com>
Message-ID: <CAMj1kXG-O5PLnEWGWXzYf2r471ng7j-jZ2ziTwLdSgdVFdJNaA@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
To: Atish Patra <atishp@atishpatra.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andreas Schwab <schwab@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 linux-efi <linux-efi@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003026_726929_E0B881BA 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, 30 Jun 2021 at 00:56, Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Jun 29, 2021 at 6:40 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> > to boot SUSE Linux with GRUB on QEMU, cf.
> > https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
> >
> > Remove the constraint.
> >
> > Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > ---
> >  arch/riscv/include/asm/efi.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> > index 7542282f1141..649ab513dc99 100644
> > --- a/arch/riscv/include/asm/efi.h
> > +++ b/arch/riscv/include/asm/efi.h
> > @@ -33,10 +33,10 @@ static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
> >
> >  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
> >
> > -/* Load initrd at enough distance from DRAM start */
> > +/* Load initrd anywhere in system RAM */
> >  static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
> >  {
> > -       return image_addr + SZ_256M;
> > +       return ULONG_MAX;
> >  }
> >
> >  #define alloc_screen_info(x...)                (&screen_info)
> > --
> > 2.30.2
> >
>
> LGTM
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

Please take this via the RISC-V tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
