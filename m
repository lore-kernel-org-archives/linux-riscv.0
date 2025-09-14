Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E7FCA0EE8
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEm1sVH7+tn+CqaiShyhap3N1B3NOYx5ON1ZVp1FYaM=; b=fLkNBor4htgJic
	yNuQ+ITfF4+Dl47AHuUCS6jFF8MqcJwl+INN6cpmYGw9HU+Guh+qGxBFccrQ3ZipqyOIisivBkKt+
	UUrt+/VSBBEmqGS3k6E3t2TvqIKE1jp+2w5QqfIC1ZyB/vKZrHtKoHsNemPgOQLMXl7lvCXeKTdfw
	dNnyPoVsax/1Vyjm8LT4GVculYw3EXEvMpTW5cTLXGHkWS4ec16LO/oFfu+djscN2ssiQohQ70ddl
	5PZS6xaK0ZEh3VpzdUY9fxbhFFQBOvG06B/Ou7YBvnhLpWNZYRkS3Z/dva17zUVGmq2J9ievPaiH5
	s7cekNaYDtODl2624xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxooK-00000001iX4-2fPj;
	Sun, 14 Sep 2025 15:38:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxooI-00000001iWP-1lsa
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 15:38:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BAFF40600;
	Sun, 14 Sep 2025 15:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D7FC4CEF0;
	Sun, 14 Sep 2025 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757864317;
	bh=ihW47HHuEW0kivT0LtQDfndFpj4gQlPyOZ8ChekheGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGrCk1KXR+kac/5OvXpvMS9DC7fpHqSkremvp3fzsvyb6prDigqDylpNSPElqidS8
	 2otZXTknq+IJzTf5PFAMGbUSxGzxhWpaKhkmOQrn+AgAeY7zJtG5GJBBx5b2ZgfLA4
	 KHWVBm/EMps/giN+yPji/JWLF5ESMN0zLZgjtT8uX25haYBS7eQRy2q0QTZeuR1AgC
	 U0QhhxpiJ0NovZt8fUsZNnErPb477tzXnicb3fCOaGxLE/DO7Y4OBBMQ82TvQyR7yW
	 /xsM67WgIOTtNXCzlJNRFq7IXj7X4QlJmgiq7XSOq4oXJtHlf94QGVuz1QHRwydKOM
	 D0pF/zMF4y4QQ==
From: Conor Dooley <conor@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	duje@dujemihanovic.xyz,
	Guodong Xu <guodong@riscstar.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: (subset) [PATCH v5 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support with 64-bit addressing
Date: Sun, 14 Sep 2025 16:38:27 +0100
Message-ID: <20250914-crushed-blinker-9827464897d2@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=682; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=W90YfP75Cf8fElnrlN+vBYi5av5KHOKCWFABavcr0+U=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnHHpaICZuwn2a+79lfyGly/JXfDkGVa9m7o3VK/p+2c DvWUc/WUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlMtWT4Z5bI8PIWX4pvgvcz yYkPbJi33Tc82/TjbO4tBf0I34nNcxkZXvoc+cP8oOHAIyPPU222uyv9jMTe6ik9fPelq8PqQ7E ECwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_083838_489316_94150AEE 
X-CRM114-Status: UNSURE (   8.40  )
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

On Fri, 22 Aug 2025 11:06:26 +0800, Guodong Xu wrote:
> This patchset adds support for SpacemiT K1 PDMA controller to the existing
> mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
> but extends it with 64-bit addressing capabilities through LPAE (Long
> Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
> DSADRH and DTADRH).
> 
> In v5, two smatch warnings reported by kernel test bot and Dan Carpenter were
> fixed.
> 
> [...]

Applied to riscv-config-for-next, thanks!

[8/8] riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC
      https://git.kernel.org/conor/c/3df7ce0e43ad

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
