Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD8CCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUVh8Mh0cIYzV+dldOKltCABaFj84QUh/D5Fmejv5Vg=; b=G8R64Qg3drzcvj
	3r+ka7nflvUBTGlW4wd858CglQBMX4Dml/kVNI3QgfiQbore8r1VFwt5OY+gM5c/8KF98JWPzrV6d
	biznDM/CYa3yh2zMY0Y3SYhX0+fJ0k6QN06gSJBo7+tZ0JvV8LJRb5BoJ9CeDTjpumKX+t0p1D3rK
	uB8peB/wQzyTykIF7Wue0xMoZen9cx4Sp392RuNQjQvrlVlwa8EkIdUMKLUZqxFAMKhP00rJCkCyp
	RIuEm1+u4jmM6cVO9YUd1x91zM0yIoOMm48wwrdFQZm9ev95K3bdzH51P/69AsH0G4fNCkBYzqxwR
	DmDPshoqNncSGI4bKj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8tN-00000008gHf-0NtC;
	Wed, 12 Nov 2025 11:20:01 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8tK-00000008gGP-3TQK
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 11:19:59 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1D9C6341E78;
	Wed, 12 Nov 2025 11:19:56 +0000 (UTC)
Date: Wed, 12 Nov 2025 19:19:52 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor.dooley@microchip.com, Frank.li@nxp.com,
	guodong@riscstar.com, fustini@kernel.org, geert+renesas@glider.be,
	cyy@cyyself.name, heylenay@4d2.org, apatel@ventanamicro.com,
	joel@jms.id.au, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a
 module
Message-ID: <20251112111952-GYA1685027@gentoo.org>
References: <20251027133008.360237-1-elder@riscstar.com>
 <20251027133008.360237-10-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027133008.360237-10-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031958_887860_AEA72D1A 
X-CRM114-Status: UNSURE (   6.58  )
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

Hi Conor,

On 08:30 Mon 27 Oct     , Alex Elder wrote:
> The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it as a
> module in the default kernel configuration for RISC-V.
> 
Can you take this one via your defconfig tree? thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
