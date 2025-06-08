Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ED0C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSmbo0FOBh/D3LJ69XimdfDrEvWIEAP0zMKYVZTc2pk=; b=d8qdfFmIS10GZs
	4tqkuoBrqKoNgIvIKMZ1gF75YyrmG1TrxUgqGbGo/Ht067WKnfAal+BQV2k7XIvI3+LFO8UcpX7bP
	Qy6/tjOozG/bXjP25t5dHJVNqvagL0Dlgs+kw7WZdTOa8j7X6ERdgFBP0m1veNlXRTOKo8yZ9trhy
	ulDPlyRWt+h7F45/3hbULJYQv70373NY8IbJvu5RD85jrpNuIQNCM6Oto2x4zf1CfRLqEse0b5zwv
	9/VgUp1HCKUqK8iOmNq4iqCEzWqfAlzPBjHO7E3RYUDLF9RgmjUgkkxklEFXJkotPdRkONu6Q2xK6
	GK6eokf0g8Lg+C43f5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSr-000000037QH-3Bv9;
	Sun, 08 Jun 2025 23:30:09 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSp-000000037OP-1YWk
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:08 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a442a3a2bfso69882211cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425406; x=1750030206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MPhc4m2BlLMTsqjKbpZeSk/tMLZcSiM106HiMt2a30=;
        b=XxYzs89ZnYFUcZGtNWwYKaP/FgzCKntgA0qqqSaVv1rUaA5acx4OxY2+RltBh01egT
         lFozuwhttv2hExo8JFk6I7EtlIw14CTle5GrYYITF4x2lmO3FyvkQxVTWmwOI6JY3yJY
         iWz6qCmrsIffAwOBw6B+1y0wzdtNT03G8Z+iuRzuW7pBAhZX0Bn6/TrLfcr21AYqlHuv
         ykr3lqQj152lVk04Oto6lyu3GvrbivaY5dPDIG8SJjmk0wQ3h8jpR7pBc//uYfy/EL4E
         RTLANu15YPzMgULs5fxFEW53i2zpz0JE1vU9rhSwcw8CLHxgOLCB+NWxcT09rzxO9SCS
         3qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425406; x=1750030206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MPhc4m2BlLMTsqjKbpZeSk/tMLZcSiM106HiMt2a30=;
        b=rm3CppSydqJx4YHycnBTm3t6IYugirahiMBpMdsxCdUs9xxqS3eHwMFAbWnQ4OK+5j
         pY+LHHLaBY8cJtRJOpS7qnDb8NTAFqdoigBot5ny3/u6mSIBNWjjDjkqtoLCoS8giSoy
         9zhKP1VAaCR0pVUvReYegK5lf0IxfDjS4H54LuQL2mIABAI5bf2Zd4kJnXlSJ1On6+Gt
         lYL5IdVIfI14I3fOCKPbC591b1aQXusLhRls3I/qFyE0C7KlHsVB6PR8CoLANiQRoriz
         kN+CWZjKzt4ahEH96XyIlBBqG68sBAqES5277HNdMqs2XB7rSAHTXrY+8iEz+yE/7AdZ
         Bv6w==
X-Forwarded-Encrypted: i=1; AJvYcCVZFCXV/eOrVuMmmmEiPRYONgS2vZpKzcQWFDQkKj9H4jnXiqG9MYXVDrcDzqyyQ2Hp+dJ6W4HQt1mxHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4HdsGZyvzCQtbQqkW/Cy8t8yHixneD1UelBtWA+ced0M8CxS
	L6dXQiCtZL23DgEQ0V3lTlm6xVLkCwSFVhQYl5FpVgtYAGCgTlbirMNU
X-Gm-Gg: ASbGncu5x95+DH7K1ojoT2C5LepcniHjzfm9+tCo2W7JVHX+jK+rlyi88jUvc20MCA8
	jHb3FJr5E/uIDx3WDPweOchl2SxA7BfmBJervXhCEw4anEmMOmf2BJsuuKhS7ZJHX7pYf4oez9j
	Am+Gci8MJYU8w/pRdy8pb3Jco8IPSXDVKMvnVxCJxQB0CfQg5KrjdcEksjk7baazi3Z4jj6AGP9
	pXkIXSuaTZnG7ZLt0p8DsgrYBewdncVusFgdLhEBumeuvIhv3tL2q76ZgaNaF6j2sKtwjrMf3sw
	eNQX3xV6zVQvp600Fw1q3SIynGo=
X-Google-Smtp-Source: AGHT+IHStic3inQZFI5nmv82JIFqhS8ZN7gZGzEplcgmQgDRVr59jgDMXWjQUVqyNlZ6QMJ/fIJ8qQ==
X-Received: by 2002:a05:622a:2606:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-4a5b9a2891dmr263302531cf.13.1749425406381;
        Sun, 08 Jun 2025 16:30:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6fc3c36f7sm10256631cf.66.2025.06.08.16.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 07/11] riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
Date: Mon,  9 Jun 2025 07:28:31 +0800
Message-ID: <20250608232836.784737-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163007_409922_0AC5EB6E 
X-CRM114-Status: UNSURE (   8.30  )
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

Add MCU devicetree node for Sophgo SRD3-10 board. This is used to
provide SUSP function for the board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index d077923097e8..75564b2719cd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,16 @@ &emmc {
 	status = "okay";
 };
 
+&i2c1 {
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2044-hwmon-mcu", "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
