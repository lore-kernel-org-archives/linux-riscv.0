Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8ACC636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taHN/tPXTGRT5LRIw7+bEdyKVGeVP0S6Jup4aHIByyg=; b=M3gk/6VCDwgqjO
	lNvWDfQHJR0DcPfLXjG47xchSXgLqB3LxBFDG+N8mLJxnW/lzkJaZZ6XAoFMMCnRZqKGTIsxZX5ko
	xZjnp45j860pTGn/u93zbRGGkvmCovkKeq8e6FtP+quVeXHUENT+MLB3q4nwKTI7SN27y98Cr61B8
	6HTakOvI8AJKQO4M61YacTA8Y31a1688YGUh70yzRZMkQVk2lvzUwo9dPXL+7QfIlf7N7O2LOk5Xp
	hf7QULKIpGbTPfqZO8yVH5f9OHbGPGeV/HOxvXl+tePK0ZS49BztVN5d5sKespSZ8w1FsKzpQGhF8
	5sEKdYvOlWirjNgeYImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uK-00GB5K-BY; Thu, 23 Feb 2023 11:37:04 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uH-00GB4O-26
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 11:37:02 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A7D0132002FB;
	Thu, 23 Feb 2023 06:36:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 23 Feb 2023 06:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677152219; x=1677238619; bh=SE
	VSeLr4YeKzVQBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=tkgwUTQMf9ZUqyL7Pm
	dCQxjPqaAiYgMW3ulsYsZMv56+ATiKJ90DbWp96j/ASkWraUbkOkVVEtLxgkRqhB
	5KISa4zdGtMFV62h7FCIw9lnKYrSarmCPycp5A2mFeeKuNctbfdFd9724x8lR0k0
	puU42biv/3ngK6RsNcOuB0qm4RQfeCW9Jvh3yxEMhm9H13AXW4jVluO5nMxiwe/r
	AJumXHNOzF8tNCZ6Krb+fwSkMkUGp0x3RbnvV5yk+86Nbby2l7gsRagaiYE/XByl
	UscRAIJerz+p3Z2iHPJhjvnHinwUL/a3M2qII2YbPHXbevmLzB15VpkoB/h/jhq+
	J0yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677152219; x=1677238619; bh=SEVSeLr4YeKzV
	QBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=n7K9bHnbvf+Sgdso3+qV9w/+4j4Wx
	P6V0HoS4s8nJerg8xH5n0LYdKLLZzA6bik/CeEsVPFS/AeO9T5UMBjF0c19NSq6l
	sGzMRrSmtF9TxVuWOoKB2JvT3Hiq10n/oHw+pRfoCUCitlf2Gvzt+rnoGvsO/9Fo
	vJ/HBNICnYsaRPy68KP6EmHJysUxZ24Lk+s1TstbLUS15XnqZByj7vBv5KS4YM7c
	w3a6JBQ4Rw8FA0KlXoVKutX+6He5pxE1+qFqUDy0zt6YVgQNv0LbxUnQ5tRV9jma
	GoilnAslD9j2Z+kX7piSp9V/3aAf2Qt8QpospLVNwCAqOyisIPIwncuvA==
X-ME-Sender: <xms:2k_3Y0LeqdD9VES44UJcs-iNFK0oPlM7azFd0AQ86qt93aoFnRctlw>
    <xme:2k_3Y0IK0d6nFckInNH4-14XXUHL_vkqQxgXupoNmAigFkFrVqWoisxlAG6370n7M
    xDxzLf1i7CI_ozpF9Q>
X-ME-Received: <xmr:2k_3Y0sCcVZTOmBbc19IMQjH1-DGV-O3XVtxGUOMyyjNrvBDs60YWe32rY19FLR5tCHzoXESMcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:2k_3YxbINMIlIGBy3Hj4IwM9eWgYDemlsNVp-aZSERGBtFmXqWb5Gw>
    <xmx:2k_3Y7a5yOBpO5VPDzRNVy6Tj2bc4AGYcC-jWnNw1VabkMo7Xvw6uA>
    <xmx:2k_3Y9Ay_5QHyHsXt5CiH-cKhawcVgA5qJHeqBWbmvakiL5L-eiEZw>
    <xmx:20_3Y5CZBxjeBjCCvPi3m55ULkI05ZiSp5TbTPX6a54wtqpCs7SSHw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:36:56 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	tsbogend@alpha.franken.de,
	mpe@ellerman.id.au,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	robh+dt@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	linux-riscv@lists.infradead.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/5] of: address: Fix default coherency for MIPS
Date: Thu, 23 Feb 2023 11:36:40 +0000
Message-Id: <20230223113644.23356-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_033701_147611_303BD465 
X-CRM114-Status: UNSURE (   6.38  )
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

DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
might override the system-wide default at runtime.

Use dma_default_coherent to override default coherence for
MIPS.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/of/address.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c0b169ef9bf..c105d66a1fa4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1105,6 +1105,14 @@ bool of_dma_is_coherent(struct device_node *np)
 	struct device_node *node;
 	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
 
+	/*
+	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
+	 * might override the system-wide default at runtime.
+	 */
+#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
+	is_coherent = dma_default_coherent;
+#endif
+
 	node = of_node_get(np);
 
 	while (node) {
-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
