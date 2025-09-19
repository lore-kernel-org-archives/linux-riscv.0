Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46944CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzw6pwsd9o9vHWlt041+OtNu7kqRLrDgoytPZ7XANS0=; b=C1mXoyBDAR6RtV
	C5n6zJuUXc18vFJgJvrTdxkxpen3is0rDwhVRfajaqQD3+53942+RKrccq1Aj1CS2tXTwju3rlmON
	3aDRsWHLM7Oge7fCmoycE8ViLRS35ddqv16HDRK/vI6mO2ALB6AsVDCO2JKVheSxDrjwE35tJY2bW
	LTvxFPylcLjOd4eeeGePwFjCW/nOIuCcFY71sKhY41QrdVrG50c1bU2b6enrkvvH65m+5T7TOWEFa
	RPBykI0BTOx4DXjvoTnfpBunyjuaPmH4q+rJaRhrdginHzBqeZwSpZlDMLSb2RtkdgoQGXbEXVVkj
	m0Z4ez+Axd9ETzeLwu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXST-00000002NmK-2EwV;
	Fri, 19 Sep 2025 09:31:13 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXSQ-00000002Nlp-459V
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 09:31:12 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09EE3341FEB;
	Fri, 19 Sep 2025 09:31:08 +0000 (UTC)
Date: Fri, 19 Sep 2025 17:31:04 +0800
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@riscstar.com>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.18
Message-ID: <20250919093104-GYB1279412@gentoo.org>
References: <20250919055525-GYC5766558@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919055525-GYC5766558@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_023111_039260_F8123444 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi Arnd,

On 05:57 Fri 19 Sep     , Yixun Lan wrote:
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v6.18
> 
> Yixun Lan
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.18-1
> 
> for you to fetch changes up to 0f084b221e2c5ba16eca85b3d2497f9486bd0329:
> 
>   riscv: dts: spacemit: uart: remove sec_uart1 device node (2025-09-04 08:50:29 +0800)
> 

I just want to let you aware there is a potentional conflict with this PR(trivial),
please see more context from below link, I've already CCed to you, thanks

https://lore.kernel.org/all/20250919092507-GYA1279412@gentoo.org/

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
