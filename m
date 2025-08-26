Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66926CA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LO9pueDlBtCpqOaIM5GvI1MINokcszf4dlvxl3eqxYg=; b=sGs4WU5VhTTIuV
	K3LTR0XtBoxU6rJ3rWkVSTXf0hCb0guAsylmsHU8GKbFb3hPWj9soMBPbGD3TYAAk4SmNYifN8uTq
	e+uOB25Tt3ktZw/f+OjKm3l+yqlbo+T9UxlM8Ru0iF6FiMzW0pPY5KcpteSUkXyVa/J3jolJ8+oGH
	7vjRLJsSsNAozK4WPLetKuN98ux8duYQtUl0IjMszT+wlZN8pCjHOivjJpFvtRGQrxUqucJxys6hd
	pxs7flzraecNb0+4x0BzQqH5WwCwDSj2YdA02L6t7E3snz9ioHaG6aw86Gb8zGhG8aKmqjmd3Bs1F
	U8IMBM2QYp/pgpb0riYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiCa-0000000AGDN-1z3N;
	Tue, 26 Aug 2025 01:10:20 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiCY-0000000AGC7-3hBD
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 01:10:19 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-435de8160dbso1536721b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 18:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170618; x=1756775418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=HRShtOSYeMiSqNkr7NYp7i71Xqofhbaq7tbi+qMnVGsfQJ9i/QaPTl74ekXj6jXJLI
         p+goWa8930jIzgw2G3FJvDageLFWry7zROBGUvFFKxe9KaelLWo6NT7UYRVLl8QzmYOs
         skAWY7HrmdJpA91jKsEDC0AswM9+XKLB+2baPzG/7wdx6vdxR+UH1+Us5BYS+SCiAuEY
         IiNOFQg1CrEhfE58p+S5JzXGvIghzKV9OXUPCeLP0M0MDNANnOw9AJB+ZkfEqEnEJ7Fm
         zB73VOOS+JCD7n2HkcsoUeuRdIhGL60F5Age7LSj69aCSiB5Nucnuo2yZQkR7R8C+ziO
         ioYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170618; x=1756775418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=IFBtr0x0up0zrNhrL1gvnLgGc2bvkPwUohS/6o0moRF+Dnqb7j0Ci0RyCpCpCXSvyM
         Jux7E7MwNxbYGPSK8fWjdsxHgcNlHo8IsFhr6JrlBnFfV+QeuGzPVPmonTP1Lq2sOsyh
         IXmmlHW+4lGLVZ9U7KYiL6b5iKarmgBUlJIOiwr+zRvdahISFIUryVnTTf05n4alaP/v
         tPw+Dw5hDYrUPWs4kcrD1hGf5kIwhFm7Sqh3pyz/tjmOFeYTPWGbhVu1G1qaxYyuMuqk
         XpYwMsCTlLbL0DAFPEH1s4TDm0uySq6lWzY4zI2DzMrjvxDIMmObpstog1Y4UAcSzmvt
         /zhw==
X-Forwarded-Encrypted: i=1; AJvYcCW6oF2nPs1/BtIpHYGN27DBrGlF0f1Zy7TU4eAn91Fk6UifVFmGG4vYk4riKhQdb1pyfPZM1TCyg0nbjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbj+y53UJwIaa5XCPDZJke7BYXbzWJx2aEwn/3Ysck4NZSA3Px
	RvWPh77HDBnQo0Zn1VKmNwTFGXKB7wJjucsO2XHuwg+6B8UqKl4/eyDb
X-Gm-Gg: ASbGnct5dEIEAzp8rW82VmFZ+8duFMzffLkuZW6gDg6a/MI4pw7e8A3XRJH0qNGpPtv
	KCP0UOx4h4HHZy5+AU/+aA1lXKxrFb6+qsJ/oQoVYK4z9ZgUoRvk2Uq5eUVTrIKjPBbaf/Ygkxs
	mxNRfQ5e2SdJsbHn43BheBLaq9mYjYP0kGEcLImwiKvM70/Ocasx5hmXVNeyWTXviT+YAK6sHCU
	PR1ohdDHPtkQ9+XpSdj07CsIv+TiERA8TxzFhuFE9/MLc9tbi2zDuYn36UCy5gfjzkQM1YRgYDH
	tU3A61sZwfNYTYkjDiXLeJ1IKQpS4keIIFkeoCuDVre7/+QgfMNhQbeYn82NLgGNA+wHf5iWn46
	GkNWVsz1py4WO0qcm6FvUH2M+vRknaGEw
X-Google-Smtp-Source: AGHT+IElnibKn0kJO+4EjW9DXM+SobqgRQIgDWBiXTLfJjdn8m2ppBqLQoVrT6kVdtQvj76aRcVJlg==
X-Received: by 2002:a05:6808:179a:b0:437:761b:dcd with SMTP id 5614622812f47-437852ad33fmr7337517b6e.44.1756170617942;
        Mon, 25 Aug 2025 18:10:17 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437963db10bsm1352616b6e.0.2025.08.25.18.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:10:17 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 3/3] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Tue, 26 Aug 2025 09:10:10 +0800
Message-Id: <579f5bc7d060701cbab1046c3b55ca0bec15eff5.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_181018_912058_458DCBB8 
X-CRM114-Status: GOOD (  12.90  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
