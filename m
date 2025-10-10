Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20582CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8vKYK67pb7t5WPP94OppIDHJffMEadwPq8rsuKDqCo=; b=K7b162V+WXutoh
	nHE8IjjnP3XLEJPQGGaqwfbsuDZ2TRwAbAiMDjZoxXkWJH+3+Tg2egdA3eQ/dl4rbOQikd13PBm4z
	XEfdbmhCzpW0othyWPXRs4mR17KF6WcX/tlKI1iNGUKGstrnGNEiUa47G+pwnAHC+V6/HOsbnpQbv
	NlYRNdn4uNFSdnkWcqUdU9bqTSf66JLEah5WoWL03NNICu1JB0norJxW28ACiv9W8Bz05hh6iYSWW
	NzD8VREAF6ufg6pxGbN8ixpBTbCjOn+L4DpKtln5Qm/CFLPWYWWVA7ZcT9PwbOmm2JzNqozJABArO
	Dy0MkfJCV/Q2PVyc+u9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HWN-000000097vI-1xD8;
	Fri, 10 Oct 2025 18:07:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HWL-000000097vB-28K3
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 18:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A85BA602DE;
	Fri, 10 Oct 2025 18:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F355C4CEF1;
	Fri, 10 Oct 2025 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760119632;
	bh=FN++C03nbaDoVjSBUwMIY8GsFp4VFrAjhQGqg/sS1n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUAvtwX/c+Xyggkgv2RJR1UV2+Hr4VRQXyKbfA/BE+PVAlFH29ggmk+QmpbMmT8VA
	 7we7PdgcAsCsLaugYv9uFWnuWlm/l2LMSrtpJ1dAXE2cIDt/vMfYCyhPsTnxzgEVrq
	 dd/To17WRhMl4AYKYSk49WANTr6ULqMvFFzUl0Hv4LKuAyx53ohiUMfCPWyi+AszMl
	 bYJbh5FGym0ifRpUiCAHPWMDBFuuCekYwBCXa+0BG+5GV3HomYSqqO64N+jr6x34gs
	 TVuiDP/uFwa3PkTzZno/qTVyIgfcIH+y9IzgpTiw7ElX0Ww2mSMg1GP8jpEvv51ktf
	 nLtMxBBDdr66A==
Date: Fri, 10 Oct 2025 13:07:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add UltraRISC
Message-ID: <176011962981.619057.17240345269763319785.robh@kernel.org>
References: <20251009082013.1331361-1-lzampier@redhat.com>
 <20251009082013.1331361-2-lzampier@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009082013.1331361-2-lzampier@redhat.com>
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


On Thu, 09 Oct 2025 09:20:11 +0100, Lucas Zampieri wrote:
> Add vendor prefix for UltraRISC Technology Co., Ltd.
> 
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
