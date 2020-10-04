Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05315C4363C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 18:48:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B452068D
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 18:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuFvZLSu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="Ugp7HzMq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B452068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chronox.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zex2rEstVJ1yYPwBsW1HlQ0fPWRiYs0nzXDJci1Vov0=; b=HuFvZLSufWqB/1l3/pSN2qsDp
	Gzj2xYhbm3tXxk+RL6Qu96ciaIduQKwIVGOMZeQF9+1OfAOvQJlApwakG9w3kaiT6MIFhDIJda7FW
	E7GDrGsmTO5xnH1lorEeqyFUSjPVP152vzWuv5D9uUb6K/8c8QGJH9Zbk4JGBlpWh9nPuSxpO+/K9
	1S5E0aTHcSsnxzgypU7dzYa8v9q78Ys8xE0JhvdS2+cHOG0STzmzQEE3wUr2Co1bbFzpjPDI9i6NV
	PgWWO9ooCsu6EaVV8HPILOmVnG1PFrVJy6Vah6hzbfiyWLELDcXAmLB0xJ9DJXh8ffx2PqSB/fysm
	Kjvv1PCug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kP93Q-0002oJ-Pu; Sun, 04 Oct 2020 18:48:16 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP93P-0002ni-2k
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 18:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601837292;
 s=strato-dkim-0002; d=chronox.de;
 h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jb55CfmhnQCfrQYMa+E0GB6f9VItN2e0JBTcCBghgCo=;
 b=Ugp7HzMqScBnCLUt2VgMqHG/qhLyt4VbAz+5OSQgMeWFxF6WtRNZFhCZC7O8maY50x
 E6c47K/3CZjTqDU/Qc1R0yJ037DShEwKEKJl0UVxrDN+rRbxR2cUNyX6CmxKKto8b1Cs
 t1oodQEfF3THuNzQkyOnaNdDnZc0c9BGECHeO7G5f8Rcz28oxX3Z+IeD0nIw5GZx7J96
 YAef0LwztivdaeagVwLfWC4eJP2qhP3qhgF8HqKoPBw5iIo3nXiTnBTk8zymEixNHwBm
 x1X+miCKwngIXmS9bWYxNMxQC31EcGsPCFA4h5T72+3rRMOfhAKbUH8kn/RIqA55BGwb
 deUQ==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZJfSYkOI="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
 with ESMTPSA id C0b627w94Im39EY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 4 Oct 2020 20:48:03 +0200 (CEST)
From: Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH] crypto: jitterentropy - bind statically into kernel
Date: Sun, 04 Oct 2020 20:48:06 +0200
Message-ID: <5692716.lOV4Wx5bFT@positron.chronox.de>
In-Reply-To: <20201002064905.GA27115@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201002064905.GA27115@infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_144815_316677_B7407FFB 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel-team@android.com, kernel test robot <lkp@intel.com>,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V architecture is about to implement the callback
random_get_entropy with a function that is not exported to modules.
Thus, the Jitter RNG is changed to be only bound statically into the
kernel removing the option to compile it as module.

Reported-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 094ef56ab7b4..5b20087b117f 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1853,7 +1853,7 @@ config CRYPTO_DRBG
 endif	# if CRYPTO_DRBG_MENU
 
 config CRYPTO_JITTERENTROPY
-	tristate "Jitterentropy Non-Deterministic Random Number Generator"
+	bool "Jitterentropy Non-Deterministic Random Number Generator"
 	select CRYPTO_RNG
 	help
 	  The Jitterentropy RNG is a noise that is intended
-- 
2.26.2





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
