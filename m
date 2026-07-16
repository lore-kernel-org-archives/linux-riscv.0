Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973CEC44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+NWUldviYUXoXZTJzLkd5V2FxPjlsVOqzup2H2rXoM=; b=qQicAtHvmM0EGX
	TyKUYRsphM1RCKa71lXRQ5BmX5HdvDvr73Q1Kz7Gi7ZPhsYhnQu1BxZL7yUxsTgnLxy5cCBiG6ttn
	LpVhFhNujG+F1WGn0FAJDJbcLUP8gnTYkL/qgRdhciSrVfmRokF/WvHT7hADYdN9oW20sHCkgWOJC
	2coQNATLKtQm4KexCisxqtpBPNCCqskeDqYix7b3MhFTA9Mj7nMou3esVHAJ9cSANP/bgJNCtWJJy
	A2rMPFqG3KLMy8sv0LCY4LSeghcxFlGF3VIQUNYODCpsO9t3+yE1Te1ROc0sZ/x41x0/qp9SuHfhl
	GC0F7YVYpij6mDdYVp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTj6-00000000dij-1LI7;
	Thu, 16 Jul 2026 21:34:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTj4-00000000di5-27jU
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Jul 2026 21:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YfuBW0J2fn5ZiwXHo1KSEOKKeic0LKpEnanL6byFMyo=; b=oObIO7vwgH3wbFMmkarXfvEIvy
	vPWdDHfRY/9Sb6i1jWcpJ/QC44Tsut9iSaqlQjZ4TRvqyM5ARP6wVYK2BhdpxhpAjB3OKYVS9HLFk
	pMnfNi2VamSh3ZxyXS8A7V1nOVaaoLo3Gxjpjp6hrdrWwpZStB+yvHu6ZchkIvdA8q483fR0ZB+JR
	pcJwFUFo+TkkZTxG2ryMYLWkK5HRio6n/PHGZhOSNZIWSpB78RUsTlB3lne9M0Tipn81Dk8LDFRbQ
	gdZKecdrjGiMensOPWOs/oXrGKdtjn4VIxozt7ipf3+url1Fso5FQysxVOmFJ1TdJnqm+/1GnKvzb
	znulyyrA==;
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkTin-0000000EMe5-1WkK
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=YfuBW0J2fn5ZiwXHo1KSEOKKeic0LKpEnanL6byFMyo=; b=SBxrP0q5LPnJRGpMhswU/BWGFv
	l0WRrSpbbmR/2jTVF+z9SV25CG+4dL/iKFSKq8h3sWEWUxpi33IPuFxOUMf5RDwhiOTDe2+arjYw0
	yN18tnx1MpTuUH+C7WOdcvatPv9VTUMYo2O1MMw5NryfRm8iTkb6hHR/ImDMaPzJ0CBHoWsPijxUC
	mmh6v8vhBMHIIJRa+F7roJzy4gVqo2h9XHrpBVboIxD3WeUlZGKeBeZE5ZkpX9GkpTST9YdFiWb3n
	4IOw6o1X27xzvlAJ36JVDWW2cPejT5Rzrrzy0k0EHXa48M3IpiPNE+v0qtizv4Ml4FOR4/YOuIdKH
	evEKcKpw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkTid-00000003GcB-3Ces;
	Thu, 16 Jul 2026 23:34:11 +0200
Date: Thu, 16 Jul 2026 23:34:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Message-ID: <allOU8-v6WviIJ_Y@aurel32.net>
Mail-Followup-To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-wireless@vger.kernel.org
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_223433_778924_78FE6346 
X-CRM114-Status: GOOD (  11.67  )
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

On 2026-07-15 22:21, Anirudh Srinivasan wrote:
> The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
> root port, but the SoC doesn't have any 32 DMA addreseses which the
> rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
> has when this particular root port is detected so that the driver can
> probe on this SoC.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/net/wireless/realtek/rtw89/pci.c | 4 ++++
>  1 file changed, 4 insertions(+)

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Note that you probably want the following patch to get the controller to 
connect to a WiFi network:
https://lore.kernel.org/spacemit/20260716213314.3027969-5-aurelien@aurel32.net 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
