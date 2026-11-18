Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E2606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJPUh80c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3CqjKIz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B9O+jKm+B9Ujovr8pnIWzhMXizONIyx6DKxrFJcPU2w=; b=kJPUh80cAKRoG6uOprGqc5xkXq
	utCfOp6n0BKcSz1EhQkdwpeHMVsu+lvJENetEez2xo63GnA0Sj3Firk0s7yoNh3d4Q0it5ZELl2Y2
	5mkFJs2A2gIZHPd36FGI2nFMnt/jJc9Ka6Vsir8wJPtZif6wtoFuhIDL8emQM5dyqsDVuabri51kC
	i3NQrcEtc4S18eO3HNyN6XQho90HdrDciFIGsIgr/n7bXbPZgNrDtRM0EPW0ZfzMJ+dI3NxocTyc9
	P1K8mAbECw7pSTpnIHu1x5LriJEBi6My5PxM+bYvgCfD+2CJi7zm7fpXAj/s5E1gHCF/MDryXg+hC
	Pe+4e3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZFU-00000007ufh-0nfG;
	Wed, 18 Nov 2026 06:34:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZFT-00000007ufQ-0KGk
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 06:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A937D44F19;
	Wed, 18 Nov 2026 06:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEEE1F000C8;
	Wed, 18 Nov 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983666;
	bh=2fdla1NYjjCieel0GDgyV2h5zcu99JPKuhUzM+in2nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3CqjKIz0iYatvK2Lmib4agpv8+7BNEEwdvY5jjKdnRn+vKgGa/P/jB2QQzQobRZY
	 sk0NHrJWfxHUdPi1N2vdcZZXq6GakntsC1Uxk1N+zQsYIHoz9FmSNdvLlRWlaCVoWP
	 TmCz4lq7ZPlwDt1jgzI8ubci12UNc2SkwuKmS5r6v4IvH9skvfJ3wx41C0tVF4aV3F
	 X6vYOYo/SRFFxDUtfL6fMYFeV0vzhq+oif3UFMHxjJBt38QfjO2gPzNLe7LbhEGL4w
	 IjW3+dlL3MsMNEXFT7BPrm8q2MKPem3pR4yeuotPmzmCjmCOdno6lHdsf7zoHi5B/8
	 gPleBnCF0merQ==
Date: Wed, 18 Nov 2026 06:34:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Message-ID: <20261118063424-GKA155714@kernel.org>
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13:43 Tue 17 Nov     , Sandie Cao wrote:
> This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
> regulator tree, add USB controller and USB phy, Enable SD card.
> 
> This series is rebased on next-20261116.
> 
For the series, with

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
