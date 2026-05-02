Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B6ECD3424
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 05:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVaedqP3sgyXHVzFJtZVZrdPIn0cbSFq7oPELFrXa9E=; b=OKG4rXYpa46Fs8
	H7+0iLK3nkepc8r/ly7vlqtgxJgN25/UN8x/9mBcTBN4SH+4sKPkQgGjsu/4/YoYfFObNcNJFXYtu
	VK34FuS+spCzEs50RkZQ2VKJbQTYs/iRNDMxyCgwii4IfPSAGPQhJAy3pOgn4Yslc5al7BMd5nZ/O
	K/u8jEVN91l3NOcDaA7qB/GYazJyFxoNxXzRFwrnoSDbktHsY7700dOOCuMqw6lQvgBdImZyrhmrd
	jbcU5Wg5IDHOvnegg25xGBs1c1xbazw2IBrdoG4lBJafp5s717+yd20N+MQpR6Y6u2ZxH3XSAEpDk
	Zq12ellDH5292Umd9KbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2l4-00000008KmP-43V5;
	Sat, 02 May 2026 05:19:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2l2-00000008Kle-1UZq
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 05:19:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-824c9da9928so1142836b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699155; x=1778303955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=pcUvQB8fbOW+nZYKhD8q6PiCEzo3u03Lm8yS3fMqhJ0UO7hWITCIVsqtI7Qp6LMh3N
         jmw9b+a0FyJpZETQFucAn4H/jPY3T8EuJVRFEPiDQMxJa7Dw60PhdNyEYeUMzajSBYPr
         plUVCzY7rgU57j/2prfBINrYZzoAbs97YzIdauTQuYJ0nVAdY7nTfVP3HFfHa4dCsEXy
         9zvAULZUNKlcUP4gxo+4EZn5e8HQ6b+Bo78bl6xLUayTxoFeWgMo2Kb+LJY/JW0H0HP7
         XkUJ2Ha6iQF1QVVCBtUSfQPVrYEIuSbU05tIvhjys6DFpHAvejdfT27bINAU/GeeBub3
         0jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699155; x=1778303955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=F6r/3XJQyXp2NXFf1Dbz1ypNc+AkokbSm1eqUh7+H0OkgnNrwvaiix07Rl5HPnh3PO
         egztHDeFgYf26md5B2C5G6g/6i+sfnBNBmPMoIR778LZY3whXPl76lJkk4+3mzf9NJpy
         Nc2GrvVANr2KTSn57JJXMZl8Nj8ZpmAYPqYLUKySI4b0Ta9CNsIrEbENzk57Hhay0xMg
         2mrCxPtsSwff+g+t/zQC1pPsVeOFQehwzq6AaMzSSVEXf4LANAjogMfFIb8+Q9ny2ovn
         uY6fnpq29rmpHntM77gQEL6OqN6ZcYOXu6CgqXP7BDDJ4WsOsGUVu7uR80HYMv7K3IrA
         RtEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ThZ0EgvURUM1LyXnRX8WCelje2nKrOIu7C8z53nypq5KDYNWKoS76LFu3A9HzOwzi4aYC4Uz4RT3cOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YywZlppA3mQpnfvldDIFi4EUIYASpcYKV2dkcBNdJkwofFlvPLb
	hrLHXB+38g4WcVXZmBa7MDQ1RKCqmZguwTMEtUMKLG/ihZdj+0Jt8T4s
X-Gm-Gg: AeBDietXKtoilBNFlaE7HMMyHbUW/RxF48tBeM1wP1vV+ZkGtWEnL3dwbCT0CqjM5k+
	EuFbizCrCQ4rslT3d4axXn+In6micarIzHtpzN1PYpuzDdoyLEe2hRrxA1uO55A6XHSnS8lMBGL
	vb6CtNJrWTqGNGin91vbjYjqp3yckqTNd9lzjfC3ykpc3tPF7DWUqPte+wpPqo0xIzo6cDgOpI7
	69VSgCYG2mlUW+m9kTpjCQNzkqGtvmzCuwbjfvTBKYZng3A6I2jmvLgsmqCHsQfEvvBn6rgPsLp
	23h8kk902vQtbG3GquP3zBhmwrBFSLwoyZDvzAI94zkDkiYPjzfyYgRcdGQDPf/YUqMqAnVRh7x
	FRgwZKUM32F83AOTuXFJVJMytQkhyJB6r7u3KhCJTgN5pQMDyDcceyAvKEST0UDqnQh+F0w3K4p
	ayTPm9Njcz7ts+ARiRoSvFCiQTVLyh/w==
X-Received: by 2002:a05:6a00:985:b0:82f:37e3:ae67 with SMTP id d2e1a72fcca58-8352d20b18amr1983415b3a.27.1777699154297;
        Fri, 01 May 2026 22:19:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/4] spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Sat,  2 May 2026 10:48:53 +0530
Message-ID: <20260502051906.8160-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_221916_399714_6EBB26EC 
X-CRM114-Status: UNSURE (   8.00  )
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

Following changes fix the power source of USB 3 and pcie on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)


v1: https://lore.kernel.org/all/20260325081700.1502-1-linux.amoon@gmail.com/

v2: Add pcie vin for pcie regulator.

To verify check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV
    vcc5v0_sys                    4    3      0 unknown  5000mV     0mA  5000mV  5000mV
       PCIE_VCC3V3                3    2      0 unknown  3300mV     0mA  3300mV  3300mV
          ca800000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
          ca400000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV

Thanks
-Anand

Anand Moon (4):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and label
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
  riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V
    regulator

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)


base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
