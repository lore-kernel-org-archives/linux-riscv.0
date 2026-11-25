Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4D606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tu32pimo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxQ0I+1w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wROKBxzajoqiBXLrenLZQliqaR4tgq30II7VXPuPVz4=; b=Tu32pimoIgzqcs3VezSdv8s6oj
	/L2KaAcblDd45akFPzCUKlDz7h0w8+6VWBUDam2gBgPEIdGZft/m1Bsl4jbjHG+M69Ncd8IQn8Q/4
	2/efEXg8j4BBLhNlU+/08xyFSLndic629IfZgrMEq+f+OJvqRaUNIqyqidsuJc+LqiuNVbQn1b1/4
	md1NIhCtl6bYdxSirV0p2ddQkyHnp8/atNSRMwaHJiGzY137l9r7+MyXjv3sdKcLP8uHLCyH5V+1e
	eGyvNz1frYWhwQmwyfnPUmNGxB6wcI9h+ZwJzidZOT4a6vUxe5ksbTYO1hgxLNhnxw2CyByXJtEwL
	yOxgYncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iE-00000008vf9-427c;
	Wed, 25 Nov 2026 07:46:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iD-00000008ved-0bKC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9474E4569E;
	Wed, 25 Nov 2026 07:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CFC1F00A00;
	Wed, 25 Nov 2026 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592800;
	bh=2DcaFXD0125nWcxTRBCp0tsdK90suKgYtEdqH6E3k1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dxQ0I+1wyBYpeuu5wItqXDl0YeN85hd2y+M4I1d1i8LCxA65e4IbcALyqwp4oc2EK
	 /JYN2yvex9j+1VYcnf6dBUuGkDqoIPkoD76b1k912CG3JNaQnVq/IWLEoh6wCjEcUB
	 sT5eM2kOLTmWm4aB60ED/UIk686OCM7TaV8R3W2/K4i7nSg68G2VziXC3qtlF1mYs+
	 09qmwdNRqW+bRKr6MyWpWKAKaMb/cWN3qLUw9YofKNhwOXIzk/o+Z1EelI40fJRzI5
	 tGwgN70YFjZyX9CeAtXfHUyDXB+21WQYhQDyfRIP1AKQNMOK+pIdk6sl7CNQSnOt36
	 vW5zHmrlSy2Eg==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:14 +0000
Subject: [PATCH 1/4] riscv: dts: spacemit: k3: Rename PMIC node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=685; i=dlan@kernel.org;
 h=from:subject:message-id; bh=MM7auyW6m3xTfeJCLq8URarLNjoz56AH4mXZ1+VDyzM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJLSJbFQuRW46QpH4a7S6tvP6mvxRWYlljGk
 A1vqms0bfWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSSxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0UCw//akI7eNfI2+KZ0AJf5C01IhO0AXACxpIX4dvH54IwsIeaSQIyFbKs8
 eQ83LbCCgdP8XWmdR8fm4xEg+ujlzIx/ZFweEadtpyt/sG07wBD9oX1htEXJp4apQqTI2mE+Y1h
 mGCuqa7/hZOXHOoRXET3J3qXuIFxkAfX08u7M99Q6tFGkuhVVqj0ZvDiOpGer0IgTf1XkidfPFK
 Zcuc6gkTk2NXwdqzaK14fFNEBlVdI4LcNWLAIviv+XZFJy6cP3ZhQu5bR/xqEFTxzrebqYDsZC3
 LLAKzEq+mfznnF/TOqAx09yj0scEsasjj03LQNqO8SUPquJrn72gGEkkDG+LW23tow+2AzfT3g8
 HpkgBKM8C3BWqs5T+xaArQpbSuB6XyU1B2cIN6CYsv9lw7Bge3vsnQmXPnOfO1RX4urIlLGoJG0
 GcngL4UuXHAuL1OK1yY0cgF+xDOUrUOOMDQvDyX6vmHSmZKhtchO61grLvZFEHhE+eSRU7/KE3W
 /Hr0g5R869UwU4syAkkZ5jYzyotZICC9FuMBjcNLVZW5lq/XVEoCN0XGt/QGgzMF7KAdecQFIst
 oTaocXlyGj/u7t7wO2s/CqzJ3r4AT3qnnsMoiX636DRoIzmdj9dSqe2bGm0VWviXYLdYc7sGRK5
 oY/k1ov//91UdCja7lvgTqXoRmeLOQ=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Replace to a more descriptive name which follow Device Tree docs.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 8d1cd468cf8c..a4afe24130ae 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -100,7 +100,7 @@ &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
 
-	p1@41 {
+	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
