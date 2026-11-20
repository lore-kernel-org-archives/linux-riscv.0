Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF660A3803
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iobfq3/7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXT1FYTq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6qLA83D4/9gzHBGnCIxuY7zH8bSkaT+6Obu5IxKmyQg=; b=iobfq3/7BFHcezxS9u9kIk6g1o
	8AAP/UrSJrnxTVuzODxCdWbWSBExWtn0B2WULzd2qpJOSzmKNZqtTtQgi/MUxj4JkKAlwv2trgqjc
	qu4DulipBBWE3VdSsliEkHQIjrrhMj4q2R3ANzyXOnNH1hVQazxwIpYvd0YK3eSAvIkzeUfGcd3iF
	q8JxehppjrhZtq1JpiwKZd45WX1r8m/yJrhrGM2dsfQFvvZFJafEvczAONUzCp5fdTVfmbDAWrBXa
	j2Rpl2BRz+orjjo+zI0xeuhO6P3lez697XjKcMTSyjbIrzJHHK3pWiWMs/N6dKjRx5RKt90o6Pz2B
	NUZaFEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6I-0000000G2Eh-17dW;
	Fri, 20 Nov 2026 19:16:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU68-0000000G2Az-2jh5
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96B9D6212A;
	Fri, 20 Nov 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202195;
	b=U8wEpGxwpssbJz4blbonnIO5Y8HSPCIip6qzwmqAU46JuxKQkxffly+0w4lpXXk7sdam
	 Al18Q6/Zya7h5JMcw1L3me06cga2c7QAfsIm1OxUv78wDEHIsq1BJGGsfGIrQtupHuqIu
	 xIbAURdhrS27ohJUbj1VoAG8pLtU0zR4oO4Y/ahEUqeUM9H+boEHiNPSN1S7P7GBU5xzm
	 6oxdkN48Zm85qOtV+XNEXCIz/+TLXu9OinEUYySi42IMtZD7zDvi6d6+xgHJ+yMFf42U5
	 7Yvz+qEcxbfZ9e7slwGkWHbhYIxwoY6JjFeR1iBP+ohmFPZOvgMzCYQCoUIgEFs+kuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202195;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=X1gs5KeCo1v5nVzDOONX/rjGPthdxfNaqSCGYiFENeg=;
	b=kyX+XhqYthejGGXi5X1BB5iCKnjg+fQTsfmN6T1R4xUZjCs/aWRJUoCl2+1H5UqjEuEi
	 lXR83MHUbGIZKLmjyHVCfQQDpnKeNFelP2zE4MlV2ahbnmwZVLZSyX5rSg4VIVkQZvAhL
	 UU9dKXZ7NcwUpW9UEOU6PtPYC4TvZk64gWR31FYys6AHAP27oIwEI33qLo9M9ZoDzbCS7
	 B/p9FoYifyMytQgVkwfFKmHHNcSQTcJjsN1owOPRvcg6SH59wcMz+qgpITAUWCklVrZcK
	 OWUFzroOmnwQzyQFJNZ53BVWjiIpx6M/o/KUBwxStu618sOh9XLnSHdwwDyuhA+fMfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 833E21F000CA;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202195;
	bh=X1gs5KeCo1v5nVzDOONX/rjGPthdxfNaqSCGYiFENeg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lXT1FYTq57B6uAhfydx+OTNAutLUUGfWWbzKAylE/NUA/Np6/idde19UDURpRKJyv
	 3+jMLYjIEfADsRGHUwLpYjeRsd5N575Z8WfXbqUm/o0yBmR1okACxDrcoj5AviJDhs
	 JGErSe9YJSdfQKRPxFPu3doeD1s/JGlp/DJ4ZjJHp73m1241zqJgXvodtJmq4is5Bh
	 zfVx3YK+5oSALSZ8J96FXtdO4fFHlwpUtokuZ2hpX2Ksy9Rd0MxY5D9z8os8gmfTZ2
	 WH2r/JEaal8wb/Bf0HrJyCqW3CgANB2q2Pzhnpc/1VYaGtfk9b8d1ES6FqhUb4//Dh
	 LvRzm6wbk7bTw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 131934B994;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:47 +0800
Subject: [PATCH v4 01/13] riscv: add Zhihe A210 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-1-4a795a0a9fc9@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=1016;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Xvkj+SoMFEM0aCTapUCLJM3XOLxV9bGDyfr9qshYbdY=;
 b=T7MP/76xYCAKU5w8NqTFMcRtQAIkbRLfydOKpgQvY1FLftb4nEm3Yhd0DRAIEPZw/RkonH/fK
 SRMZXG585TuC2Ofkq9niiUkQJFFfpd+z1/La8+sRICabQ6bh74hY0YN
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

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the ARCH_ZHIHE option for the Zhihe A210 SoC.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/Kconfig.socs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c4983..9e096feb79b9 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -91,6 +91,16 @@ config ARCH_ULTRARISC
 	  This enables support for UltraRISC SoC platform hardware,
 	  including boards based on the UR-DP1000.
 
+config ARCH_ZHIHE
+	bool "Zhihe SoCs"
+	depends on 64BIT && MMU
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  Enable support for the Zhihe A210 SoC.
+	  A210 has four C908V and four C920V2 RISC-V CPU cores.
+	  Supported boards include the Melon Pi V1 and V2.
+	  Say Y here to build a kernel for these boards.
+
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select POWER_RESET

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
