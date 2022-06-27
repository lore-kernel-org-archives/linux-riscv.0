Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D943CCA47E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAn2Tym/O270v245PH6+8nHr7fRYTJ0TS/2E0moNgws=; b=NvPtqjEjnGjGTe
	+XapT/QaQAmCZ5Q80IkL5dFRSzeDPpGC0SuzkNZ46LeThajtq+LC/JbcH8SXrNZvCwI3xjAK6sey6
	0ZRH+bg+PzrpegXWU4n+x35evNy1fzftr6GXGqUa+BTxm5k2/pskyw1gdF4kmva6KpnvmaqeiFxLt
	EUk+EHy79vY9iiV19hLTUDSaoXtrUWnbC5Re003yFbrs8e46KWw6HiCz9K/T6Xe9ZtoLINnBwE9M5
	9ayCvmWHS0rR5F78LaNawFdy7Z8XmSoFxpctgL1MeLBXoMeO9uUCT/GpxA1w+1Q7Um6JRj7pWrARR
	Y1kqZFXi201rCy53FM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucS-002bCR-8C; Mon, 27 Jun 2022 19:42:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uby-002anN-FC
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r20so14523308wra.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ycV6k4WWkFTlcXLHw72umTHvHWH8LEFc+03pUq4wXA=;
        b=axHtYlAFA802beerF1xUmeKXQb0vB9Fu/ETM67jL15osjDB8WaKiAX7FLhUA8wDNCt
         0JauD+QxMOOSmVweUIMThSA/MdjGiw2P9Zcf7oBC8V470chKbGUhamRKQSN8/JGghVrF
         C8M9VTM8twqOHV5RLITlZzDwSDCwpD0jZhmR72UHeY3tws9Geat9wxnemuqMicTDOuzE
         0fkrc7rybeNJldWOWrgHWcTCto7RUo3nDSkb90H2c9zd3j5W4PmnmKNN62zarK/7bLHX
         capb3ernqGdYqMQ4XmvBWywCw56+3WDEjld2V385oe5lIaCMN8k/EyD0m83ZQXgpwM1Y
         9J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ycV6k4WWkFTlcXLHw72umTHvHWH8LEFc+03pUq4wXA=;
        b=xFZRGan/qGw6lC9hmrB7JxhBrfLNl/WzQA1K8sE2pUzgcaMWE/QhInHGJ7EAq1WARn
         4pmZb297m0bNiBWYC9zHR9aXWtaETseKSxFhqrnpMNVZjHfWRDMVu0j6TMKjycbrK9cb
         ALgPldW+x4LMu8J8rVpCUkJwj8J/3r912ZgBZnblX3GNp5RzhbZSYfxVhAev2j8GpUi6
         PemnWvOBlHWESnf0A7NAXnc8y9iPiDpjqJrDsiomNd5hGjKF1R+BSI6ygHh0bROSBzVk
         nW7/kq1zVAaunvLfXjDtRP5AjQ5UrLxaCuJzz5VlbFn+EEIlR+DiKyK6xhG1tyoU3YSD
         VJag==
X-Gm-Message-State: AJIora8ABp13Sq1SHQGGYHJF1ptMXmPCuFxXP3EMZYdksfa0vauSaqGE
	haxA+obb6OJCFhFmTyDeRyed9w==
X-Google-Smtp-Source: AGRyM1ugZPNhTAyfMNKJfAKWSDZJNQ6t/9bFfe93+HgnOEovCz6LbNAyLlE563FuiIH9qiKlJvd6pA==
X-Received: by 2002:a05:6000:1445:b0:21b:a919:7d3 with SMTP id v5-20020a056000144500b0021ba91907d3mr13498611wrx.545.1656358889211;
        Mon, 27 Jun 2022 12:41:29 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:28 -0700 (PDT)
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
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/16] riscv: dts: canaan: fix the k210's memory node.
Date: Mon, 27 Jun 2022 20:39:56 +0100
Message-Id: <20220627194003.2395484-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124130_561285_D307DDAD 
X-CRM114-Status: GOOD (  16.23  )
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
The corresponding U-Boot code seems to be:
static int sram_init(void)
{
        int ret, i;
        const char * const banks[] = { "sram0", "sram1", "aisram" };
        ofnode memory;
        struct clk clk;

        /* Enable RAM clocks */
        memory = ofnode_by_compatible(ofnode_null(), "canaan,k210-sram");
        if (ofnode_equal(memory, ofnode_null()))
                return -ENOENT;

        for (i = 0; i < ARRAY_SIZE(banks); i++) {
                ret = clk_get_by_name_nodev(memory, banks[i], &clk);
                if (ret)
                        continue;

                ret = clk_enable(&clk);
                clk_free(&clk);
                if (ret)
                        return ret;
        }

        return 0;
}

Which, without having the hardware etc, I suspect is likely to keep
working after the move.
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
