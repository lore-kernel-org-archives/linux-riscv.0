Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189CEC32796
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bz2DR9NpwEwPWy5IpExkUIX/mkNPGPCJrnLAaD0vsTs=; b=nHCk22OWyXdACg
	ijUor9RvIuaDFLBKa+Ks9K+qWljRwui15XphQYgRkoN114ifcsZtFncomTx7a2Da77N4tZKmzdr9R
	gr9/LYdM7KRdn+TMBVcOOVFtPw2foJDIv94gVZyvpQzA/WK5d0bopZ5+GjcX4rnD9YIkKNHA0xko2
	Oj/CGRfCdAm57mqToLMRZ72KqWzNKgn0QQlms1umSZNsgcqqiPjbc4Xc3jmuD4DUr1vCshRlm0g3U
	xikzlzd5b5pLbVQkQT4aTRHIhAlw+qKTr6ruyzzJrOKxYBO+CXJ0wR5kSBlb9p97e+Y8pKuYZAU0U
	Q9/16ahzQBz70IN1lTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQok8-00CWEg-Uh; Wed, 24 Aug 2022 11:40:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQok6-00CWDH-1G
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 11:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9DEA6195F;
	Wed, 24 Aug 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2560C433D6;
	Wed, 24 Aug 2022 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661341216;
	bh=nAChmvsQjvtcSVy62sD3IXOHSXzowoeX589gEndadc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k5LaXsQk2IVr92x+ZZ4emyhdpasxXMD6OezvzajgXW0YQ3XtDXtrHuxJ+SR9a/iH4
	 gXk7ShBQ2RuEifLicqFoGdHAWrozlxYN2WPwLJvEZA/CZ+g2eGR7mKF8SwniZHYTrt
	 kowuWv07npmbFo2q5Y/plj8zI8C2KK+qvUFm04QhpHhhGH/wZFYePjk1j92EvQVO/s
	 cb06W5zIAsezCVg/Vk/9mbWhkvP66HB5XvTM7VZ9zt2kohIYfTT6k/2Y0z7UepPp1c
	 O6SHYTf9yUca2uiAbAF8qkEUe1R9+BaDbIdi+NCPCZZCYI4anvsTUtbPUKR0tfIYF0
	 IZxMBkhAVL2+A==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <mail@conchuod.ie>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] Fix RISC-V/PCI dt-schema issues with dt-schema v2022.08
Date: Wed, 24 Aug 2022 13:40:07 +0200
Message-Id: <166134118410.100046.14129524978971500704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_044018_151204_5982DDEB 
X-CRM114-Status: UNSURE (   8.56  )
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

On Sat, 20 Aug 2022 00:14:09 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> Got a few fixes for PCI dt-bindings that I noticed after upgrading my
> dt-schema to v2022.08.
> 
> [...]

Applied to pci/dt, thanks!

[1/7] dt-bindings: PCI: fu740-pci: fix missing clock-names
      https://git.kernel.org/lpieralisi/pci/c/b408fad61d34
[2/7] dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
      https://git.kernel.org/lpieralisi/pci/c/05a5741019a5
[3/7] dt-bindings: PCI: microchip,pcie-host: fix missing dma-ranges
      https://git.kernel.org/lpieralisi/pci/c/1a7966b33b5b

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
