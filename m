Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1D0C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INMXpK8Sny5EnAqk4t/6s8JZEUa1RQZ4oqTiVoaZaKc=; b=laOsaR+UAnmxBq
	5X9S+nN7z5/ELmFXlflhPgE5yqKmiDEZi+J6mJzFrDAzmz7B+JzbOHQQmNZtB72JkY7zUdVUB4jMJ
	N06faC0hXs7YdiXSH/ChO3v4li0yjp71POD6iBDpU1toZ8Luk0rmozDOjjfeyP9Chn9jh7NCXnO11
	7oPndyqjHYlaayCRAD89VjWaiW49maWyXSqFrpFyHCVh8dqBZiXQc+hD5nV6a5GuQYhut7JRWxJNz
	P1wp553BMLAHP7WdnnYmCN4kHBBmJQ0b9g7/qyU1ipEt4yyaBB/1/fHlfd0LcabA1OQ4y6G+fgag2
	p4JfkQLCN9aI+aQDoNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLia-00Ca9K-44; Wed, 04 May 2022 20:35:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiS-00Ca4S-HY
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id e24so3508733wrc.9
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kj6gvTW508ioZB9vcsmBa5dLyYw96Kxg9vwOPe1U7nc=;
 b=ZgdbVjocHD1S3M+lP8I4gH6GE2rr3avbmlNrIjk2/LFKV1MqKier3SIMbVlIHRTDan
 vdqKRepi5sP97IeC7HIy5liqihPb9OVfLTqUaeTx92WoS2k1wCMka0qf9kkzNUW0l0cx
 BAmYYLHeCV2rj2Qd3V6sL8ZIA71qB3Fa4G3bC8Z4oEI0sjGzNquuLw2GCdvmLKBHJ+Hf
 zdc/yM0nQiCO5YgyFMK6+Q1J5wv+7QxVDpfatED7jKxqnAK4AJUha/KGw/gLEpjAuETa
 EIbi/8UV1zNuR/iBM8m0k9TC8xpydg2uOxhD+lYhdNbDFSvZNG8pesj1n7qDAPsmVbrI
 gVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kj6gvTW508ioZB9vcsmBa5dLyYw96Kxg9vwOPe1U7nc=;
 b=kXwPfBG/Q79fFYefdnx79mxXduADHqdd/kqYxXPMjDor9kTJ7rg4cK5RapPNp6NlRU
 VJRTYrlarRV9Q49vqXLrbbXWnLq5r0vmml6UT56EK3nxAdRnOM2ULI0Z3eWY82V9V9pi
 Cy5UwjZcHjFr6vwkPyt+cMPL/OIgR7Wz4gN46NuYGJuYxNvs+KTtPhF/TzE/1VzX4v1A
 T7GxSPBmL4LAuOsWzd++XYoroRU5wRnjPyBWcF5qjA+N1ItUWDgD3ZR7juZqwt3c501a
 K6KI1gs/MsMnorG+B4DcdHfcEZTtalUM9qbChCyoiYI4iK30Qv/ZoxoAZtu+LccxeOYt
 OXGg==
X-Gm-Message-State: AOAM532qz13dIualOd80J6QWA4ZwaB6jRqDGXzvO8DHsgsOM49IWmYqW
 7xOiJud0WUaIjszfCsJt+dcojw==
X-Google-Smtp-Source: ABdhPJyHwjBb3mBRYup5T5Ul0WqJx3T9zZ3OHhmfsSdK2MfyRNs1CmC2GTuBHMEQSuFPmjaaCSlndQ==
X-Received: by 2002:adf:f0cb:0:b0:20a:ef39:d42b with SMTP id
 x11-20020adff0cb000000b0020aef39d42bmr18219145wro.8.1651696512891; 
 Wed, 04 May 2022 13:35:12 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:12 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/8] riscv: dts: microchip: remove icicle memory clocks
Date: Wed,  4 May 2022 21:30:45 +0100
Message-Id: <20220504203051.1210355-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133520_626189_1F133834 
X-CRM114-Status: UNSURE (   9.86  )
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
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
