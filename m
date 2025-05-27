Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8451FC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfgjCWnQ1PWd5CYRnn2PRfgG86I20T3k7eY5M4zImvU=; b=XZiZxYTymN7Ngl
	M/mfH+xZC1yCxFjhTs7Nc2Md0/R9Iqvc2pzpxwN9NJ7gsj5cKNgFYIHK3LgerCpHcbg0h+nGS2uQ2
	MU5/L0COMgemyR1w7clCkWZ74GS78nGDfzvygkLy6RSr1A8UBapBOmOvKflS6TEwdHlyyLgFpeqU2
	pUPPO+sgQWv8uGga27MII+e7XQ5O5es0Ug3nXkiJIqwGEUbkLokgTylz16A1oBg+qD8LKWEoRhYmk
	W65NdtwHeQc0as0tRlWsHSt2ZkJqS6nDY4708O/Sz8XcWOSWsDq+WuW7DA7ZZgeWlaR1+YFkUgD78
	rshbbqbCo8qzZWrVxmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQm-0000000A7Ie-2iEa;
	Tue, 27 May 2025 07:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoBe-0000000A4yN-0hyV
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 06:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 984A261136;
	Tue, 27 May 2025 06:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40ECC4CEEA;
	Tue, 27 May 2025 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328801;
	bh=kdiH0AXGuvY9XtxMtuYU8wXg/NjMgu8AdKdsundsshE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8TYFJaiafMEoqsHW6CNxlG44eo6K7DjL+010aqCJtFWAib1HyStZM5Oq96pfyo1Z
	 4IrpibWl5tDqGczCJoKw0PxTCTk7A2+pNL21Pjlfnt8He+lIi3sA0M4Rk+QgVH0aL9
	 LcRntmKt5OyKc43ZhnzbuLVijMC9759CcPN1OzMEE5GTuMXcV+72Uh8wjepgzb2Hb9
	 ZID9sAf/I61ZbT/2/pJOdSorTG+lmsjKPke/Pz5Pp/7oyr7rRhqXTiatqhdDfS+Iwb
	 K5xRouXRVjPgl5iggBJ8a2MrTavxORXYQoecg/MOYKzB85NJu06GMaYUR02cY8HztS
	 OmxbYTpzv1nUg==
Date: Tue, 27 May 2025 08:53:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250527-burrowing-adventurous-ermine-dd4eb6@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
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

On Mon, May 26, 2025 at 10:40:17PM GMT, Ze Huang wrote:
> +
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> +      The 'interconnects' property explicitly describes this path, ensuring
> +      correct address translation.

This does not seem write. You mixed DMA with interconnects.


> +
> +  interconnect-names:
> +    const: dma-mem


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
