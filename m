Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+msZjxUiNzpR+/8hjWfN3zmmzdQS+mEkAybhsE7jR8=; b=tsg2Bq4SPU77fI
	uISyVY+ZpTQE4v/ylZqFu4z5xlBag8ktN55mYZhEM42Q5y8dsVNVOiK9pfWVFz27HA4NdRjrBgrYd
	hieE16YdRKneHx4gz67XRBE5I0jlIFAizbCzgs7f8hpgkgTmg2wh/RFIUOslpeFdWw0Fg4RzCkORM
	LM0fLb36mJhKSsf40QZhSfK1glB+q+JhVoGmFdC2ihepZ9YZhCWgzzhBAQ1LXbwnQLjPqbvjUlkHq
	YFLgrHK9jlYXWTXmz8hdXeGcqRCIuvElR8IPn+LplkR5wlvYvFMEod1bzwJgsvMoj4GTsjgDgRgVk
	jqynrprU6NfwYKMkLE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgx-00Daqs-MN; Wed, 29 Jun 2022 18:45:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgC-00DaFs-Jt
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r20so23805875wra.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xPbPYlymephNVmTF4XMmqzgSP29N1hKW0nY3OhQ8kt4=;
        b=bIL3O+08jSafbGtb7U08BFLv6ancGGHOyy8t0PuyztZ0247LnqujD+WEk1rMsOM5Hz
         x4rbXKhptTq9voYY62GNR7QzTopeKEUDk0JivS1uwsBcjxPN2n/CXBB4IOSdhPCdVN30
         iF4DDu2c2NUkBuOkWAkNrx+XHLu5HWbytieuTXQ6YOIsvbQ3CRlZuDbN/QNvkIFSLxZj
         KsKxVsL/5aI2KP2l0tOnjXqGzGAaXjkz+ia9erDlkqPPUZmRGN65QSlMuzTTewm+GZuH
         ISKmZiEQbwwDDwl11tRKVMC2d29J4mdLuNUJQ9OcdhM2RVwpRHFZFcpIHcUw/K+zE38G
         XLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xPbPYlymephNVmTF4XMmqzgSP29N1hKW0nY3OhQ8kt4=;
        b=AtRGQ5Kxyp++sO2Z9Q7kMwV+2ap32wUkHpivKqP/t1s91jImsKUXceHBBlWk+IeIj6
         0zyXO3bjiiy04WE+AZ8EXUoc6tNThDHqxE1m9jqLJuRVRc+cjHZ3piQDK2uUH35VO0JI
         fQcOBpm4sdGAI/NzT+zcSHLEaXwmSmE/XB3wF0DikOvRqUWnxZwEpRXHD2k9klWQs2gp
         SguHrShK6+FC9GhDcO7ltRPQLxSTvUFiJj1zfwaZLk5pmkv4TBIekuF3RdPaL7uhcvAx
         fquJrklavfvXqE5L0v5BrSRD0M55Ab9/ZRzBYsyfcgWyUlv8ScUzMVaSGmxZSvDNFYJh
         k9WA==
X-Gm-Message-State: AJIora96W7UwKckOGtZh22wYVEayqEitWrfLO3DYQ66XshqU+HR84cI6
	RY1/r7IIeS5EtnBM+iNE4SXUOw==
X-Google-Smtp-Source: AGRyM1thyJi31gfTX2uVAqIx3UeLhb+ISWNyFKRvah2HDTfAAbgqaVsuL5zuItNJWE1qpvCtHqQqvg==
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id v6-20020a056000144600b0021d2245ab65mr4552665wrx.315.1656528287443;
        Wed, 29 Jun 2022 11:44:47 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:46 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 07/15] riscv: dts: canaan: fix the k210's memory node
Date: Wed, 29 Jun 2022 19:43:36 +0100
Message-Id: <20220629184343.3438856-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114448_746913_1C462574 
X-CRM114-Status: GOOD (  13.23  )
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..cd4eae82d8b2 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,11 +69,13 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
+		reg = <0x80000000 0x400000>, /* sram0 4 MiB */
+		      <0x80400000 0x200000>, /* sram1 2 MiB */
+		      <0x80600000 0x200000>; /* aisram 2 MiB */
+	};
+
+	sram_controller: memory-controller {
 		compatible = "canaan,k210-sram";
-		reg = <0x80000000 0x400000>,
-		      <0x80400000 0x200000>,
-		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
 		clocks = <&sysclk K210_CLK_SRAM0>,
 			 <&sysclk K210_CLK_SRAM1>,
 			 <&sysclk K210_CLK_AI>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
