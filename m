Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CDFC6FA93
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu0bRZgaPoErwhv9Ajru9bWHDATVuqdjx8cVO6VTlGA=; b=u15AdyOrjtsxyk
	0E4nJF/dRrLPs9JEda8OukeQUFEwuTHq5trQKXy+r0sPBIYmN5N7CGhTfYOBJIaTCtTt42i6wTb9m
	gh651w6Cozf91lLw2loyaDzoFX6BPWxay3sm2bM3nPiqRaOk/GBuZL3YxDdvlUoO01Xtb50u8Ja30
	a75WQX2E7Gmka8xYJA+TgR4zekAT9cdmSnGqXLrkYUDdR5FdVI0ZgpBRNW071oMJapJk+Ji3XdUVF
	DNYo83va6tiOgrVQVDsx2PKidDui3WmybOVjq5BHm6WqMZ8O+FVhq+GA7zGNNZW+4V8YSOzDMlYhV
	7fDMkMoMsBApw9dcOlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKI-005pgZ-Jf; Tue, 20 Sep 2022 18:50:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiK1-005pSw-EX
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id g3so5875025wrq.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BUW4gOYp/pXvxRdjMx+H4oGpfR74YdeU/jQctJIUObE=;
        b=VgJBCzZSWWvGQX9E9GzjZGOpU4hKxrxrtei/ntzf7fQTpq1XhSpjFZnjmkFwj/gWRb
         sVF0T2vYzVBl2RX+vevLdV0lwQDUqo7ZZpZfRAKX5KCfOGs9cDPue5o+bLLFyuEWAykM
         kaK0X8Wd7Mg8vwjRLWKLEl4QeqG9MPNz97/Pw4NTpSIwY3APQRGIAnpFU2aYVBt58R5L
         o8L+tvojSBRYYbJoTDSXI4iU6KmaUOAp23Zc7ARzris6AKSgO6m2n1rfevcGttjt6Fbe
         o/4TTERQ55AZXFoEwD/RKA4apdIAxGK+4CMsHm6wrkTO3P4pMAMJcHviZ+mXja/i9CbA
         TWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BUW4gOYp/pXvxRdjMx+H4oGpfR74YdeU/jQctJIUObE=;
        b=QTPE7Bvgupf5iP1xFRubOlixWyApCkPgMXbarmdOK+oMGGEAIOBTGTEGT99V4M5unb
         E9+FlgwqNCJqw6Czb9yXnsIVLyVSKA3ShpSjrYeoBQzvMqX3/tK3RpPzUTxgNA1TPOba
         1vzvI7KPAPX2iF26Jrq+2N+upV+C/22dBVjjvUzDj8QEvTPfg6AMHprhL+PAARC4TMlh
         xubZylcRlH1ir81WN57cUYc2KwpbbE0P0ofee5hADulo+t+tgLJlSAwaWH6cxPuQyHXQ
         XAcJPwt+Y+A0kDNX+NRuBUikx8miQvI1NzTLpwhEKY74CV5zF9mvCoOr+FuQDmjTdBqY
         ZaiA==
X-Gm-Message-State: ACrzQf1ykfZoKH2ovnnvjeCORXlAdtMurHbfhL5Hqsi5T4/usdTeLCu2
	x6K3tE016lDQCikNjkJCr/E=
X-Google-Smtp-Source: AMsMyM53j1tfWe4rRV/yOYx41751jvFLwqQWHbJd13UU1u7cdlpuhMqQE623NK+uLtEX3oHpV2SpBw==
X-Received: by 2002:a05:6000:1a87:b0:22a:56da:9a2b with SMTP id f7-20020a0560001a8700b0022a56da9a2bmr15342036wry.433.1663699813775;
        Tue, 20 Sep 2022 11:50:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 05/10] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
Date: Tue, 20 Sep 2022 19:48:59 +0100
Message-Id: <20220920184904.90495-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115017_551857_04565715 
X-CRM114-Status: GOOD (  10.68  )
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

Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3 -> v4
* Dropped SOC_RENESAS_RZFIVE config option
* Dropped explicitly selecting SOC_BUS/GPIOLIB/PINCTRL configs
  under ARCH_RENESAS
* Updated commit message
* Dropped RB tag
* Used riscv instead of RISC-V in subject line

v2 -> v3
* Included RB tag from Geert

v1 -> v2
* No Change
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..5c420ed55ef9 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -80,4 +80,9 @@ config SOC_CANAAN_K210_DTB_SOURCE
 
 endif # SOC_CANAAN
 
+config ARCH_RENESAS
+	bool "Renesas RISC-V SoCs"
+	help
+	  This enables support for the RISC-V based Renesas SoCs.
+
 endmenu # "SoC selection"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
