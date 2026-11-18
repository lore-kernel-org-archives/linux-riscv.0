Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98544606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2uGjug/q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NY63LtWv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CaVFPdX9AxUuCIyBz118s2w9PHvt3KKcxMRSlAc1AbM=; b=2uGjug/qo9WJXXG48gE0B5vRhN
	p6MfcXmVC6YgAtuybRjGmz7RfT/4VOYYldaBteg/5DH7CNKQ64WN0j87i89dc94NreV2kTiMEDSv9
	KNNIUHLuncj8G/3gTR6gR3uwIX8n3g1WmuYd1gSInBZwsbAjJ7aQ+KYjWs+LqM+Dh9H3W95H0VEkI
	7Av6OSTNbZpEHm1kIpGjE47kyzmAoGq/7Bn+WA54PmhWxbw3wlTHW+NXMpxSi2FPjDAaJF/qAdUhT
	koVdU86vA2v3W5kfcizwRSjVHxXoqozkxDUlnrvGdWvx1GLiG3PJ2hmcbephlaT/3Szl24k1mW0rt
	zgUnPDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZmx-00000007ybU-0WO2;
	Wed, 18 Nov 2026 07:09:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZmv-00000007ybF-2o0n
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 07:09:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 560676143B;
	Wed, 18 Nov 2026 07:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA0E1F000C6;
	Wed, 18 Nov 2026 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794985740;
	bh=L1kBsRXVv/qLCpMTuLfhWNyDVKrXmHpax7bqY4zUUAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NY63LtWvTG4DFCjCGGxa7EugooCUSrsgjoZvkE8UizC17cfBy+7bu4ADEswLSz8R/
	 sGgOyKgjcCvt4/AOYrkKRemqsWM/ioVmwgAoTtHv5TS41HBCROAuJZ4zZFWpu8sYgO
	 ZafNQt1fvGwXYltJ0Az+OmGo0EKM3lsnfUYBCdKPlSmDGgMGbVLX/7ittsI7c+bgwF
	 tiGaI+rUFVn7iEU4PSjwlb3P7r5LNje8WemGgZGvTIzbJmoNknUUCMkWGEincDQ9YP
	 OhG8+VTkM4D1fuixJtHBsHojgksB/mPCfCA6vTjoc0Eq7a96u6+Ty8y50JzMDeXRyl
	 NZKzqMbjWPRkw==
Date: Wed, 18 Nov 2026 07:08:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Message-ID: <20261118070857-GKA156369@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
 <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paul,

On 19:44 Tue 17 Nov     , Paul Walmsley wrote:
> On Fri, 13 Nov 2026, Krzysztof Kozlowski wrote:
> 
> > Correct minor style issue around white-space - missing space.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks, queued for v7.4-rc.
> 
I would prefer the DTS only patch goes via SpacemiT SoC tree [1],
which would avoid potential conflicts..

Link: https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
