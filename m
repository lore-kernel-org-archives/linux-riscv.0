Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E462D609D8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQ8XJbQwvgIB8+fUXWQ13YfrCbtRRpJ9GiUciAIS6wE=; b=Ki0emZNbrHwGXC
	A4oFhZ3XtLWaMvml+fNNPtr0OTvDbgkBzWY9vP4oBi5qjn6GDMBXoARhJH3MtIIv7ENu4lzNWUiOS
	aSbm9Od9Ghl55ML9oqQH3iVrwUNLAE55a/nzERCQair+HfiXm7jWGKRhbnyOZD+OPMoOGKOcpwB8x
	T2103ZdVYNS/UnWB4S35uILozkQm0Gnxu0HRncaaLaTQEqo7TjGYNRn5+MtlR6aSa94A3tjLdvqSn
	eP1mQAHfR+K8R2jyqkgnSbJVhU+T/LSQILwz6NPos41g3l88X7jglLMLQvg6czGvECXXvyR6u/Ccz
	v3N3xWMI1O/7vd9G//ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG1T-0000000CyRw-1f9v;
	Wed, 27 Nov 2024 11:15:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnr-0000000Cw4r-1Xw9
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Nov 2024 11:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fitgPnLYiABUAVLekJBnKmS6Sa7mqRZoPbzh+k2eip4=; b=Z4DRu9ltITN+fp2+NSbQyeCldD
	JT0i7AlU0thu6Su+5HODqgHIosxJXa7EybgG8sXuRT9QxPvBf4P9QInmwVvxudasx8JfQlstkFcIP
	rxiaQoLUIyQmTsuN2jwEQhS4zpD2S2t+fzgt0HgiP5RNInJUZyk4rhkBZT7O61W7Lo96hCzjweC7v
	xe8O5MPY0kpMC2G6hsNVBPIC9Q2Y0yzr0edeaYbR9EjzhB5ZD408QYL0xENDDX7u8JklMVbaz+7pH
	GHqWpJmq3KRs7e0g3eEfncZ0+wuxPttN/3a6buDXopPNJX3vA0u6Wc9A+ACzJjT4Eg0vF96RJ8G5W
	CAlaaPDA==;
Received: from bayard.4d2.org ([5.78.89.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFno-00000001P2f-1umM
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:50 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 17570122FE1E;
	Wed, 27 Nov 2024 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732705302; bh=Mr+PrXarwOscZIn47L1gfNj1f8aJ1BHQ8BTWIOY61ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHIzLYyPyFtoNjLCFvS5IPk8qT4yLEkbgh6LsK+BzonUqz/tc/xHELvL50nmjfpeX
	 ntqG1EtvQCH1OdqzxCsHglwDgndwNWX9fZSKUBFYdbaXVib04zQ5GFYnD8E/21LSuK
	 RC1fSm8FHWDcovwPmhs4zdAg9cImVgD6HrkzDW58M/PKfyKmZTOIZt4fBm+S2/tOdt
	 BTTmS+Dfd7NQWqcLWGoUCRLfAvIedMS3ELYGB6MvrL+npvbGcYpgKqRl+bXPPKp+k9
	 2nWnkE4p4nSgQbCFHJlME2de0owJGfn5CGg3kzfrF92dM1JJcaf+8HWTD87GqTzIQ7
	 IzYgU5z+axBOQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZ89x4naavqP; Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from ketchup (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id B6AA7122FE1A;
	Wed, 27 Nov 2024 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732705300; bh=Mr+PrXarwOscZIn47L1gfNj1f8aJ1BHQ8BTWIOY61ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FX47VPYpyNVOMtFWkYzfQso3D9D7SO9qMo41IRHV4Ur1Nmi6bskvj6VpBe8QKnYjR
	 ogJVCTf7igfmo6J4xENGzcxgeSEvCzsO/WicYLW1xXA9SEpYR8RSDFkLu84ykQeIbA
	 gFM1Vfogp8I9eJtNS2oQ2Y/PadA9WnNn9PRESVmTkFIPzBAicqFwgh8EuuEqc8xH75
	 RKZI9WfzNhcZF1wS4lsNUmL5oMWQDm1Z2Z9Jyy0v2Yob4uxM8nn+G5ADJiDBVZRyDH
	 tA4Bl69WLnXJkqwOFZl4eg3Dlenu1/ZRYRAIyprW7LvNTvP7nQLLZfWDWq5xxhHWby
	 /fCLxZtCZAUhg==
Date: Wed, 27 Nov 2024 11:01:28 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <Z0b8CJGrAe_kUeuU@ketchup>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-5-heylenay@4d2.org>
 <711362cf-5f4c-49e3-b771-38dfb441bc4c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <711362cf-5f4c-49e3-b771-38dfb441bc4c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_110148_749482_AEE1DB25 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, Nov 26, 2024 at 03:50:30PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2024 15:31, Haylen Chu wrote:
> > +examples:
> > +  - |
> > +    osc_32k: clock-32k {
> > +        compatible = "fixed-clock";
> > +        clock-frequency = <32000>;
> > +        clock-output-names = "osc_32k";
> > +        #clock-cells = <0>;
> > +    };
> > +
> > +    vctcxo_1m: clock-1m {
> > +        compatible = "fixed-clock";
> > +        clock-frequency = <1000000>;
> > +        clock-output-names = "vctcxo_1m";
> > +        #clock-cells = <0>;
> > +    };
> > +
> > +    vctcxo_3m: clock-3m {
> > +        compatible = "fixed-clock";
> > +        clock-frequency = <3000000>;
> > +        clock-output-names = "vctcxo_3m";
> > +        #clock-cells = <0>;
> > +    };
> > +
> > +    vctcxo_24m: clock-24m {
> > +        compatible = "fixed-clock";
> > +        clock-frequency = <24000000>;
> > +        clock-output-names = "vctcxo_24m";
> > +        #clock-cells = <0>;
> > +    };
> 
> Drop all above. Your changelog is poor - does not explain this at all.
> Write changelogs which detail what you did and why.

Thanks, I forgot that missing phandle references are acceptable in
dt-binding examples. This and other required changes in v2 that I forgot
to apply will be adapted in v4.

> 
> Best regards,
> Krzysztof

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
