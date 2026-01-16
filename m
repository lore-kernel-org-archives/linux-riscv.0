Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E9BD4A615
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGfLK9EtAa6PLtHzDPeVE4x6vPrfATdtL3jYHjfqMFc=; b=Fza6LZXaEr8KG1
	8xTa9XacwH4kV7mFundz1i9AjPTUQIKhvtl/tLwhG9Es3+x5nZoSR9y+cDW0CaW88fnVnd2JOs3iX
	GcSD5KUKMdA4B5Oi9IFaqXiSAbhBHeOa0/A9LvCob2YMg6k8JRW+/XhIPzv3x3nimnju35AchrLDt
	FwxYS4vMoz0rS2rIKEc01a2eUS/yORa7fkshqax1IJqbUOF6q68Dmb0zlatpky+rttyZson2+Ox9t
	BFuhILW5CDlZACuJQ3gT3LNaL6kLj481/v42sC1ZbRzHh4mY1nzwDGpQ/CecguNGNEulnKoSayB1l
	OWMY819cD2hy2Fo6UQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfiZ-0000000DoDF-04U1;
	Fri, 16 Jan 2026 09:02:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfiW-0000000DoCR-2oSB
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AFCC419B0;
	Fri, 16 Jan 2026 09:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1A4C19421;
	Fri, 16 Jan 2026 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554123;
	bh=Dz3h1fZVhFYfJiCKG8iNbuul6rn4NYsHgDTFjl58x3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UL3TpwTs5BMq57aRYARVRFOGew4aYeLQ1BakJegpMb+f7u46aw3iyauumigNO5jYK
	 XQFzUFl5EHXAgP4b5Tw1FRL3kTcUbdZ4+8T+0EzqJtFr2NeBPuZiAEeIMWfJ2rxmZk
	 1h7bZ8R6pxk3kauFcNlJkriwncXv9GbM+4soJZRsyqp0ZaTWL8yX5flsYSDnHHikRI
	 omMlFH9eikdL5oMPFRjf7HIuEMpYRsayRHdVnHboWQxWFDquj+NrCFmND/OBPFp9Bq
	 fqHpVtOLRBWNt5K4uRefP4U9vv31eH1s9rj8CXHP4fvP1SaOjVFv5chAXm/Kd8Jv8Y
	 b3Jmn+1P1Unyw==
Date: Fri, 16 Jan 2026 10:02:01 +0100
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
Subject: Re: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
Message-ID: <20260116-unique-devious-elephant-e9de6d@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_010204_863036_08615415 
X-CRM114-Status: GOOD (  12.67  )
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

On Thu, Jan 15, 2026 at 05:42:03PM -0600, Anirudh Srinivasan wrote:
> Document resets from RCPU syscon for atlantis.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  5 ++++
>  .../clock/tenstorrent,atlantis-syscon.h            | 34 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> index 3915d78dfeda..7e9c8d85ba9e 100644
> --- a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml

There is no such file in linux-next.

> @@ -31,11 +31,15 @@ properties:
>      description:
>        See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
>  
> +  "#reset-cells":
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - "#clock-cells"
> +  - "#reset-cells"

Why aren't you posting COMPLETE bindings on first posting? This is now
ABI break for no good reasons - you knew your device has resets.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
