Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E996DEE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nwrXzcRvG0Z7i1hpX9tSXvOD/RLmCBnlHCiPwRnzet8=; b=Q0/3QlwvIJ5qrO
	GlHKF4UPdy8k38P57r34mr36m642p7+iw7b+zgPE+Q3OwzDM7ndwR2M9nmSATYAS3nT4QhOZcXP20
	pKTq2NmMFL8Ymw9miimpchKIWUxAA8qI9YWT+6miR4sWzGMmA3E3srOm+8w1lfL8TvWMv7DpgpJxV
	NonvnV33Q5WXfPXCnqEnHke1znycXnHnS40/JxkuQ3/wkXH0bAP9wjZv4ykNNNx4YYwqDl3fP+oTV
	Pt9hMUF/rgOfyjYbAfGAwU4i8geg6szIhYlvVqYE5sR/ZdL8ZNQQPA3q4X9g8Y0mwMnQaWDzq6Im2
	i+cepdL1HS1NqXiVmQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8rC-00ESZv-0t;
	Mon, 21 Aug 2023 17:38:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8r9-00ESYw-2L
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 17:38:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8866E640EC;
	Mon, 21 Aug 2023 17:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7921C433C7;
	Mon, 21 Aug 2023 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639502;
	bh=fbEtKOok6iuPCXKRBpZwCrq9lsiy0DSR8lgdSafnjw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=C0lQglTspaHZ1oa/VUKgzTZF9Rfw+B2BowWpN1tE8W4NcQ9g0X1DoRYL07/kqjQqt
	 apGo/K9YgDqSSjwx8ZQk00fWD3gunjaMVgQIX57EUeKUELJTkCYdW6CTUj3/dR7z0U
	 PzZXHe5jDxGtSI4nW8RJpUgQBAihMKmlrT9hShf0LzYzvZaQWbonij2HTlV9Ibp1q3
	 9X+LUlK0DAK8P4JwjSX23F7VeKBhIm+hkPu/gZeDEgRaTakjjpEIvijzoV13bCUYMe
	 FSkqToxreoGiH1ANMeDikD/oZwV4o5yq7RuzpZb5Lu4GFiO+EvZOYdO5ti+U1qWNos
	 co5pZrhxzHDsw==
Date: Mon, 21 Aug 2023 12:38:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Emil Velikov <emil.velikov@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Message-ID: <20230821173819.GA362570@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31ceb1b8-52e8-f57b-0e76-ea768242e26e@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103824_123775_5D93FD62 
X-CRM114-Status: GOOD (  33.05  )
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

On Fri, Aug 18, 2023 at 12:09:29PM +0800, suijingfeng wrote:
> On 2023/8/18 06:08, Bjorn Helgaas wrote:
> > On Wed, Aug 16, 2023 at 06:05:27AM +0800, Sui Jingfeng wrote:
> > > Currently, the vga_is_firmware_default() function only works on x86 and
> > > ia64, it is a no-op on ARM, ARM64, PPC, RISC-V, etc. This patch completes
> > > the implementation for the rest of the architectures. The added code tries
> > > to identify the PCI(e) VGA device that owns the firmware framebuffer
> > > before PCI resource reallocation happens.
> >
> > As far as I can tell, this is basically identical to the existing
> > vga_is_firmware_default(), except that this patch funs that code as a
> > header fixup, so it happens before any PCI BAR reallocations happen.
> 
> Yes, what you said is right in overall.
> But I think I should mention a few tiny points that make a difference.
> 
> 1) My version is *less arch-dependent*

Of course.  If we make the patch simple and the commit log simple by
removing extraneous details, this will all be obvious.

> 2) My version focus on the address in ranges, weaken the size parameter.
> 
> Which make the code easy to read and follow the canonical convention to
> express the address range. while the vga_is_firmware_default() is not.

Whether it's start/size or start/end is a trivial question.  We don't
need to waste time on it now.

> 3) A tiny change make a big difference.
> 
> The original vga_is_firmware_default() only works with the assumption
> that the PCI resource reallocation won't happens. While I see no clue
> that why this is true even on X86 and IA64. The original patch[1] not
> mention this assumption explicitly.
> [1] 86fd887b7fe3 ('vgaarb: Don't default exclusively to first video device with mem+io')
> 
> > That sounds like a good idea, because this is all based on the
> > framebuffer in screen_info, and screen_info was initialized before PCI
> > enumeration, and it certainly doesn't account for any BAR changes done
> > by the PCI core.
> 
> Yes.
> 
> > So why would we keep vga_is_firmware_default() at all?  If the header
> > fixup has already identified the firmware framebuffer, it seems
> > pointless to look again later.
> 
> It need another patch to do the cleanup work, while my patch just
> add code to solve the real problem.  It focus on provide a solution
> for the architectures which have a decent way set up the
> screen_info.  Other things except that is secondary.

I don't want both mechanisms when only one of them is useful.  PCI BAR
reassignment is completely fine, and keeping the assumption in
vga_is_firmware_default() that we can compare reassigned BAR values to
the pre-reassignment screen_info range is a trap that we should
remove.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
