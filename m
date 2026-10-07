Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE55CA6007
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42qLTvoYfgotK6YjETXwUIThlr/hn1yQ98X/LQ2J0Hg=; b=gt+4cO210S3zBH
	kddcHYfWo3U6XTlV7CrvRVeTsmN9d5LzQyibbOZzMWOoXA6Pj4MbjNfb+H2eGg7Ajx3WQKcnYPdAM
	/MCb/NRS03rxYp6a22WqnOXiQK6huAsCOPDajCpVsya+t+fujRqMn6yMFfIG+lhmlSb0w1YEmfVBU
	5fngqNYZpqJaf31Fdm4YHHOE9N/nXMQmjkK6AAVHrIPJoGMlKWkEF7guyzlmJUAbmUGE1LCeRGogK
	t6i1WBJkp+Lgna26T5BMGirZexquW7nBe67c+1S7qCY9GzAcX4+OGJT5KpJWD5ZmpxP8pNCSkrBo3
	PWO+ubXKG9Ss7Kp5nt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET7W-00000002fMu-3HUf;
	Wed, 07 Oct 2026 14:59:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET7U-00000002fMm-3Oef
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 14:59:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B1560A5E;
	Wed,  7 Oct 2026 14:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F431F000FF;
	Wed,  7 Oct 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385187;
	bh=RlbDPA6UwQ0YRs0y1zeJhCOYJioG5GQ5Xlbiv1h43G8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WgXBQx74jpl0plYm2kVRYv5yN98oRwxzz/GBR1MpGMGhA/+pGKF2gzsF/PJXYo2+k
	 bxDF8AeVQVrY9Zi5jIEemlWBCbU5plt9WrUauBfyZY3pxKu20+HGI24Pk6mXcC0TFp
	 1nbdpHQmOQRGaWLC4TTUO4hGGfBpqd+vNl0HFOoigPYDb3jTwYDyUPDuoQhqT1Z8C+
	 zUFgWdmL6V3/ACgFAvx0Y1d1HVD/aExB1qg/r4ltTG4ZvagywX63T+TKGOQMg+cBhU
	 aiTnPeRJLKUf2tI7XXeJm9Eju2EbwgFgsFaoEA/86MzrXKKpmXVndsCa6bF0BHrUts
	 DhwdDDhQG7EaQ==
Date: Wed, 7 Oct 2026 08:59:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
In-Reply-To: <20260917-p8700-wfi-v3-1-ada4b0584712@htecgroup.com>
Message-ID: <cd400f89-a125-3f8d-3b76-ec1e19976823@kernel.org>
References: <20260917-p8700-wfi-v3-1-ada4b0584712@htecgroup.com>
MIME-Version: 1.0
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

On Thu, 17 Sep 2026, Aleksa Paunovic via B4 Relay wrote:

> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> 
> The MIPS P8700 has bugs with the WFI instruction. A WFI instruction
> after a mispredicted branch can result in erroneous address
> translation on the MIPS P8700. MIPS has not published an erratum
> for this.
> 
> The workaround uses the RISC-V alternatives framework to patch all WFI
> instructions with the MIPS P8700 pause opcode (0x00501013)
> at runtime when running on P8700 hardware.
> 
> Two call sites are patched:
>  - arch/riscv/kernel/head.S: secondary hart parking loop
>  - arch/riscv/include/asm/processor.h: wait_for_interrupt()
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
