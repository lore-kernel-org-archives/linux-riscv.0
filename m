Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34369D609CF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5szVACm4Hv4xUWYARprs/fOoq4b5PZ1STzmyORp2yY=; b=oi8KGnHyMolrmb
	QtuypEOI1c1wOV1Vt0Q6D4053a2q9ME3DMQvMqNt+soJ46ulVZm0k4ykJEsUgizfWUt02xcJonOBG
	jFTKFBhzXlKSzgFYb6hmmCzfiuiR9qTW+KCw7wwgbtkqFEuPGt4WfrrscQDLTVVYSzQYB7ZLBANF5
	DGgnxKPCvGhlwoeA6/OQK4tnarg6EUvlSxZqlS1Ft6HhijYqt4/xtyWQBN+HcXYAzBfSVkBDKdXm6
	5z98qZVCvk/hod8bw6SWunp6NcZW2KR5f6QBdQf1rxIpWcgiv7PdlwHHCbmlNLHg+WAPq59OCQHCk
	W37lNRVnXkfdY35ZFlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFUG-0000000Ct2K-3q76;
	Wed, 27 Nov 2024 10:41:36 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFQV-0000000CsNL-1R7h
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 10:37:44 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 1581E122FE1E;
	Wed, 27 Nov 2024 02:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732703855; bh=EwkTX+MIFpLy9bn5raEc+I7FYh+YTAy5cL29F6FwZ48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=islEAvqIu14umc0Nh0BNtaP0O54EhJiE/KsA+8hCjHouDnLAMzIa0hA/1GJIQK2Ma
	 8u9eFi0mi7Z6PHzaRGyiTZBBFjQZAjeEu7D45U4AHmoxpcYTpQs4r7nSyOSiKO77Eb
	 kIZ6/J02wk+ftsCE+1enjvEiZ/tjre4O71Zgrrm26h9Mi1Zhjt5jKfvKntsyVE6LIN
	 aQ0uiqTK2eL8dSnZrCEmZ9ozq/I99rssBjDLGqxqjJXwvGvG4MUURW7BzSUB95ZH5V
	 q0VZDrAo9VVt0LYZjg9xI4qsFwAvBhSo9HnKKEBxRXoKiKMa3Ic4qH70L5IKcYxRkh
	 Vi4kgWYfOu//Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gT4AeVqNt7z5; Wed, 27 Nov 2024 02:37:33 -0800 (PST)
Received: from ketchup (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 0E94A122FE1A;
	Wed, 27 Nov 2024 02:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732703853; bh=EwkTX+MIFpLy9bn5raEc+I7FYh+YTAy5cL29F6FwZ48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dp4UrgW77o9Ymd6bTjpRfztdQI5YoI8Jx6G+IprE8QppyWLBTchlw/HqDcCAFrY3c
	 ZULd2sM/4mo0pFNtm3Fw5vaHW8akqi0gF2hIUGXAmoL5g0LdqHP2vS0NH0oypcswZa
	 eLMteRDH7RCZA/1zTjKf4MHS9hi5kjjXZ4qZndXUvFRCkTyHxZvByw4ji8yACxopJo
	 fQJYSiUZJtdrRogf6ch9w7eyyJFOoqd0Bo3nWn5BtxhB75MqagIKYFMmSvBLPQclI/
	 UWNGvwbQXo+lXFGlwjVhdnfBLF1zRWmrq510Y8qelZp7Ofn/H+h8dB8SxRUeWrnd0J
	 dFqueXyjg70eg==
Date: Wed, 27 Nov 2024 10:37:20 +0000
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <Z0b2YOdIWfuJINDW@ketchup>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-3-heylenay@4d2.org>
 <64bf96a3-e28c-4c47-b7b3-e227bbaa7aee@kernel.org>
 <hgtrinu32q2jtxb4z5nvjskjlkwwzxhymtf3alvaxlbqxrbzd3@2rw3uy2tqgnf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hgtrinu32q2jtxb4z5nvjskjlkwwzxhymtf3alvaxlbqxrbzd3@2rw3uy2tqgnf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023743_705561_60226EBF 
X-CRM114-Status: GOOD (  16.61  )
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

On Wed, Nov 27, 2024 at 09:03:11AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 26, 2024 at 03:48:33PM +0100, Krzysztof Kozlowski wrote:
> > On 26/11/2024 15:31, Haylen Chu wrote:
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - spacemit,k1-ccu-apbs
> > > +      - spacemit,k1-ccu-mpmu
> > > +      - spacemit,k1-ccu-apbc
> > > +      - spacemit,k1-ccu-apmu
> > > +
> > > +  clocks:
> > > +    maxItems: 4
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: osc_32k
> > 
> > osc
> > 
> > > +      - const: vctcxo_1m
> > > +      - const: vctcxo_3m
> > > +      - const: vctcxo_24m
> > > +
> > > +  spacemit,mpmu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle to the syscon managing "Main PMU (MPMU)" registers. It is used to
> > > +      check PLL lock status.
> > 
> > Why your example does not have it? Example code is supposed to be complete.
> 
> I think I understand why - this is for only one variant?

Yes, currently all implemented PLLs are located at APBS region, thus
this property is only meaningful in spacemit,k1-ccu-apbs.

> But then this
> should be disallowed in your binding for others. Currently your binding
> says that it is required for one and allowed for others.

Thanks for the correction. I'm considering moving the definition of
spacemit,mpmu to the if block as well. Is it the correct way to disallow
its usage in other variants?

> 
> Best regards,
> Krzysztof

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
