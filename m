Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8614CCD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8B7AVKjHY6prE4pv3f1Yytd3NBDpo1noZT8WkvE3MI=; b=4GPIb3q72VIlBV
	/Lm1pIXCrh6/p2vEivMbwMjqAMnaNGzDITSSuncudAe0UJG8ISxjLXw+fP/NWd9jdnB7kJA6HjH+r
	htb9MjvsAABcWRdAOl15LS0Ra2Y/F5PPVhk2dxHTOOfSvDx64WkmLg9ptrrWfbMS4oAwu7CjpDIj/
	zs3eKKPRzgmyge6CisClnoHIOFiQEXWSlw9OXMZ7BYNcx94KxL0Nz2owvpq1CQMKE00FyB/VlG35q
	Kg4Wi1xDmVoi6P0TrNSWIz4y1CGQO3s3zJw2khP4MiD3KmF7Hlx1N3F+QSw7RKwG2PcDdEPS6cqG8
	1OAAhBjLop10RnuSsvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoXO-0000000AkZa-01ng;
	Thu, 11 Apr 2024 07:07:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoXJ-0000000AkVf-42CX
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FA43CE2F2A;
	Thu, 11 Apr 2024 07:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456FDC433C7;
	Thu, 11 Apr 2024 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819271;
	bh=Eg7nKhlQ45pThDmInT2Pa1BtHQZJf9V/GW2+v72Y/Mo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Hx0elqZ25lfBI3qu9ExJoALiB8EBOQTiRMso2dzTuIlFts6YWT8fYoAWmp6VylQ0V
	 mspLu0J/kFkSXNjh4edmv7H+aMZfX3OWLKc5WApPfwJ8NP+gPy8XrcP//ZGd2L2f1K
	 XLXOorBu3DRMQVpe+whzSj2KbFz62zOOL2yao4AXWT5YG2eXbajiEsyl049k/llyN9
	 vPjUatvjFqJk916L0u1XksBfmlWaZhwXTuIIum5YZHgrIzMHQ71voeUs6qjLCiG4xo
	 6FMfcN07UKC+gbJG97xmJH3wF889JNj7C12FogkwY3ODqjlDaZc6/m2TWoiq3okpwi
	 5G3rZrXsT34QQ==
Message-ID: <fb7ffc03721f54b3217725ec2f276f66.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49537156E71B64483F15C0F2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB49537156E71B64483F15C0F2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v9 4/6] clk: sophgo: Add clock support for SG2000 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 00:07:49 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_000754_287810_D89C9B89 
X-CRM114-Status: UNSURE (   4.82  )
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

Quoting Inochi Amaoto (2024-03-09 01:02:54)
> Add init code for SG2000 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-v1.0-alpha
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
