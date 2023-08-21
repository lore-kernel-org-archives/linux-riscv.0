Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B015EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QIJoh0Bu24ZR9LZp/lu1ZJDgINkX/uKY4qk0Amlg1U8=; b=tXPxzIX3upzp4d
	shY1lqFleNd1sRRkBi2Zy3wSaODbiW3FKvcYAt65kqyTTJ5Ae74JMZoXsc3BfRddbO/bF4YQKrfdt
	KC9IFAsTylf45YUtJv1J8kkHAVJXnhJAU092zx6NeEoCMx07s6/bRmlW7L7CPtz1Yliro/MdOnsjI
	eykUEFjA8fsPIwRLMC425fO/4iw2ERVmf62eWLCsS6/13Gk09fwpzRctbCOSSO9nbPrVCUCxgRQEe
	Ydy6isYLuUffwKsiXAVYJ8n9D+xr9x9l+/tkIAsu0bPrsORlxxlZA3AO/SW16vBsN5OkKwNEulLxX
	oVFXVaxg52WCnPmF9Y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8mO-00ERs3-2s;
	Mon, 21 Aug 2023 17:33:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8mM-00ERr9-19
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 17:33:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 880F862822;
	Mon, 21 Aug 2023 17:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5A3C433C8;
	Mon, 21 Aug 2023 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639202;
	bh=P7TLnAKhTYRL1J+d4M8hHwwIMX7rOctfYsRcpM82WRA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TKP3p7nEb9cznH5KUgLXIcMmpSvFIxXrbXI+fe0aY4VNOFr1cpwiizfGwUHiws6n9
	 QnRwHu4LcZtSXvydFEA/Mvn2zmrJnu6qSlKNnPKwpjZjW++27QVadO6H6hRdo8YPOx
	 1sBZzZDgDMBHxXfjLSYJzNfgLkqZduEFr1LKBsC3fJ6XXPYVCDlkSh+Y1N4wNEyt8h
	 nRNinShKiZQnAAp3R6Z3Yd0oLGImp3fkqEnJnz/R5rtla2kI+iTq/y30UbmcsROoym
	 ZPJQF4wH1PLk1PBX0joEExllI3vqqXpdskrgHqcc5L4jhGh92D1ELIM+ugvZrdmOtw
	 8cv6bKLGMEBOg==
Date: Mon, 21 Aug 2023 12:33:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Message-ID: <20230821173320.GA362442@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fb7ace8-2f07-17b6-10ce-7116b05b0148@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103326_715186_1160E0EF 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Aug 18, 2023 at 09:48:46AM +0800, suijingfeng wrote:
> On 2023/8/18 06:08, Bjorn Helgaas wrote:
> > > +		if (resource_type(res) != IORESOURCE_MEM)
> > > +			continue;
> > > +
> > > +		if (!res->start || !res->end)
> > > +			continue;
> > > +
> > > +		if (res->start <= fb_start && fb_end <= res->end) {
> > > +			pdev_boot_vga = pdev;
> > > +
> > > +			vgaarb_info(&pdev->dev,
> > > +				    "BAR %d contains firmware FB\n", i);
> > Print the BAR with %pR and include the framebuffer region from
> > screen_info in the same format.
> 
> I do remember that you already told me to do this in V3, sorry for not
> replying to you at V3. Most of the time, what you tell me is right.But here,
> I think I need to explain. Because doing it that way will make the code line
> too long,and it will exceed 80 characters in the column if we print too
> much.
> I believe that the vgaarb_info() at here is already the most compact and
> simplest form. Printing the BAR with %pR is not absolute necessary, because
> we can get the additional information by: $ lspci | grep VGA
> 
> $ dmesg | grep 05:00.0
> $ dmesg | grep 0000:03:00.0
> $ dmesg | grep PCI

Fair enough.  The BAR info is already there.  But I don't think the
screen_info framebuffer data is in the dmesg log anywhere, and I think
that would be useful.

It's fine if dmesg lines or kernel printk lines exceed 80 columns.

> Actually, I only add something that is absolute necessary.
> Printing BAR with %pR and/or Printing the framebuffer region
> is consider to only for *debugging* purpose.

I think printing the framebuffer region is important because it makes
it clear *why* we're selecting the device as the default VGA device.
It's more than just debugging; it helps make the system more
transparent and more understandable.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
