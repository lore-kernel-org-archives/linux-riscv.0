Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124DFCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 20:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7xjNs6gFLB9HUxSf0NpbfDVVLmpAir30g5cNrsDys0=; b=ChahoCzCD6QvuA
	WyVUtWI2De8O8dSpYsjwlcgqpmWvf0DpDHb8G8gbu1nhixkt5QvuxA4fBv1wpIk0r7vbYwNv9UDzS
	5HdnJzud3vRcfpdzbS2IcZNg46rMrP+cLcIuuw0PEALBN8rIP9/HEkXzRulBFfolrsTo0Xd0IgQ0i
	poKCot4E2BHzyUYrdyQVY548VBQISb9LOQ18IIkLqIEw/hjz9FWG4IZwmETkwUBskH8No/K9pvg0b
	XSjL5hPBPSEcXxeV2L0K7iOcQDohWrsB7FvhPopYh6xgMDlsa8t1LFk8lMdII8FJnIa28WHDZdFmY
	lrrRqYbP5Tvqoa/TGN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqcQ-0000000GdZb-1GDm;
	Tue, 28 Oct 2025 20:48:38 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqcN-0000000GdYx-3DWe;
	Tue, 28 Oct 2025 20:48:37 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id D706C8A0A03;
	Tue, 28 Oct 2025 13:48:32 -0700 (PDT)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id C0146160036F; Tue, 28 Oct 2025 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1761684512;
	bh=RNFyMoBWxOdlyG9IRh7LHDULuVP6HOHggT33RZ17tAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSFtPcc0BiEXbpb/zBzfoQcm4MgaSuhTYzck8MnN8tUCJrAuoXL2oxWiocPS5Y1hs
	 9resct6vmHBc4qujrDvZNwTjpr6wUxHZ9rT+3SFV9zhobx7B8zRG+2upkCexlAdgAE
	 5nd2gNmxIuKQyKhgQMR02+l8IRdi3C6uskXea2Ds=
Date: Tue, 28 Oct 2025 13:48:32 -0700
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, vkoul@kernel.org, kishon@kernel.org,
	dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Message-ID: <20251028204832.GN15521@sventech.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net>
 <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_134835_922146_A4682E7C 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
> On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
> > I have been testing this patchset recently as well, but on an Orange Pi
> > RV2 board instead (and an extra RV2 specific patch to enable power to
> > the M.2 slot).
> > 
> > I ran into the same symptoms you had ("QID 0 timeout" after about 60
> > seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
> > seems to work fine with the "pcie_aspm=off" workaround as well.
> 
> I don't see this problem, and haven't tried to reproduce it yet.
> 
> Mani told me I needed to add these lines to ensure the "runtime
> PM hierarchy of PCIe chain" won't be "broken":
> 
> 	pm_runtime_set_active()
> 	pm_runtime_no_callbacks()
> 	devm_pm_runtime_enable()
> 
> Just out of curiosity, could you try with those lines added
> just before these assignments in k1_pcie_probe()?
> 
> 	k1->pci.dev = dev;
> 	k1->pci.ops = &k1_pcie_ops;
> 	dw_pcie_cap_set(&k1->pci, REQ_RES);
> 
> I doubt it will fix what you're seeing, but at the moment I'm
> working on something else.

Unfortunately there is no difference with the runtime PM hierarchy
additions.

JE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
