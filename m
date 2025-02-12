Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A530FC021A0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3WgpWqOwfNwBv5teM2KXGGKxZIEvTsMMoICzQzr1Nw=; b=zePB268urbQulr
	nd7pMVvEZTdv0/aX0ZGJ+p7du+DS9nFZT6+C+9Mb97cDvlW7cQMahBcjcRshuZEoV3rth0cHiZcdf
	jDmd64ydM090Axh+mxHPzAr6+1aeAckwA+W9uSx4L3eQsRYhHRSqcULvQA11UdEdD304XHXziV30Y
	tDcWRDkYXbIC5OYGvsxiBO/eRioeb+tC1Itk/tP8vPrvWgmCVOuFSgcXrb3ZUz+NQbP1fE6ZJd98W
	iHbKgJac2GMFHEwOm/BlVQZZFQA4Gd8LjECfMrhJgp1S+M/870jtjvIExVH+VQvNYkjBgktBUGWIL
	ByIbxO3yISo13pJudmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIlH-00000008h7r-39Vo;
	Wed, 12 Feb 2025 19:51:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIkE-00000008gtG-0jzB
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 19:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DFF33A40AF7;
	Wed, 12 Feb 2025 19:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3D8C4CEDF;
	Wed, 12 Feb 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389800;
	bh=qRczGa8mUmvt/RUG4HaVJ427lqSU37GvFDIl21GUKq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVoxhRztG/7//AGN49krym+TNi1s+LJrQAM3HqpwsIdS7G6ZU4qfY0pkU/3oTB/Mm
	 q1WSheZPe1Xux3gDHC6gsAIwhfN2DXhCTgs6//19+ebMgvfeR7GAZ9I944iXdWsyRk
	 BlfrQZPoevzWpmdXoNKaVESbxF2UwOxar+x4foMyZrJU+kadCPnvJwOmnCZ98HaFem
	 bBIlKBSvgcMIeYJHzmQW0Rvkqv+M7fC1iTHjb228tDM/90y7751VxV+u6ceuAEwjSV
	 uIQXjug9OhPMZAZtnIfNW0WHwDLp7k6GveCam1JjAb1t3eZ0XahFNxIXUvh/gpjxm3
	 6/Q9CWb5cqVKg==
Date: Wed, 12 Feb 2025 13:49:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Longbin Li <looong.bin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <173938979936.135912.2099635079026768337.robh@kernel.org>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250209122936.2338821-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_115002_283888_E21D92C9 
X-CRM114-Status: UNSURE (   8.54  )
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


On Sun, 09 Feb 2025 20:29:32 +0800, Inochi Amaoto wrote:
> Add bindings for the reset generator on the SOPHGO CV1800B
> RISC-V SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
