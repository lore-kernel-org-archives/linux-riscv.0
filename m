Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC95C55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRNMlRdXWLJeeVYuL9gWFlkMXM4kPWnrE8hK7mY1J5M=; b=i0/5GyAftSAqkd
	tuNJqh28MtlCy9zAYZOwY6XZ7kMArpXKQn1vDjt1Rb1oSpZ5ZhD34JKkw3XXcudkgw3iANaC+R4RZ
	SBDXPFYKmRyd11L4g0/AraQgn9Q6uZKi9fsmewGJvwroUUpJXIwPfAAlgNmrm0bA4oqDvpyOlA2fQ
	upYmVjAAwd6ducgbewWjIT6nDgeARbZSYOLCU1ptFJjF65sZEPW2WO9OhGuC8Q8U3x3uIODEIGoGr
	jBH7SwzGwEVFzrZfglwRd7nmFhaom82JXbxCFIDRvACPXjk7UEsxiPp+ZmXmp8ub0YdcI4wBli0LQ
	p/b1QkuYr3fN9l0iRIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt1l-00000005BPm-1Wuw;
	Thu, 06 Aug 2026 08:00:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt1j-00000005BPf-1dPv
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 08:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D203C60A8C;
	Thu,  6 Aug 2026 08:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D631F00A3A;
	Thu,  6 Aug 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003230;
	bh=wCsDbqJXdF2IQW6rHcMJA+Tn4gj7AL4ZApX0eWn5Liw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jiyFEnBWGE8JqbmRSBDoPS5pELh0vKTSSkfC2e2wnxazZojEw1MCf1nMmKzEIMdAt
	 UVzEudlRArvxEZ4+xwtwaucEERn2DI30ghSta7qwlaCtH3LgXms2+BnZavhWWo/qge
	 m+CzdzLpV21LL4tKwgQPs7D0G4h9ELzYNQfdo8ox07b40LnoWc+qL4Y7tIkk2+lzRb
	 jIBowazZL1qq/CwfbHqDFauftUnjmfqpx6z0PXPZKUxKFrmrMKrN4uIlzxymgxkac4
	 6xB9gyMTWcbQEZucjTPaYf6Ahp5XKZ82FdNPP3aTbSc6OMJWja/ibcOVUeudR3QuxU
	 aKNjfnGTGUctA==
Date: Thu, 6 Aug 2026 10:00:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <20260806-futuristic-outgoing-gecko-5cd90b@quoll>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
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

On Wed, Aug 05, 2026 at 02:00:51AM -0700, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
