Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305F4EEE25C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUKBwIZbfpPkS7NPYtZq+1ixI+o3dV7ZGPLm3kULMQE=; b=mxELfX6efwZiI1
	YZVaSgXvXmtyqyZxNrSYxIs9fFYwJJIFw4VtgcJBmDtKbF4KlKlEThBJD7RH539kvr4YiLL04ESEf
	qedfXYybbL5G18R3t4i8XuAbfRmYpieqc3ZEQMKr1OUi459dAzSugVSom+cF1iyRe9Y3kHRsOe5s6
	r+boqPiWu1lstlfJWnTixQtLPSIpNEyphXntvz5RG3/4Epn73mMm9ZaW6M4JBDfZkbQ38v8quL6jp
	aA8NGPeE7l9qB8H5P+4OMQZQ6KihBiSp0dlUnt/O0sN2pzslvcC2+IgJwJKrY0BsPYZzGJbvq86sv
	v4M/o1RzdCLtyptW129Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcua-000000086Ly-2vkj;
	Fri, 02 Jan 2026 11:01:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcuY-000000086La-3w11
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 11:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0FE942B7D;
	Fri,  2 Jan 2026 11:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C0C116B1;
	Fri,  2 Jan 2026 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351698;
	bh=5IRg4FH/bYd3meE/ovtPP9K2dhz9OcEq9fFqUn6o65U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyKegCqDoK9pUoxQ8Pbv6Ld54Ic9/3+6RQEY4awh1fl+y9IDlGIhKJNqwADGO4l+p
	 0gWSbwKEHpijP8ETZ8rD1pdY8h2WrDYuAabRpClUs+96pdE7M5g4EgyznmZdR7fmtI
	 xgKMrjPwt4D6Ejbx24coW32NiXIs94b904lnGOTXHvzzTzvcKwvBaG6C1weqJSF7W2
	 OuAOTeVch6I+6iA5ISs9ixUwLgRW/EEqycNg7ARxqaGY2KHGQ0CeS7JULjoum4SDNo
	 RBysUnLod834BXSvVjvQZ3k/UQXq53heKPxTGs1666jUkojPWsBEz1nPc9Y6T/rCU7
	 mrYkIbeUzAP9g==
Date: Fri, 2 Jan 2026 12:01:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20260102-diligent-kangaroo-of-enterprise-3d20bf@quoll>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_030138_997435_7D1ACD66 
X-CRM114-Status: UNSURE (   9.60  )
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

On Fri, Jan 02, 2026 at 03:00:23PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
