Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA5606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YXzJ/zYv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCXHdLRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XKcKnw0qAMvGRQZZMIGLKOdMw3bAuuEwV169TKl5f/w=; b=YXzJ/zYvdlz/eMjTULiTGHz4jf
	DL+BoR+Q3qARbpAnTEFFgEtvGjhh0etvDA7e9zCymCl6Fp69fo3YtOYq1+SwlgRPOjgTxRAoiml4A
	TpVo76vwxIk8ruW+AeVLMcMoKqRUhAW0VblmXWUM+q28MiQp2nSx84ADZ4UcFACj5zuLxFFX5IyNK
	Pv1mQFuaAP0xXf5K8w/a0fK9iAL4JQWcdLQ+bRL7NpliDsqINFUN11mtJtoTB92KxNcPC+0kFO38G
	lBaBsj5poXOTD38P7nriO5jDWoayXgRiwIuvQIVydIiV7iEGZNje74tgFuYVdKpsZZo4nDBaR3h0H
	YbeeV0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqj-0000000Eiy8-1GMv;
	Fri, 13 Nov 2026 22:34:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzq3-0000000EhpO-2aOs;
	Fri, 13 Nov 2026 22:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58AEC46C45;
	Fri, 13 Nov 2026 22:33:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609223;
	b=Cfqnq+VgQvnXxMtuSt2tP8cGIX+dAfsjkA2Srd1L0c9wTNZNchp7vYjf0oTMIapor+3X
	 b8g2rgiL2bBEnbo7pm0DcbjF5akbOYiU4IaaIj0sPqJaVXJ/xaNf9va9439IgkLurTfbg
	 7mBR8Hf/Z2Pdn9GerIE8P7YVkpgEF1DNmWok4HUTDLetogwlsqNGJrDzW3DpLlwH0ptvy
	 HWiLg9qRwJk5FL+2UxI6hrO0KwwwVgbf5tw29e11BrbFQ8DuqqspoV19ZYTtIyNAoLJ4D
	 tzdtsc0nwY7UzigQ9ppcLFywWr1qDtQ2wYXKZSw1elXLqSc17gfC6rOfX+bNOgB2DxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609223;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JwFqOKP20g0aC7yp0dMF04OjCxUKgcRvU9TaC/BzR80=;
	b=Ilq0WS7++QBMXINskeTfkv1BRozYHiKek1828s4fG8AcLv5qg8vmGx7zQiVXEN98MPOP
	 Fn72XvMfU2c6MoLfUez+idaHWqO+VgYLIVdt1Sp3Oghb+V4pl6nP/y/AB+799bEz2UwLo
	 gV9qDq2vej2g1//Q5IwWjVQ2ctM3xeEeX4YpA6fNHSrGxbFqvX7TeTfbRk6MZnNA7uPT/
	 yuSSEBOuwWNBaHzGQCujCN19WHzPY36Ef631xviA9rFNx8a2OyReq8ccinlOnbOH95LCB
	 A1QyYWrckhCUAc8zmE7AIaLzivxdWVyc3G+MQpuAwC8bpY0mr7MrL0d/RptavreXd2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2B8E1F000C5;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609223;
	bh=JwFqOKP20g0aC7yp0dMF04OjCxUKgcRvU9TaC/BzR80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BCXHdLRwmqWlF/2aUfKDVB12YsuvDfKHRE1C18YiVLHjVW/+mmHRU6orZ74ECnR1U
	 lxq1xB9k9rl8Eg9BpLEPGXr+KoquFd3OK33orrD5XGQjXWhD7ayucjBywtP3TTYfRT
	 Ry14g4FmqpBrgWegX9nEyANQQ+29wTQyk0knFG3gqAu+20/ANUmenv1tSjZmV94ZgW
	 jKRaMOAmiRUso0ZreHUn1Tzp+JzWhDgbYPs0DL77Xa5Yv0JLpMereIiLvThLAyiT+B
	 njE//EK8LLvTXrXgk5e615fUqRnsy4OcQG5vyeiGEmzYI02j3ErU92yk6sOEVyObim
	 Q0hVAGjWIg8iw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E14A49B74;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:34 +0800
Subject: [PATCH 08/19] dt-bindings: rtc: sun6i: add the Allwinner V861 RTC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-8-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=902;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=F1GNhVpodsXAYlEoyOMPo+2vHXQnhpYEkGTEEAeJ24U=;
 b=r31usjU0JpNBnyAaJ6yw0tFh3sM1hAcG8U6aEklPoM93eVC8D7WYOsDVfP5Z8K5DzDKgfP/GZ
 KiiBLhKjRvSDJAPRwJ137YPvrIo1pzy5Oun+vZaS+OGZA1VItVeH/QU
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

The V861 RTC is compatible with the R329 one. Add a compatible with the
R329 one as fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index ebe35f893f8c..9d05b61acedd 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-rtc
+              - allwinner,sun252i-v861-rtc
               - allwinner,sun55i-a523-rtc
               - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
