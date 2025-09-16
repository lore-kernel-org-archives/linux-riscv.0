Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D1CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcYu1hMldT4cNYXwnozFmtznccPOTIEjM02KJVu5IFI=; b=r3LsMBOfWoKj/c
	iMcLoO4qU9Q7nJIplBua0PrA6Etrp09bhtVYeqZNx+MsRLvNxFmK8YYO0impFg0uWjEUlCiANT2ir
	VLmG8QSUlsgIJj22DnxIGl2AUR3AjSXPh6ZZOOI1J+luuH3r0BLtqxANlvozQaIt17mvdg1LaKezU
	0YEI115bg2Joy/iuTd9f7PJO/5MS/eQX1msAP23UrwjGwtZBRmt3kVJ7LLSD3DVBa/oaFRInWKh0F
	Dz/fVuGKySlSghE2NL+B065Mc6v2VHTd+8WXujuwiazJoucu8nZBLm4shH84uWNaFkHeoX5eTcVNq
	XYly2Dw169WhahrkIZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVyU-00000007yc4-33lO;
	Tue, 16 Sep 2025 13:44:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVyU-00000007ybk-0Ekw
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BCCD600AE;
	Tue, 16 Sep 2025 13:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3966C4CEEB;
	Tue, 16 Sep 2025 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758030241;
	bh=PaMXEFXqCAuG12KEQ4djKfa6Cip7cabwIbwPaQn8wY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljdjCTkGxZRvb0F7FEBCvF8MQvB8OpQlHE+8U5+ljM2dNkPq/jtyw3AYlywCWUB1L
	 GD4yIqOid2EWZ5zKmN/h7A5ulypmjpBgT8ztUSUR0m/bbJal5/a/xuReQRkTYGo3PE
	 IhmdHuKSmAFKstZdjPFBsnbr2E6wqoUgl90AIRy6/CG4dm9+haJYr13LVSD61Snai3
	 TZ0K6/J+qkwq7cY0pYSKZDJKQgn3zX/heNEEXzrFVj7J8mC2t2fRqS2ucj5VUw6cnH
	 QBcWHDkMmHYirrBPbcz7Z9ca4cRZZU25bWgyzUXy9eBu2zc9C1E65PQ62MXxBkBvRU
	 pBxHVu/xdGfzA==
Date: Tue, 16 Sep 2025 08:44:00 -0500
From: Rob Herring <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 4/7] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
Message-ID: <20250916134400.GA3654122-robh@kernel.org>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-4-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913-tt-bh-dts-v1-4-ddb0d6860fe5@tenstorrent.com>
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

On Sat, Sep 13, 2025 at 02:31:03PM -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Document clint compatible for the Tenstorrent Blackhole A0 SoC.
> 
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index d85a1a088b35dabc0aa202475b926302705c4cf1..198146c59de0c95a2ffa052c8d4d7aa3f91f8e92 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,7 @@ properties:
>                - starfive,jh7100-clint   # StarFive JH7100
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
> +              - tenstorrent,blackhole-a0-clint # Tenstorrent Blackhole

We usually don't put Si versions (A0) in compatible strings unless later 
versions changed in incompatible ways. Perhaps if you already knew that 
B0 was different, then it would be appropriate. Or am I misunderstanding 
what A0 means?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
