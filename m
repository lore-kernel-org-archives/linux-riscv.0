Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E8C5CFC1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuqPpkPxP09cG5WHEiwD+kABj2tgxHtO8+sxS3FKdQk=; b=t2KXPKRq/a1j8s
	i7S6G2Vtm1kdXzN+FW3qxb6aXX18Oc4HsV2c/NFMukcdf1Sgq2FJBGjJZyBmo5dJ0uM9Cw5iWyDXm
	9q4s4kt7CDxEnqKWnQXDOrUFrzIaxjiKoDb01uPRNl2F9YYUqPUMHE3tRUDTeqXm/l/B59ZkksftN
	jUa04BwD33qrsz20mA8eI3vB1GfYBm8Pmp2zU+e7RU3vuDUFrjbo4BNG0o0HtLze+R2dsOzgrUADL
	iZ/41eaimd9SD/w+Zl3dPX8AZQyjcD0WcL8DyjZmYTXRZ5oORpk3E2A9FLdn2TRQD6ljRsf/jcsGQ
	Pa0B+Iixqq6qmw0mW3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthuM-0000000Dbwa-0Wqh;
	Tue, 11 Aug 2026 08:32:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthuL-0000000DbwR-2H56
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:32:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5334600AD;
	Tue, 11 Aug 2026 08:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5AD1F000E9;
	Tue, 11 Aug 2026 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786437144;
	bh=qEqfWRHWi14MDoi5GTB3EIB4jqDfZdRQHZn9kMInfcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOg5/hkS0PDvkXVqYuo6lDv6X3wyOyisMZQa0Ogk8nlRAVQl+7eOh3KnH5/G/SHl9
	 3ebhvB921hZ8vxfSlBKuE4CFiI5t0kMdJRIxsCBc5hcZXBBqT1qtYzl4NivYUYMZxP
	 th04xBmSCgkyuWYRR81ZT0nZYsTujCJYWMyEqcu5BjmeBK7MPRTFqNZFz6PrksE65A
	 39sRZiTZG8h8yCd7dGbbEwSFFJbMVCg7HAOkNEEluE+Q2/RqKLq3dlnCz3g6GUzQYJ
	 LhyYHMc+bauFyyGCUYIbfP4PLQzy+GGPILyGH9BZrg7DJlRulTxe+Ha6bcphM2TlJM
	 9LKE7YwfY1OiA==
Date: Tue, 11 Aug 2026 10:32:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alex Ousherovitch <aousherovitch@rambus.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>, linux-api@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v3 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Message-ID: <20260811-lyrical-aromatic-mouse-bbbd42@quoll>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-2-skrishnamoorthy@rambus.com>
 <778fef91-0610-4ddc-9d64-e6b45b30127f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <778fef91-0610-4ddc-9d64-e6b45b30127f@kernel.org>
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

On Mon, Aug 10, 2026 at 10:16:26AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2026 21:55, Saravanakrishnan Krishnamoorthy wrote:
> > From: Alex Ousherovitch <aousherovitch@rambus.com>
> > 
> > Add device tree binding schema for the Rambus CryptoManager Hub (CMH)
> > hardware crypto accelerator.  The binding describes the parent
> > SoC-level node with its SIC register region and one mailbox@N child
> > node per mailbox the host owns, each carrying a reg (mailbox instance
> > index), an optional interrupt, VCQ ring geometry (rambus,slots-log2 /
> > rambus,strides-log2) and a rambus,cores affinity list.  Which crypto cores
> > are present is discovered from the SIC CORE_ENABLE register at probe,
> > not described in the device tree.
> > 
> > Register the 'rambus' vendor prefix for Rambus Inc.
> > 
> > Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> > Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> 
> Completely messed order of tags.
> 
> > Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> 
> How Alex could sign after you?
> 
> > Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> > Reviewed-by: Thi Nguyen <thin@rambus.com>
> 
> Your SoB is the last.
> 
> Are you sure these people reviewed THIS code instead of blanket-review
> for everything?
> 
> Did they find any issues in the schema which you fixed?
> 
> 
> > ---
> >  .../bindings/crypto/rambus,cmh.yaml           | 207 ++++++++++++++++++

Also filename should match compatible.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
