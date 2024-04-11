Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA3CD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psI/lrXfZErw61yJ6vjtGxw0eU6KhmpM2r3Vc06twI4=; b=cWKEhPXu5OZ+2H
	1f9RGYYOJWoXPQS/OeAmi0ka7h6H5pzMJrDeziQbxezWN6eF53igYo8BXzQNqYZ+4iHI0bgTpLCuL
	J7f0A45ExELmgmUAwuJ95ltL9Bi6nBOIjGz03pIxKAgRQtpHet1p2MQ2htP6PEC8OKZKhBiwCrCSM
	dkxKNZV1tQ7IdZ+XPxvbP6eX+IKZKaFiJ7Fujllvk0mOT3xiJeTIFigjsN2Gn8k8QbOwpT2H21Sk3
	fF/PN21ddmxCXYPtZ82QA8ledGC2pEqlukv0y3wWBfyj+0IxCn1+XbXyDsXzPKvnqgkii38gNuaf9
	7fxwV47Q0ybMjiqaRTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoWs-0000000AkJA-1sbB;
	Thu, 11 Apr 2024 07:07:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoWo-0000000AkGz-2QWM
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A199CE2F2C;
	Thu, 11 Apr 2024 07:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE093C433C7;
	Thu, 11 Apr 2024 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819239;
	bh=ZWKo/BX8/wnIgRSCduC2T39SHdhV8zk/gZ6Kmh/NggA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jzJYR4hUhmT6Kl4If/IktSrI4kI39dvhnqJVPZi8XL3OJQ6B7z/bCr6fzqW179Qus
	 0CvwEsjxORzC7U2Fm3KZ0BSdg9XS1o76AbbHGT2/QQNm/aOGqj0szRN6QghWpMxShD
	 ImqMahK7eRn3PA5zSXDiZ/KtFFb1c5odGVD7iK8ArEk0RGqXsL2q1Wcy8s3DKFUY23
	 AZQmuyi4JpBNKQEDR5v5uhrCUFCkQMk4M5ACA1KTL4IqVgYzedtwcMbHPVrHM50z5D
	 Z6XMB3hbvu45PyYviTKnoGg07mxjgnFCmHCpUnk7G5G3zDYzz2LdTWJlWstfhSUYRg
	 AXjPsu72VkqCw==
Message-ID: <2fe3cd148e400a93754e4d97fb3275ae.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495368F185E018767CC6714ABB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB495368F185E018767CC6714ABB262@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v9 1/6] dt-bindings: clock: sophgo: Add clock controller of SG2000 series SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 00:07:17 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_000722_841472_255BF9FA 
X-CRM114-Status: UNSURE (   7.03  )
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

Quoting Inochi Amaoto (2024-03-09 01:02:51)
> SG2000 series SoC has the same clock as CV1810 series, but the clock
> related to A53 is functional in SG2000 series. So a new compatible
> string is needed for the new SoC.
> 
> Add definition for the clock controller of the SG2000 series SoC.
> 
> Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-v1.0-alpha
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
