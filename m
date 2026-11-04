Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D3606A339
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOIGiQzW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k28mOaCv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LnlBeifw3NGRdDxgJ+BfLFjNlm8Y86g/MlBqc6nrECo=; b=uOIGiQzWfrSqbtMIWs2lzwto4y
	1LZeO1LOQyqFDFKaJDG4X44T6BDDv+Tc4VGJo35wKkXy2ZAcVl0lcy//HRFcbVBQWJTa6bcuxnSln
	s4pznWSYXRONbV99ft0Nl5g5AqDNXEW8wkUSlk3xjMZU/I1lIELkKcT5QqrU2z01LGDTtcd1ISVcF
	rapReMj+9lR4Ix205uJD6a+CQ35/xjUt5sE77frXULd8IC69BsO7UVKvco7m2puD2t4k5GcGvYulr
	Bjo4TTdnEOiCNwGToR9y74Dek3zmspjhkto2Ji3Td4iviICRM+fCdrvD6wALJCjT2mRazJdzp9uNB
	EhJndaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcxk-00000005nRu-1qqx;
	Wed, 04 Nov 2026 15:31:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcxj-00000005nRd-1OcW
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 15:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C7766061B;
	Wed,  4 Nov 2026 15:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B41F000C1;
	Wed,  4 Nov 2026 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806302;
	bh=k2iiQK3f85Qlr393A9TttaLIVgMhFvsKqdsf+QHpCns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k28mOaCv81HNgLKT4zK/GHU7yyZwzU0Q2GutM97yst02AI6AjEsV5RbZZdSSgyl3M
	 ouI1BV1B7VbpDcOz5I8Im02rGOKQLBVX2OS6ypkhVd3i6Sq15HowgIuu6Oy8+nokE5
	 vjkUZd8IiX741VYRIQIyUlb3iYkgeHUXmJ2iGDhsLxmxmPOftO0Smaa5rVkETnyT33
	 QdgH90ODJiUuMJxt1kNRn99ry4SDuHzaEoY6bec3hJd1uJNzOtrRlEFK6EeIB+hea5
	 dirnoWZLtrzelD5bZUeHSAcblGII4r7GlMRqXZS7QY0PHoJdvq2X06pRIcJuf4Fxq0
	 roM1nguPIzFkQ==
Date: Wed, 4 Nov 2026 15:31:37 +0000
From: Lee Jones <lee@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Message-ID: <20261104153137.GB1650678@google.com>
References: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026, Icenowy Zheng wrote:

> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
> 
> Add them to the syscon binding.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 80ff0e1caca22..b9d45f98345f2 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -126,6 +126,13 @@ properties:
>                - st,spear1340-misc
>                - stericsson,nomadik-pmu
>                - starfive,jh7100-sysmain
> +              - thead,th1520-syscon-ao
> +              - thead,th1520-syscon-ap
> +              - thead,th1520-syscon-dsp
> +              - thead,th1520-syscon-misc
> +              - thead,th1520-syscon-vo
> +              - thead,th1520-syscon-vi
> +              - thead,th1520-syscon-vp

Nit: These should be lexicographical.

>                - ti,am62-opp-efuse-table
>                - ti,am62-usb-phy-ctrl
>                - ti,am625-dss-oldi-io-ctrl
> -- 
> 2.56.0
> 

-- 
Lee Jones

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
