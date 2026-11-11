Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B25606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 01:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSP/0LEF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1uP6iM3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YAxD1rIMZt9XPCMPm/fb+K58D6jZRvlaqUMhDNMkpgU=; b=XSP/0LEF2y8WFSFRS4qpIf7AcR
	Kqlia6g/d6WTQz7lZVgaXfEcSdK1AWs201akuMV5meWcoy0zFaI3Bol0ftaP0FqErJr3SKTGzMJKC
	XdSC7XRY5W1sG+5ka6Mm4V8TfSrswAmG4MmF3orkZtDgzvsdJHttkOgSSlS7kz4PuelTNFnLRB+Wp
	zEku8hXrA2qAGt15b+fgQrCSF9xRJ5fOPUun1WtAm61ynotTtbTvonG9KdzvJXyjvZu8/qkYzW7Bk
	QHWBCY+cGP+6cberaeTyweBVNpf/hyXOhZsNcHdG7Erct0rmZwbM45jcNb0RDe6IQWoOaFI2ITARf
	mutaXiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwuR-00000005MHE-2XDT;
	Wed, 11 Nov 2026 01:13:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwuQ-00000005MH1-3SWw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 01:13:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AA1A439B9;
	Wed, 11 Nov 2026 01:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7BA1F00A03;
	Wed, 11 Nov 2026 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794359634;
	bh=9G86ezc2tSarZK3XMTxJLmspGwjOjjloDjMYM9KNl8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=C1uP6iM3wNW/8HkHF73adJ5pY8Qf100Rl2QwfEVP0kP4J58/G4KzfVwmq7ufMDJAh
	 dCE0/vnQEZxGTaB2dJMabiHtgFyaoor0b/cPxlyk12ufdVXV9aL4eRNxcbKx42qHXx
	 0Xw32rt0+4HheVZfLc/HiCs4wVWdmr5x8Hi3EyfPe1d3MnMbGMc1eRRBDucaCK9Kqx
	 jUF7tX8dyDZIFcRB0chIi8dN+EtYnXcwmePw9urCZzDpXszpC9LYELksaq2ndnk+To
	 7AVEmJjNXRHxGmuCUxaARUfuw8OTp3p/UZntF4k+HDZdhdib2og9omvuP3jXMTo46y
	 FtrR0aJkzk4nA==
Date: Tue, 10 Nov 2026 18:13:52 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
    spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable onboard USB hub support
In-Reply-To: <20261109175555.323067-1-frederic.mahe@cirad.fr>
Message-ID: <857db758-8aeb-178f-6acc-b163ba636863@kernel.org>
References: <20261109175555.323067-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-949019252-1794359615=:1436767"
Content-ID: <73288eb2-efa1-fa72-c824-2d612fa1e6ad@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-949019252-1794359615=:1436767
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <583f3743-56c6-ad22-7710-dcda79404eec@kernel.org>

On Mon, 9 Nov 2026, Frédéric Mahé wrote:

> The Banana Pi BPI-F3 (SpacemiT K1) has a VL817 USB 3.0 hub behind its
> DWC3 controller. The hub's power and reset come from the
> "usb2109,2817" and "usb2109,817" nodes in the device tree, which need
> the onboard_usb_dev driver. Without it, the hub regulator (USB30_HUB)
> stays off and the board's four USB-A ports are dead.
> 
> Enable USB_ONBOARD_DEV as a module, as arm64 defconfig does.
> 
> Tested on a Banana Pi BPI-F3 with v7.4-rc1 (dwc3 enabled as a module):
> the module autoloads, the hub comes up on both buses and a USB mouse
> on a USB-A port works. Without it, only the root hubs are seen.
> 
> This patch was prepared with the help of an AI assistant (Claude),
> which also ran the build and boot tests.
> 
> Signed-off-by: Frédéric Mahé <frederic.mahe@cirad.fr>

Thanks, queued for v7.4-rc.


- Paul
--8323329-949019252-1794359615=:1436767
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-949019252-1794359615=:1436767--

