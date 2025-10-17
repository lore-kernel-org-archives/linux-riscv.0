Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A8CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AzWE14sW1xIy8OrmN4X/mATx2RQr5H3rYCZwOT+RQ1o=; b=oeCJzGr9gs94fgtA0CfNEa0Uw3
	muK6eSOSngJkfc7dg5ircO6FTxhWigYjOttggNjS/6rqyPvxkWeZ2/OJIvOjAXVfgm9hZGecZC1pk
	20ZVC2MpczJwJe04eWuntVGN+7qoeu/YP0T6410Aqxmko//GjyaSkqU7CjtTWgwHi7+U9jFshX0i2
	u08dlsAhucOi2noah/yW/zk0Mno+cqYIxnb9lkq7x0E0iuQJKxILFEg7mE/1vLkppoxSm7LNxqhsi
	JtvFXDU8VsQ9chL1n6fhAydnJICePf+C6KaBznNPYaSw/xxd9Xu8vI1MviN/kN5HYa8ZCnPyQ+4o+
	6D6brB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hIE-00000007Osr-0uAO;
	Fri, 17 Oct 2025 10:02:38 +0000
Received: from cyan.elm.relay.mailchannels.net ([23.83.212.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hIB-00000007Oqy-1sJF
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 10:02:36 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 266F06C1FA2;
	Fri, 17 Oct 2025 10:02:34 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.116.100.136])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 18B856C2079;
	Fri, 17 Oct 2025 10:02:31 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1760695353; a=rsa-sha256;
	cv=none;
	b=47EyyEKQnI0TgEXkP+KaoKBRVN3THrt1Hw2+4i/c9A0be8OOMacShCS5IcJRnwo3gO1SEy
	j5wxGjhpufJZ0EzzphVR0rFL/NHwHBTPr68nkEk3TLiHjIwIGyqAP0Y5wTdx+wgfbJ6+mW
	poMNQa7KQMKmL022lvxvpf8U8sfB9fj1mZAmVzRw0wL0YmeUBDS/nW7Kleo0z3T/FDmtlJ
	25kaTH/vlTvk/Ns30IwNFKTD3XtOkgHCep2cJSQMiv7L5p8DBghKwwBnUtr3FrSagHEkSF
	cEIENGwLh7Z9xhjhuJFTfKj45H9KdlMGFw2jMfnFRw1Dw1/z/aHv6OG0I1KflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1760695353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=INLfLanNrxPT8zZfl4wJScpkqHE8+TQnHHl9RjngRPU=;
	b=pcqnvVptgS4/Pat+gdc00QGJR2YyQk3kS4DnaufmLm05GSJQ+upSdE04buWQxnM06y2x6l
	jf6b8Qa/k7x5G6mtiqQoFgT5n8CNXQ5paiFUkBmmp449AseRu4BZ9MHe86M0AnEG8ouBdw
	XsytIsJh+pEdoRR53+OBlitXSPwd/oYkOCMrBIviuAW4gBULTWbrGBa+q15aRlVcjVjuth
	qEvpNS0DmUZw+NnrSH1/ef0yKwbULo9eRnjCPI8WpooPUZ5AasHJb0MXEkjuMLUAcHSfRY
	HVqzQVh76LfDC93EJBAHkxrqPDt55/exZxspMjxcAoSat59dMBOW/RJSKH4vpg==
ARC-Authentication-Results: i=1;
	rspamd-645b74df65-b2gqj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Thoughtful-Zesty: 4925f2f243cb1525_1760695353949_1738770027
X-MC-Loop-Signature: 1760695353948:450799911
X-MC-Ingress-Time: 1760695353948
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.100.136 (trex/7.1.3);
	Fri, 17 Oct 2025 10:02:33 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:2f55:e31:2877:ead4])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cp0jt6bm4z1yVn;
	Fri, 17 Oct 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1760695347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INLfLanNrxPT8zZfl4wJScpkqHE8+TQnHHl9RjngRPU=;
	b=dquGaOQJ50FuM7nM1sHO4ZKdjfqy1yDixC7SDNjV6UsVxpz11jxtBIYTccQGNTzanQ6jQg
	BGjF4WVVOIbCSjETaOXvEvnwsBFU+Ob5gISMMpgEHxtQBmXgJRc29M2Mu9/tdu3P3q+d+J
	79WJ1Rkd56ApYmlmwMSUbfpLwDL2xANQrgqvA3hMKu2ubY7dR5Od0Fi/jhV8MqM+Z4NqDa
	JA7cBUwHePhqsm7OtGJg3Wibk4HTbKdCcTygPnA+Xla52qQ5caHaNLQFbgh8yRvFOX9PTb
	SJp3CDvrZ6W0ZgbEGMD3ZnrcEc9wj382BSfTP3WNMldys70E0hvJpKO0k/6w9g==
From: michael.opdenacker@rootcommit.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] net: spacemit: compile k1_emac driver as built-in by default
Message-ID: <20251017100106.3180482-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 10:02:26 +0000 (UTC)
X-CM-Envelope: MS4xfE6wcYjsPboHb55vSh1fH6aAWNprdRcSXrdFEIWCopkxczg0fg2oi4JZPXzc17U5fumSNVpTQ8GaIZON2ODWTprzV/SxzxeWxfEWpBdLQlVustMLg1B4 2E0aVkcpL22tFkCW+q4brCQZgjglw8+hW8ijuQ3LjCEHFFNj/MLKvibvf12FqDvdjs7+hGGLstgVYb7ndMW6Tc4U5/PK6tOv8tFM/vEDLVETlLQXgGPIY0qS tMULin+Mbyl2H0Ew/sba+/10YOYSa11413QPUJbvsZIW75r4f1a1fv5ybKbR0maxYoVPICqBcLbM32/WeTXJ1dApTQ6m7VGpvkYrPg+c1Kn9lo0Bt79/7jlM jcteHgroEZ5+ATgAnxmL0a4qDakovt8sGmr0Elzn3WPwqbNX8O8iKaA3o1zltND/hHL0db6jBCiIKTlwCsVwtNnpI11j6eLz3Phb4D9O7AVnWd4pGoHUxDv8 zwPKO2q1g0VD8zjs1aFIIiAWCXNGMbhNTdVvftsqS04neH4yUtvS516o93DY8YSmd+kWiVoq1mBTLcSXCXaoTMS9Af/DwfBv7Bt53WGVj1Kc3D9aUosUiFBr V83j3WnUctOYwGQah0sySMk0lM0ZuqxUSb2OOOVH7j2LYw==
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=68f21433 a=/5xBaVTRis1tCxhfvtIJdg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=WyZDyWQnYPSBde5YxlwA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030235_785193_E7E963A1 
X-CRM114-Status: UNSURE (   7.42  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Supports booting boards on NFS filesystems, without going
through an initramfs.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 drivers/net/ethernet/spacemit/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/spacemit/Kconfig b/drivers/net/ethernet/spacemit/Kconfig
index 85ef61a9b4ef..7fe1b2a308d1 100644
--- a/drivers/net/ethernet/spacemit/Kconfig
+++ b/drivers/net/ethernet/spacemit/Kconfig
@@ -18,7 +18,7 @@ config SPACEMIT_K1_EMAC
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on MFD_SYSCON
 	depends on OF
-	default m if ARCH_SPACEMIT
+	default y if ARCH_SPACEMIT
 	select PHYLIB
 	help
 	  This driver supports the Ethernet MAC in the SpacemiT K1 SoC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
