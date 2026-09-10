Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFDAC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBzlUmutTnzS6xCXzDWbD1DSFLC/PkDHKgfQsddHG6I=; b=umkxgZaaEkfk6I
	NCkuFbwQvtRXF3eppV9oI4egT6XpndVjMDkPdxE4UvDLH42KF20SVF7aJ1nXgbeSHuzmQ10HxJIWw
	OlkhJWt8EOwYA6k/kceBRfrxc9mVb+RITek4RlIOVubVo2lAyCZxa5UYPbgk5E5PUvCB2vab2f/8e
	UOCqMs9aWDkTHw1gklx0cHxuG0cDNnWdxr1L4rNSEh5TIYioUTNLTsjDcFZxgzf3zdAA0OllLeZad
	zmv20oBFcypdCllJ+cilveS9rr4JhlF/WYuIl6HfQ1AMRG3wx3XWavkx+ofPqrdHOX96SEVfMkRFc
	5t4/bwObWbZNy0lgWdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dTM-0000000EHkX-066O;
	Thu, 10 Sep 2026 12:01:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dTK-0000000EHkJ-2f6s
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1525F42AFA;
	Thu, 10 Sep 2026 12:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C591F000FF;
	Thu, 10 Sep 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789041702;
	bh=mbMPjc61ROWaAektEClaax4ipO7uAl89nDvqKysINdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGzYFwjgwpEp7eP6+S8Dm/0owf3KGEz5qDj3jjEVs+kSRw6zzPJ6E3CfV0sCN/5pL
	 MDOZPi/ieRAYNGLGgDPc7XeA0OVhSWdI0UYVHCFXB0CLm5amegpZPSuzxiS1LB8qoQ
	 u43vFw+JIyyuKYhVPgxga1QiKJ6HSo9D68J1VsqnAurQcRASrOUCx1E2J2P6g2bfvA
	 gOUYy8Eic0eR/OW1K4NR7nwkBs4/juP/hX4iqp4OXeJ1Mg60ZGsv2eB8n/2MWAtDfg
	 649XT3AlOkWS+pbNLtlGrbSVuSPU2HaCTv71qB1dzloKzG2gU0XwRmilSyq98U/4X5
	 FJRzNmzk19FTw==
Date: Thu, 10 Sep 2026 12:01:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Message-ID: <20260910120139-GKA20735@kernel.org>
References: <20260802100101.327815-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260802100101.327815-1-amadeus@jmu.edu.cn>
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


On 18:01 Sun 02 Aug     , Chukun Pan wrote:
> Sort the nodes for DT. Also reorder the properties of the sdhci0 node.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Anyway for this patch..

Acked-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
