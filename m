Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E6BCA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PC+J8xwn/Cgo7wIX17BVVN0tO/scvvAFywqx1EhdODI=; b=lWkrXN3sYYiHBE
	vx+2Yhawr7c6druE/zhGEy6YHsa0ZIDY9oJlCcvgNWJ4SJOj5OaYd7ORajkre9bASqOIMFMACVSxP
	XClHBydexJ0LuCexQRFEeMqh0f7szjq938bry5bTlyuZUCsG80XUrNmDSbvFI6L0JK/smehVmzhQb
	V1FlV4XNopxALYQ4Q3NZKRgx3AiChj0/Ixo5IxgTAfxV+uq94ez0topq4tBMdywgtvToQ9xI7y3Ys
	2IKwJRwFA6wYQbi6JKcq15Vj4x1/WoFacjONJ6YKkm3M9NF9dbOPrbKwv14seGvEQVwZzNroPmx+h
	+3nsH0qKdEE/lpcw0NwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNyi-0000000Fayu-3z0o;
	Wed, 10 Sep 2025 16:47:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNyg-0000000FawT-0JEd;
	Wed, 10 Sep 2025 16:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDEA2418C7;
	Wed, 10 Sep 2025 16:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFD1C4CEEB;
	Wed, 10 Sep 2025 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757522845;
	bh=62Kld7JTWpGcejeXzL2pSMaMWwHGWlpqGWR2nvOnp4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FVnlEL1lDTV1YR+A8J7uibu4yWINGyomz3bF6CJfqS/UN6fvYIN6wqbHiIbf0/box
	 3FAJG98TDCgaw7pzqq0BgmcM/FoWbrLw+G5U+VLpz/mr+Rr4jnzg7sdvgb2FBT7+Wl
	 30Nf8QazzuJsL/Di9fq/ulNdZdZVvMLzdW2ChFJxZbmXrsuqfuePJ+KexOXmWXZSGQ
	 BbXR7CxeJ+RNUDLHeSjnon1bu43HtBqIKX/9qeRiW0ET+RVUoykGvR5Uz9IXTZmm1M
	 4/iFXIeDfd3wUmzFwNnZtNnBb+tJYHWrB4UjCIieOnj6zM1Q4CywaxKejr/vqOFWTu
	 a7WHOQ/GLn2WQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
 Longbin Li <looong.bin@gmail.com>
In-Reply-To: <20250708063038.497473-1-inochiama@gmail.com>
References: <20250708063038.497473-1-inochiama@gmail.com>
Subject: Re: [PATCH v5 0/2] riscv: sophgo: add USB phy support for CV18XX
 series
Message-Id: <175752284008.484319.10400801407053619384.b4-ty@kernel.org>
Date: Wed, 10 Sep 2025 22:17:20 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_094726_141524_4ED039D6 
X-CRM114-Status: UNSURE (   6.40  )
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


On Tue, 08 Jul 2025 14:30:35 +0800, Inochi Amaoto wrote:
> Add USB PHY support for CV18XX/SG200X series
> 
> Changed from v4:
> - https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> 1. patch 1: apply Conor's tag
> 2. patch 2: remove dr_mode debugfs entry.
> 3. patch 2: simplify the cv1800_usb_phy_set_clock function
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
      commit: cdb2511bf3925ce095c31e1647c12086d34f9cc2
[2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
      commit: f0c6d776f74d1d8bda94f6f042b2919bcd615280

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
