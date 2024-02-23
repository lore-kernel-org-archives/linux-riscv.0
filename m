Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7E3C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzUAah734iu/QZBiwt5/b8yKbPswLRDZp+PSy3r+1SM=; b=Rrtu0tTvFu+Okx
	ZsPxYvUT8ScBVzn7e/iVhAnpgBqR89IfBK2XZuzqaTQg/604Jgx/e2n9F0IH0kJzS1QxdS9qu9IsA
	9YClrCWD4EppCeizt2q7cqOsDwjo2GBhfAS+EDmwDU3W+TC4bjiLuaHdxjKxhh3lT95Eampd/fAoR
	nst38KBAngP8Tsuwr2gvyxZNjYJnX1Nq2PycABMDn9kd4foJPMDM/0v7Ded3PaRp3P6JPzlhYIsvF
	2XQRuqDNAZdD1c1P3O1vY4RLDmx09MS+SPeIF32aF+hu8zpp4IGbLAd1j66MFLmxuc5/3FUnRRj16
	VWK45/bQ/davxHkx8XEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJHR-0000000796k-3Yvh;
	Fri, 23 Feb 2024 00:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJH8-000000078zt-3Set
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC16661348;
	Fri, 23 Feb 2024 00:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFDCC433C7;
	Fri, 23 Feb 2024 00:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647529;
	bh=0VXV7QQc4huFHcQS4+UMq0GJKqEi8Bz47SvrUUhEKF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTkJisuB618warovcVt0Nks5rSatRQHBHUfLBZCF7gA+SfQIYasBo8KYYwvPwNNVR
	 2sKgGGDwnvxbiRfJB3a1iHJc4HLhUE+peNh7j4F4b5jmBhppNYEqd6/tigqpfEtU74
	 NoVJfgXeE6yp2jierWIuq8zSOkC7a/BmE9ApwkAJNrkkcLnzB55cTVXVXNZ+RrTKra
	 F/Gb75tg0+N1cbcW0dS+HxiySpMMqTwqsT6SDeE+hyViB9jynHz19wRPFr1c7uvElz
	 uUL4lnqmTTBihKgqjEsi7b2NnuD+K5TmruAIyQauv3ZseeIhTOey1GbwKk/6i4psM5
	 xcybcWrCUCGjw==
Date: Thu, 22 Feb 2024 17:18:40 -0700
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: samuel.holland@sifive.com, inochiama@outlook.com, robh+dt@kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	xiaoguang.xing@sophgo.com, conor@kernel.org, haijiao.liu@sophgo.com,
	devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
	mturquette@baylibre.com, sboyd@kernel.org,
	Chen Wang <unicorn_wang@outlook.com>, paul.walmsley@sifive.com,
	chao.wei@sophgo.com, palmer@dabbelt.com, richardcochran@gmail.com
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: sophgo: add clkgen for SG2042
Message-ID: <170864751924.3865395.4075439052302524683.robh@kernel.org>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
 <cebef63e3e704db58658b5eae3f1fc4dfd1a587e.1708397315.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cebef63e3e704db58658b5eae3f1fc4dfd1a587e.1708397315.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_161851_050592_5CA07494 
X-CRM114-Status: UNSURE (   8.33  )
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


On Tue, 20 Feb 2024 11:09:18 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the clock generator of divider/mux and gates working
> for other subsystem than RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  49 ++++++++
>  .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 111 ++++++++++++++++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
