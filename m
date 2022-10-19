Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF1DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eJigTgECdobEJHCIE0wiX9Mfrs6i+NSYF6T/Hozv3k=; b=i8e2xYjSOEoNJv
	Cd/rGZi/yGbD681mcGhNGt8Wt9Y5HUOXJwcyJXhPMpN/mlJSAYAviQ4uaDtSH7af76o6QPpfO6bKb
	Wr0/ugt2s8VYRUZqU0VOc2zcOTeqKGHtkgKWJoT93Tbj5RRibPcJYDjA8gq94Ee+3GDn+uxhc/72c
	tO8lXj9Ye3IvVflS7F4nRgRNfylLsMgiG0022yn3Hs2B0AvxUFkzvsC+infNCh4fQI4+ERLa2PNXk
	m9SBtpOdV7TsOOIRbkZeCQ81erGREcPV4c27bgLJlVMqOSSRz2nVotxhItDnLe/ibR6kAoTykZu6r
	0ES8XE8qNcx2JRfonLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFPV-004zzo-JZ; Wed, 19 Oct 2022 20:11:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFPK-004zxW-Ve; Wed, 19 Oct 2022 20:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 908EDB82367;
	Wed, 19 Oct 2022 20:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D40C433C1;
	Wed, 19 Oct 2022 20:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666210276;
	bh=cxINFjC4l26JMWQCDS6yOnnhsiWltfRN4i3cz4+b7vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1ZMR3K24nseRo15MOP5rfNigW+Z7xZT29yurBVj0i8XMgxeJujD+PIICzNZIm6bN
	 gyK4dHYnL1woYBdPMdyEToXjqNHDrW2LDxd3wWYhGDXgu42WH98mSb6PNGE0biVwoI
	 NmL/FHqhwiOGE1mM2xnC6PMrXYmWjtf1ioNz6JDLPE8Y5e73BbnB6NW23Hrt0MK1e/
	 +nKHkSBV5CS1gPpnn/eBnJUp5fsum7rA+C1TehSt0R/pHMPXztTW0k12Hfu1L95GIv
	 +3fg3d6ThtT2fif5tCNG/VOG/010vzdu0WdMFtWVtPpP1GUcqnAcVjxl7mbvJEmMkE
	 xq4VgOFK32PwA==
Date: Wed, 19 Oct 2022 21:11:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <Y1BZ26pv9A0VFS/j@spud>
References: <20221019195452.37606-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019195452.37606-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_131119_184247_D0A23DB7 
X-CRM114-Status: GOOD (  10.12  )
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

On Wed, Oct 19, 2022 at 02:54:51PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

>  drivers/pci/controller/pcie-microchip-host.c | 1 -

LGTM...
Acked-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
