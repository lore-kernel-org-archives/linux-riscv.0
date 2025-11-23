Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555CCCFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWAxTazKI4gvDjq4YlD4gxCn7VwXdzfa8GkTil0WPXA=; b=IrE3lcbU5yxti7
	tkMLZW88NMsWCRgzKlYyqzPwYfVIc4/jmik1NdUkaNWGwIu5POV69slyxu6TaBBKuOuXlSK+TGmUf
	8pwAXOV9vuJcUwswPjjhaKlWKZvF66MlTJO8ZDPi32Ix1igGv4PYpZnlbAxV43GSVT6tBVTak1JiE
	7r65Gh91K2cOnQZM/e/LiO9UwfXxsX3JP8uWnPVWnFxbe1wwymF6ZdQx4Z/RHAN8hPkr3mSz2WZBp
	qS/q9Sme59RtdNfkNQdAaUeIGu49W47Hu6n/bJix3Y7RIGtdwbypCIBBaDojXGT+Yu6+FiiGIH/Fl
	eKrgLmDMkuX7SoRUtcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNHQk-0000000AheF-3X1F;
	Sun, 23 Nov 2025 21:15:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNHQj-0000000Ahe2-30Wi;
	Sun, 23 Nov 2025 21:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C829060198;
	Sun, 23 Nov 2025 21:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD64C113D0;
	Sun, 23 Nov 2025 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763932532;
	bh=D+OCR0hsIV5XBu9XitqcJnVl2OG0xT1N8cd+2rxAbx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5OfKYtv/ujJ053wsKTh+hcRA+Ivna+Bt62V0TjLzF2yiIHx7BpzLiRUDINbCJ8Yx
	 WzFACAdHIyvvVpE5gvPtCls6LtSWJSY3vyCek4t3xSyLUfxr2z+32kGj+aUrQZuKne
	 NCJXnlSqTi6KFqidDad5ynXBMp9rn/lXF36IxnSPfTMveQMFvo6d1hiwyjxBQfrDZQ
	 SDf95KbWuILgD2SkzBxC7jvITxbJlbmH95RuJrQgA1zp+xn0SvcBYl+YDIkR2FI2C1
	 6zJYFk7EwaHnDkKKcFGvTiDSgVq1zLvAw5Glu2MTwTYBANcdaZUvkXc+U8NI35BSy9
	 T6oq6SOQ3K1gQ==
Date: Sun, 23 Nov 2025 14:15:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Message-ID: <20251123211527.GB3667167@ax162>
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
 <20251122013551.GA3928114@ax162>
 <7f179e5f-610c-6468-cb3f-17d25d096a8f@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f179e5f-610c-6468-cb3f-17d25d096a8f@loongson.cn>
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

On Sat, Nov 22, 2025 at 07:26:52PM +0800, Tiezhu Yang wrote:
> On 11/22/25 09:35, Nathan Chancellor wrote:
> > On Wed, Nov 19, 2025 at 12:27:08PM +0800, Tiezhu Yang wrote:
> > ...
> > > index 433849ff7529..e72d3254b93f 100755
> > > --- a/scripts/link-vmlinux.sh
> > > +++ b/scripts/link-vmlinux.sh
> > > @@ -61,12 +61,11 @@ vmlinux_link()
> > >   	shift
> > >   	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> > > -		# Use vmlinux.o instead of performing the slow LTO link again.
> > 
> > Why is this comment getting removed?
> 
> When using KBUILD_VMLINUX_LIBS_PRELINK or KBUILD_VMLINUX_LIBS_FINAL,
> drivers/firmware/efi/libstub/lib.a needs to be linked to the final
> vmlinux with vmlinux.o, so I thought the above comment is not proper,
> it I misunderstood it, I will keep the comment as is.

I think this comment is referring to the use of vmlinux.o instead of
vmlinux.a, nothing to do with libs=, so I think the comment should
remain.

> > >   		objs=vmlinux.o
> > > -		libs=
> > > +		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
> > >   	else
> > >   		objs=vmlinux.a
> > > -		libs="${KBUILD_VMLINUX_LIBS}"
> > > +		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
> > >   	fi
> > >   	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> 
> FYI, the previous patch is still under discussion yesterday [1],
> I do not know whether this patch is necessary and what is the next
> step [2].
> 
> [1] https://lore.kernel.org/loongarch/CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com/
> [2] https://lore.kernel.org/loongarch/39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn/

Thanks, we will wait to see the conclusion of those threads before
applying this.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
