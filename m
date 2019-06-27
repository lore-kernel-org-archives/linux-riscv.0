Return-Path: <SRS0=5nvY=U2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60AFC48BD7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 05:32:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD0C208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2019 05:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsbiDw5w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DpxcC7rg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0xJ8lcr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD0C208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DY3YGsHbP9doRjVyVGiK+egP94ZbKDAC3Tt821pjV7s=; b=GsbiDw5wM0Q8IN
	FK/M/3Km3SlRaqRiXuN3X/Vvb7sWztudts1kM5aSX/337FjzOCaaWIbIeUj6jKPAt9tu30hnRFJcL
	4d8THv9w4Vz2iOgA6SU/gGwC/MOLQgPRQRkR1waajl8gnT5iDRVlk5+xVJ0k3ANHDT4yLxAUwfkmr
	WAV9G3YZ2Ekn2i6OzptLaNWnn7JhpBwCK7zNUDUHvZf+8PiCoGi074SHFCiTfJ7E+UP+A0I9640sK
	wa8dcUPxoyRQ52C8dE7FVsC1fQlSh0QtmJvmuDEmmQuyJK7GxbLMjB6PSr2wKXjYMqSzeQz4b9Dlp
	drvgDP9jBREcrSg7SCXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgN0o-0003mQ-Qz; Thu, 27 Jun 2019 05:31:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgMry-00013R-J9
 for linux-riscv@bombadil.infradead.org; Thu, 27 Jun 2019 05:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yl0vYQF05N+d/WsfiuYyJqikcA7Jz+pxwRMR/3N3uP0=; b=DpxcC7rgezIBeNqbPulSQLJlJ6
 WvRzqYjJsHHAdlWmTPJ429gohnmn4TcrlWoY/+kGj5SzIsf/UU54KhM86cPPj27WDReWRpmKm/ikK
 ZCCjwlMY0b3nh0dQrYQ/L1e9VetMTJIu3m8FYoOCOzlllO/ymAX8fgXiwr4Z2j5UC0atpZrit9d3S
 NdablqaalUmWylGoaoBAKiylMSCt47bHpL8F1lLzLgAT0Ot8U/t+olwLS3uXtHASjHNiYcJ33l8Nf
 4xsHvGWd15ox6sLk5LdossK+soFNbUPlHiu7MdQ6mW17ersbkh6DsA9QPNLAv6tsF7XUSBYxibeaV
 dNdvQnWw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgILi-0002Ks-AB
 for linux-riscv@lists.infradead.org; Thu, 27 Jun 2019 00:33:16 +0000
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99EEB20815;
 Thu, 27 Jun 2019 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561595590;
 bh=4vNT1WqCDwINrAB1eZm2chVX+WwCgriDgpieN3a2FRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0xJ8lcrD6zJH0I9aORh72yJSuElla2fMWK3Z9x89ymsMxvasyFcLbI54j1JBuj0X
 PaaXPtlznVC4cR4tn6fPMlxQ5mOLPiurbpPSFkNMU7GNtk9En8N9F0GXly9QBj5FLq
 V83ZDlEQuB8t4qATgBpQN/NtszY1zIpZOYo23n5Y=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 49/95] RISC-V: defconfig: enable clocks,
 serial console
Date: Wed, 26 Jun 2019 20:29:34 -0400
Message-Id: <20190627003021.19867-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003021.19867-1-sashal@kernel.org>
References: <20190627003021.19867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_013314_496926_FF097C2C 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

[ Upstream commit 3b025f2bc98973f181d926192b0ceb6ced0f86d2 ]

Enable PRCI clock driver and serial console by default, so the default
upstream defconfig is bootable to a serial console.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2fd3461e50ab..4f02967e55de 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -49,6 +49,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SIFIVE=y
+CONFIG_SERIAL_SIFIVE_CONSOLE=y
 CONFIG_HVC_RISCV_SBI=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
@@ -64,6 +66,8 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_CLK_SIFIVE=y
+CONFIG_CLK_SIFIVE_FU540_PRCI=y
 CONFIG_SIFIVE_PLIC=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
