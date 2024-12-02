Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD2E69E90
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj/zZRSiHjk29eSTdqrCl7EmdTyK5zcK1ErbwwKfFJ0=; b=Gi/psKPtm2FB+4
	UCHFpgCfhpR6wXg/JvIxurW0Nftwf8NaHCoVwkemOsiNvRYttHSUXJc8698t4Ark4bjZFbdc8hxBn
	TWHtjQQ54VML4lIRUZz8PHpYHC9YjhX+BJnfwEuLswbR/bFbVQn/2LUwSw83LqkDm7FkLc7tep2XC
	HFOkv9+uhM3RizBccdiWipf9G4HQ2ng13W/6PthUFJgDkPUffvdmQ1xMhKsBAv3uWOJHm0IKOVrZd
	TreXvQ3ifJ++6a7IxgE7OFNipErzwIsCW4M+WtC+Vpe5i6fQQOerFQ5pVExetY0E2tKtRr6skaH27
	X5JDAc7nhs7mekpf/Cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICnj-00000007OFN-2LSB;
	Mon, 02 Dec 2024 20:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBnf-00000007Fhi-3rZu
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Dec 2024 19:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vWoXH141pLTYr3pQKGCq1nUtQfuEH7uHsKne86x3w+4=; b=J8sQUGbXoDKUcDGS5OJt5S9Y5C
	4M2bEWZw8Haefgp/1ALdFRcDQK4SpCUuX9fFNkYkCknQ1WHEWOM9qV+C8LRo8C7jUVcZWPlFStlNk
	7dFLDOFhYPMQ8Q/M1qvjJRPI1NBok4ULaD8ErJKr0BFUnsGzKKXiFb54L63h8rXtpkbrvp4lp/mbq
	0C9YdktpOHYp6EWMQU5wLzGdwhGI5rkPjO+BbyduL0tRltD/X6YNb4PBBpD4qmJh7WcbPmwCrMzRv
	NQEoAERsfVgJmSqapO2FT30JzflrJeRqSdnB1+LSm/hrkQJc6qtEWBtx5ooMHhpqdpXZRdqOs/+xZ
	qLqUA9Bw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBnc-00000002F7G-2qbK
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 19:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B5675C62FD;
	Mon,  2 Dec 2024 19:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF390C4CED1;
	Mon,  2 Dec 2024 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733166573;
	bh=umy77aQd2gb3zfX2M3K2vwZXQQnnIJU+TbwFDWYEObs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjBZb05Y7vmgX/nXYA4hvHtbMBfgSdNP4Ojbam74gn8fSMv5BXKRONsu1XDyPOZHG
	 RCq15boRuTECFD4/Z/3I50rFpdjNrvxo6a5J1nQJrgYlcFuNRTkAz1XuIXEQZ+1yRs
	 w/Xnt4pyf1y/2UB2GEFaPQ2sf+IKfLngISGtJWmWj7syJH2PVM0fV3VbgFohvU6sQM
	 lImNoudzacbzX5sNS0TqJGYnr8wQuODttyFX9Y+UuMsXUH84pkrdWmFi/egam7pj57
	 bklQ6FLl17VD36oZa9HWsxTIcwMV7sJt/GHudMGcQqs3TlXP0QdGW5+Qi3c6ZwgZmV
	 TbMjB2+XJBNww==
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
Subject: Re: [PATCH v4 0/1] riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
Date: Mon,  2 Dec 2024 19:09:25 +0000
Message-ID: <20241202-gimmick-fading-87a41318bb4e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127151843.70341-1-e@freeshell.de>
References: <20241127151843.70341-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=597; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xeDHdB8e4cS0BxMn6/ptFXFTuJZ7eEI88nwD+dI+sCo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl+rM+2/n0izeQ3ddG73dnZgY1fTnOGZuvmX08qEWwpa FRpnsPXUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIko1DIyTLZbXTnBnVVDr+bb PX0vvaBKkfAD76N/d3W0ljXH24UcZfhnd9Royoebv77k712QYF41KehA4vn0DJcym7wVlglJm+f wAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_190937_087670_ACD296DE 
X-CRM114-Status: UNSURE (   6.61  )
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

On Wed, 27 Nov 2024 07:15:04 -0800, E Shattow wrote:
> Enable host mode JH7110 on-chip USB for Pine64 Star64 by setting host mode
> and connect vbus pinctrl.
> 
> This functionality depends on setting the USB over-current register to
> disable at bootloader phase, for example U-Boot:
> https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
      https://git.kernel.org/conor/c/03bd268ae048

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
