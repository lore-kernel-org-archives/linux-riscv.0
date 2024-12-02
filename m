Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E554E69E81
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfjsT1ep/4OIG6agvEIejeNujHmp9jw02bZx/a/kPtw=; b=MgyO4j5X4rdfEH
	z1YXjv79k6hT0YjVZ86OoJ3BvQfbTyNQNh+1B3posV6kSci8UaLmFM9B4uMbu3t+UiTqErafQXlVe
	5rbcf8ie1tKjkcoF0S1GeeEMhM0sIeV6mKxQwIu/cOpYZhEyzhCrZeKE21+LT8NN5Rd81WvgT26lx
	KhSprN7dRrHigq8s3g86tue/j46pnJPfDdWg1hruO5xdgh8NWfGMPrklPNpXnxdia6Q4kahEFRcP1
	+0AypfkTLdwK1yp313Ltk6kWhMvpjxII4jqUmFxjDNjng4DVu/lWjg3Dg56+GEIDJCN++iNmduVDl
	Ebwz2YRZoOL5kvt/4MNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBnj-00000007Fig-10Pz;
	Mon, 02 Dec 2024 19:09:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBnh-00000007Fi2-2OKZ
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Dec 2024 19:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JFw/HEwP2APfysm+EJ7QdoI9s/k1GD3gloZ4vaJAVFI=; b=p1I/QAcdpWqclVsz5dbrfAAb2t
	qjYkfW1NXnwHLhwqVycSlhLdjOkGkTnYQpeVRWpiWG/M52VXG7MR2z7rV6wgGD9vFJ6E4nTQOMgQk
	w5N6P2WOeg2/1EJu/EGBQrzdD6bWYFrEICNuALsrI8/FGmUC7B9AMVNMCIbYggLz0ZLbd/dnNsqCb
	fhlds08wHUQdaYYrLK+T0SBu5f8tA+2ZSPrDJUYyxW0F2HQE+C3M+AUILp1xq/G92cQ27BT2x4Tqm
	WiXAK60bYBmGUzQ57murtTb53kotF/Gfti1SUua/5CSpnt43mTZ/DxOBZQwzUtoQq1jXmFF4kTVLI
	vsUDh5zw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBne-00000002F7V-1k05
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 19:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E43E5C6769;
	Mon,  2 Dec 2024 19:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EDDC4CED2;
	Mon,  2 Dec 2024 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733166576;
	bh=QTsPHl/Taoe+yxX9OpQ/uU1H5wwWQvNcBX5kRjq+fj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPCtE/dFV7A5roSHN6K4OhtVY3k0oNFIUKlB5q0yWN3geajSkvVKJMxJSfaff6/NI
	 vJexJbTeeNGaFff4zg8M/ONkYcLudqUeHaq+wWp8u9xuc7dWaie53Zh5S5zidm+teu
	 dYngr+C+WxIduQsykkwV3S9qiT6iiZiUM/NjICenDNSIZVybOQQDZEbgvf82QCvYJA
	 BZeDK1V/8bfuLmqPszLIoY4Re0bpoqrSqRD5dy/GQ3TEahs1RcCo7SARz1sq1R5Nrx
	 MT0Pg5QM+Ci6alApUJcfN5qJqY6KDr+hMYpLzmVTjcF0NATUlirqswGfN5lPcWGDxK
	 ZZWdD2u8txk8Q==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Henry Bell <dmoo_dv@protonmail.com>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
Date: Mon,  2 Dec 2024 19:09:26 +0000
Message-ID: <20241202-wrench-bleep-14eaff07451e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127154958.71094-1-e@freeshell.de>
References: <20241127154958.71094-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=592; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0GV8cg7FLdiPSZtkVCNPFpdPDhaQh8JlY3YnOLmT0S4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl+rM9e1XXknAtcqlU88XJQp0O6sWkmf/PMzllKXJ+NB ZMdt3B3lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCKlDxn+6dcWKzV+uy4oNLnD MXPVh9WRT26an/D8/t18wqqPyRtfTWBkaMzs3LpPcOmaDxosldJXfs89vMAl7EPg/KLjHgaV501 fMQAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_190938_836311_5A7EFA0D 
X-CRM114-Status: UNSURE (   6.52  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 27 Nov 2024 07:49:22 -0800, E Shattow wrote:
> Enable host mode JH7110 on-chip USB for Milk-V Mars by setting host mode
> and connect vbus pinctrl.
> 
> This functionality depends on setting the USB over-current register to
> disable at bootloader phase, for example U-Boot:
> https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
      https://git.kernel.org/conor/c/708d55db3edb

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
