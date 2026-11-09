Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC7606A325
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4FlnSx6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOiMeJ9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SrUN46UgB3z95ujCWLj0WRpwZos56RMr1a0o9kzPYGw=; b=o4FlnSx6rdTb/ZzIoehtZbEgAR
	zsE2Aba7tiHCaJK/DZ30vE/k5xi1ztj6uU+wpdryKI1tvM+L25JmCGrq/pB9DbGSwWrfmZXrVKPXo
	peEa5/oyxHEb3IfzfiWkozIcOklOyQ38j5S4nWikvTeYklwjiutmpaQj9QXDS80J1gwGECJSjiYnO
	TWuN2fMsONxuzsLPT7GalnryjbtMEGet4cWgDVi1aHEochZWWMBr10wSfHPfEeqdcrMnzkEu+nCKZ
	aR46aJyU/IUje2qGvtnMMgdNL42RLiiMuyd4GHrNiL0CZHKGe24LboRrNsZV991Y/Mwuxrk+/iu9H
	Php20vSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOcj-00000000iJ2-3U0v;
	Mon, 09 Nov 2026 12:37:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOci-00000000iIX-0rOm
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:37:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAC30435B5;
	Mon,  9 Nov 2026 12:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25E01F008A6;
	Mon,  9 Nov 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227839;
	bh=K1CWsVs0IPjpIDw2JWkNBzEKlJiME1CRvTNW72z+Z5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fOiMeJ9NpINJhEWER3W2ji4evJ5usAogUOq97fLlOhiW1j+cDan4XbqUlot3B7vHX
	 Rt7X2shSlbzgKF9d49yT1f7yei4HGUB+23soaXcR72xD2Zs+NM9PTTu0cKYNwbCReo
	 bMQU7fVS1Ae30A8xx+dGqhkRaPiCbcR5HwZBOGSLYxU9Vz41hLSY/yfrQMEHYWocUm
	 ue7LN27qUqdREMbW/BT5oFcHEzvM+k8dMdOz3qaQG2eXmvr1fWcjbYwnM34LkQAQGD
	 dSz17Mr8d9b3W49b9Nabyv9be9YsJorCvwnM6mvuVLLoxiKqrHKba2wumxYpfEhvjM
	 Mp4FWVHqTG/Fw==
Date: Mon, 9 Nov 2026 13:37:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261109-unbiased-fancy-bloodhound-a6504a@quoll>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109051050.105623-5-joel@jms.id.au>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 03:40:44PM +1030, Joel Stanley wrote:
> Document the RISC-V ACLINT mtimer and mtimecmp hardware, as described
> by the riscv-aclint specification, commit 4e570bfd3201f2 [2].
> 
> Multiple vendors are shipping silicon with the hardware as described
> by the specification, which was abandoned[1] as a standalone spec at
> v1.0-rc4.  As we have multiple instances of hardware that implement
> the spec, the widespread implementation of the spec is de facto
> ratification, providing a stationary target for the bindings to document
> and an exception to the policy of not accepting things that are
> pre-ratification.
> 
> [1] https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
> [2] https://github.com/riscvarchive/riscv-aclint/blob/4e570bfd3201f2c09e5afd290b5091526b0f099a/riscv-aclint.adoc
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>   - Rework commit message following discussion at LPC
>   - Add reg-names, rework description, fix example
> ---
>  MAINTAINERS                                   |  1 +
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..403875d5932e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24185,6 +24185,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> +F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
>  F:	drivers/clk/tenstorrent/
>  F:	drivers/reset/reset-tenstorrent-atlantis.c
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..e6f3d08d4f93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Core Local Interruptor (ACLINT) timer
> +
> +maintainers:
> +  - Joel Stanley <jms@oss.tenstorrent.com>
> +
> +description:
> +  The RISC-V ACLINT specification defines a set of memory mapped devices which
> +  provide timer functionality for each hart on a multi-hart RISC-V platform.
> +  The mtimer device has a single mtime register and one mtimecmp register per
> +  hart. The specification is at https://github.com/riscvarchive/riscv-aclint/
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +  reg:
> +    items:
> +      - description: mtime register
> +      - description: mtimecmp registers
> +
> +  reg-names:
> +    items:
> +      - const: mtime
> +      - const: mtimecmp
> +
> +  interrupts-extended:

Use interrupts. git grep gives basically zero results for such syntax in
the binding.

> +    minItems: 1
> +    maxItems: 4095

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
