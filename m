Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A73C369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmYepOw/zAIZfolxbHgad5apRZ8ugtpqX3M02A3W0N8=; b=KRGyvKaxKjlbD/
	hrxBsZgbYKdbj5Tq3O3mTuuvkr55hgIhun5X3D2KFK/fceZSNxJyzidEMroxuEUTsv3C1Mmqgwv2K
	CjKp8Xav4zHxjOuM3tarQIMM00ni9oa5aoIjDSJumZHMgu/pBKmP+prsI6JFPj62eFCmpts/t+4Jp
	yGvdTVsp66Rt4R/qvJYfk0bHcoxfkFMCd17O+11BE/9DmJ1uOBQ6X1b6yQzBMHhUXUNuEB+QfUkW0
	GbdkXlDUY6DTnVkePpvUcbkzo5WI4lq7AmIJFs5GFziHtYZfeOEGgRB1KHw2H/dw6+CnMsOlx8xL8
	8m3Jlh3vpWxFdCtSr0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LGD-00000002W8o-3m5I;
	Mon, 14 Apr 2025 14:58:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KBs-00000002EOf-1R14
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 13:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26135A49E89;
	Mon, 14 Apr 2025 13:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFABC4CEE2;
	Mon, 14 Apr 2025 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638575;
	bh=o8ivKalBhI+guvKrIwk44UYG38JFMxuYu71uRcbYqY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5YZ1X5IJtQo2hx7VfRuefWpzaxcV/rlVeJSJMXSj/FkBff6I5nELmLNPZC7VRyG8
	 eLrKUHoPhZbIwuZEyfNxQsnG+1x+nelnr9YBsuT48kHWQimchVYzfNki+ckAQSUsKN
	 DjYttJkGOqP1f2doAK+6zWYQgDS/vf5trdiT6ez5oh19kq8+HmZfcVw6rEyHWGm8Go
	 l/hQjT/hu15tYjY+KR9GSpsBXTs+JFjQ/AfX5Tn+k8kKM25krbAS/8mPfWMylvBjGj
	 hes5KS0cImv3fgTWwky+8MSJaPRe1d+IT9u1ELanf/3N2eywiD5zosT7r1dmHv3cbe
	 jzDLYZDnbCGnw==
Date: Mon, 14 Apr 2025 08:49:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Remove obsolete cpu-topology.txt
Message-ID: <174463857063.241931.7472620485655725624.robh@kernel.org>
References: <20250410201325.962203-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410201325.962203-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_064936_446510_A5FB944A 
X-CRM114-Status: UNSURE (   7.99  )
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


On Thu, 10 Apr 2025 15:13:22 -0500, Rob Herring (Arm) wrote:
> The cpu topology binding is now covered by the dtschema cpu-map.yaml
> schema with all the relevant descriptions moved to it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpu/cpu-topology.txt  | 553 ------------------
>  1 file changed, 553 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
