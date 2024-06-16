Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411CC27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScMI/drRggDYhTEvApFSbcvMFcL8FeeHKtaZ2+Bx32Q=; b=CfOMq8B/VoccpX
	LyOTe8ltkc8s9z5jiU4B/plv0lCCrEbG5S9zfx4zSYSsJvKB4ZDKTV1kv/O1RP9ejSO0Ums8Mvq+n
	LV+BHaCJpB13oObN1Ky7/Ky0yEBzFPwA17jsnjbmczTuK76xqg9MfdnwSKt0x431hWQxkNVFsStP+
	MneGGdE8QK31xgHJzPPx/TuDiTxeLdt9ztsfNVRCW3QWY+yd5N4avzNjppjVwwk/CIEphBbGX6XFO
	deER7HdJsCpSjSMxLd/QIQx3q4tb66ZcKy6bMMmO+aeLgZ5SrXfZCzW7fdN1pgJnoxSWMp0GA5jlm
	jFXoy4MNYM53+qL0/itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf7J-00000006SZU-1K7i;
	Sun, 16 Jun 2024 01:55:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf76-00000006SVI-1zny
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 01:55:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-703ed15b273so2603676b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jun 2024 18:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718502923; x=1719107723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNPhbe4CKhTW6lWgdp189/o19T4GZdsybtYcMCrAtjY=;
        b=QxxNY2dH0MPU/c0CuJ+zDw4upOf/D15gN49NU+pP9YxgCljdmEd+MZEAM9elslzk9w
         7Zzjs4H7eJwzVcrOyibpYVrtf8HiCK9V+dOHy9Y+kEDsXmr9WqtAxonDj4a8bBrfIwEe
         KTCXL1bszWVOQgKhS0K6apJ/jgQ6tT4e7Cj4fTUgh5SxT9EM8tvdb0rnOY2OkqdyivVm
         dyJOOwKtGSEJ2A1WSL4OETs6EVsPe4HMB/m1bQg2/3APwgY1wdPxDjgIpXecHxs3Ea0R
         1kgta0QIYbDE0gQUi0BP8Lc+JZfJJcDKu9PHe9ywZAznecJ9Odat9jBxQmxvxMt6r7Jk
         qFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718502923; x=1719107723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNPhbe4CKhTW6lWgdp189/o19T4GZdsybtYcMCrAtjY=;
        b=wA5ZEoCPepzP780cBiScGIn2nsa719D/6Y2mUwWFDelT9YdJfzWtZ/Xym/HMirFMV9
         sQWErmBAkk4NGUlQmZ5DQnDhrNhs/dbZLzxf2EcmCUjGbG8a5EfQWtpGVgdBqJNiEcQS
         Zkzn75o2ebm20gxEv39GxAE8B/3HuwCa5jhYeRAWH8o4BvB0kl1iqpDE3Ikj8Z39pMoV
         GVePC/s5/lY3QDO7gtDgDrXFrzUVux657KKlYlYhWWii9jZXYhFmOzLallXpD0SpdZIS
         ucgDNuarYx11u3xOO37W4widBjgf1o81ZhAU+OefFzsjf8tgDTHtj4q03jCV46fudxow
         ru0A==
X-Gm-Message-State: AOJu0YxDzBdRsQab0kEiCnDkd5+GCgheuoK02K42pK7p+90xAASTYDBe
	AYLWsqWrVazxmiScTUUOjN3o0x1gJzl27YpaarMw25wDyf2mEBly7MBySb3Upjc=
X-Google-Smtp-Source: AGHT+IG2W5IPRHAG1kGoyujjDgtV/z+pDbrlN9J1y1wQMn05h74BhHu6aBbrwBiwAJOG2I5i3s17mA==
X-Received: by 2002:a05:6a20:d80d:b0:1b8:3f6d:3037 with SMTP id adf61e73a8af0-1bae7ea0f63mr7711032637.18.1718502923295;
        Sat, 15 Jun 2024 18:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1cea:28dd:2ee0:e8e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769aedbsm8751201a91.43.2024.06.15.18.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:55:22 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 15 Jun 2024 18:54:32 -0700
Subject: [PATCH 3/6] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240615-th1520-clk-v1-3-3ba4978c4d6b@tenstorrent.com>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
In-Reply-To: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_185524_551289_7BCE13C3 
X-CRM114-Status: UNSURE (   8.29  )
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

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..10a38ed55658 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
