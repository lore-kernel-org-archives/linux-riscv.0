Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBD606A337
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gPKWL14;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctjilLN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AQKhSNR0444AxiLoY0vhl6nRKTHcZ6u23FoPK/idQGA=; b=3gPKWL14XdNo2W2kiR0Hj/UR5S
	mCmv2xzrJN8PZAGuGzt9V1qf9By7E8EKpzbUa2r4HZPBJHDZoEr99BqhTp/IAURN6exzQDTK+bmvg
	djW2fSUHjipoyd8/QpVZa8L+cA5ilh3KynsMzP9Yvd4RDMcqqPq4K4mSwfOojjmUC5ZOSvJ4yYBa7
	lL8/4UJg3RWQvuFaOjMtDDmNCvwpT4DwTiaFeZaM+p9a61DvBRG3LzWdE9R8y9fAdxTn5nGziEnWD
	vaCZyVkC0KZ1vV8r+ILiyBswTATnXkrK0jpuE4LwfNlf6NyA1blRV6XDC5EetM1ApL3GgUFYqGzxp
	V3LRhDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROAY-00000008o9n-1U6K;
	Thu, 12 Nov 2026 06:20:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROA9-00000008nyh-2wKn
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 06:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D6F943AFC;
	Thu, 12 Nov 2026 06:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1461F00A05;
	Thu, 12 Nov 2026 06:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794464396;
	bh=neSRzhF/d5DoRVpSm0zYWoFxhd17W2VLi2BCLsSsDLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctjilLN4RNMv/a6ywxFLBBf5r6QEIHNLpp1KM7XvMCdUS1jm42Geh4MwWtCMcv0F/
	 Hld0s6yVuD8QDO5X9cVCd1Yd7jOOO09N8Aem4VLDmuJJijAPvcaNh79SwCdYJqBDKc
	 zlvG3sDlX3ERr3aI/a1q8x4jbCmf9Nm43ddHn5Wz4t3UN6qzNgJc4XzPNiZcx/BfEI
	 IxjaAJGV85Rp380DY67sc73p3ylzB1l7QSUFUnG1mP68pDzNAf/01z2jmbu7a7IKCs
	 e1N/HaqV9fPx3AixTRP55vuv0nNPzaidGDCCVCE256iFAeYZAI4rfKt7HD7UUMj+2C
	 Jt9iQV47EAXIA==
Date: Thu, 12 Nov 2026 06:19:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	=?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>,
	marcel@holtmann.org, luiz.dentz@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, anarsoul@gmail.com,
	alistair@alistair23.me, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
Message-ID: <20261112061951-GKA62271@kernel.org>
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
 <179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org>
 <DMSUPKS0VL8N.1RUUESQVU8FMF@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMSUPKS0VL8N.1RUUESQVU8FMF@linux.spacemit.com>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luiz, Troy,

On 01:45 Thu 12 Nov     , Troy Mitchell wrote:
> Hi Luiz,
> 
> On Wed, 11 Nov 2026 19:40:19 +0000, patchwork-bot+bluetooth@kernel.org wrote:
> > This series was applied to bluetooth/bluetooth-next.git (master)
> > by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> 
> [...]
> > Here is the summary with links:
> >   - [v2,1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
> >     https://git.kernel.org/bluetooth/bluetooth-next/c/c21f8cff7503
> >   - [v2,2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
> >     https://git.kernel.org/bluetooth/bluetooth-next/c/df348a0d065c
> 
> SpacemiT DTS changes normally go through Yixun's tree to the SoC tree,
> and Yixun hasn't acked this one yet. The binding patch is fine in
> bluetooth-next.
> 
This do happen sometimes.. I agree with the split, or another solution -
I could also take patch 1/2 with bluethooth maintainer's Ack, either way
is fine by me

> Yixun, what do you think? Should Luiz drop the DTS patch and you pick it
> up?
> 
Ideally, the DT part patch [2/2] should go through SpacemiT's SoC tree,
which would avoid potential unnecessary conflicts.. besides, the DT maintainer
did complain about this thing before and request dts go through soc tree, see
https://lore.kernel.org/all/20260918-belligerent-succinct-kraken-7fa592@quoll/

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
