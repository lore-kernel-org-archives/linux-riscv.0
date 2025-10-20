Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6518BCCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p53GBnn1f8Ww3gGMVT+pjxf5f9oHZYYsP9pL8K6FkOc=; b=B9fQeW0Ir8DTLz
	ihOsmDGxj9bxQtJ4TxaA6wRzJZrUXYnJ8kmi8BAoJ0P0VAE9AetLnRnu6le755HQyQm4LgWmcqZu5
	XWh9pE2fcKO9VUD5gdhYeOK1ix4xwr9jIsxTnWp5m0/puRC0aBAem3/AoCEp1Xrp0HipNal1iSOc3
	TfWDS27oqJBBMGfz2+tmvNpEWriBF17i1kqkXCF6n/8JjvJeJeiEaZgDb5FLuYsk40c8ucPked8XY
	dDMjsw9fZx+yZGz0wbvYuO9BE7gwZ8m5sEE7jWCfEc2YCM3bR/o80Nixn23HP6amH7U/+6EYgmwwA
	h3PUWnB2G29pn8ipAO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtog-0000000EVXR-1Yds;
	Mon, 20 Oct 2025 17:37:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtod-0000000EVX9-1Djq
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 17:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDCDA43A6E;
	Mon, 20 Oct 2025 17:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B0BC4CEF9;
	Mon, 20 Oct 2025 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981822;
	bh=K9wyPo0cQ9GL77ffKurdZDil7DRu7VmOSh2SzUXV9Z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6YX0EwUNddz7jSUTd+A9NGqHxywGBuhRnEQJRd9ZBRuRov6j9u1snN9kAN62S8Da
	 +KDXwR32plJI3GpPETtNIb6zvlf/AUzcVm6qiBBx44aIEMaokVecBjuBAFjNIBMB8k
	 Zxwyvt0im46G101RmnLOD+wLAsVZFXFmpN+ssQTOMt8zTr+pGyGMs52XZYMo0+M/KY
	 SUoxfUPuwzxy7+MxM/Lp9acyZZObl3otC1eByaA0Sk/6y2FGCE5KZJLo/J+1I726n4
	 lGnljDqCmswM1aboQ0jY9+xl295zuKveVSzoanSVMYFCKdC+G1bUBSDhpt+T40msR1
	 DYWVHa7mRkYhw==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: starfive: jh7110-common: split out mmc0 reset pins from common into boards
Date: Mon, 20 Oct 2025 18:36:53 +0100
Message-ID: <20251020-eel-skipper-c71e1f8fb679@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005174450.1949110-1-e@freeshell.de>
References: <20251005174450.1949110-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=412; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XWKHqVXwJok2pbqQ588FkM+xUoRw0fT4JIvExX2Fkz8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnfis2+dnJ8FN+Xvk7QbCbLm81Rt0Rarz77ouezSbv/Y 1mTlMKDjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEUo6RYU/tSW8TRnXLpXEO 36Zp7d0r/n6LW9PclzMVJwlN275w1xOGf1qfNgu0LXBYJv9CR/Tj74/dSoZyfLJTTSoUVGrmlqb OZQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_103703_370707_E8A0C162 
X-CRM114-Status: UNSURE (   5.41  )
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

On Sun, 05 Oct 2025 10:44:28 -0700, E Shattow wrote:
> Prepare for Orange Pi RV using jh7110-common.dtsi having GPIO62 assignment
> different than mmc0 reset by splitting this out into each board dts.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] dts: starfive: jh7110-common: split out mmc0 reset pins from common into boards
      https://git.kernel.org/conor/c/fa939a287224

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
