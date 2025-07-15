Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7758FC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMKOeRpWisqa3nFtppFRCrxpoN+4AgyTg44sohzrsBw=; b=x+Mr0HPu/kgcka
	JdsB95TyuA7jpqLxkiJBgrMArnNY+6wpArz/O3YHg2ukg2fL3I8GU34KIlHeCfY+0QxhzSN7lrn1r
	CigiS8MNQIIboIJsDKg5d8/Dy/ok0OVpa5T/bQUJg+iz7KRzoriGOEAvUj2hbHE3uqvwdCyqRXkMH
	Vgrblbf91Q5xsv/rDgHFZE0WbA5aqBQ6WzbeXddSXGpWrTzM6U5IDuClMDiH9+MTis1eaCvZaUFSi
	Qge27b3PLkORkyUGpI6JqL1CAR5YGLcxT/oHj4bs9cXdRZk3yWFPj66Pu7oTJTkV3hg7zrIfIkcG9
	UKMDStGW6J1dG4SgILTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWIW-00000003sJt-2Ndz;
	Tue, 15 Jul 2025 03:25:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWIU-00000003sJR-0e7k
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 03:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84D604386A;
	Tue, 15 Jul 2025 03:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42430C4CEED;
	Tue, 15 Jul 2025 03:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752549937;
	bh=lrzxwWtwZkNCjGp2yhM/QISkZjt3HFGiOPAd5Hqt0KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7PuSuWTWcQFMmtXjLrtDpl0Wtf8yAEkG/+jxgWUPWVdfVewQhkYPINJWaZeJnGkL
	 IJlfTX36KVei4CWgJEPFO5NdUlNSSP9L4bxSUpEIlXmmXPH+jkdfMPSArdC16a+eAp
	 xMWYqKLUl7L41VtuTvD92OsktDQQ86qlL6DPGm9ZJgMV7z9SfynC3u0TN+T1VuDrLX
	 bcyUk2yIwJAODrgjDSTwm3g8Wn6LJRVHZxJItRhHOkLTVeyXax+rUuvV0PxZNXXi9W
	 Q6/BhBB2bP17M9NSWxohunwAX8SzzQs6Jbes5g5c1676g6CoFP5Xf2ubOwMagP7cBf
	 eD3V9ig8YRrTg==
Date: Mon, 14 Jul 2025 22:25:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: palmer@dabbelt.com, spacemit@lists.linux.dev, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, alex@ghiti.fr, dlan@gentoo.org,
	skhan@linuxfoundation.org, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, conor+dt@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Message-ID: <175254993587.4165390.1905297422239367623.robh@kernel.org>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
 <20250711183245.256683-2-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711183245.256683-2-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202538_214458_2F4D20C1 
X-CRM114-Status: UNSURE (   8.29  )
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


On Fri, 11 Jul 2025 20:32:44 +0200, Hendrik Hamerlinck wrote:
> Document the compatible string for the OrangePi RV2 board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical to
> the SpacemiT K1 SoC [2].
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
