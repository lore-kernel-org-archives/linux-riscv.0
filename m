Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06F606A6F7
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UKgoDGa2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYZsV0fW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SHz5DVqOp9g0bggyC+6AmGDQDWcw64Sa5rEiNcA9oJ0=; b=UKgoDGa2SQWY07ttc3niw7HJ25
	lPCVR1qjl87XDN3dWluZGJFv8O4N4Ygch2H8ykOlxQC6EF3RbCLUwFDLmY/mBrxqOH6rGHpfI+8eZ
	gu0heVLUFbnJiTroq+HiyLMkAxt0ghZQ6QwYk4V1uRUfTv6aEUgP6IRWw23Kg1IM2XL5gbgAlYOrs
	5OpMMgbk83B2b+MznTNLTTpN5yyiCyFL/6MrmPq7LTYyfScoQdANzcPBdgIUMobs3n82KjJGSim2v
	D10bcRMN7GAUcoXeGqowinUR3U/3xH+vdc+SZDlEkWqapJppkG43n/cIi0QLwJcCX1bh4Z+C1mg1k
	ChJ5Upkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6X-0000000G2QY-1vha;
	Fri, 20 Nov 2026 19:17:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6I-0000000G2Ej-25ZF
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42A6645CF9;
	Fri, 20 Nov 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202206;
	b=PhlnVrpf2kscLzzQHrvmWwQxn83b2xJN1Ws0eqotUcA/PUBpnY3yGUk2EPtsJtQVIGNA
	 By/smh4PzPj0s470lTr42JUkRrgx2hId20U67EaX9Abxyvx1sj/MPnQPvPvgmXgS5+auj
	 IjTy0dBDKt1YDENTdUIDQSQy9QitIZ2h9Y1GsNZqeyURv5pmhNcKyCjf+onrLO13c9AAb
	 lvDtVaf/Yd6gqjqZXGgDKgx/NRx2SP8veQfxBmNlNDbih5uyFNG4h9HLleSm1Y4rIMQ4n
	 As+dQ7hygPXcCbS6UsZm2zgpxvGkPUHeSoZGStYieC2GCKjEuA4prRX+pUOuA/fy7MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202206;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rmfx7QYlhFdbxH6abqp7/AYToCj2a0IViMkw7PBXQf8=;
	b=Xon/8I5Ra3nPP77rdUL18kxBVztZsgtOWXm1gL4RTWQD+8SM38XMSgRyFCerTMtJ7VC6
	 X0bFsyGukHcDbfL8fNXoLmJ5cq2H5cMsl/uvi6NZW8/c9JPpeKnKMZGVLsEGbVNUQ2lPj
	 2bCPaBQ4on1+Vpy9sNE/M5s9uMOQWik4i0S4ohHVV/VoZ7FtLcSkl25Jv2EsNCAEFoYaD
	 wCr+UpS2NWQblVIePS+oo1EBPOJ0Nkz9jkkQmUYmxbQVQIY1qhwy/XTgb+8NCTJglQ+X8
	 zBvxL646cJYuLxyz0swSH0PeaoPqLFumVc+TZSaMNQYxyagHnSws/XmHymHUucaTFMw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75CC21F000C0;
	Fri, 20 Nov 2026 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202206;
	bh=Rmfx7QYlhFdbxH6abqp7/AYToCj2a0IViMkw7PBXQf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mYZsV0fWRhqtpbLApICegaowqoFEa0EbQmUOBHgOmsRhooD5KkgjhegtheuYLmjCV
	 BFH2b8ZjH9oIGmdyAyCdNWYe3OVmY9CdGqMeQj8MsVPHjxAOhHImESg2YxDUUCmXau
	 Fgf6+1sP0c+siUsYOrxVBREBV4hJjMwHM8kVEMUn4fcZl21b3FBgsJc7H+SW4ZuoOd
	 NOSH6ouVD2FEa3TuRjElfa20G/+KQO+gT4K86Hezbaf0e+tYrilh3y9AoL/Pb1680Q
	 OwMdd/MjZ/1aysoDXsNf7kkkyjtqaLH9DsqbCfiE15VmcfjRmbCMt0yhtQvo9fwPOD
	 Rit0XYqTsrm7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BDED54B9D2;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:53 +0800
Subject: [PATCH v4 07/13] dt-bindings: serial: snps-dw-apb-uart: add Zhihe
 A210 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-7-4a795a0a9fc9@iscas.ac.cn>
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
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=1465;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=QLjwbL73GqPkQVnItJ73UGwGElc2NGvSKMH+o+6GPQk=;
 b=mvx9J3mV6IzcJmdPW+I0FhhSHOkmb5FqNp/FEIQMzB2AVPcuaZH8yoCfQNW8cEwOf8Ln1Pnuo
 mE9cgoKzdq3A/dpppN09Ibufz89fAH1Qpr2DbaAh9GxqdZTI2hsQuB9
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

The Zhihe A210 UARTs have separate APB and serial clock domain resets.
Add an SoC-specific compatible that, like the StarFive JH7110 one,
allows both resets.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..a46a87e100bf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -29,7 +29,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: starfive,jh7110-uart
+            enum:
+              - starfive,jh7110-uart
+              - zhihe,a210-uart
     then:
       properties:
         resets:
@@ -43,6 +45,7 @@ allOf:
               enum:
                 - starfive,jh7110-uart
                 - syna,sl2610-uart
+                - zhihe,a210-uart
     then:
       properties:
         resets:
@@ -92,6 +95,7 @@ properties:
               - syna,sl2610-uart
               - ti,tda54-uart
               - ultrarisc,dp1000-uart
+              - zhihe,a210-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
