Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F45CAC589
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGjXiM8ofVPvgBB2ALbeKFIbYtSjY0aLVEt50T+/2hw=; b=C2d28m10KcU7Rp
	1/RsUINMS9xrz9U5LjwFMGAI273V8MbK4jz5JE9J2BSAUNha3H6mM7ekfSGd65Sbnc+lnmOi4rUvY
	NszsNsQ4QH448n16gztW6v/3YUU0kxVqOCcZCtZGdrQiMvk7POvEacSALoiRPU882wgSPOENHeyjo
	POKyzTd2vIZmsih1ngFidgio4OvA0uAN8y16lJ41JbB/DQz6hD9omMhjFRTnGbQoY+Zst8haGWdwF
	AGMN1zxavQh2zMR0WrrhRjwvOc84asG+m3BHgWtDEC8K5WFdpwpyUYFauM/fnIeFroU3dPJmg8vOq
	8zQMwI/rdzpdXVCKCnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5v-00000003h4g-3Do1;
	Tue, 09 Sep 2025 02:28:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgnp-00000001cgu-1Zle
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 18:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2B6E4042F;
	Mon,  8 Sep 2025 18:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBA5C4CEF5;
	Mon,  8 Sep 2025 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757356880;
	bh=9UbZIylSOOcUsfXTPHSeBMsVpKt2/NcF2RFEaeA8gJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I+gWs6gGf79i18orC+mU8AvkWdoPthfUaBU+2bFOxO0HVt3UzaQReQ53BE2bF9cuL
	 JeQg5KzbsvLqoRQjI2jzGTzIfUvFk9/yYT32jDwg5XbgugolEmTdFO3Nq3TQ+YSnnc
	 hbGxLyRtB7UkFDf+xfrp0skGd5zuIxdJjCnE1A7jCL61z5/8j99GFFF9ryYY5UPSZb
	 uzGtPpDJ86YnKCkQCD5EFcwyWtLDAufWdX+LkQTxmIx4R8c8K8J1sKuhlztnJFD6tW
	 m8ICXKfvlUy4JNgiFtjUtE9I391scd69oWCJqLC61CJ9Pd9xOojTkE3nmfgRss6F21
	 FLsmhomIE3tUw==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: jh7110-common: drop no-mmc and power-on-delay-ms from mmc interfaces
Date: Mon,  8 Sep 2025 19:41:10 +0100
Message-ID: <20250908-prognosis-nimbly-3a10aa0bcb22@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903101346.861076-1-e@freeshell.de>
References: <20250903101346.861076-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=y1ANHXKExkpfH20vLWjNgJDo74JRGsK0QuAX3xqB3WU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBn7ld3OtKrXN2sEW4YabGHI9u2QMVLlkbTw1jiXrf7Kx e+8akVHKQuDGBeDrJgiS+Ltvhap9X9cdjj3vIWZw8oEMoSBi1MAJsI1jZFhv7Poks5yPot/THyR p8VXdMgeTncxvBq2IFa2L4FXhu8TI8Nflwd3tXZP+qm4rH/mbqG6E6WxcUumcZ9b07woOuUiTzk nAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_114121_439002_8DB26B8B 
X-CRM114-Status: UNSURE (   7.48  )
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

On Wed, 03 Sep 2025 03:13:34 -0700, E Shattow wrote:
> Drop no-mmc and power-on-delay-ms properties.
> 
> The committer cannot be reached for comment and per discussion [1] and
> testing there is not any observable problem that is being solved by
> having these properties for the VisionFive 2 or similar variant boards
> through the jh7110-common.dtsi include.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: jh7110-common: drop no-mmc property from mmc1
      https://git.kernel.org/conor/c/08128670a931
[2/2] riscv: dts: starfive: jh7110-common: drop mmc post-power-on-delay-ms
      https://git.kernel.org/conor/c/b5a861a438d1

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
