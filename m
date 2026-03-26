Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94107109E556
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0WkUw7FFdRegF/pWgtp9wH6HPgNlw6IdsF/wacKeHI=; b=ld8YuqweW/9/2I
	LAFcrmhhCh7lyZ7eY/T26Hfe20f+w53RueB+XlkKvBz30LZvqDsjZ5TkxLdg9Odc8edFcjBdYLvO5
	l7lQtU+2VHJ5QX/7FRkYY90uPWwzlsWdKkEq4RAVH79ZA6cC5KgwCl64QAieh5sdzc5ZaCELvGDcT
	/EO4YaDet/alRgwL2MA2D05Bd6QhPeADXwaiyvHTes3vMcEZZf7zC46X9SNWyjNzCv3/mWNHu4AFX
	NYDOqeIn+mOJGhw5yXGpBKO2D2K0Lw4va2gtVm5hNloYxLwfkhk6b1zB1U0sY97SRFe+uk14rRjHg
	0rSkQ8XleJAjoZv/pPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5euw-00000004tnx-2vNz;
	Thu, 26 Mar 2026 07:14:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5euu-00000004tna-1qIT
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D58B744257;
	Thu, 26 Mar 2026 07:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4913FC116C6;
	Thu, 26 Mar 2026 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774509247;
	bh=j+EykvnW4YLCD4pDE6qCdNMazBf3vURnXvo7Vi+hVa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwNMIsAiDx7Q7afpSnd4E5/mmjr2a7nfRnWoHuiFuw+WeF1QZhVlqTtW8jaSp4XVt
	 bFuSWvLysrvj06IbVqeATkedP2TjUeAofRoJ5n2PXmS8VgXRZDOCakdn9ffeXmeNDz
	 JwWh4YpISLXkoSEyIKi5JlC8kxIi+CwRXc+yuMA5xdERk3mXwrfv8nUknToolK4ZOA
	 ZCeiCv2eS6qcqtE9S9kgVrX8Zvu2BxtR6qXWk/guf0qRg4OvHDdxk1wJHzyK4hn2ox
	 fgH9ucqP5gRo12G2IwjTcUrlXEKZdConH/XG2LNp0UPsuK5Dngl/mqRtjUpiVWxek9
	 KYY41O1dV2X4w==
Date: Thu, 26 Mar 2026 15:14:05 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Message-ID: <20260326071405-GKE777612@kernel.org>
References: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
 <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
 <20260325234835-GKA777612@kernel.org>
 <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_001408_500735_2D2B2EBE 
X-CRM114-Status: UNSURE (   9.45  )
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

Hi Krzysztof, 

On 08:02 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> On 26/03/2026 00:48, Yixun Lan wrote:
> >>
> >>
> >>> +
> >>> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >>
> >> This is even more pointless because there is no user. Dead code.
> >>
> > reg_aux_vcc3v3 is used by various devices, but I can drop it too,
> 
> Which ones?
To be precise, I should say reg_aux_vcc3v3 will be used by various
devices in future, but not in current device tree of mainline, e.g, 
USB2.0, PCIe, 10G Ethernet, Audio..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
