Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33947C83F03
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8dsZ4o5y+N1/8HaAqKDM69lRVaz/hWn0vpHedA691g=; b=MxEIR+1st7+M2y
	G8hNsiqPAqw/CukmwjopQX3pSkm3emvgodVJ+6XdcxjPRVH0VXy/YKaHatEv0ULk1HwCyOCwBMApW
	UE55AqkbiIeftsjdiuqLhyFivwwv5Tf8+IRyADM/43CWexu0/tJYbd3qD1M0S6i5FNm6+BFqmf4ws
	rac/PqjLhf/JtivbicMtQzOVzDd+HAo9jLdJHj9xwCWT+ODZE9JSIk8uVLYESjj3ZyeYGsfI5uL+Q
	sdlqei5ofaUGy8aEbVOGw/IhqBDy31J8/F6uc0vZRJpVOsFWCS+To0X8MAmObaZK/jbZE0zRCqzl2
	pzRTrPc847yrp7x6+2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZmG-000000011eM-0Yn5;
	Mon, 07 Jul 2025 00:32:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZmD-000000011e2-3wKC
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 00:32:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so3533041a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848329; x=1752453129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=IIob7AF2Eph2a1fyER2Cn40LFy86ULMLQfP7NeKGD/OVoX2J7c3a4EdfN8DYrZK7wf
         VBft35U0uXsMKQ+P5zroATfNt8tvZk9WXonA8pF+4Z8LiJrwRNOLDqgI7KEvVvHYbBN/
         v5uFKSGs8D4dTP6oMDUT7tuHAOWOBP/KNeq3d7X5Axo6leNxb7b/eoaH8zSS0ymxz5Yj
         7VpfZIuCR6Zbd59oks7OpaAMx2vDgIUygyngw0T9os4YWmvaemDGKO9f6WP33xTHthhR
         iVF9/g9PMnksACEJZHJlsAeUZVJObfPt9VhsLvEYH3e+2dTQZ2p92H51/P48/FETKzJn
         zHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848329; x=1752453129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=ivhChxoE1CJqGUsUXh/qQnVhWW51YVSjUeh+p8jZ8wOvrNBKm/i/lRpVoMe/A0nXE8
         /YZ1pt8eS6rpRT4Iy77RM4WeuMZ3iH+TmyVBm5el0Y6DI/fl5heRNACO4j+ft48J3Xw8
         x8bXkExBe1dM/5fOusgM7OWRBY8vMOcRDPbxzmm4/NubneCGhz7k0Z6Cbd3d/UYRSmZi
         6ZGb2e80wB+dV/xLJOScr6MbkMMYzoi8aE3MO/SZ/vdgNSOjiqpdolQSTXfk482GpA+4
         Y3B2fRM/F75i5NDOGsUki4wEst8+04fWCc88l7pa4ZjUH7XWrLt0GpItdOXFx74vRSiy
         jmvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5vHs7ny3u2Lu9YHnJ/ozzVeTLR2UYjsMBfPHaAi+EbN6kVJvLv5vGh+1NZJSmwXhY9N6/F2ak1TjbVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpBN1sSbwgiRROQmnY4rdnEAxn4ijiL4Q4Hl5BOonM5Ov05Rxg
	ZJ6DAig5Vpq6NR6oEmiB7XJE1xgcWqfaph6OC2ZIwUG8Uf0WBJgrADG1
X-Gm-Gg: ASbGncuHe98H2bmpYfar009+7CGUcFQqblTwrVMcIflf3s2lueGaYJ5dhsGd6995fKc
	3dir+/1TV740porVSt3OMDAshacAeXczVI/kXYJyXwnsmm5h+ZtIX5PRoOZoY+LCHA7C43j9S80
	b789eyFIMd9bweV6T2ANaZmZzYQIVO4AXtLK5PkzIwrdNgm8kcrPhGwlc8dqqgJMisWHuTkQa/C
	hgLUyud2fafsfFLriCasX5nTql65U3tJeKns2myGbadS64O1bn+WFObDzVCcjzb3ek3hCfUBA+h
	RWy26oGRGS8B2xbOObkjVbJtaTjRgPbtOSeW8yRdiOeEeEuTJop0RrZ0cwIAAA==
X-Google-Smtp-Source: AGHT+IEJfwXHQNDfml8NzaqLJBaxvkA9HUYq+A9+IyCh9ibIK7D1D9K8y86d2uYsm2pa9DcODEISyg==
X-Received: by 2002:a17:90b:3c8f:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-31aac4b2f1cmr15485476a91.20.1751848328607;
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9cc66830sm10477012a91.16.2025.07.06.17.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Mon,  7 Jul 2025 08:31:59 +0800
Message-ID: <175184826045.122679.3644918560620246720.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_173209_980826_369CF5A1 
X-CRM114-Status: UNSURE (   7.42  )
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

On Wed, 18 Jun 2025 09:58:47 +0800, Inochi Amaoto wrote:
> As the PCIe driver is merged, add device node of PCIe device and MSI
> device for SG2044.
> 
> Inochi Amaoto (2):
>   riscv: dts: sophgo: sg2044: add MSI device support for SG2044
>   riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
      https://github.com/sophgo/linux/commit/29ce381d6bc61b23024c6ee42a5745d4becb28c1
[2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
      https://github.com/sophgo/linux/commit/55fd09df36d7c6ae59d82a7df5072827f65a0eb4

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
