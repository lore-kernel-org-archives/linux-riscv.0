Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF65C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1ibS3w+NNSKRkd2rbN+9JVNMHy92VPKcZKfClMKzK4=; b=ySGFX2FJ6VMQam
	IxnGAk7HiFxyPyGGSk+NTjJZ/OLkQhZd++1AxCe+THXVo2EjgdSTbUhcdCErgdyOcPdeanDWCzDGt
	CFVinSL/rA80qD1S6YaqjO6/JpDJgdlL7fzglnudJrRlDt9OMs8i62VqTP6IX6ZXJuPho6dSW5cU4
	4cIbG6A55ToRYR9Bn42Ax8EG9lSWFlAQ/PnBTWnqJaZ6yhmTvsuniQmbWmiRJ9VPpPPmaGZ3qRt9U
	qiZmvdxx54Ir6Gagj6Ivo0n+VmcmfMv0voVKcX9Dk4kR99+Uk9yaBnfsOHrcWOJrskf2TqQLHHt9w
	mqx4q1J+A/Gvr+PgGPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEu-004zgR-0Y;
	Mon, 24 Jul 2023 17:20:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEq-004zdQ-1n
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:20:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b895a06484so27198985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690219248; x=1690824048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T78H58Y+eyGMwfw+MQha4MkUBw4YAh2gvZHpk5miiEQ=;
        b=xB7435YNjj/ZzwqdtKUb5Op688RZ1fvskoaZtkg7UwSDKMTfGtLefhJqIvGkTWiB1F
         cYEuyMuOJRJsaLoFB9p0wYUxfbvaJLv2S7B4YByXe1iw9731ETyqK8E96K1aycDcjvKO
         MINN1k1mH0aBQ+22irnFgSMLhG7LVMoz1LH8JoXTSVAXfPNNE7xdVVURYTGQz0sMy46y
         MFV/3SiPnrNs2+X1wJCsbei8sWdmdPCbbYrYbKEfxC4ozZqWFFGfjFXS4J4zQHlyi3s7
         rSh949tS2WoJVU3LSqDf95ICjAyNuq9NaYpyqG+/r3Znvs/7xNA1AHmgojeBnLi7dfE1
         VB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690219248; x=1690824048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T78H58Y+eyGMwfw+MQha4MkUBw4YAh2gvZHpk5miiEQ=;
        b=Oy1qpruQuKSUD3+9Ix6zCVtCuQLqao+X7gUhqCoVYs6KPsO56WTvTuawUdE6XDqeob
         tJ2b7BbMQTHVnZ/w6vXSoNN3zeD3gdm7wY29VVn+p8bx98nqlXbxjn69g6AJmfU6tlgp
         eNgAAjUAufrfT9BQjSsV6UW+6BDhM5dPCXmfAU3D5wUNkVbnKquabFphmWfyVNBJrjNB
         ma3KmrTFBV+GfYU1J4m7AqCinakBDeq99HohzZoSA+fG2KYb5CV6gMAxBuPXyPWHCLNu
         rMy5hLaPt44tF8Vlw+/EoJ6/a4KJ1uhfZAENZt6duRkgkXiT8r2t6afqlm+GO8jvvryz
         yWEg==
X-Gm-Message-State: ABy/qLaFqDt4jdXtGjaLhHEP2dUaROH1h/zZC9hVn9m/aV5iMXqtr6bT
	/r5adKSEde6CV4ldXiDK4NwXyIQ6HZfV8rVg3tBvoA==
X-Google-Smtp-Source: APBJJlH/kqG3B2mSYH6hRT9OESM7I2ZRUbgGxqU0ifQgR0ERkakURqiGUhNCd6sBH7XTwao21DfzsA==
X-Received: by 2002:a17:902:7590:b0:1b8:a3a0:d9b3 with SMTP id j16-20020a170902759000b001b8a3a0d9b3mr8867938pll.47.1690219247804;
        Mon, 24 Jul 2023 10:20:47 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001b9cf522c0esm146456plb.97.2023.07.24.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:20:47 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 0/3] riscv: Add BeagleV Ahead board support
Date: Mon, 24 Jul 2023 10:20:37 -0700
Message-Id: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOWyvmQC/x2N0QrCMBAEf6Xcswc1YgV/RXy4NJsmYGO5i0Uo/
 XdTH4dZZjcyaIbRvdtIsWbL79LAnToak5QJnENjcr279Dfn+LNYVcjMHjK9sLIkSOBQjcNwPUt
 ssygDtYAXA3uVMqYjMYtV6CEWRczf/+vjue8/KiVb/4UAAAA=
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690219247; l=2058;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=cb/GVUPxtZh8g4BNOlBWqM76o98CviH0nZ6IgW668jY=;
 b=bltEAH6YPHy7pRO3DKbzvxNCGJa/xoEQl4zNMsmlXZQc6/BplXS8X57MxNJu6rkOEMZbHDkRA
 Q2lksSHIwuoCpN74ArOKCVSFPjDWpgCiAaIy5TU5RwIMyFWG3uEo+CK
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_102052_593198_7C576565 
X-CRM114-Status: GOOD (  12.78  )
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

The BeagleV Ahead single board computer [1] features the T-Head TH1520
SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
minimal device tree file to support booting to a basic shell [3].

Changes since v1:
- Add dual license to dts file as Conor noted this is typical
- Move the bindings patch before dts patch so patchwork bot is happy
- Reorder new entry in thead.yaml to maintain alphabetical order per
  suggestion by Krzysztof
- Add A-b's and R-b's from v1

[1] https://beagleboard.org/beaglev-ahead
[2] https://lore.kernel.org/linux-riscv/20230617161529.2092-1-jszhang@kernel.org/
[3] https://gist.github.com/pdp7/91b98f5b8a632802e669d8c359f4f498

To: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
To: Fu Wei <wefu@redhat.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Drew Fustini (3):
      dt-bindings: riscv: Add BeagleV Ahead board compatibles
      riscv: dts: thead: add BeagleV Ahead board device tree
      MAINTAINERS: add reviewer for T-Head RISC-V SoC support

 Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
 MAINTAINERS                                        |  1 +
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 4 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 295e1388de2d5c0c354adbd65d0319c5d636c222
change-id: 20230722-upstream-beaglev-ahead-dts-d651af307fa6

Best regards,
-- 
Drew Fustini <dfustini@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
