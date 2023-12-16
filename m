Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56F3C41535
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+0TmstIZ+QRteDaQ6c7MkSlrQJiBy2fXmOL7cM6u10=; b=Y33JeJsAGqgheU
	oP6M1YvrWo9MM+q0SG7YeqA4PkPSavfg5RukOln23BJGgmmvrVJgnMYFu9RmU2PNX533kfz06ohAY
	TPNSFnsZsNnGPtuU13FJIjui4XTeKY/Yn8M/T/5KreoGPcC5cUPJg1cxY0X4/nCqKTPMC9IFT9azh
	GdV9ac8CKM9M7gZEQS+1OIPwOR1NOdYzMfFrRjOdUfWfO2y9duohqqxRn3hyXraMpqX8baEi8qV6Z
	6HKvU7QoAr1Nwk9QZHs2WA5JAiDp6SM04EOnN7PhQ1J/o3GXkZENwDSna5kM9TBIU4l1XGFwIqNv7
	OsDyyjQMiQvQap4WZJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeJX-006rQT-1k;
	Sat, 16 Dec 2023 23:43:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeJV-006rQ2-1F
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 23:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3058960B1B;
	Sat, 16 Dec 2023 23:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDECC433C7;
	Sat, 16 Dec 2023 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702770197;
	bh=XxA10n9pk/GAfkmMK38vgv4ImRz2CJHlcGKcI4SdK6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDU/CcYJHwhsxhBi9Bnr7hL5oZPsJz6vykA+zT3SXR9l/QbPD7NMP38WiqLbF816C
	 qI+R8CCH0JFRWGedgo0jHBt0zXPSRzeHGckzoCMvz//YmuZUkQtOFeS8V2XEq7QK36
	 q1K6eFJTdU7aH3gyypXpdfzG6DmavkBaVejXcmH3ea40/XM57oZ1RV1Ud+Qx4FWRBJ
	 gUHacKMpG8+m8LNMxPTuj5bflOfAxGxoxzkQzXwxRIlRLQ/yH9ZwkW0THj5B+fawkt
	 gjw7vqorylnF872QtDjdEnbKYkTkrrHDDLp2PTFu4qdPSX2ytMn9f4+ri/oTbBDklt
	 FB5HXdhtIQfyg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP
Date: Sat, 16 Dec 2023 23:43:02 +0000
Message-Id: <20231216-banknote-sanction-4643975710fb@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215190909.3722757-1-emil.renner.berthing@canonical.com>
References: <20231215190909.3722757-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=551; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=o6Dp/7qRhGoRQyRb//hF/Y31njOm+E+ACzcMesgkTSU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKl1ZiyZrzgMPourz3q7qbcuL2JCy5vVRcE738V8vrrtS sxVr3tJHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIaU1GhuurfN1EUnizMn4E LTCa8VdMoUpreV/V1hnKOUfTfXVPfGL4n7zvHe/8nXbqNf87GVLXvXt6JFYzOyPcsW3+szss16/ e5wcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_154321_489880_808D27B8 
X-CRM114-Status: UNSURE (   6.16  )
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

On Fri, 15 Dec 2023 20:09:09 +0100, Emil Renner Berthing wrote:
> Similar to the Renesas RZ/Five[1] the JH7100 SoC needs the non-portable
> CONFIG_DMA_GLOBAL_POOL enabled which is incompatible with DMA_DIRECT_REMAP
> selected by RISCV_ISA_ZICBOM.
> 
> [1]: commit 31b2daea0764 ("soc: renesas: Make RZ/Five depend on !DMA_DIRECT_REMAP")
> 
> 
> [...]

Applied to riscv-cache-for-next, thanks!

[1/1] riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP
      https://git.kernel.org/conor/c/9a9e8d8d2b6e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
