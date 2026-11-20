Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A29860A2626
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m5u826Sv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gm10O6Be
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4uK2tXIDOjCUtTd63UVubyyAEEEyvrfYIaHCYGrAkWM=; b=m5u826SvP9e0sbIhm/NvyJHfrx
	ONCdLjeDQebawUYhIXjhEatQpc/SPeK3rcQIUwFlQ+IV8P5ChfxKXRzacy5k1+siXweU7020ojdhK
	SUkS7+UmaY4Fg5PlGqQorx704dBNsWZka5XwwGxQnFKlAe2RJqGrto4gAu1+9vnp3lNq/7rtrcTsa
	V3R/9wD8RnpUNKwhS90Lx35D6f5UbgiVcVDLveXUCq8mHoESWblUP0YafMBq7c2CR8PmML7OZ842z
	+CTRr4rWnBJEBX8QWMPapysUT/VMKcnR6uB2EaCxe4fEblWx/CbSFZtats76lsMkEhBse1kxdn7T1
	FZQlGDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6Y-0000000G2RH-0zDa;
	Fri, 20 Nov 2026 19:17:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6M-0000000G2GL-1Mxr
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0979B467FD;
	Fri, 20 Nov 2026 19:16:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202209;
	b=znR2zmqO5QYpIOU4KB8rZOuJcLrEaBSWSNBbOl1fiANUM1nhAxURKH496EWrLgDAKnQ2
	 HxjKcA/vA7J+HvdN3ehEqpzYobUd9a/mOWBhRtLjmOPzxUJGTAcb+Z7K1ZYprewAK5WLQ
	 iaV8p+tZgKrYkWZf5KGz5yfsFHPQZzf3HjDk9w8RXSQ/3JPvrRxwi8oA1l2Cxt0doVyuD
	 zPaK5WruhphDFhzDY9Lfmg5Lkj7VpIxoN2YTGpm1DtqPkT5WiyQOXJzZU2bE0hPpwWuoI
	 rktMLxihEl27CN9MjdUHdwJB8UtraJMcGGTeiq2lFziNqiJiLofBju9se3owIbz+6tA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ne2gE+0c5VVuSEJ4JgnLZoMrp02nkPPc7XwbkOsJy9U=;
	b=erSoKW7i947d491R5himrvxKf3QQWrJj74BuCXr9XH34ZeghHJ8p/Slg6iTxDtZK77fi
	 Cg/zXVcqt9hKBCJKiuLvpmDKPSVnLW52o2kk7EZALtdCot+4D8b5b4jpPYvLEfJ5v7Ex4
	 Uz3vjsCrCPb7W38QN8EcbN7ZnWtJrCwmciosnDWmgB7XZD18Jqb3Ma+/259cCXVU3BPrf
	 Ckavj/cnvyFwx2XJGOFUOtauU/HqYQhcmokBfj8BpHRyjDPzyioMQJLH0/dSQc5ldPxYp
	 NzYNACL2pIczsv0oIP2vc0nDDTbp5umUcACPZ7fLjEn0tYIjcFbF40wTEIM5VAS3mkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BB0A1F000CA;
	Fri, 20 Nov 2026 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202209;
	bh=ne2gE+0c5VVuSEJ4JgnLZoMrp02nkPPc7XwbkOsJy9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gm10O6BeOeFETn5lNu8pBVYWDsjfwU9e6ADBBXXHO1lOPmu/06Ebkgc4LdOYy+uic
	 d9aWU4Kx/beSNlFgWY64nfJsKYDCXdpNYlhrsvN/YM5XC/x00T1MJjOgQTbTqCTlwy
	 +i2PbLbQwEviulxRM2ygSWgSJmJA+VAozC9QpgdNlrl42+6H/Qh3Kb9A34XMyEg1Qw
	 JfxQq5IvA7Y4oZhziFYc0+1zTHC3JIREuULtvvrP6ltzy2NGG55YFEAXWMACcGEmaH
	 g8SFiwNZaysx6Hqtkdo1utWHF9aN8tZZkF06OlTEzNcbWvIbQX5CBBU0UxYfL/aEnu
	 kjuJjC5G84hSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 70E704B9EA;
	Fri, 20 Nov 2026 19:16:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:59 +0800
Subject: [PATCH v4 13/13] MAINTAINERS: add Zhihe A210
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-13-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=998;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=4+K9oMgmXDDNfWP3RQVazEGhA8ORba3TgR1reKRQrsA=;
 b=7xcyBtu7YBanong5vbppbomKxRSQ5askeWhUrWIhxQ49iTgHE+taiLAE4M2HbLLzGiFk62t3o
 ZuIW/KgYXZDB//lw5jViGKgh8McyJDTU0lHz8KeFABH1yAAJZAYqs+j
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add Zhiguo Zhu and Han Gao as A210 maintainers.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..a1eb24fd742e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30928,6 +30928,18 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	arch/x86/kernel/cpu/zhaoxin.c
 
+ZHIHE A210 SOC SUPPORT
+M:	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+M:	Han Gao <gaohan@iscas.ac.cn>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml
+F:	Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
+F:	Documentation/devicetree/bindings/riscv/zhihe.yaml
+F:	arch/riscv/boot/dts/zhihe/
+F:	drivers/mailbox/mailbox-a210.c
+F:	drivers/pinctrl/pinctrl-zhihe-a210.c
+
 ZONED BLOCK DEVICE (BLOCK LAYER)
 M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-block@vger.kernel.org

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
