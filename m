Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CCAE77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYxB2G9Bcq4NsmnuTqO+9ov8y1w1hzUrPxjGH+6lj1c=; b=W16Az0diIlIp/2
	3uCfvvnn5p6/ZiW1W+ZjFPNYyV/yfXWVdRcTZzjYA2cDIhRu2OYPd3hi2Fp2FWYac9vFoRu09SvyB
	BkdN0b63RZ7rnMf3LcWN6k3ryR+EzVndkYohe7LRjTZdIKJhySSgcJLOY1Xl58nYWQJ2J5QoBJZhZ
	ECpXLEWAZJPUQX8H/FmOVKZF/rDfVN7PxBuiC7EADeiYiBLT436NqDjT4hb9X+ZM5gYgUyfsfATWx
	8Dn4IjoyRl5Gq3xU1XVJA12c3WDkUptb64G1O0FdRJ7GHKc/ad14b4wEpVTQiE7DOCUUbEAfdcoQZ
	aphvLiE1JV1haAcY93OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY5j-00000006iQV-10QZ;
	Mon, 09 Dec 2024 07:22:03 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY4e-00000006hms-1nYv
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:20:57 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3eb4b6106c8so396260b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728855; x=1734333655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sywd5ibf/76z5+rkZ7ijeWmGFF2MBuEBBfOcYOD/r6A=;
        b=Icbn91WQ3Qwe/t4Id5ij0ipjAW6YMyeyNInAXN00/aj7eMQKGNf75Bsr4wZij1nbmR
         t58EprbooBStUvU+8MxxrCcgPDrhY+3aT+m3TFxrc4JbhXr6haEyD93LZLK/iFdHiVLz
         pYrnJDpJ1vOlJoosqhDi2B8DodFfvib8hkVG3F7sejCQ4YFmyGPKt8BL2H0Y7l0xbr39
         eHfGWAitjmc6or7DL9VHcMkEGaDKObfnY8x/5d7y2qrcOE3W/EZ0nnurlA7Gghqc3pi6
         QCo61K3ajceBlME8+2Z6Re8/Epi8HK8d+hYa+tsjigh6m6zM+KeBLKbpeePSKDgEkZ8q
         UIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728855; x=1734333655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sywd5ibf/76z5+rkZ7ijeWmGFF2MBuEBBfOcYOD/r6A=;
        b=rliBTofMDmJ7IFVjKPjyIWl00EmKUM3Fp0TySsFjyuLXbAXV02X+rcr4yF26kuSNvE
         j4jMLhchHqlUPbMMVPKF2SpwvMkZykTi+kRL6KLnRSCJxlXUpkLZnC2PmtFNchLHaA4p
         bIWpszhsjCa2S3fkxKrZt6va4IxSVuszdl9LMpoRnTG7/43ZiRmjbGZ5OfPEWqaSmq2n
         fffSKGtqEGIzdu6LcoWzrSYB+w1X3QYfBEB+VnP0WX8xcwAYuNGaITXvSDh3PK55/T/Q
         XlNq3sqUPRmJ6gaa3cE4t54AvvyTgyLuqw1pqyTaNkJadzLF9jTw4I8QQu9E9CQVpqKu
         94ow==
X-Forwarded-Encrypted: i=1; AJvYcCWR6ljp8Rss5S2+Hg/4IcZgaHmN8rJoV5Prq5CZi9jtKs/rw0jW+K3CKIwJ1F//8Fi4hPmf0qZN4CCV+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0dxJqEvuqXY5x2SspNLBM4g1jrf8z+Og1hGaC6B9/iFCrwf7g
	jR+R+8yb6EbAMmmOZf34Lxun/wLZzG0j0h7dhHm7lU+p9+MkwSKF
X-Gm-Gg: ASbGncuSp9sEBvkDYhP0Zlsg3HqYNILSA4L31xoKWT29opCorKkb7R/dFspErmj6jxh
	P6zxJAqoU1/laKR+G7haoKhjfeMAcoh0aSVv/k/0L4SGAJwR4wit9VqxrZAjTu1+W7iZQhEIkhC
	obvB0B4hJhiWTpejQs17+aJefTYd4VsforuHUixAvxwcf9sWUrylK2lZybgvcw4/PGak7IswaEJ
	Hp9az+jJyMpq3k6SvoVw2Qr2z3ny72cFX02FEYHYymjnuI7Hb2vmuJUp02B
X-Google-Smtp-Source: AGHT+IHWdeSWThVY+F+74ZdnjYKyllCPH28XhzCUMebKX0SZBBFPPV2lGMTSNickSlZKwyOtGT7n0A==
X-Received: by 2002:a05:6808:2384:b0:3ea:5705:2a2f with SMTP id 5614622812f47-3eb19e5d650mr7560012b6e.43.1733728855352;
        Sun, 08 Dec 2024 23:20:55 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f2c472a028sm62252eaf.33.2024.12.08.23.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:20:54 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v2 5/5] riscv: sophgo: dts: enable pcie for PioneerBox
Date: Mon,  9 Dec 2024 15:20:46 +0800
Message-Id: <5887f31f8f8080e833d799bb4fae2c52d6739d76.1733726572.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726572.git.unicorn_wang@outlook.com>
References: <cover.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_232056_466745_28468467 
X-CRM114-Status: UNSURE (   7.29  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable pcie controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d..e63445cc7d18 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -60,6 +60,18 @@ mcu: syscon@17 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
