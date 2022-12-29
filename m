Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D622FC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 23:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vK11MTMqS/mknqC3XlgTvGdtY42pF5rUv6QUshlZCmE=; b=pijtoUIe6ckEAE
	HPKgwxnsNciotQHtzoOP+5JHcyIDC1rDNhi8bRniuQ4H16wSixREGJK5sNHhLwDxcC1wWJqFHlZdy
	7YzIvSqBBh82mIDZZ4P2l9Aik6+ZXaqQCM9ML4UGGWcPmZBPA+IQ1TS5bbeEH2r5kM8z4e7VNqqxY
	vvAxjXOtgvBQuS/4+kvKoEDx9a9hFUAt52ytG5Jy2RdrTCVSoki11bMQWeWui+r+6WrgVeWDU56Pw
	kF5j6D6M1b6I2dDuqG0pT7abEYuZOifMtRabDzQiG2pEcDAbWw+ylA5lF3RWy66W0aOTXNqJDf19m
	SrC/Is0zFvEqc4fdcNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1wA-002xZF-63; Thu, 29 Dec 2022 23:03:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1w5-002xVi-Nm
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 23:03:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id h16so18464002wrz.12
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 15:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1AZ5G8QdvwsjRXOP4YGY0iwqvUTHtMnrEchm0crWkw=;
        b=OrNOIe5F6kwD3gvBb13uLI1jiPKI7ZhRmfv2ONO+sPyfEHiG3dBVd8BchL0itwUYUk
         6wnI+GOa5NeqF9eAT7M5IIW5J4fztW06SmyP+5oDard61Ns62R0MP2mSJoz2c57MrE/S
         Tq7vrEduhs3Kk6rPtHtQ+4+lFk+7vnnljUHjsu5+AWrtYvj+L5hJSwqO8tcvpRsHK6GV
         Ur08RUkqMM7TflssQZWU9ScAKOTUzmqUlJbsMwj2oHV3d1RFCCbtY8AZ8Wjx8zaQqbXt
         1idm+2bIA4IwVz+hxEnvNdiBHvUWh96VxI8Jt/pC754z6YUEe3VbwaFhBBdjqwNVp0+W
         F7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1AZ5G8QdvwsjRXOP4YGY0iwqvUTHtMnrEchm0crWkw=;
        b=BskLTZAh1/ZZ/C5BrdUmSYEJYfiwcsKotIWwxHW5pK8c5B2VYQxz+9eY1X1oFBWx5d
         vW+DErlmmr3OYWpJJSqZsmkCh/uyhsbikGiIWHRT/KOKL5R0za7QtJ7Xik53jiOqXM8+
         CeKLazeQN1sv+2Jn7of3ie21a2FIP9xKXlbMFhSzm67JpOmDX/Q/6XRH7gPU5cbZB/W2
         18mnMtXOkNnZLgHRh4gfYxsc/gMODBAh0bfMEo8/uMNTZPtKdpPGCiMX84n0b5EnRvr8
         5GytJuOcEumdxH0BPgJSQQQwB1q+bdHoBeOkUkglSQ3xInpR1qXPQQ3GxuXgGeqQ0B+I
         gxRg==
X-Gm-Message-State: AFqh2kqxWIyY4kuI2dutrk7W0FjPAcQt69pPIRZpD8Eg2UzGCEaxwzSj
	ntel4dLy4uXEOOa3ftPthtI=
X-Google-Smtp-Source: AMrXdXtFEYvWXlgWHpUtQQSJ9uFe1qiaXPSmpUChY+HKun8x4LG88d8sQabX63FNkBzy4tffYEvyjQ==
X-Received: by 2002:a5d:484d:0:b0:27b:45ba:3b53 with SMTP id n13-20020a5d484d000000b0027b45ba3b53mr9467197wrs.12.1672355019974;
        Thu, 29 Dec 2022 15:03:39 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:88e9:3a08:4328:85c4])
        by smtp.gmail.com with ESMTPSA id b9-20020adff909000000b00267bcb1bbe5sm18995683wrr.56.2022.12.29.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 15:03:39 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes
Date: Thu, 29 Dec 2022 23:03:00 +0000
Message-Id: <20221229230300.104524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_150342_199569_60B8E1A3 
X-CRM114-Status: UNSURE (   7.89  )
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

Enable OSTM{1,2} nodes on RZ/Five SMARC SoM.

Note, OSTM{1,2} nodes are enabled in the RZ/G2UL SMARC SoM DTSI [0] hence
deleting the disabled nodes from RZ/Five SMARC SoM DTSI enables it here
too as we include [0] in RZ/Five SMARC SoM DTSI.

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, without patch [0] clocksource-switch tests fail on RZ/Five SoC.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 318a584be341..43a74c8a4321 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -28,11 +28,3 @@ phy1: ethernet-phy@7 {
 		/delete-property/ interrupts;
 	};
 };
-
-&ostm1 {
-	status = "disabled";
-};
-
-&ostm2 {
-	status = "disabled";
-};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
