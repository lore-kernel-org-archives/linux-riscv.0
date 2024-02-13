Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52136C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEenkjVpaaGk8V2kNey/aU81od4L3CwREH6dVKZc/Bg=; b=gfEFR/6XTa51eu
	uwqSGuaIxn3Yjl2xqHCEjiVHiAjx1hNerEgeTMtVcrc7DM0Mk+cPkp11bd6SCq8QyTDX3Au9xIuKD
	dfFQZc0Ck8zixjq7SPg2C4pfUOss0hUdfNLSqrV2fCbSPpPL5TjMaUUSGrH1cs5gzzM5Rm6/TFoAx
	v/XvVNsA6SsU9XHouvtrR8PvwyOP4H35eA4aN0q7m7AU/lJGZ+N5/SwK6Z1Fl8Oj7Fv5AfDRsbX8N
	m+gEv5jSkzGUUEhuu/dBsMPqEKZMb7YXnVKJnCeMvQ4o/SwK+O6y+KPW5B83H/QT10Byp+1akqzlV
	n4LdoQ68JAGkc8hjh5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvrE-0000000A09K-2123;
	Tue, 13 Feb 2024 16:42:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvrB-0000000A092-1lLu
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 16:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1E3C615A8;
	Tue, 13 Feb 2024 16:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCDAC433F1;
	Tue, 13 Feb 2024 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707842524;
	bh=xbvPqK9JRSwLRR2qAODE8w5KCwA2ZAi76JUCkpeivY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nvl7/Rd9f/dgNSSy+oG73mLbWVb2Ca3G0/HlNI1cGGJzOWyouYpt3VJ418xqkFInY
	 nlXUH6ppypCPTn1dz3P9n7UuUEHCtxuJPRBYyx/60TPMxffYbcPw0RYzZuA0K5GYIE
	 vzd7V4QYMCs00FAiFRZ+wUnvF9OOSgp/FcZHWG5xZIxHecSrkPLOv2UtsXtUF/p8ms
	 1G0/YnOQX2CiFly1rXUeKMji5SqJfx6qhs3rVFxJonxDSml7SeAFc1f4atputWNAgU
	 kfj8cQHu10I42ss1EqlqkSHidYSFVUJyYAKTPeyax/pde48MqMWxez5znMo76dvu8w
	 ZjrV0uORvUl+A==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: starfive: replace underscores in node names
Date: Tue, 13 Feb 2024 16:41:55 +0000
Message-ID: <20240213-commodore-egging-baf7ad19ec56@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
References: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=359; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=HRBHjd47TJfW8gNCG2QlfEZlC+TxUvJev6JfcO10PXI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmnZ18KmROe9t5Bcd+Ur8c37okpOZBe8vBSieTp/vgzM zg7zv5K6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEAlQZGS5+2jL73DlHHYeW a+83Lnkcw1hvEvbgQN+HjKWmEYu8+5UZ/mf/tTq7915zS1r2vf6Fwos7/x2RlLzwxmrNF22DqtR 8Ww4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_084205_529405_23C8F365 
X-CRM114-Status: UNSURE (   5.65  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 13 Feb 2024 15:46:38 +0100, Krzysztof Kozlowski wrote:
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.
> 
> 

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: replace underscores in node names
      https://git.kernel.org/conor/c/f03606470886

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
