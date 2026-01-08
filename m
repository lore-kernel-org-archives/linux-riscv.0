Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE1D1489D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/jJrJkAJmFaCISQkoFrJILZUGwm9j7wPdaM9WTXNBQ=; b=ll7hCZcWvLA1AM
	ZqzamnH8SV0IKyUiROyfNx7QdWnFHKSzCPZq8R6Fj3WyJrj1p8vTxxChCdDAgmnGQnPizqM3QTpYj
	PJLZEheETTzh7IAj9e8IZ0CvBkaJ97Kljz9DBElBoBds/739iCVg2Jq/aMGZ0czzGryek1ggjuW78
	oO33SGH2fccrE7Z0bQ4qojaM0s8DOapBvc5gfsTYc2jsBj19fwHq+M7vVkwvp/+/FA3xuta5eFOVA
	7KQnbiz4L9AkAV0lqm2xRXfZagxMHTYTAQVBamU1212WolYI+4kk5j92NJhAATfUS62TUDvNm+meI
	y+QJkr3vcOZKD9f2bXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiWP-0000000FwnP-1ohW;
	Thu, 08 Jan 2026 05:25:21 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiWM-0000000FwlV-1PK8
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 05:25:19 +0000
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E62FE340F55;
	Thu, 08 Jan 2026 05:25:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Encrow Thorne <jyc0019@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Thu,  8 Jan 2026 13:24:37 +0800
Message-ID: <176784920500.341655.1244714161729055220.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_212518_398883_DF4DF879 
X-CRM114-Status: UNSURE (   8.05  )
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


On Tue, 30 Dec 2025 22:29:01 +0800, Encrow Thorne wrote:
> Add reset support for the K1 I2C driver. A reset ensures that the
> controller starts in a clean and known state.
> 
> Reset ensures that the I2C hardware is in a clean state. We cannot assume
> that no program used I2C before the kernel booted.
> 
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: add reset property
      https://github.com/spacemit-com/linux/commit/91c444d4285c07dbf2e6e4bf954d9a0282157f1f

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
