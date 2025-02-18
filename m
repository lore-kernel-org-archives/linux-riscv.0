Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA7BC021AF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPBy9SLQiQbZ4RGFPBE1zNFpXvoZjeeE/DezbulNpLY=; b=wvi6LZiszc7fOO
	v04E3JPm/3geKd16xm9aGj3BF521C/eKZuZnmctgv1GdJQesrykBgNRlE3ODkz2RXfT14tTflmUIG
	eBWETWHYpvHyIuHCIuh/d3K5AIFNOEmVc7c7a3KkYGIf/Gh5kls8ZGur+gPvsWo34yJCe9pYexQJ7
	Qq2c5HqhiaKODkgaEArYiziiqr+w2KiivMKhhPThqbC2n1Jvtdc1TYD6gfxM9yiIyjEygCSGASk8y
	EPit9E2SQNy4jhe5019EPHE2h5T1Gbia+OzwzVhur1nFw28uAoGbEOUFCH/iOkb4Wr4lJzxMhAfxo
	v+d2b6ms3BtWInyKRjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVer-0000000A5Vn-3kwZ;
	Tue, 18 Feb 2025 22:01:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVVF-0000000A48R-2Iyx
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 21:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1F2B5C606A;
	Tue, 18 Feb 2025 21:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D399C4CEE2;
	Tue, 18 Feb 2025 21:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739915500;
	bh=W13jQITpujW99mQ7CPujO6pRt/8mwf2HQ7ShicruSHs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W08e2gcdbMf1I/pADbgBXU+fDN0+fmoJr4ahb7ZKPp/Z7RIT3Fnx6kR/1D2NjgClJ
	 QoARg1qgHpPMgXZw2cDNnixm9k/hzDCITbrbKLJmHpxv6Y+ssxPi2iFxjY+AWq9Kbp
	 09y42E/YuATKOO04iYI2KnW2qWI+YFYtddwxVymXq0LITojbkglYhoQy0blo/JhTID
	 hMdz8DOV0bt/hqGIsIKAO+0jxMUPj7yx/6VsLJErGpopgXmYxyAYAXYaLi6l2oeDWS
	 9qB2//jKPCLHE/HBVV6+4l/IveguLtykXKqoM7WnZdTcL4DO8ISN29UxMY9XRHD7um
	 w9IjAIOItLWsQ==
Message-ID: <b2b9216c7c28e5eed267b9a39c8dcfb1.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250218-poplar-iron-c894fe8deca6@spud>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com> <20250218-poplar-iron-c894fe8deca6@spud>
Subject: Re: [PATCH v4 0/3] riscv: canaan: Add support for K230-Canmv clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor@kernel.org>, Xukai Wang <kingxukai@zohomail.com>
Date: Tue, 18 Feb 2025 13:51:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_135141_641703_A1CB9226 
X-CRM114-Status: UNSURE (   8.28  )
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

Quoting Conor Dooley (2025-02-18 09:02:32)
> Stephen,
> 
> Is the driver in this series satisfactory to you? If it is, can I send
> you a PR containing it and the binding so that I can apply the final
> patch in the series (and merge the basic support for the k230 soc)?
> 

Sorry, the driver is not ready.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
