Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78ACC4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C7LcpU7CwTrOfZSetEzrGPqe8BIGhu+QJOZmdYzCng=; b=4nMV0B+vI76gY/
	10F3PDmNMQpLwZb2e0VfwkIY0bkFL6KdzPTzraupGNCM6ScyqizPzLVW4k7rXsXsM7Zjltn6Eumc3
	1Wu5u9VAKOrMJR0c4BUMyxorOWpZC2KQ9diWRjqUPfs/7aOwSR2meShW1yvoLtzyECVTb3ob1kuv1
	bJdjbAv9duBa5aHyxXhnkbG/ZAb+MDRqfHpazJ7IxEXStT6XK2fvvwkzCqbXqRX2/NEx5+6v9XdkM
	5hiev9SNir3mWUWATciElOwpc8rYzHJmSSZK9EqEb1nDLrB5oWLXKhZDeSlFnhZ1C7bDHwvIwDbHh
	YR7AlLovvKC4wjhxCcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDH-00GnFy-Jc; Sun, 01 May 2022 19:26:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDF-00GnEV-7z
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e24so17192765wrc.9
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcvxHzb8OEubR0d3ZnHVsyg60KtZpqMvRiCsHiDvd8A=;
 b=zmvjifVBMhvWtlSbfD6GknK+sGxQw5lmp2CdidzKMySBsRWio/x/EBc0knxEwLAJqD
 xNgwTI3DlroxWOBZk2bi+IsFDBapRLMpSfqJDmY7w693n71jV5zY7af51hrUhs1aem/c
 KYyBa9euUbjwCp0z83uEkDdOq9FkBLrXbk+LBBKVeM4l4xBaNw6RFrLgfGG/aiNqUMlt
 9bNSIXFZKjmdEwbGlqq37qsd61BjDo2wMPP/9wtML9e+Bv+Ifz818O+jlWH1rfPcsOJN
 y6qmBNgfXAhU/LZ4pJwVXIWaUbdPOlaFEAz/aRkdPe17neTU8EejQhMpkiBYwg5hgE53
 uj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zcvxHzb8OEubR0d3ZnHVsyg60KtZpqMvRiCsHiDvd8A=;
 b=5HgHWYb51sed3ViOfBF1PPTCiZOHaAij4k4ZozoBCR2/kIXreYhjPufKy9p/Ekzdhm
 f7oS101wkHStECi/i4BX6wX8vktYVhYawR8teQ+nG8Qf9/k71uf0zbAX6Ug87dZq9EVv
 EdNANKn8Cx1biexF11gCLIfB6Cmp81ZnE82g5JmUjZq/1NlBhf61/E0iDKrSCj3L5N+w
 eCmdP0bOk+KGeveB2GHkgHQXwEcd7Om4JEXTCHhND9sXvnK302FUl22QrQQcpaVqrgiU
 5kNdde8xYpSXIxbdr2hiHXSfWJsIMeMKd51AWRl9Y3qesoZMFrUXGYTJnnXjY5W1pYkx
 X5eg==
X-Gm-Message-State: AOAM5320k5spWfPJxzqIHxq940gGis1gwnHxXIcaa1GlK5SyhgjGmMdK
 1fYkx1vn9gddaByhDh8Ay6PVug==
X-Google-Smtp-Source: ABdhPJyBlI2wdfs0sSoJucBsSoo1njFepselO+gh2XCZSXanB2H2/0VGN6ShlVVMbnFZFcL2pe/YAw==
X-Received: by 2002:a5d:6345:0:b0:20a:d69f:8126 with SMTP id
 b5-20020a5d6345000000b0020ad69f8126mr6947931wrw.276.1651433190882; 
 Sun, 01 May 2022 12:26:30 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:30 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/8] riscv: dts: microchip: remove icicle memory clocks
Date: Sun,  1 May 2022 20:25:52 +0100
Message-Id: <20220501192557.2631936-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122633_322392_16B9E671 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The clock properties in the icicle kit's memory entries cause dtbs_check
errors:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Get rid of the clocks to avoid the errors.

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 3392153dd0f1..c71d6aa6137a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -32,14 +32,12 @@ cpus {
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x2e000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1000000000 {
 		device_type = "memory";
 		reg = <0x10 0x0 0x0 0x40000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 };
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
