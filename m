Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37994C6FA89
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkbP+naejhEbVmMeuEGP259hduTA5ZkqfaqsmlVvejo=; b=qDhXQc3+aZrTRe
	6gKYcqbDmwaNSR4frqBn91I+m4ZypMGR2zcH6LO2hmbtwRMd3vTeIV0e677Ss8DQHoDWwEmm5c61z
	5iutGUpwXSmVx91T6u5TD6DSg5Z2VwO5Q6Fg2oeeLdXAajmc9JacknmhtfEBGJeD+ywYemkTociAl
	V9TJ4JfJC/raFVKvvTKOWZA1GH8KR+GspTRD2/J0sFrjn1rXAlrBxQ8omp0A04lYrCtIOwDYf1KxV
	UGX5WI7z1A9mDyeynxxrzsNbzH3v69/38SbxzhJAN820sRE39rTEf9s41FLHwKpEMev6PVY4eSbT/
	fJ42Wrnn14RYj8acAUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQo-00FUQR-BR; Thu, 15 Sep 2022 18:17:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQk-00FUKA-L6
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g3so11214448wrq.13
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xzoqzDtndDkISsSwTujowyDPoGXKL8jqH4hdlXLXrA0=;
        b=g5ulsbtE6DartTUDwK1K53pxs737iOAFvah1Hi8jK5pmVKn8KAVEf6OvssWURbZdFo
         dOSWToLwlaQwdJ18U4d1RedSFWSgxN+7k0AN5OqBda/cevb25gOLuTuI4LLibl9keWto
         N4Q825SAEdoOvDk6rXAoR/pJs7twaguzQCwGvopOeL3C4STOtA0O7SZgrNRYy1wyTxRZ
         9jvDY4BZL8Srqk7Y+0B8Gc61zSI9T8yYmC2DmzFDp33WvqFBWINF5x4NaI7ujWuZuoTk
         DlNo+uDiS/xJUShEyQUfQ0UwDltURs02MR4sa1gaqN6zbcRSatsrYEFTxBqxt7dBSZ4p
         ay3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xzoqzDtndDkISsSwTujowyDPoGXKL8jqH4hdlXLXrA0=;
        b=u2FlpnzhBxTErZ2mKWP6Lor3gP6iNO6GtE7UcF2f726ax/vQuSXqZQ17+iFdO7jAGv
         uXVgpnriYOhjnfYXFa4rpIJc026SZwzT/77SLy/4E8Wlp+GBq5iAcNbRijbCLFgQHUa5
         BDivIzoCdLyKZcjmEyLkTOAapY09ZBchj7K2jcPZWFahfvDh0dK6KAE3KWfOAdvHQi85
         MgxwC+AZl3jwPOdNR7laO2PC/pzWSvmMJbUjvD+SfE30L50CYj7ZpEDG0CH/EBnw7weH
         alMidEqBHS9OKZgcw2/WDKcz9qp225q2wnzPFnFs/d9v7n2j9OjmiDOR60FqMjWpal0D
         u3uw==
X-Gm-Message-State: ACrzQf1O44otR0pd4E/h+T8/Fy6kmidqwOtnP4nz2P+U5rPZw3qPdYws
	On9CMpMuZFvKFgf7NaaAUPk=
X-Google-Smtp-Source: AMsMyM7tjqwmJxX5D4dBi01RrRk+6JKiqTi1egw5XeegPGl6fRnFXsEXlXXpxAL3CklC75qxxfrBMg==
X-Received: by 2002:a05:6000:384:b0:22a:5d05:c562 with SMTP id u4-20020a056000038400b0022a5d05c562mr579729wrf.701.1663265861500;
        Thu, 15 Sep 2022 11:17:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 10/10] RISC-V: configs: defconfig: Enable Renesas RZ/Five SoC
Date: Thu, 15 Sep 2022 19:15:58 +0100
Message-Id: <20220915181558.354737-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111742_730933_53D5B7E4 
X-CRM114-Status: GOOD (  10.59  )
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
v2->v3
* Included RB tags
* Updated commit description

v1->v2
* New patch
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..3dd9aa4d707d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
+CONFIG_SOC_RENESAS_RZFIVE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_SOC_VIRT=y
@@ -123,6 +124,7 @@ CONFIG_INPUT_MOUSEDEV=y
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
