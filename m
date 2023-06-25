Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB13EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf9HBGzG3LWm/JHZw8Z0rtKKry5Yoqmj7wwG4z1g0y8=; b=Yd/enDpbQZbgZ5
	pZDhdBYK9duMdrFBlC+ZRp3pcArS9ZAwZY5UJyKM40ZWqp8nRfPLAuZehDvMrG/agzNIFlVdsJD+T
	7XLj5EtFTGTWAzEjhqfLlFBhXiNY50GUzaYlrXLdwXnka4tSL7U6/9b4NVEUziAHFsB0ooPYD7S/c
	PAP58sza6hl3CcwyQ4hIydmBiLsjvl52QLUK9UPqB+yfuwXCjGRmnrCon+mfEZoZUYPOEDDYyyhd5
	a5ZORjE+RQl8M4+TdGDC265pUmjXxelRM2O+0pGWv63qwPKZyLDiCc5HsxlGvIhOE2XVCF7uu3q78
	Cj1wqwIEiww9mjtrlxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ24-008uOV-1r;
	Sun, 25 Jun 2023 23:20:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1t-008uGx-2k
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5736360C4D;
	Sun, 25 Jun 2023 23:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5EA9C433CA;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687735223;
	bh=O37DVpRVFprc11pX+z866pQny4gdJe08iStwdJzU6bw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eaEtbOMu4nfKW+FhSRPDP4KCoeV3yqjOYev8iwOd7KS/u7vrORhIJ4U/bNK/ob9Ov
	 u30Qc9Zz56xiClFlaRxduKiBwoSah7ZKwpvQMa2SuJhe//h50v3P+3g5T6dx7RRAIL
	 6cIgodlg/2/CgZEoyKwxPgN1h4V8aSCHybAnz1Mfrg3f4taKpB7WTYXwHvaKMuzJIX
	 IinuSTMetR0WPZuBg5IF18Q71bVGaWVDqyYQsEr5pPGDK6otGw/iS+mS88ya+845kN
	 i/XRCNRuzUWiHTM94zaMnM6BZebYS7Zed7+o+ZLJDz5T0iq5rsFrYgd2cSkaX1CY77
	 0V609usuYiX2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99F7FC43143;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] ISA string parser cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168773522362.24181.16156078607515411409.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jun 2023 23:20:23 +0000
References: <20230607-audacity-overhaul-82bb867a825f@spud>
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, cyy@cyyself.name,
 conor.dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162025_977165_22805725 
X-CRM114-Status: GOOD (  19.18  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  7 Jun 2023 21:28:24 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With that out of the way, here are some cleanups for our riscv,isa
> handling.
> 
> Here are some bits that were discussed with Drew on the "should we
> allow caps" threads that I have now created patches for:
> - splitting of riscv_of_processor_hartid() into two distinct functions,
>   one for use purely during early boot, prior to the establishment of
>   the possible-cpus mask & another to fit the other current use-cases
> - that then allows us to then completely skip some validation of the
>   hartid in the parser
> - the biggest diff in the series is a rework of the comments in the
>   parser, as I have mostly found the existing (sparse) ones to not be
>   all that helpful whenever I have to go back and look at it
> - from writing the comments, I found a conditional doing a bit of a
>   dance that I found counter-intuitive, so I've had a go at making that
>   match what I would expect a little better
> - `i` implies 4 other extensions, so add them as extensions and set
>   them for the craic. Sure why not like...
> 
> [...]

Here is the summary with links:
  - [v3,1/7] RISC-V: simplify register width check in ISA string parsing
    https://git.kernel.org/riscv/c/fed14be476f0
  - [v3,2/7] RISC-V: split early & late of_node to hartid mapping
    https://git.kernel.org/riscv/c/2ac874343749
  - [v3,3/7] RISC-V: validate riscv,isa at boot, not during ISA string parsing
    https://git.kernel.org/riscv/c/069b0d517077
  - [v3,4/7] RISC-V: rework comments in ISA string parser
    https://git.kernel.org/riscv/c/6b913e3da87d
  - [v3,5/7] RISC-V: remove decrement/increment dance in ISA string parser
    https://git.kernel.org/riscv/c/7816ebc1ddd1
  - [v3,6/7] dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm support
    https://git.kernel.org/riscv/c/1e5cae98e46d
  - [v3,7/7] RISC-V: always report presence of extensions formerly part of the base ISA
    https://git.kernel.org/riscv/c/07edc32779e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
