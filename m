Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4049BC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY/D6iCISmcLTQGY0zcfZ5H7gup4eAmmwwGwtbHRZIo=; b=jkJq1xCIDcS55Y
	ZLQYU+kSqsmlBkfgCWaHe2phKomGPOVsTIctg5A6dgKkDxnc3O+Q7n2QmtYPgOR74BLc9XEO/N8XJ
	9x6ob0ZvH7fUHXO9155ZzveV6G3stTm2u+hfJ4zWw6p1Mam0QxJwV+ZlBOa7fshTvGotsAVLeMKNk
	9Sg/kYRXYlQLDfofzwH2n5oeHGxQMOsl1IT8mUImYCPuMPsriEil6ytl1720aHD11iiuW4tGF6ME3
	N2AEWi694SCbxNnPvV0W//2y1vsW69DEtp/IWto9pMqYurvRZnmL5xBCB2fWcjnDASWzX4aTxR30p
	Dm7f0KptrdhwnCxvdm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP5g-00000004rrg-06hF;
	Fri, 21 Feb 2025 09:13:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP5d-00000004rr4-3j7y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 09:12:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38AAA611C9;
	Fri, 21 Feb 2025 09:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF0DC4CED6;
	Fri, 21 Feb 2025 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129177;
	bh=mGyruGLf48W9PdHCU/1T2pGmF4R+E3nW6UeeBVAtmrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOvrXniaMi5ISUyFw5P3LDYA3GLaau6Z0hBefRURq22U28Gtx89/qJZqaKQAlFjFn
	 NzsqPEeTOS/uB//GvmU2vykTyWBtxHH0fzQMsL9fpmSdqgr4kiX/qreqMIQdIsEilE
	 0gpESbJ1rO+tUsJYxEIkKHiuweHLkPPSQo9UZ7D/Rix6NDr7pNTY5HlzlpDk7+bwe4
	 2dmjKx7HrIYGyUgRWzAwCM31jwcf2L3OScZDa+jKwqi2TiloIutJDvIHu/s7Pw/cQ1
	 rp1f+v5OPY28kaIS5uiLSkMMIqMDOSRqRNEAxfOYqZ67w/rjNERHsYnAN7zXJQKwhu
	 n0zmklCfvEevQ==
Date: Fri, 21 Feb 2025 10:12:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Message-ID: <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:18PM +0100, Michal Wilczynski wrote:
> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
> Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
> downstream driver [1]. Recently, efforts have been made to upstream support for
> the Rogue family GPUs, which the BXM-4-64 is part of [2].
> 
> While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
> drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
> this support is being developed, it's crucial to upstream the necessary glue
> code including clock and power-domain drivers so they're ready for integration
> with the drm/imagination driver.
> 

This is v5 of big patchset which became huge. I understand you did like
that for v1 which was RFC. But it stopped being RFC.

Split your patchset, keeping versioning and changelog, per subsystem.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
