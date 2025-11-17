Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F8CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCcvx8BCMej8A+uY0oTIM43y5ZNVx1OjcJsRKnhMW6w=; b=lFSk/y9ZL+V831
	1LOuesHdc6DV/DbC9j4/5pGM0C9FONiMt11TVLp2p21pPqGePOg0VL1ai33U93G+cvFltOZP6WrAz
	RUbB7JbmhEn5UlmP2dc4ulZK3Lov3cU0NZ+sCdlkVMvrAWJiqN4YUEp4Be3n3PITRbz3yld3F1EcW
	PtQAg40Na0/7Fu5Y2tUIuhxlsoxEjgHUT3F/PiIn0iH2QnfUeOCAXpvTq7PWE3uySNRh7bbkxvAJj
	+gEiOepLngtPGVxLM6ws7hhuQg2irC4ow3N5trE12fGSBFmtjoR8nCeJTYguWWtFxcRkux3L33vju
	3uL13Tt5CHMjnCL8xsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL82k-0000000GySU-0kph;
	Mon, 17 Nov 2025 22:49:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL82i-0000000GySM-2zME
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 22:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 914DD605CA;
	Mon, 17 Nov 2025 22:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8140FC2BCB3;
	Mon, 17 Nov 2025 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419791;
	bh=c+NaU0TriAs8ICepbzbf9oSBIbi8FE5b3ihXcNJEAqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EM/VMzVxSdpPvUXGhQKI5DnvOcrVqnxSdHsdS2c2EkaX92mDRnOiKE4UHyinqY6iu
	 YhUtXo/0f5zcQwOIv0UxLHrIr+g8zE9yBS+/ewzdaI0hF/liUoS3tj60ktDIpUZrBl
	 ul48+y18WJ3hL64orexIK+QyiUsgQ1XE1l5D8GxgW9geQZ1MllVIXvXxgAujRLbD4n
	 h3HNeZyhHc/9Wqh2IMJFUS2ZwdA9dagjsGogOi+0N9C49kDg/gsfwUCMBKLFark7Gc
	 SAcjVn7HKU9BmG/T/wTy4kYasaKxCdU2VoZiK/aG/CwkGiYmgS+LRbYH8MczX+D2Cd
	 RRWqgEz+tvDqw==
Date: Mon, 17 Nov 2025 16:49:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: cache: sifive,ccache0: add a pic64gx
 compatible
Message-ID: <176341978797.862829.13625647277395076899.robh@kernel.org>
References: <20251117-colt-carnival-8aab0a900816@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-colt-carnival-8aab0a900816@spud>
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


On Mon, 17 Nov 2025 14:24:37 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> The pic64gx use the same IP than mpfs, therefore add compatibility with
> mpfs as fallback.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Paul Walmsley <pjw@kernel.org>
> CC: Samuel Holland <samuel.holland@sifive.com>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
