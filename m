Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D807DCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjrofF/oKjW1Z5NBuCfwTElp7l7Hhyp/xOm+Sj4Q2ZU=; b=mCXtYQsPri4pHp
	/MF3KkG8x1PRgQ7QLHKe61FAP1WuwL6als03iMLF08fTxbK1BVqtWRhBhy2x4qT/zaKRU6DB8uR+p
	lcnVyUAkhGQ0JrpNh/sTAR8XcrK8pcqdf0TKBUAcvj9rgzxIcYUnk961lMh9TH2wblUm2CmNSzGv2
	12EuQSh3EtKoaRu5ACCcRLGcheZyQQnQOQzcYkCjezTHk4YczRC5y0fBlgh4MuJfKHmvg/eBlw8N5
	x1hQ+pqlliClbmZUf5Ee+hs7CpciOSANcM+QTbLg9DzY/pcQVcZ4I+V6MBuI04EfqwFBAyhSq7dvx
	ETBrRpXVk0fpMicXqvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeGf-0000000Bbf0-3YxA;
	Mon, 20 Oct 2025 01:00:57 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeGe-0000000BbeQ-1c5V
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 01:00:57 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 39512340D7F;
	Mon, 20 Oct 2025 01:00:53 +0000 (UTC)
Date: Mon, 20 Oct 2025 09:00:50 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251020010050-GYD1506524@gentoo.org>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_180056_440075_05314F98 
X-CRM114-Status: UNSURE (   8.82  )
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

Hi Michael,

On 10:02 Fri 17 Oct     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Aligning with k1-bananapi-f3.dts
> 
The DTS change looks good, but the commit message is kind of obscure
and unclear, I'd like to have an explict brief description for what
have done in the patch, without people looking at the actual DT code,
although in this case the title already says about it, but we could
still give slightly more info/context:

The OrangePi RV2 board ships two RGMII ethernet ports with each
has an external Motorcomm YT8531C PHY attached, the PHY use gpio
for the reset pin control.

Enable PDMA for OrangePi RV2 board which provided by SpacemiT K1-based SoC.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
