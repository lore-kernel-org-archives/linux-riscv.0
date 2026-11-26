Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB8606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QCecfSmC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTEegIdj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7LLH/LAHEWKw6S6DvbGmDyO9TRQVJVDU3CIMMsHDY0M=; b=QCecfSmC/45rpXMBWM0IzAJqFv
	rdjsVvAGxNHuVYdeobmE/denXsd4WmUTxnIXt6VJE9t2d9eV31Xz4lfqsoL0HtHU2+S6dNow/l/gr
	CNrCMIukE2WdPr/yhlQNatIoaS9xBNu0dGNGzcd0SeMfr8sKuA4dDmYDrTZTjHZpnT2pI107uNMva
	um57pk5ehUugM9+Dm8yYOMsgIlYWknO92+kPhEr1OsOd/t/amQq0+fOK6iTq4zBewJJK095PhOfzt
	yG8lStJ20LHmvWGHk0+UWHYWwwbEYQd0nISdhvwPMMyfNfI7BHxDH05xiFxzj2wRSE3zDpEWHsQR6
	qLc1a/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYz6-0000000DFZI-167W;
	Thu, 26 Nov 2026 12:53:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYz5-0000000DFZ6-0MoO
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 12:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3359406F5;
	Thu, 26 Nov 2026 12:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDBD1F000C4;
	Thu, 26 Nov 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697634;
	bh=O+d5676T5CMcSy/94TsW5KMv0BgyZ1tcN/EjPiQ8WdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTEegIdje0HvM2qaftMcVv2uLKABRroZ03kJ9XkK3T/hbWBTyB8VuriZGtZlekyPs
	 jNX3hzvZrkFe4yK8iTXBxn4tJHhAX9amXLpa4x8QSjvIO4M+VnhIYOOGQy2MsKGfqv
	 y9qTWIXFWA9qDoDRnXmnCQt1WPJY1av60tKgCpbVjJfqux/laPrY3qrcMuMpROQVf9
	 mjL4VlrO5viC9+dbpDD/CsjmTAkB9wZOPVcYWIEnyWdjywwrL0/8Y1t4KbXnFbcphm
	 FaHjP3c37mfU+rTGFPy/fs7Gs+FduZa+fdtfsf5ZSjGyxTfvDUV8FVgPyqaXaQfkQt
	 lENMWEMyEiLDA==
Date: Thu, 26 Nov 2026 12:53:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
Message-ID: <20261126125351-GKA2398@kernel.org>
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
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

Hi Iker,

On 19:59 Wed 18 Nov     , Iker Pedrosa wrote:
> Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.
> 
> The GPU is integrated within the SoC and enabled by default.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
