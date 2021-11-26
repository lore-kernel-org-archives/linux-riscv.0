Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01227C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFJmHcBGIrzEPQg95sG7pz4vtAHWrVU8OjHsDKyr5DY=; b=yIuNTbo7KDIQSI
	O8K3kM4JlHyRAhfzSM6d0kWgtDISI6IGovw26wxyRF+51R1m5Fj8MbVLLxtnphcZxE4g7YWVoydAD
	Aqn6Ff3jFOJ77xXT3NL8Oeu/sB4GBVUWSQ2i5wkRs/FXQhmNW7XAjUwXWysFxDQvcajVvQr7rGqLM
	e/GymLE9kmNn/elMOENnDcKDWQcpVlyjw7/MheS51yTEgHTpcjF1F1/C0pigR0nab7Ha/AziXN+Dm
	U3UavgTesk09vpiUn/eycpq4ZIkmG1XHShX7LOio9B5Ap8uKeFDw87E7nA8iFqDnKTu9yXaNmad/A
	ZFqdOzL4hU0HE425mEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqR0L-0090uI-5P; Fri, 26 Nov 2021 02:30:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqR0I-0090u0-0u
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 02:30:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20FBE61152;
 Fri, 26 Nov 2021 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893820;
 bh=eYeR2AiRtnXUp0I5517HQ+Gpur9yMYWVi2QmjpMPfxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S6BdHzYg8J7ORf+1V7H8LPdEtNXjeASi5vjn7xXGQsyee1T15K1iOYiYa6TP4qVb1
 fQYCARrxzL2zbOvbG3BRgQSHDtV0L1Oe+HCewBwOSoNUq7kpfbCx+2/s3mVSa+VFvo
 QH38TSxzI8+MyTsnnFCyA8VoQDXTZ4kB1a88mtfTlbdorIXJnh5BMqlFuUcwiuWsh8
 WtnlkfJeHHuc6e9T2LawC4NCPL7qjy7+3Wp21sboUocRkUaWXq/jvVwawJnkbiymaJ
 rYPJ/HbnqN07WCxzWuJ5gcSe9qAVFL5eJER8f9A2NVok8KiZ4c9hyLA4vRzvuwpSeQ
 SJWIvL3BPC3PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bin.meng@windriver.com, atish.patra@wdc.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 3/7] riscv: dts: microchip: fix board compatible
Date: Thu, 25 Nov 2021 21:30:02 -0500
Message-Id: <20211126023006.440839-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023006.440839-1-sashal@kernel.org>
References: <20211126023006.440839-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_183022_116634_B8F50E9B 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

[ Upstream commit fd86dd2a5dc5ff1044423c19fef3907862f591c4 ]

According to bindings, the compatible must include microchip,mpfs.  This
fixes dtbs_check warning:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index b254c60589a1c..be0d77624cf53 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -12,7 +12,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
 		ethernet0 = &emac1;
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 9d2fbbc1f7778..446f41d6a87e9 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -6,8 +6,8 @@
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
-	model = "Microchip MPFS Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	model = "Microchip PolarFire SoC";
+	compatible = "microchip,mpfs";
 
 	chosen {
 	};
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
