Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37487D4A609
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/hWO/FzYamU4QChvZj0jJLJTaoKmsFcBc/RT/VJgPI=; b=Us2V8bl3RBtpPs
	RCoiaAfAJPLi8m0kGy7Kzw5yFThgTOxMYIY9DNkFXr4jUFDRpqiDfdBsNmCIfhnx0gb9jXj3qYgb+
	Q1h0qVQLdTRq6izu54qrjPK2AnNzE2cPAdLCoSlWVy5lZWDhpIt6j6nl8cBswJ9DWDz46uMwU/7Jm
	UwmEjTvQ1Qt1Fdu/Rs8Vt2SIQU7kWuwGBjMDZYME0QDuigFg1N6eREVRsww3dQ/O8OmxwLlOQ6yeR
	ZEscPYqQkr/8g4NK4pWXUElx/5sTlhOXqFNTeco17XlirxoYudw9rqKR/JHdlJxloZkeZCTN1aeHL
	Jd16petKOrGoqfLOVaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfkw-0000000Dols-1LMg;
	Fri, 16 Jan 2026 09:04:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfkt-0000000Dol6-2ekw
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 444AE42A38;
	Fri, 16 Jan 2026 09:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE274C116C6;
	Fri, 16 Jan 2026 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554271;
	bh=GIje/pFENTe+tBZRGJcbMQHRfCT1ZHhm+UonxExDiXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTmukUg0ArB8JdfjD8xytrvKK46uJbur2TChbJ3/7xL7YySIdIn8enAR332dInyX1
	 fNmeNrzhN269fGZfh8OHA2yIlW3Tjnf1KPrDX7BiDf+m7nYyPfyD0dzk8TJLMJpcPJ
	 GRRC2FXzP45fGtXxqGZ1RuyjdxuAGSVFLbCjSdoonitF1jIfBcRGAVcyJH8DDWVos1
	 u376uVUp62JVeC0QHAZ2tt6mMjU4Da1ZXDayiduQcdmqPLsa/C0GgYMwxLrmWbLS6P
	 n19dKWdYr3QCyhcK3CMBt9Vdhwv9sxkiavKl1FTr2wqzBpyLqv87vQH5Ob25di23Rk
	 8vPCechDHB/9w==
Date: Fri, 16 Jan 2026 10:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
Message-ID: <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_010431_691799_16877939 
X-CRM114-Status: GOOD (  13.81  )
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

On Thu, Jan 15, 2026 at 05:42:00PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis syscon that manages clocks
> and resets. This syscon block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU syscon block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> new file mode 100644
> index 000000000000..3915d78dfeda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis SoC System Controller
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  System controller found in Tenstorrent Atlantis SoC, which is capable of
> +  clock and reset functions.
> +
> +  RCPU syscon controls clocks and resets for low speed IO interfaces on chip

So not really a system controller, but maybe a clock controller - place
it there. Otherwise HERE you explain the rest of the functions of this.

You should post complete bindings, complete description of your
hardware.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
