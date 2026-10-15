Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA29CC6B3A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FMD7kQqxyhRuNcjfwccVckrqLiwlHhReqvd8UdSkhk=; b=TBEup1LskLJWJZ
	lzToMynV4q8lZRzZAexBlnbCpntqZOTMLCxHU5qzv2ohpBc1XJZ/ulenm6Nko1+jZfsuhY+ki1mjw
	HOYPe8GVg2cr/UyYEA0XxN8PWR8OSRcoXAhF3r6PP80HcolpR5NQgTDwPRMLG1YX1exUG0rmcmDkI
	WdwfJRoHhkGndzGw4CnRQ+2sEbAfvsM4l1kYY3nj4HkT7rCQdKVAwZ7ah9OmgHt2/BZX2rnNHDCVM
	ZO6ohWXG4O25+AVyKhAMWo7kSwtOMUMUInQ/MMsEt4F9627CSQSdpy32YvQXW7WyVBIRT998CsrnO
	0QKvkREzbTqbUwJP6b5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLtu-00000000Inu-2TBu;
	Thu, 15 Oct 2026 13:53:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLtt-00000000InC-1h3g
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 13:53:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D5ED60A65;
	Thu, 15 Oct 2026 13:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E241F000C9;
	Thu, 15 Oct 2026 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792072420;
	bh=p7Qlw7VXf7AY61LSa5FCk7VLQuFTd8n0dC9+kQeBHzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSAVjZAmBfm5ehhCuVBXrPqH0OdDBBH0bB9l2UYHkMovPwIkndZsgK+yFO+q2cRs9
	 fFDPojgaGZfCC7rwjiOJieJIgOp7/ruO6AKfbzF0VMy8daMwwj6HnWWG4Slvm0ohST
	 iOz4JaombKV9cyVv+/agoWrNSbnHSkKzkNqcgUMcW0fbgEi1uFUxoJDfJwu4jUpW1O
	 MsRUMaeI13UKDlT5fu49hsDOq/Dxr+mWbNDICUU9t+Wp1/9V9b+26wbeu9kVQXiQnn
	 KxePPtNaRJ7Qa1vE4p6TKRI8jhyQF/EgWUj2HNs2aLUUSwhlckpO84TAsTRtq+QDy2
	 y2UZaA2pURxAA==
Date: Thu, 15 Oct 2026 08:53:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
Message-ID: <179207241674.34261.14585638486927486054.robh@kernel.org>
References: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
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


On Thu, 15 Oct 2026 15:00:48 +0800, Baihui Liang wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
> 
> Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml      | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
