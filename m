Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36086CCF9F8
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1MGaM9DI/BYd2wSIZsrk7c9/aG9v4mcYMuKwVG4zfw=; b=L60RJTMpTW0z6y
	MeMQ3NBiTZS3oj+LR9cQ1nTw8d/f3LyJfjXep83D4iRB110M8GLcxWGDulOR8lCqYFIrpCeQN8pFz
	wXfZnxrzv5O4TnWio7J6TeCatHUkOKepY4EAfavdpshHxp66CSYfHssv8TLUX+F+mVV4MwOj62cTB
	8qIqYbnaeQQzrr/kIx/h8IHwF41zzMGoLfPsi0IwWoMdw4hU2D6YYdjHIDZ+D4AQTfe5T3ary8Ey+
	o32glrQXzqx9WGD34kUuuU/XfYRmojcI9u++Qoa1mf7LjzhZDDPCpus0FJ43kdEjuS+3fd4fn1WtH
	V99KSldqY1erLbbjUKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWmt-00000004Yai-0yBF;
	Thu, 30 Oct 2025 17:50:15 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWmp-00000004YY6-3BGS;
	Thu, 30 Oct 2025 17:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=JSgLBP4N8SNl1gTOFG6TDDGGZeq/ZcICS9giX00KL1s=; b=se09qJUR+afv9LNen0zoku4b/N
	sK1LMhglahuW/MrFGN+kga6O0ok8UDIwm1bX0WRn7t+GXuXg/TLvNS2gr1fKj6qsaGcaIQK/jdbA9
	0QCH0cLX7eh7V1Hzx0M64sme0FCudCaCA+UE5/9Dqyfg/CXO99w4Nac3l70T0xzQTCIPHlWgDC2/n
	rxGbQpS0ePc8qNiReX2L0XfHkEIvYKOQDYDd0dgCSmLHzTijJ8RxKrRIjzGw8GQB6CU4fcwwxkR6q
	k5cgghZuOt3rvmV/Kl+TWKXkX7BzRHnQevSb+mII+Bi4FWnYTmmkIjHzXl1gdK6zAhq0HLUPOwgZw
	EXG45G+A==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vEWmI-00000002ZzI-1jJy;
	Thu, 30 Oct 2025 18:49:38 +0100
Date: Thu, 30 Oct 2025 18:49:37 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Johannes Erdfelt <johannes@erdfelt.com>,
	Alex Elder <elder@riscstar.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Message-ID: <aQOlMcI9jTdd7QNb@aurel32.net>
Mail-Followup-To: Manivannan Sadhasivam <mani@kernel.org>,
	Johannes Erdfelt <johannes@erdfelt.com>,
	Alex Elder <elder@riscstar.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net>
 <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
 <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_105012_239912_FF0E9B9B 
X-CRM114-Status: GOOD (  30.71  )
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

Hi Mani,

On 2025-10-30 22:11, Manivannan Sadhasivam wrote:
> + Aurelien
> 
> On Tue, Oct 28, 2025 at 01:48:32PM -0700, Johannes Erdfelt wrote:
> > On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
> > > On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
> > > > I have been testing this patchset recently as well, but on an Orange Pi
> > > > RV2 board instead (and an extra RV2 specific patch to enable power to
> > > > the M.2 slot).
> > > > 
> > > > I ran into the same symptoms you had ("QID 0 timeout" after about 60
> > > > seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
> > > > seems to work fine with the "pcie_aspm=off" workaround as well.
> > > 
> > > I don't see this problem, and haven't tried to reproduce it yet.
> > > 
> > > Mani told me I needed to add these lines to ensure the "runtime
> > > PM hierarchy of PCIe chain" won't be "broken":
> > > 
> > > 	pm_runtime_set_active()
> > > 	pm_runtime_no_callbacks()
> > > 	devm_pm_runtime_enable()
> > > 
> > > Just out of curiosity, could you try with those lines added
> > > just before these assignments in k1_pcie_probe()?
> > > 
> > > 	k1->pci.dev = dev;
> > > 	k1->pci.ops = &k1_pcie_ops;
> > > 	dw_pcie_cap_set(&k1->pci, REQ_RES);
> > > 
> > > I doubt it will fix what you're seeing, but at the moment I'm
> > > working on something else.
> > 
> > Unfortunately there is no difference with the runtime PM hierarchy
> > additions.
> > 
> 
> These are not supposed to fix the issues you were facing. I discussed with Alex
> offline and figured out that L1 works fine on his BPI-F3 board with a NVMe SSD.
> 
> And I believe, Aurelien is also using that same board, but with different
> SSDs. But what is puzzling me is, L1 is breaking Aurelien's setup with 3 SSDs
> from different vendors. It apparently works fine on Alex's setup. So it somehow
> confirms that Root Port supports and behaves correctly with L1. But at the same
> time, I cannot just say without evidence that L1 is broken on all these SSDs
> that you and Aurelien tested with.

It could be that we have different revision of the BPI-F3 board, it's 
not impossible that I got an early-ish version. That said I just 
visually checked the PCB against the schematics, and the devices on the 
CLKREQN line appear to be installed.

If someone has contacts to check what changes have been done between the 
different board revision, that could help. Or same if there are 
different revisions of the SpacemiT K1 chip.

> So until that is figured out, I've asked Alex to disable L1 CAP in the
> controller driver. So in the next version of this series, your SSDs should work
> out of the box.

Thanks, that sounds good.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
