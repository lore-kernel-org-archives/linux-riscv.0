Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA8FEFB6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nMrVmu9/+ooHPmq59GgtKkXjgWJRpNVrIgv+69Z8ECc=; b=CVNItMT4K5G0kf
	K/CgOqcqb0q+HB6RXKik7JDVM4sDBs3mTNz8xeOCFYachpxe+HfeC303ZHH3i0QCdSZSzKK5UFCNy
	6/glKo4f790jhWbJ2JZD3nYQmiIesLmMgDE8rEThOrYVyWPMsTsa8igbgfIp7CgGB1w2oPb+Igd3g
	2jAsVbGk6fLKTRWGNritgu1P79t6ieUPAtLctXCB3UjhF3M4kr/JyEQVidpwcaJyAykefWENu6tgR
	nc+SZkH6zXwQlpqu9zQUSF3zz1tDKEhM79vt4P9Q8wVKGYWA7ZwjL024zD02dtjBqI5/UNjX9jLRO
	eEv7q9/R1WvrJWmWsRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw11o-00000008ktA-0Aea;
	Fri, 27 Feb 2026 16:49:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw11l-00000008ksq-44bc
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 16:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 269B9444D5;
	Fri, 27 Feb 2026 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3011C116C6;
	Fri, 27 Feb 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210961;
	bh=jznU9LDSkQYILvcSIV46IxA3CrI9OTrcodpcP2KE/Rk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BMGK66IlpUYHanCwORkjV1r5gD4tZdmf3FdgQyvpYqd87OnPE/XYM3XTkW4Ksw/Y2
	 Y3jxv1rvP5tPMlEvJt5tjaSTDHFbZ6E0cmQiJ4sJ1nQ4Fa0ouKncl5VoVtiCuVxIzZ
	 wWKIJt52O1sSUx08jbmlf8//snPIjiC+zltv0lkdOUs2BhGHuFA3bE4uAUcyVVBSxy
	 qaQx337ysm56rZiMRyNkrrziyLzOmk1FheLkVIlnP9JOrOh9Vg2yq723loCPFce4ld
	 PQ+fWhfMBe0FBUqcD3yCDZF4bHUCb4tFZLXFqqmmZy1DAO7HVlmZIQO39PRRlHaFGU
	 +2b9qvGprKjDg==
Date: Fri, 27 Feb 2026 10:49:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Brett Creeley <brett.creeley@amd.com>, Han Gao <gaohan@iscas.ac.cn>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
Message-ID: <20260227164919.GA3897300@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9329ae2-721d-4127-9380-b1ea454bd8f2@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_084922_048088_F84CD8A6 
X-CRM114-Status: GOOD (  16.86  )
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

On Fri, Feb 27, 2026 at 01:25:03PM +0800, Vivian Wang wrote:
> On 2/27/26 02:25, Mark Bloch wrote:
> > On 29/01/2026 3:56, Vivian Wang wrote:
> >> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> >> implement less than 64 address bits. This breaks on platforms where such
> >> a device is assigned an MSI address higher than what's reachable.
> >>
> >> Currently, the no_64bit_msi bit is set for these devices, meaning that
> >> only 32-bit MSI addresses are allowed for them. However, on some
> >> platforms the MSI doorbell address is above the 32-bit limit but within
> >> the addressable range of the device.
> >>
> >> As a first step to enabling MSI on those combinations of devices and
> >> platforms, conservatively generalize the single-bit flag no_64bit_msi
> >> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> >> with msi_mask.)
> >>
> >> The translation is essentially:
> >>
> >> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> >> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> >> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
> >>
> > Hey Vivian,
> >
> > We are seeing issues while reloading mlx5 on a PPC64 platform.
> 
> Mea culpa. There's a fix on the list [1] since last Friday. I'm not sure
> why it hasn't moved yet, but please take a look.
> 
> [1]: https://lore.kernel.org/all/20260220070239.1693303-1-nilay@linux.ibm.com/

We needed testing on powerpc and sparc, which has now been done,
thanks to Han Gao (SPARC Enterprise T5220), Nathaniel Roach (SPARC
T5-2), and Venkat Rao Bagalkote (IBM Power System LPAR (pseries)).

It would be ideal to have acks from the powerpc and sparc maintainers,
so I just solicited those.

Thomas merged 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi
flag to a DMA address mask"), and could merge the fixes.  Otherwise I
can merge via PCI.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
