Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B198C7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwFtk2Xc1BaXnpyl/gi9lJHM4+Ekr9x1C78u7u3H77A=; b=KwKZXnVL8AAIA+
	YjQ47ogGeD3KNUmy7kPLgT1G9M6iyPONd5IVSRRhUZ8jUG9v4xQ/YgJz14XyOkdK51OLquW9zhxNt
	wpXUt6uYDtnwb+hUjgu3vrP2hQyG7IzuosyeVXyJxysAfCf2fmH5r/akFiBImOPNEkjLfBMJnI0GP
	Cc1aUtWLRXcwmRwB99OANng6D2zjRYdmq04hA7CRVHLhH0mazf+D5MlWhVykPrMCKMmmsRbgNq/UI
	5fHNPDZtkcxgtYw3JkpGHxkSdn+9FADC2AzdCgm+MEJwd5WqhZWOjG4uAC58NK3082u9CaxOguonC
	VhP55bCdnG/NKgh9K3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmeFd-003yBh-21;
	Wed, 12 Apr 2023 17:27:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmeFZ-003yAh-2t
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 17:27:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26050637C7;
	Wed, 12 Apr 2023 17:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029ECC4339B;
	Wed, 12 Apr 2023 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681320436;
	bh=BIUSRAdoy/Zus3h2K2WNnAQR/1nxAkSLeQxWV/R2Prg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/ioBuLjffehMYpwpQri/vITWx05lPbVtkI9SUbkww4WxGP9uVxoAp/Oha9QUBNAe
	 MuE4mxx/wP+/msRhy3ZCeLlXuSlOzaQ1BwB19DH3Nz62srJH8GLazKtDMz1Z00TJyX
	 ORUTZ+q0CMG1yP2htUMl3fZb/WJDcLsj+tcKwmUNeTTAf1SKm6mf26YFnYssakPaBf
	 K3aSjgkTBQtQDRDdFNSf4CgdZTSNa5Sl8M6do1sYWYSW5DUGbzTGN67mCkvIYVhz3C
	 HONJmc/Cw9iZoYuEve5kOG0K4kZglEtlZKUyf2KbviHlpafA8lD13nZNSAIU83ZlGs
	 7DTxR7btBwh2A==
Date: Wed, 12 Apr 2023 22:57:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 0/4] Add DMA driver for StarFive JH7110 SoC
Message-ID: <ZDbp8IVpIwFvNgFv@matsya>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322094820.24738-1-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_102717_971111_A77D39E9 
X-CRM114-Status: GOOD (  12.74  )
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

On 22-03-23, 17:48, Walker Chen wrote:
> Hello,
> 
> This patch series adds dma support for the StarFive JH7110 RISC-V
> SoC. The first patch adds device tree binding. The second patch includes
> dma driver. The last patch adds device node of dma to JH7110 dts.
> 
> The series has been tested on the VisionFive 2 board which equip with
> JH7110 SoC and works normally.

Applied 1-3, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
