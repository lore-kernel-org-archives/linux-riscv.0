Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C277C531CC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 00:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpT732UVLdNtfbuaaYHIwxwVsFn1ksNiLtfO4BSkjss=; b=DOTKofKCap9tco
	F8kaeyXjJatuBt/B06agCLsDOc6t/dhQX7EJDGoMMjihhcHcBnICdLWRG8hqarlIfVEM9+c0dtljg
	WyAIwxZCZ7zXxawOYEjPG/QlJhMvKH8j+pVRWbHzAbOAllYcDfmvwGQGyhVZHauuC9t+eAzCde4sG
	4BEJpWMOoL46k/fbgaXm/sVKLh3DLM5mVLraJrU4rmI1YXZy8voNTIpddACy7e/WJ+fKQF4vmBAXl
	FB4CKfjj5EEP0+WrV23GjnkPwiysqK/LSa6KBr2Af1z+NyrkmvgRcXpF3lhswgkqFIMXg2r7YJFiy
	OuFyBPEi27ohULo6HGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Fw-0000000FJbQ-2bHM;
	Fri, 24 Jul 2026 00:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4Fu-0000000FJat-2oP1
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 00:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACDD440F11;
	Fri, 24 Jul 2026 00:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D34A1F000E9;
	Fri, 24 Jul 2026 00:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854753;
	bh=4IqQuzWa9zukp/8Xa7Vx1hseOADWYDWrtLWPKRKUA2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HAgI6yWl4lzJe7ze7y3KINpyTvDzSkThi3xs2Y400VTeWIiRfjZnKE7W+5gMSSXHr
	 eHfk4hzoVB9ciJIiT/SMOdmfatwrIZTNXK2tMo+Oioam+CU1SWGZWu0Log3M6HUGw7
	 Mz7U1hOT6Gto7LlCfUKS4sUsm+nK2v7Sn/YaasZJGYZ3lnMiE8b6ZN9qTJZcw1tPve
	 wOIWI25ZHmaCQCqjA6fPjNE904JIHAuuQBfo1XDTkja9D6e/JTojuIY+p1/w5JzP/E
	 qsEe7v+NzT8glP/uVRGFb1sd45JhCRsi4xLMWBebW1Gwx6qTkiJVFzSqgTPF/9/KwB
	 HB2skUgbZMfGQ==
From: Mark Brown <broonie@kernel.org>
To: dlan@kernel.org, kr494167@gmail.com
Cc: elder@riscstar.com, linux-spi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260722162444.11415-1-kr494167@gmail.com>
References: <20260722162444.11415-1-kr494167@gmail.com>
Subject: Re: [PATCH v2] spi: spacemit: prepare both DMA descriptors before
 submitting
Message-Id: <178475444741.5645.6128130514340592590.b4-ty@b4>
Date: Wed, 22 Jul 2026 22:07:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RDjoztJQbU4GVnyRy3kaRitfm74jeRfqA+SnJn+SxY4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYrjfh7V8VBPJzP4T3BLa4gWuOESEqMO26JPTt
 Hkk7G4aCz2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK43wAKCRAk1otyXVSH
 0KXnB/998YytmnS/jo+Qbh1QYspKr/9sSePM4fYW6xAvLWvgWL+fzCqe/MdoqHaKZitrOnvVFnt
 ukjgiisqaP1omjiNBfXujwQ3sQ/DX880xX94XxECsMob5cYBWSgq6A+3QbtHKsb6IaoYPuB7cZr
 SwZCTu7rz2c9OA+jq64yjyLa70pHNrFg4jolwIeHRujWJJB9bYW7CoFzg96oRnWKVAiKw8jA8vx
 Vh33vGkioMsnxGTYjxcV78oTST/Gm00fikDPmg0f93CAWkscZECWbeswjN3CSIyd57Gcom68HeV
 hXDo50SjJfKoY1omkCuGI0J4r2v29QTxLMXR/BDwhVgpuZQr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 22 Jul 2026 21:54:44 +0530, kr494167@gmail.com wrote:
> spi: spacemit: prepare both DMA descriptors before submitting

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: spacemit: prepare both DMA descriptors before submitting
      https://git.kernel.org/broonie/spi/c/d3c87e71539c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
