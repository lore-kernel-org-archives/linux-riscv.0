Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3072E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wv/0kNg1SgizBb9yZadINONxgRoPsZAktnjudcrmqZk=; b=gRbtjQrJfZLF6f
	mEc+eL1bFBEYEXuCvk01ubuM6LCZrywKS2XVzOGRmXX+tbu2+Lg7jWTol8ADinJobm19vGWtA2GOm
	Q6h1/0sw7t1qBZCO5WnxCWFxbOBumKy65btSfp1EvNLcPOtKjhTYG37cB9+s+WAwcg0e38Qx0qqC3
	QD8Hf3b2PahM9Jef1CDtxoFttcNIKtDnqUyGBQOMjrH1aXCFEQ35jfKLXsf9NyO+c0frOCw4K7ZY8
	hpukOx2K3pOprRq4pzlk+s+bSEVEqpuJjZxMCUkULgAxugV2Ij2qKL3Z5Ciw9+flUlbxoDlfxwddZ
	LR2Rf/h+uTQ/1o9QXOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZEe-0000000Du2b-1UjP;
	Tue, 17 Dec 2024 15:11:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZEU-0000000Du0z-2cfk
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 15:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFE965C5F95;
	Tue, 17 Dec 2024 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A862C4CED3;
	Tue, 17 Dec 2024 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448293;
	bh=n37HzBm18BtfmluuyWiYddzhbeZWwmeGcfBuacYm1Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+pACsDbzrfQE5Qj4taP298Q0TAiuff9YxSqXAmNa/VkGDbZKMHEsvr606nFSDMZg
	 CQ2sl0xZQ+h3xkqKxxys9IFszCjNW+Cd3krCQeiIL5LaPZeWD6RyCPMjv9FiH0gEFP
	 3ez8oXhKZqtfbXNeZaUFCv5OedZZ70cSMPtzAfc9Za5pixuIsBzdcUD92xaDTFzm1g
	 p88qlBR/Wmrf/q6Bj2NUHb3FUVzmTXIRSJ4V7FjKbk6BeYvpVLdQSM5D88gMIu4exw
	 A5qpXdtBZ4iFLQXg13LfSQ5hlHbU1IPa7Hn6UzKptXZgtOcVLBtAjIOrdvLwf8nZho
	 7ePMaE4fMbMDg==
Date: Tue, 17 Dec 2024 09:11:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Huang Borong <huangborong@bosc.ac.cn>
Cc: tglx@linutronix.de, trivial@kernel.org, krzk+dt@kernel.org,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	anup@brainfault.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	palmer@dabbelt.com, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: update imsic reg
 address to 0x24000000 in Example 1
Message-ID: <173444829149.1744130.11707403858440316768.robh@kernel.org>
References: <20241213090924.181249-1-huangborong@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213090924.181249-1-huangborong@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071134_703285_52C2C38A 
X-CRM114-Status: UNSURE (   8.36  )
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


On Fri, 13 Dec 2024 17:09:24 +0800, Huang Borong wrote:
> Change the 'reg' property address from 0x28000000 to 0x24000000
> to match the node label interrupt-controller@24000000.
> 
> Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
> ---
>  .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
