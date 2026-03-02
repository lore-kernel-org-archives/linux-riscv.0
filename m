Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180B7D58E73
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 07:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=138I4MHfX1fm4ViDwCp7VKdBiSmR07ipGrAIq3eN7/Q=; b=z2nxUY4+OIdhnd
	cNFHP5QEO5auNdvE918B9kWc+LtNsSiCfbCzKHTPzWY3AtUvvrW2fs/s9C9j6pWUMkQhwYMRLXr1M
	v2yCi78u4NzyHcWQpEWfgOZ8efl1ldP6HHLgdFiWoY0Jl8KiF0HqazGN0K6O5ywXfB5suNmcHAzs4
	9awc0LddIiAHwZ2jjjwwYKhI9K6thgq7fc1h7SIEYGMFvgbgWiaSxq3kXVG0S3rzeRTGS08CKIBMd
	oKEy00PMtDp26uOUlm2eMKNR5lb66v8fLeAMQY10oXcg9eWX5eY2gtbZ+YQEdfvz2XEbsYK/OCSd1
	JEzd3Vp4K4RGk0eOQpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxvS-0000000CQy1-1TWs;
	Mon, 02 Mar 2026 07:42:46 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxvP-0000000CQxe-0I8d
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 07:42:44 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1572F341E82;
	Mon, 02 Mar 2026 07:42:39 +0000 (UTC)
Date: Mon, 2 Mar 2026 15:42:35 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe
 nodes for K1
Message-ID: <20260302074235-GYB288339@gentoo.org>
References: <20260202100000.19176-1-amadeus@jmu.edu.cn>
 <20260302071502.63672-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302071502.63672-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_234243_136650_B50CEB5F 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Chukun,

On 15:15 Mon 02 Mar     , Chukun Pan wrote:
> Hi,
> 
> > The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> > 'linux,pci-domain' property to assign a PCI domain number to
> > each of the controllers instead of assigning it randomly.
> 
> Does anyone have any thoughts on this?
> Without this patch, the PCI domain number is random.
> 
You describe what's has been done here, but no why?
Can you add description about why problem with random domain,
and the motivation of the change behind?

from my understanding of reading DT document, either way seems
fine..

> ```
> /# find /sys/devices -name net
> /sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
> /sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
> 
> /# find /sys/devices -name net
> /sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
> /sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
> ```
> 
> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
