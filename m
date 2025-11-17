Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8667CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJrSolouzF0Gq6zl/BrvKG0FaspcFHRVefpQRLS8sIo=; b=ZhoF7lK4YK2/2g
	9bZ/7/tjNiVVXHzvCC56DpwcUsIRo8j+ZhMq/Y+PEdug8TD1hf22KHBPOf9nKI0SwCH9vO8a1jr2M
	z3QOolulVp6Ztwk3Surmuz1lBLjhwwFUbpDgy95L/uqnUlHlzJJ0ABvMmin3hKMm+D1rsTfrQP/sr
	8u7vM/gxbwVTfcVVU2ldnb1oUXsxkn6OO+fploqR/OkIPp+OmuvJTiezvfI1/4QOlzkdfFOJ6yOyj
	AP9X+6i73EUDlTGmhXwPiCx0P7mDXrG+rmQ12SCcNCplMXBEHVOouzuRR3Z666vdi2HP4zqjkoqws
	9acT22qszAsgqfKFpABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7WH-0000000GwDe-3vlG;
	Mon, 17 Nov 2025 22:16:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7WH-0000000GwDD-1kHo
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 22:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C22F6025B;
	Mon, 17 Nov 2025 22:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6DAC4CEF1;
	Mon, 17 Nov 2025 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763417780;
	bh=kh3T3UvtdvrpXjQpgvHGlGLzTijiY3FyEc+vFyfgu9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbZobeRk7Otovno/knQ4CjH2U9ziv4TzMqhLXhvKZpznOztYcsxNnWt9uk3Mehrhw
	 VacWZ5XugKaQy72Fcxn4Jz/q3shZjqG+0j5XJvXVbnompYkcLMn3F77DQkDwlDl+a3
	 9TiBhnJ9lofsKdsA97ZmG4aLeQBbmV25z0C38Ye0GqFXKN3b29jUC1YFXzW+4+8e48
	 Q+q9NJPyPYbq209mU02FMhL7Wqh6DT10RzU0mQtN9HkE6CZzmt76jHLpkYK9RpyNAa
	 iwr+2ATnRncR/ngxhIFccPrffaSJaymEpppm1cqNr1RqMeBdc9V31R5tk7pVzJhIKe
	 9rLEJXuUMyx7A==
Date: Mon, 17 Nov 2025 16:16:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mbox: add pic64gx mailbox
 compatibility to mpfs mailbox
Message-ID: <176341777747.818372.10784269144119060270.robh@kernel.org>
References: <20251117-screen-appointee-837a7296ca91@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-screen-appointee-837a7296ca91@spud>
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


On Mon, 17 Nov 2025 15:46:54 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx mailbox is compatible with mpfs mailbox, even if the mailbox
> consumer is not - the underlying communication mechanism is the same.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Jassi Brar <jassisinghbrar@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> CC: devicetree@vger.kernel.org
> 
>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
