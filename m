Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87393C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXhtxPIt+R0PDOwIzjTuC+blSl69sxR0W3zCIEka9G0=; b=iUNMEo75RFYedZ
	0d0Rx3uUXxaMbm9JRTmD01mIwaIRWMKuo53BxXFdelPzUz+Wk8h8XDjkz7E5nfXwGlEqfwXv6Mwyi
	MyfhPevE4x6FfyrS1ELyTZRA+n0utVrAWQhSekIvXgVU+0wHLhyZdFpB/d1Or2vdtI7hllUQ21481
	uNvuKlTfGdJM/Om/XRAK264KIeT7VJNZO1WOfSspUdQknvEldle4rS7zFI0sb3HGvuAQRisthj0NS
	+gRgi8JrZus9FZtbpeiSEt1Nf08UNlnI/f2L4qZxFzwRBAUOYZbvAdkdNR63zcXbEseJmzjI63Q2q
	zRd84Btzn7ShMG+vFyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTCX-001K93-6L; Fri, 28 Oct 2022 17:31:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShr-0015l4-65
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id t4so3578758wmj.5
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKcaGbOXyklscEgGaVZeABkCmiJQn+cua48lgHGMfSM=;
        b=XktKVyJAuhuTpNR50IVXpi86/f94SIWNs0zsXo+KJ65lgHjA881DzW/wOJXK/1NGc2
         0vkKWNR6w4FpkETSCedXeeprIXWBMiL0fGkeqZkV1X4nW7QgeZu8YrsRg4j0oNJJoDOD
         lJFRSxAahXLc8XpGSkCGmZOvlEo1ogXWzGZQwpVfvtTs+0bwszHZCdLTjkd9CmaF9kVR
         yHPkAyWqdTogWDLkOKOOXOZ1qpEJZdmTsEoBlyhHrzxJ20bI3iIECOMZIQ8ZyifX4M83
         K6C73Law77r6z7dCI039sPXzxm3FSRo1d95BOSOB6WWKH5+Zi08rRYTzXpJr3QCKZfYW
         yJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKcaGbOXyklscEgGaVZeABkCmiJQn+cua48lgHGMfSM=;
        b=RZUwhjRAICLeUoJ8/mp2JuwOmhu0E53yxE1L+IwhzsGlaQUgwcCawy3OfVAVw8UWyy
         91UnA0bx4e4KN4Kctbm8LP2sGDAiEOgCFnzynuqy+5c2BAKxcoTlzDi+q9lDZMVK9Dp6
         fG8ypEKqVIBtC1ScyE/EbGMYQtgKE7bvzbbm/MiMwYoOzqPd2Rh4bDPMQX2pulof/Omq
         Vp2z4gxcGkeQEmnxyUlhTuxagcs3DNtyrjYctx2lX8S0XQtgwSvGizISZBpbNMInNRIv
         R8qSfggOY4O1CmdlHAWBb8EnYC+Prn7AGf9uuTQhBN6cfVs65ivM5UeMbUw4vwbfvfVP
         BMtw==
X-Gm-Message-State: ACrzQf1vBxn1BftJvRJpM/DXSH9dP+izCPXZPFrDvX8OYE76mOH02DvQ
	t7dZGtoqRbRlTjqxXDJyt7k=
X-Google-Smtp-Source: AMsMyM7SrqgUatgxtKzxUbci+TsYWLGOUnEsW59p/P1BaS1TwA7Vn45N9ioYHZP45iv2M+iI+IDVrg==
X-Received: by 2002:a05:600c:230d:b0:3c4:2975:321a with SMTP id 13-20020a05600c230d00b003c42975321amr10195946wmo.155.1666976379388;
        Fri, 28 Oct 2022 09:59:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
Date: Fri, 28 Oct 2022 17:59:21 +0100
Message-Id: <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095943_273515_6A583DC4 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable Renesas RZ/Five SoC config in defconfig. It allows the default
upstream kernel to boot on RZ/Five SMARC EVK board.

Alongside enable SERIAL_SH_SCI config so that the serial driver used by
RZ/Five SoC is built-in.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4 -> v5
* No change

v3 -> v4
* Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
  tags with this change)
* Used riscv instead of RISC-V in subject line

v2 -> v3
* Included RB tags
* Updated commit description

v1 -> v2
* New patch
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..97fba7884d7a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_RENESAS=y
+CONFIG_ARCH_R9A07G043=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
@@ -123,6 +125,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
