Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B5FCD4F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChHxZjYuLHw3vsyxQ1gA/WexsZOHRxRvgqvo0Fm62LI=; b=wlrz4U5zJoMkUs
	uZWIwl2oxVyA3eXWc0ftinAbrhIV42nTYFHe1FoJuy0gjqsquvZLdTo4Hd1gHzv7HeWhI0eKwF9FF
	xZEKsWysR0X8QZDm34Sn9roPQj2bMmIl4La03ZYaE4n+I7pPe9S6S7G07dyzwjQmAIPgAz76zn1yl
	PZg+A771264tl40mgXcQfeNqJbi1ieWAhKiVHpGuBd9J7P5cS1eGNSbIfgIXBEQ47jmp03P2Uo1Fh
	Q2IyBD3zUk1M6Cl1XQnBgr2ojhwvi3iCo2KkT1Ghjg97ULVSqDyDBY513oew5BOdTeEdtBUaQLaWr
	oEC7POx83LRAkeUq9r1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFF-00000003SC3-2Gs9;
	Wed, 13 May 2026 18:23:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFE-00000003SBh-0KBb
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 18:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43B6460129;
	Wed, 13 May 2026 18:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5893C19425;
	Wed, 13 May 2026 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696623;
	bh=PdsRHo3BwnQu3fBMoh55zgdXhrj5UNk1Pok8Xmrv7ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgOSNtw/jmboVozGkP1QGSPhlbu/dOMPGozBy21H4mBkpT82FkMjsi+VxDnWSNMXz
	 GDkI8PD1KJE9bZukllM4z00vp/+ENjkx1vs/VZNyNhMP2IoqXhozZqmyHKtH+8sDvt
	 1wmPf+X4/KOWx2Gej1j0HakMszjgYidXIJc2I/e5Bhgpj7o0QXMMikUYS1YTc3ei48
	 IbXKCAXCxqDoi58uEhQbwdN16JEu2DSpr/AUU7+OrTuEnZXaW2ijKsOf5isbanJoL4
	 PLTObt65rzcjCLhi7RqPozs+hmk5S989oDGEDNSwhQL0kGrSc2pKFQBCUeTkp6Iu+5
	 dkewqgYWqbanQ==
Date: Wed, 13 May 2026 13:23:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Message-ID: <177869661593.1615750.7686200037533271225.robh@kernel.org>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260506085937.754808-4-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Hal Feng <hal.feng@starfivetech.com>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 06 May 2026 01:59:36 -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Add device tree bindings for the StarFive JHB100 RISC-V SoC.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
