Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F51BF55138
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2MElQjuymtieoBXSEteOCyoSJQyZAq72wFebPmva0s=; b=3UpuHgP/J9J1ZG
	2fr1ieN0BpqCvYhxuSJ5de6uN7eILnAfs5OQ7a3Z5+HYbn3qS46M/H6LDq4qM/4TcXqva+lCjmYso
	MQuwr00AoRi2pdcJvjt8C9jpknSkQ4KJD++lQkypOIBz0SjkqN4B6GoYuqZ0+nXtE65/B7FCOZ7qJ
	RLyG2WraaSSP6wWp/DXy4CRmPUf1Tg1LkTCFiicWzpm7zCwt3xtZmp2aXvtfaOUiDEjdR/cjOf3WO
	G+O2TxqlCB/O8RtlWLloM2J4eqgV1QVWBRJ+dLvfSwYrhHHglmv97SAX7ZbQG4Zq1YuRbivbB8tJO
	J4VT4e5RfKRipN0CayOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAHg-00000005pnJ-3bXg;
	Sun, 08 Mar 2026 09:18:48 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAHf-00000005pmv-0S56
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 09:18:48 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ADAF03417BD;
	Sun, 08 Mar 2026 09:18:39 +0000 (UTC)
Date: Sun, 8 Mar 2026 17:18:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe
 nodes for K1
Message-ID: <20260308091826-GYA318052@gentoo.org>
References: <20260302074235-GYB288339@gentoo.org>
 <20260307043806.957175-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307043806.957175-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_011847_201784_2E3EC3CB 
X-CRM114-Status: GOOD (  14.47  )
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

On 12:38 Sat 07 Mar     , Chukun Pan wrote:
> Hi,
> 
> > You describe what's has been done here, but no why?
> 
> Because the PCIe boot order is random, if there are two R8125
> network cards, their interface names will not be fixed.
> 
> For example:
> First boot:
> pcie@ca400000 -> eth2
> pcie@ca800000 -> eth3
> 
> Second boot:
> pcie@ca400000 -> eth3
> pcie@ca800000 -> eth2
> 
Ok, I can understand your problem

> If their PCI domain numbers are fixed, I can fix the interface
> names by matching /sys/devices using a script.
> 
If you want to have a fixed interface name, you could setup a udev
rules according to mac address? something like:

$ cat /etc/udev/rules.d/70-network.rules
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="01:02:03:12:34:56", NAME="eth2"

but, I see no harm to add a pci domain property..

> > Can you add description about why problem with random domain,
> > and the motivation of the change behind?
> 
> Should I improve the commit messages?
> 
Yes, please, thanks

> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
