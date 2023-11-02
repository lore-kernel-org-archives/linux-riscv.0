Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B5C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCEy7fopG0vLuuN/IuAnIvORB0BjanUlKhCC4o7Lzp4=; b=lvGcE7RQwzj1yh
	5yUpAumSvmMXiWhRpp6aHaW24Hb5AGeK4L5TdT+6dB3Wi/6WL+SdJJgH+y16K1MV+UtH58RRMmqed
	kglYtx3fAXCeKWB9xIwl7ujZFKC8xFDGv/br1Isw/2HyqRRGSs/Ul9uc0s2xAWs6nv2ZLv7yV3BVV
	NfXVD5uLEpvaKpM9ZD4qvhpfeS4vg5Jw6lmap6aGoPrx7mVLvK5ld+An2bkmFVxuyXooMT3+F7VpJ
	O0lipai5IyH7mEuyRrgSqXKwCqeuILzSadbYuBDvNiI1TAD3Lr8zfJdKiXArtpETRSxqRsyW/jjyq
	7yljqqBMdqdH1t5SGuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlw-008a99-0e;
	Thu, 02 Nov 2023 02:49:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlt-008a6j-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc0e78ec92so3226255ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893364; x=1699498164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=oILzIY4b3l0H/mM3LybObrysL36XgEkrgbyX344vnIQwEp9k/b61AA1TIvqn4os4Ep
         aHaNg3nc8F82eGDc+4S6a0/fEm+i4pSlZWlNTE2I6ofEx7uQTuyZCs6PEadCpGm2gNrO
         lSjFlOE9EB6449KREsHT0V4WLdHzaW4aY4KajXQe/Ywc6kNybZZtwWcR006k5wAilxWB
         XCJkvjflJqC1xSeXZ4hzah0sPSVcGGDtKGvsySkz6GoNGYnrm9mVLIxpZQJ8llX9yRtK
         8Bxvc0ALN65KGJg/fMnLuYBiy99InPtrg/V7BWRNj53oEpT1zdEavExPe25qZ1WC1eWo
         F0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893364; x=1699498164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=sdVUiMJvU1XdWW4ARCu+qyW8CUi/pOmPt7TnTNtX/06B8wNdivbWAPt/92J78nyfTN
         cN4P0DyXplT6gDs1FXzcJxd+QYWqam8mRrIA1LrwCQFXoPJ8KIPYX/RGuIv2POeJlxlY
         5tv4OYPbiPESM9oHtKDSCyBCJ3Z+nDQp8zJywdYQ/xe2TRRtvMFAL4z2LK3InmauYXns
         h7sV3CfdDsU5EAlu39I6N2hmt0LPwtTENXL8dkRYA6Ev27oNdMWCvdw7VHgTCzjw7hNX
         Mk9OVe9dvN3fpsPguctAJS6Bcm6p6d6GCziwO/s7g1IIR/qR0icHAWmJ2vdwVaZFihro
         iJ3A==
X-Gm-Message-State: AOJu0YyfNABjuJ5QJ3DC6tma4P2hMLvkyu6cVr1qGIBrGzzIotLoLoY8
	rJQ83E5USFBeiFyADcsTvfpAdg==
X-Google-Smtp-Source: AGHT+IHX9AJrAVgWSnYbOXa7mutrw1tVdRN6GcBHN4fbPFOszvbXB4wUQnu7dVhwrk4ZcsOpXB+xQw==
X-Received: by 2002:a17:903:cd:b0:1cc:5db8:7e92 with SMTP id x13-20020a17090300cd00b001cc5db87e92mr6755183plc.58.1698893363682;
        Wed, 01 Nov 2023 19:49:23 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:23 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 01 Nov 2023 19:48:57 -0700
Subject: [PATCH v4 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231101-th1520-mmc-v4-6-86e0216b5994@baylibre.com>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
In-Reply-To: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=1108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=4bgo3aK3cuR26cRWBbMVA6MrvhUqOJ8As8gzvmDCzhs=;
 b=aA13H2waFkFK8rdICEfWcJcPhFaGSH0ZRd4ROe0tmGrxSg7hrWq8+i/vrM2/4uVwYFqUm7YA2
 XG5qUI7lWhuBylW5Vf6NOpK9BxdJC/LQDXKQpfLDXXSAcE3QiPgjyL3
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194925_211881_2F914BAD 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add mmc0 properties for the eMMC device and add mmc1 properties for
the microSD slot. Set the frequency for the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..f91d94f95510 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,6 +48,10 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -56,6 +60,22 @@ &dmac0 {
 	status = "okay";
 };
 
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&mmc1 {
+	max-frequency = <198000000>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
