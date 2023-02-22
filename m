Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E90C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm5lVM8EDKgT+3YpLIFNGAHmLw8NNlG2njBdeacGkBA=; b=xpE8lpGnHpt8Z9
	lJYuiXVGRn7a9zxMtkmxHAN1/2rkxxx4NO9iZOVcSdZIEt4h6OS22kpFPHUnnhOtQNNukJEgvZ8qZ
	EB/khzRNS3g93g/qk/hNMFZeuWO4a4JTF1URhINPlR9tYlhbINau98EuRer/Pq7aH9YimtPKLnltG
	IdRnFbsXFPU8yTWlo1OTRM9f/iddOKfy90q7+jUqehbb4RQHxny9CX0qshuhTtqTXhksECg9C/IAm
	RxRa/ibZ09QyPKgiPwDlRAjLejE0I2afDFNuT3TLXtXzCwUg5WvmqpH+LScn+6xR832X7sr1cTBUk
	3CshZ7eNzZ18Ydk4miZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJL-00CXkP-B4; Wed, 22 Feb 2023 13:37:31 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJE-00CXgf-Mg
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 13:37:26 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3E9195C0114;
	Wed, 22 Feb 2023 08:37:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 08:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677073042; x=1677159442; bh=+/
	4foVkx/AAkjDoTO2qfVYMQOOmzfm5uV10l4tbGnOM=; b=bEC+HUAWsEqXDeJF4X
	MA1wqXCKJ3T2WcwxsnS4elTB0VjWbYBje7oacXsnUgnACmBeeGTB67w8FzAYkqV+
	aXedw+fQrbk6Ch9T0UKEN/g9k8wqPAwrVmUGF6RBg0n1ZCzXlTU322qudJoDORSP
	gQ4KCCvuPkpvkGjZcVxXEQZKXoPedwlWjlt+3P0OBw30xeOQ8NtrDPb27k4vMhbB
	AnKak+Ybarxu4f5rTHMwmzj8cbrKbCd+y3tu2Su51ZDh4AaRLO1XLDK//BcIZmod
	P8vSn6rQzRWQFrph3P0YiywCRCfaLgV4RpxIQXvdpe/oiDwkAaoQdHl/s8uKAUdu
	BL9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677073042; x=1677159442; bh=+/4foVkx/AAkj
	DoTO2qfVYMQOOmzfm5uV10l4tbGnOM=; b=lDTx8Fqm9+4FFLw32LKkKiTLwmjsn
	l0mUUxPCKnaLpsBBiYnHOJHUH0TF7ZblTTeqK6mJ0R2v3St5xbF2tbhe6vXGPjkr
	K3Q0GCn2kau2vIzfTDF/MA8F2CleyTwjfKDBICORHF+kr+373Y0Un07s5/EXt2iP
	sSLw1qR8QIO8ERnP2ikmBv+6d4jBge/anOebCHV+i0oLFB/ftSXv0nS5HftxAtbX
	ni4HtVZDoxtf6OPwBt/wvJF/DW4zkh20/yAbILyE+3KFe4hUMrwA7ZrgjQQ76jH1
	S/sIFdtmfMVTWJGVMWoqV+lwwHsuNMrb68d1F3826n6W1sczGsZW4OnOg==
X-ME-Sender: <xms:kRr2Y9rLXqnHgjN9OiU3Ioj4Iv9MH_FQTuX3iskwPFYgXN6RnrxuNg>
    <xme:kRr2Y_rDcIlUUroaiNON3InQinQ5cZER9GPwubvkOXyqhARRY5o0zYR3M7r-iboZV
    5mESgeohyKZCjsIDnY>
X-ME-Received: <xmr:kRr2Y6Nl7kK3L-9EJbzaWulMM751DAyK-x3EUTMo_TFLgLxQOnUBS4pIiTCd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:khr2Y44k-f8lGvXVpfkiyhTu-K5nUpUo_usZN-Owu2afTvXZjm5Maw>
    <xmx:khr2Y87oF-dy0Qq1uqr0amcdajC_jRA3PhOwbOcVyP4V45QkI55gYw>
    <xmx:khr2YwjQJaOcURNBXeonaXJ3885rq_0kR6lixtyi68AWcZsM707kDQ>
    <xmx:khr2Y8j0bzq9U0BMjug_XQefxGrIxZw6wz1xnuCljQSdSBkOkuUKsQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:20 -0500 (EST)
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
Subject: [PATCH 2/3] riscv: Set dma_default_coherent to true
Date: Wed, 22 Feb 2023 13:37:11 +0000
Message-Id: <20230222133712.8079-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_053724_847889_CA7B4C70 
X-CRM114-Status: UNSURE (   7.04  )
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

For riscv our assumption is unless a device states it is non-coherent,
we take it to be DMA coherent.

For devicetree probed devices that have been true since very begining
with OF_DMA_DEFAULT_COHERENT selected.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..34b371180976 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	dma_default_coherent = true;
+#endif
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
