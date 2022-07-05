Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E874C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTZx9qo4rUz5cePg+BNGnVEHgxRnwVqtuRsfNScgVgk=; b=pmIaNZktTmhepI
	/RzLkMlcWCiuL+CghViWnfcWjtguw3Jo4uvkE9KaFDsGkZWcTZZi/p7eP21owy4bvFC1VRJFKiZmR
	zZ2kbno8mIqzjQHugV3iqpyTrbckeyH+ELHAfQIp5UBurYnaZA2qGGeB0Cwp1bgQcmNN75NHQZREm
	5OXcl279udadb2eVFO5SwTs3JHU+nnBDlA9WM8gyFubCr1P2yNN2FVwuF7LnzjHSl1V0UWqgMuYjt
	uX9Tkj+Z2vTF8qNHXurrPL3CivVRkuvh4CaK81ppM9vs51l+CsT+PqAW9hiw9nDHDxofebLq7z5kf
	LYB361NAxG1datvCj4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qU2-0031LB-Oc; Tue, 05 Jul 2022 21:53:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTL-0030bX-FD
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id s1so19375328wra.9
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lj8lQBl+rzKhHnZ+Xd+ZIX70dBba4zQ87/hMtZKztKo=;
        b=SWBLyNd34TD/mZu6n2FRfmU1HE1CDonJi13qsFyhAyqnSyEQ/KmdR1UWXQSWh8Lc4S
         wboztDYyEl0cB6dNxkPhLH8Vut8eQklDlAzLAba8wD+ncpM0c/ss1G9HZw6iwywvQYDc
         Wp4EiJ8gFj2NtEhHkoHzq6BO5iZJQV8yqDNi/hV+TI3EdwxWa8PyiRtclVAhofmrQMv1
         O4MgZCyDw4sYc3gDgn4HyTIQC0OgktoApwqj7hpRysjTLfmxTwmhIL9038u47rfi3QnR
         TEsjdMTU0aXj0ZC25wthUzJnFtFa+8G8sy0GbjfRv+uUUgqNTVhurKapbgEb8iTWOR1w
         qZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lj8lQBl+rzKhHnZ+Xd+ZIX70dBba4zQ87/hMtZKztKo=;
        b=vU43T2ICIvb9yXPnq+epLb+U44wwJwGl5HcMKPAvn2KcGQpnOT2xiFh9lpRRXUTK0L
         y2/C3Twm0qw1nYhOeIuHJPCDBJF2dfthBL5e5xCvYg9mrmr3DRTtxJur3egbZOyww7GB
         Mi1L1sTVlvQ56mqGt8vriMRBFeeDDRr2RixTAl8PJlz+Lfg9Uz6tmMVcQomV3kA7yoBn
         pnWn7RiTud003jQ5syhLRjgm5neFVBILQ2ADGRhuVlSRE95Tn7BoTM0K5bOq4F4il3pH
         jD86lKlgPcZLNY9xx0OoHPd3vx16aABCdDi656X5rHEgoJvF9CYCdTyLoO70xuHY31Th
         YlWQ==
X-Gm-Message-State: AJIora8TF1cIVb9PVGXK6m7dOBX7VbpyM2cDFXfPFoRGbhf3dOwxwPc3
	QqK8nniFNhewjyKWjlUEjKOTgw==
X-Google-Smtp-Source: AGRyM1tr0mSvjiKuETZ7gcWxREDHaUXAsNoHFiE497jvmcwKxLKMvl+jTlZGzJe6mijwSzLjNBUwQQ==
X-Received: by 2002:a5d:64aa:0:b0:21b:c38b:bb81 with SMTP id m10-20020a5d64aa000000b0021bc38bbb81mr33626354wrp.666.1657057962100;
        Tue, 05 Jul 2022 14:52:42 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:41 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 13/13] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Tue,  5 Jul 2022 22:52:14 +0100
Message-Id: <20220705215213.1802496-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145243_547432_2EC0BBBD 
X-CRM114-Status: GOOD (  11.02  )
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

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
