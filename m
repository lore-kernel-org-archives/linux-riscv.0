Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D90606A337
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sji2ZAL+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fdvghn2N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7ojp62wtUleo+Urqlm62ndCCqb4HyeegrgXQ1NTUGo=; b=Sji2ZAL+9B1E54
	gD0/Nq0ReUNLm2CsS1fP7eWJnxF5ifJ+CGwWYafwCv8NH0LBAvdjqssKCEynlhqyGL9US2WVm/mKd
	kC6QFhrT8PD3eEmMxFbjjbE6WtxKdh3IHau4oxF+BQrElbWQkIN08ZI1GKsbVoM9UM007k28cN8Hb
	YuSeZH+Vxn1Db2m69QWjV6dSvjBNeyU2HDcuUtOw2QXdiQ7kb5GiEfc62WY4QufwTGAVJT3s2uZ2L
	GAoS65r7OnnJOSobs0end7GL1GoWJglZaFhKxf3/9isT6wd8KTz2LfDh26+0+vXfyk75nuXy9nNLG
	sjZNA5ft9P6RZdCE7eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNX-0000000CmjS-0Ub3;
	Wed, 21 Oct 2026 19:53:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNT-0000000CmdZ-0Suc
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D29394481C;
	Wed, 21 Oct 2026 19:53:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612414;
	b=GiY52ufscE7qDVyggZzwB9kgSdMTYF+lSBC0G8TXMB4unjxpkydf8AQBKdN5cqe0EK/+
	 88M4dKGjNow1ilDq4ci7ckY3ahjcEFRcOyyiIbh+PNPmD5BhZGKU+z7BHXIwpf2Tl82ss
	 I+Er6uHG3xcws6dMEURbeNnXEWzhp+W2/u6tgYRH7oydTVnqNY4fNtC6J1pZKg9zgDHDO
	 eyncgvVVeXvZ0PFAeU/w2KtWBCMBrH3wX8EtBIafbZAvRch6Ed4wkh61RQujAYOhT3KB6
	 7qEde4+L89UR9h4mUcxqT3MNbMhByPuSKUd+E/JvhWn+aN5mqOUkyBK460DF0DcrVug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612414;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vkSzT571CkM4UxEFjc4hQdNlId998FiFtupg13HTmvU=;
	b=VxxWuaAZwIMcN9dKnJzXoISROGDxQnWgsqRpzR8iJaq/ToU861hkOTtUXkrCXbwXe0hh
	 3XApOV1y1eYkNQbqLwrv99v9+TQtle34k5SLFAF9c4xtzUl6jFTfpSlVGto44dSi2YODy
	 oZdDe5FI1GOOz+qinmFAWENhRFWxLxmIPv13UrmE10FYvbFMDvufAvuN6DPQVNUQikHQ+
	 eM2EjhsCnt2y6O16LmUmiyl/anVuzQJOsiQv7Vh4ZhdiHgRj7xbNHZpxqw0ytrmWMjqy+
	 7wa8cH3irTad7ZiCGwIbyMInL5i7XmJwVWAJH0YP/6/v33X3MHBEzjHUPBZEmPByvdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65E371F000C8;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612414;
	bh=vkSzT571CkM4UxEFjc4hQdNlId998FiFtupg13HTmvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fdvghn2NqxXXBa72xVHiBnop5foi5H645c15BaMMjdeak0eTlCAYE9OHyIefUJlYD
	 WLU2ydG4zvA1js48lQMinu/KHhd36XR/Os4wrx6RhRfL3ithsf2izP820MK1paLAVv
	 UuJl3r+XHJJOz4T8bLabnM/i2Rp86QYKww7nlLjPdcWaHUDdqgVrxAQ8iEm36yxnNC
	 gT9B2gk2O35CvK+RJZ8F2gnIbtSn9QjrpvV4bbtN9skImVVIivKz4ADD4EBqmK3vl6
	 TV4h6OhL6ZxM1zOj9xiLpWZ8dnOIyP9PoO7r7YvX4gKscl5UYPS9ajVpGRYAGPenZb
	 DJcD6nBc7rSig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7334C4346C;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:37 +0800
Subject: [PATCH 17/18] riscv: defconfig: enable A210 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1130;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dnd96ga447dSomCEFGKgHYHO1dgeChmNdmNaEUIrQdc=;
 b=4oI+L0gaFzDPLPpdDhyxx3Mn6LIC9zoATjnBz6K1sg/1+RbNn1u3FS1JPzIuujkKpmHF9PBPd
 QgUh9R+ImaCBrNIwb3pBWor/y7MvG78CUjod+4dHnHByEJTEUiZxHoS
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Enable A210 platform drivers and reserve ten 8250 UART ports.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..b9b3bca12089 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
+CONFIG_ARCH_ZHIHE=y
 CONFIG_ARCH_ULTRARISC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
@@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=10
+CONFIG_SERIAL_8250_RUNTIME_UARTS=10
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
@@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_A210=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
