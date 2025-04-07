Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6905CC369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqw8SQQ5lHLn8inwc0FvfQfwQQnC7dUyQBiOhw9hcro=; b=HlPecycLxbWyHb
	PaSehzRTXRV1KHY5xya0MPkhz5UWnhubtH+b3EDe2VVCkTA6yJk5XAeffHwrREXSg8dvAYYdVUsDH
	ZfKL3g8B0BEDU2R2b0AIbd8COGpNviMOEYAhHB5F4zWlewfeOxZQff7qGIQ+ycXNqPPQEqYea1Qt6
	G8rJ2eDKNfMud3gVyHqUE2AqiwsxNke9OXK97GNt2bE9AhccqBzzETYLjkKOO2D+OWMFQ9ZgdU/Y7
	I9un/faFyxbUIoAKW2pFGocQWNRPxvt9GQAYVbn9K+6P6dIBeI0sc+xZQVhlbJHwVznU09sF1L0Wk
	PDGIcm0CBy6fRLzrNJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mzR-00000000clo-2W47;
	Mon, 07 Apr 2025 13:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mgM-00000000Z1z-1gfB
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E0E24433D;
	Mon,  7 Apr 2025 13:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA24C4CEDD;
	Mon,  7 Apr 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033113;
	bh=R/+LUhaZu48S7bNuKq4PNvUVMZjjf3m1lZ4q6yzkqyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbQRmtq9/KVixr5Z5VrZP/HP1OUcSZToqDGLRIrfoTL2PXKFEpSuvphV6iYrN4YgI
	 MYkcGgAkpGJsPj2ukt1pA8Rc7Xs5I/YJXCC5SYNuIf8ckqR6rT+m5v2Rkzrqtj7OKh
	 LLmA5f0bF334my2qScGq099+fIMAUEZ3bJsPlKcG9HhHbbf2+9e5V6c2tvNKQvt2yp
	 p3dIHRyB/whsgHdL3Y05vIidlru4VMgpvtRSGAKaiuOlsh7vH9HT5XZ66fSmaCSc4W
	 Bn9cIQ4Ivnsxvbw8EBsKlFNCRfwazPn+L7oZCjm1Pgfz/eQ8PEgpkSerrOd7jE0H3f
	 SgDD2uhCrUa+Q==
Date: Mon, 7 Apr 2025 08:38:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: sophgo@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-i2c@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, ghost <2990955050@qq.com>,
	linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044
 CLINT mswi
Message-ID: <174403311198.2084156.511081791031518276.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_063834_458890_824EDCC1 
X-CRM114-Status: UNSURE (   8.14  )
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


On Mon, 07 Apr 2025 09:06:07 +0800, Inochi Amaoto wrote:
> As SG2044 also implements an enhanced ACLINT as SG204, add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
