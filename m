Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E7DC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPvrXT5LPBdlgoPyG6seGomeiI98j7+NkBVbyYf39Ag=; b=rdObdKnrM7prKh
	oe6zQ08TxId6MZ+DuiEesyUAnCgG/j1Jkip/d5nNm4s3CDPpEMbW4KWsMJ/etvSDXbBjjuAAtsl3M
	YdeQE14PEuLKh3b4mzm9oL6tfecwDn7mX2LAuvOi7CdT38wrfr3OD/mGsrvX4GKov+6W18aq0g+/G
	okEKnmRWvf4MZePBZf/YTlG9UlBr8a3c81Dnv9Vl7wvHUnHiAf/TeL+xacHDMI9lnHYMPS2SeRS1T
	8RCiuTm3toUiCOa/RJhAuYqaqGnFysmiOMeJuuRsP3ncVh/ovB+xehJ3K663VsNC2L1Kx+HX5jnH9
	+TWvCThl5Vr7REWPACNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKT-005prq-Nt; Tue, 20 Sep 2022 18:50:45 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiK8-005pWf-IE
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:27 +0000
Received: by mail-wr1-f44.google.com with SMTP id e16so5946653wrx.7
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EEV/bZNm0RhZpoNYETeZ7CWJmucOPEtVXdZB85ADqWM=;
        b=bnft1V8oxBH9jXg4qda8t6dZSmf3Iwfcf+cHXLuM06OoIfCrqXbnj2j2ZxXuYaMCN0
         HqQ1l32q3nOwCIB4iqZxGpQk/6w2MikdnoAjXvVTbFxCF/OvWyLJYNQ9fjWRWFbgrHjI
         xVvx5aIKwLAn2jVdc9QltHkTcpmM42+czBY79snokGd1jOFXHSoskFNA4++EA7tu4XVA
         3pQV06QRScJRRbclUxb2TbWcacmLfKD7VdnYB4gb/3Eio3JspcJykB1Hd5uZyihrMerq
         sSAjx8DbO6s6IibB39aL8NqWkCl5Q4UXMspkh0CnnbVr6s4iDJH1ZCeTDod7i4mM5O18
         m8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EEV/bZNm0RhZpoNYETeZ7CWJmucOPEtVXdZB85ADqWM=;
        b=baKXuysQljFHe7ZWHG6dtaUQnod4qLh03NmJgRw3YfksB0tnFdn1z12DEjoxYrKY8M
         C9Tu2v63La/+P3zID7E7S+Jg3f2gh/3vnDv/iTP5Xbf6gyBOzyENgEWMmrTWvZlkGCq4
         RV0FJ+7In1X/11CBrmTUEX6iHhMbkq9MiOvQMUtcVgg/wygOTPKZT/X8XpbUAxVPpXA5
         XOpm5rH99xNIyS36DGYrXFDeDUJ6920baGYmhJ/y2dMOcW+gir4n/XQ8Gvyf1f57jz1N
         /ATPgkQryLIV6/K908LyuSiDo1sgo6laHUy+nYCnLbcC6IGPTKCv8E2ldBG+UYHD9fvi
         0NaA==
X-Gm-Message-State: ACrzQf3QhDpbX6JFgG59ats8BGlSKh2gPaGjL1L6Svem0ERaIFq8OZfK
	hx7AFJLh3vYYgSl/ixU/1RU=
X-Google-Smtp-Source: AMsMyM65TgOSIr0ZfIgpLuog36rH44C9YuoCn+Yv9Tji2ryknGj6fK849OJKw3aT9oqGug0pAtWW/g==
X-Received: by 2002:adf:f8ca:0:b0:226:e456:1896 with SMTP id f10-20020adff8ca000000b00226e4561896mr15181753wrq.177.1663699819115;
        Tue, 20 Sep 2022 11:50:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:18 -0700 (PDT)
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
Subject: [PATCH v4 10/10] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
Date: Tue, 20 Sep 2022 19:49:04 +0100
Message-Id: <20220920184904.90495-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115024_661324_9EB35834 
X-CRM114-Status: GOOD (  10.24  )
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
