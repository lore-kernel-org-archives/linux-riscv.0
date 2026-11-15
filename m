Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A7606A329
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fOxb8dSL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=Qo7L399l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5QOYN5jUDhpbOoELQATfR8BkyjlB4e+p2MiQf0mrTuY=; b=fOxb8dSLAsqhcmmk+NyWQie0lX
	CzMC93AhO+mD8IQjmdDtsUUnw18FVC9r5TfCq2TcGLex6IfsmPUVmrGq7ik/zc1+dqxcIxYEqIfUw
	eEuZl7EkkCUzoTNAtoCFrhtowtp/5BwqT/4mXWW4Pf0pK2S80YcE+USpOF9QJxRz7bsr21SXaMKp9
	TsMSZ2oEAKujWVQkX2GarN4b6bMEUKl35OklMvr/RrwODubLXYMZ8sSdYq3q47SS3dWzfNh7EMH47
	xSMvxLePjyR9npGtdo2gLr6bVBOdBshPxPcBhyjgR0+QeBKkk38/0XLo6ikoNbi2qq7abxNAIYkV2
	c9z5cjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgHX-00000000Ovx-2Zkt;
	Sun, 15 Nov 2026 19:52:55 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgHU-00000000Ov8-08eO
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 19:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772319;
	bh=XE3u2B+pN0Clq+eTAS8Vx72LY4D/+Nfyr3FEdeu11rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qo7L399l9NleUXCjnlQXkzYIlH8zOC8RAfz2zIV7GAeI4Xu9xnbXqPK48kq+nadTM
	 WvHdHm8lRIuMherfpTsMGpX33q4LXZKgV2fmz4s/NhrLpvAl7H1C6w8Iz14VBmomZ/
	 8GPkp+Ym0XpN7Lh2+Ypslp5Vil6YKcqY+QlT51ekbBtbBxAO1edNyvTr1qSTeVfoZ2
	 Hc+f22wkhvJ0aEmgrXKnVLQ1yZV+s31YaCCgJyOOXKK/KVlshSy0WOfBsQeXlxbFnp
	 frBxiSsPMbHGw9KOSewDiL+F9VbXwHb6DlCZtKhDCx+Vaa3BOloWJ5V6OwxOzgW44v
	 p00aaLIywnLoA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 371DEB220212;
	Sun, 15 Nov 2026 20:51:56 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: spacemit: k3: use com260 8gb memory configuration
Date: Sun, 15 Nov 2026 11:50:59 -0800
Message-ID: <20261115195112.32120-2-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
References: <20261115195112.32120-1-e@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_115252_220868_78DE9488 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The boot loader may override this configuration based on stored ID value
in EEPROM TLV and if it does not then the smallest common sold
configuration of 8gb is the most compatible option.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 054bfff7413a..c18680b963a4 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -14,7 +14,7 @@ / {
 
 	memory@100000000 {
 		device_type = "memory";
-		reg = <0x1 0x00000000 0x4 0x00000000>;
+		reg = <0x1 0x00000000 0x2 0x00000000>;
 	};
 
 	reg_5v_sys: regulator-5v-sys {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
