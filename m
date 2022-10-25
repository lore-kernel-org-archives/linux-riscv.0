Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FCBC38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D9sf2Sn0heDhp09lY0iYmhWIyMXUj5jPzENpLqAcd8=; b=b27OY/xI6t1Quz
	BUOnDC0kizElNSl1kSgl3DO4sy88ZKcU7tL+LtqEiOhN9GQvgUx97etwPjMO9ohv5iKGvfUQPWCcg
	SEjtE5b1LrIfu+1ie/Xc1GUvElKwGormU/0CoArB8StHaRD+Y3Uliq1F/l7GrBV8ZG6f/Sk4j0sa6
	p+CRtncW/593j9j12wBAqoM59WiaCnbiG8eowTxV0ZTgzALu+tbFSElZAHTj7VX4YuCq6C26j4xNg
	0HldRv69qgZ/N1jK1kV1pwZZb/V5keKyWWVHeR6xy4UcZk6UG3ngF8DxIolDjKRjrHdhpaYto1PW4
	GZFsIgoUyRUs8A6oOmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onR7b-007BAv-MD; Tue, 25 Oct 2022 21:06:03 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onR7P-007B6d-7q; Tue, 25 Oct 2022 21:05:53 +0000
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 396DF20002;
	Tue, 25 Oct 2022 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666731941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuNweShXWaeC97qVfm6xoS1jF6hfC9NTAzy5bUMmmMM=;
	b=fWGyOa7Tw0o5Qhw4WPi/wDNzNlVBhDJwbC3BHULtLEVLKk1XZuhRDel58Fy7iFoXJ069Zt
	BlonTxfg6bnASdGS79Z822zYFFaHQMpsfzSIEd6E0W04QVgsleCcc0Wm2f1Z8gAQUe1xyL
	3H+lyPQrlj2+9wMJKPFrujm4Fq5eHC865XftuIQKzI9O9BOwqZOTQuLXZLq1CiUzS/zMUf
	rac13aDaqidRXccnNHDzA9bz0VybWXYkR30Qqe2oYVlmDR9i8fS1OtCaqhDHwgtmd5BGl+
	suRyGuze0D3AcB///F8/GqZ7FF7JYjpxXXRYpy3pOTlP4c6KmxJ9vSHsDTJ4RA==
Date: Tue, 25 Oct 2022 23:05:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Tom Joseph <tjoseph@cadence.com>, Rob Herring
 <robh@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij
 <linus.walleij@linaro.org>, Toan Le <toan@os.amperecomputing.com>, Joyce
 Ooi <joyce.ooi@intel.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Shawn Lin
 <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Bharat Kumar
 Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 3/4] PCI: mvebu: Include <linux/irqdomain.h>
 explicitly
Message-ID: <20221025230534.290a5809@windsurf>
In-Reply-To: <20221025185147.665365-4-helgaas@kernel.org>
References: <20221025185147.665365-1-helgaas@kernel.org>
	<20221025185147.665365-4-helgaas@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_140551_464976_B3497194 
X-CRM114-Status: GOOD (  10.80  )
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

On Tue, 25 Oct 2022 13:51:46 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> pci-mvebu.c uses irq_domain_add_linear() and related interfaces but relies
> on <linux/irqdomain.h> but doesn't include it directly; it relies on the
> fact that <linux/of_irq.h> includes it.
> 
> Include <linux/irqdomain.h> directly to remove this implicit dependency.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/pci-mvebu.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
