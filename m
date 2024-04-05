Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829F9C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohqcL8Qv7qNSKd7W4S4c0Qv0hBSEMWUXNpa4cDPm9Go=; b=c3KPn/AiMRUMTJ
	/aOUa4ePmrKPUeS3ucaQOvf+F63fHWWSbRfpjAJ+RDmyFcn6MMvJ648Z46G2q6Qo7uCPtrLfxQrPE
	DCNjgVD+4Rk+CBMcQo24Iy8YxARUsl2s/7mKClmQncJ7my52DvF/ubVhchkYX3FnIFkriWa+eon0z
	zjmMqc8z0t4NcO28mTLWNFCsQHuPyQk11g4df1CqCyS0/b3dUq+NaMGjxWa0bYQirTbWIKYzvocgZ
	LRlZpQJC5q6TLYNFQgf1I77EOB5xi6EHq9mypil4MZpvJmrQfqSp0NiWWSg54gq69gQpruJfFLIla
	F+JM6KIKf8PKds/9cELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsrSy-00000008xtV-3fHh;
	Fri, 05 Apr 2024 21:51:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsrPO-00000008ulM-2Rlm
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 21:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E30856123E;
	Fri,  5 Apr 2024 21:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0CFC433C7;
	Fri,  5 Apr 2024 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712353656;
	bh=7AnKOjpqHD/dkn52EQIuZvJZctpRFuWFmYBrrBbGDkY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RX3fk6+qOgJP/okKDKZ7F8WWRB7QwxIBQy7ZBnhgT6LifaWqwHN5firDGzQhKrqAQ
	 wh4OCm5GA7IMkrKOdJB9GwB3p87xMKAf6L6YSSqs17u925hXhudylZLH5mbbg+2dBs
	 Nhi00J6C4XEvix+7Pt2+TCdFF6oM5a4LzOH4v7Kv7HMJnVoOjB45uwqOXL8l1F9oTn
	 KGcj5RAEtYCVVIf0XahJoObTVRYPubR2Ggs4UTOi+kb4gaTQlCx/yc/oZqIDSNMV81
	 ybNap5miE/pr7lBSs4ykEbbcLf3Ls5BF4utEkKbisIdxLvFGzR3N3s2gr/oHkT/cuC
	 PoMWyqfROmXPw==
Message-ID: <0e0a3e9cb0a7f2cd1b0bde1e8ffaf7ca.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <tencent_F06FC1196D1D47235C8898CF10ED4632BE07@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com> <tencent_F06FC1196D1D47235C8898CF10ED4632BE07@qq.com>
Subject: Re: [PATCH v6 07/11] clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Date: Fri, 05 Apr 2024 14:47:34 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_144739_126614_8B4237F9 
X-CRM114-Status: UNSURE (   8.39  )
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

Quoting Yangyu Chen (2024-03-23 05:12:19)
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already on the mailing list [2,3,4], we remove the use of
> SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
> 
> Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
> when it has the symbol SOC_CANAAN_K210.
> 
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
