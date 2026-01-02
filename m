Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27BDEEE25C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3Lco4T4mu27dvMzT37yWvsA9hpwr1wnhwNuegxZX6s=; b=iViD4PGvrUNhFX
	X6Vfm7K5FOh1UgpWQW4Vdu8EG29rR/tAHjaNkuSr50w45fxQ0wvE1i5gXdaiUz2x3G8Du0w9PMIvc
	zrPUaaxhZ5wRXynz3p2fCZ5afVKDtWYekdFehJHI8n/k1zu+ptp+Vr1vNNPbCnO3rGNRt0j0B1cN8
	CDALULAbN6H4sp+kV8N11vskNAtQCSY5wADUqoNqZ1WPBbrvtC8OquTOCr1GtA4pzilg0Sg8vJ/No
	1ttac7H50gECBQTiNlq0UMcu3HyzvHNEcyDXFKllgB7vtqsnxAVjyIqrxzDekRV6D1vyZinRwdAMy
	QN1aeznl8j0fba8mt/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcuJ-000000086Ka-1YMh;
	Fri, 02 Jan 2026 11:01:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcuF-000000086K8-1wQo
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 11:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84CC5432F8;
	Fri,  2 Jan 2026 11:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5913C16AAE;
	Fri,  2 Jan 2026 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351678;
	bh=MwKJwpnCxjSn8BMhS1akxq/00lr/MQbNFr63/39YNgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7lh3g6ahEyHGXjbaXZexuZsffnHf0OXeZgyWbcXOnlC+RuGon9px64K6XqfkOVPR
	 Xi1sM1UqqSlMgOPVL2M3rRdSMTHYpWRZav8npIyjLMrjm9CjZF2w1MXgzNKYHECNEg
	 34eqZelSzMk5zXpaHqzOeGjukT81I3MU6idWvWGmAXsXEke1w0WQAaG+Fsh9kYWbLj
	 KuC12x8CeJTd9nM5NU5vHSFdjOoylBJ2ls2+Nhd/k9iw50tc5kvQR0r/JHzCi+5k3v
	 DeY9UcQ2+9Stp6+4R8T9Kvph336pQKYLUF17Yle/9eiR8CkCvWGLrDfdw6nrlNIqv3
	 zVNIbvVITwnYQ==
Date: Fri, 2 Jan 2026 12:01:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: convert drive
 strength to schema format
Message-ID: <20260102-mottled-albatross-of-fame-0e7efe@quoll>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_030119_523336_9162F9E7 
X-CRM114-Status: UNSURE (   8.66  )
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

On Fri, Jan 02, 2026 at 03:00:22PM +0800, Yixun Lan wrote:
> In order to better extend the pinctrl support for future new SoC, convert
> drive strength setting from free form text to more standard schema format.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
