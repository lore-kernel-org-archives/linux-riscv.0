Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0CE7490D
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 04:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZW3/KhuVzZ3df43GLSWWRqBYB4xfSWZtmNDtWcgC13A=; b=tC48MgslvFJz5B
	y4beUqaEqJw2f6CEPbftSuojd4VfPZSqPZyzbEfgMJyOl7LtHpB+M3RkTj/DG+pSN2BZNpe03zM1w
	xjPPgVJUs7Vr84lDVzPMjUsO7/cANxeCghJjyFXxxUHwN42dWJTSDfL9OOGtBWUcOKUzug8DkIHXt
	B/q25MveuEE2fLsGu2mCIX6Dbk2NjFp2gG3f6jWpxFW2lGV4GTFI40ALmrkFhtIBHT8aYSIINND+7
	RgWLICl/YmUjkcwP0HICypL1i84dm0BqrpakT2kDCGipHeazw78tNg8WqVHkLk4HhFxPNYaCmNPCO
	a8UIqfpsaeFlGq3a3GOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYGr4-0000000GPBj-2CSE;
	Wed, 24 Dec 2025 04:52:10 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYGqz-0000000GPAx-1kFG
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 04:52:08 +0000
Received: from [192.168.0.109] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHWAxmcUtp2LW8AQ--.30082S2;
	Wed, 24 Dec 2025 12:51:51 +0800 (CST)
Message-ID: <2eb2ad42-67e7-4f5b-bade-4a3627eb270c@iscas.ac.cn>
Date: Wed, 24 Dec 2025 12:51:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
X-CM-TRANSID: zQCowADHWAxmcUtp2LW8AQ--.30082S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1rGFyUZF4fuFW7AFW8Zwb_yoW8Jw4rpF
	4UGFW3uFWFy3yftFWay3Wj9F15Z3Z3K343W3y3Kwn3ZFnIqr17XrnrGF13JwnFqrWxJr40
	qFy7Gwn0gFnxWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUn1v3UUUUUU==
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_205205_824256_0F191EE3 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On 12/24/25 11:10, Vivian Wang wrote:
> The Sophgo SG2042 is a cursed machine in more ways than one.
>
[...]

> ---
> Vivian Wang (5):
>       PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
>       PCI/MSI: Check msi_addr_mask in msi_verify_entries()
>       drm/radeon: Raise msi_addr_mask to 40 bits for pre-Bonaire
>       ALSA: hda/intel: Raise msi_addr_mask to dma_bits
>       [RFC net-next] net: ionic: Set msi_addr_mask to IONIC_ADDR_LEN-bit everywhere
>
>  arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
>  arch/powerpc/platforms/pseries/msi.c                |  4 ++--
>  drivers/gpu/drm/radeon/radeon_irq_kms.c             |  4 ++--
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  4 +---
>  drivers/pci/msi/msi.c                               | 11 +++++++----
>  drivers/pci/msi/pcidev_msi.c                        |  2 +-
>  drivers/pci/probe.c                                 |  7 +++++++
>  include/linux/pci.h                                 |  8 +++++++-
>  sound/hda/controllers/intel.c                       | 10 +++++-----
>  9 files changed, 33 insertions(+), 19 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251223-pci-msi-addr-mask-2d765a7eb390
>
> Best regards,

+cc linux-riscv and sophgo lists. Please see:

    https://lore.kernel.org/r/20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn/

This is what happens when I rely on get_maintainers.pl too much...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
