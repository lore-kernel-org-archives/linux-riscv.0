Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B2CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcp4ILCrfwctcuzboeOAm78/XmY74Zzz8HpO/A0Y4zs=; b=mU+ruRKsF8L9ik
	clZb+yKzcEa8GB3oTELSPiGxMMZJXwqED4qD+JmB8dwk5Ddonlp6OTE1es9oTu91UY6VdDFJdALwm
	CiwlKtaGnRuH44v3wk+doWG33tZ/ye5GCc0hYL3OhJjkazpUwooslPiWCX07WBGxlALR02sSn6Lsw
	sDxbEsQOSpRetr4GcY72ev/ZYq6eCaIBX1WtVbrwEnlMdIXasRYoJ2Q9B1gBiwxi90FiytLslWUfR
	6ppXPJnLIKVQf/CG25a+EVlJCdpkO8XwUIl5J3yJf9lWoR+5gDmtOkCaWIgajG3fC4nM8Zgg12Ils
	gqAf418pJkO+XMq5aTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWYD-0000000G8fx-3v1l;
	Thu, 27 Nov 2025 07:36:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWYB-0000000G8fN-15Jo
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 07:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 489C6441D3;
	Thu, 27 Nov 2025 07:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8A0C4CEF8;
	Thu, 27 Nov 2025 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228982;
	bh=Vf3bgVUZ6jVpjj6thPrEznvts6kLXfHQzIMa1KX6+xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLtymqOy+a5GDlbVK/f8cPDWYtf6HR2lm2TtOCXg7RwMzYaMigdHpQzi/zFFh4pj0
	 KbieLH9YsdKBNzvw3WVb+N6/MdMNZpkHJLSPMDhs6F10kEFTluMrs0SBP7yIoE3ZaD
	 cGn3nTDaEHy+0D651eajtq/tqSNlV8ZPi6JGdY9ccGYLizHjejU4hJDkzlc2+gcI74
	 lV51wk0P6FOY8lQCLdiQAsJW5/Xy8u8mK4L/3HyKxkYbDLL/MUEBugZiRQMi3B0FSm
	 thh0SyLgSlIY7hCnan5wSQq9nQYoB2mzWfLnkUKJNAYR173vVY3Lh7BXaSZrTB3pKA
	 /QggbLYy5A14g==
Date: Thu, 27 Nov 2025 08:36:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
Message-ID: <20251127-accomplished-garnet-earwig-baeeff@kuoka>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-unclip-shabby-a7a16e865146@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-unclip-shabby-a7a16e865146@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_233623_317682_D64F5B0B 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Nov 21, 2025 at 01:44:02PM +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
