Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9114E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+d12Pokx7xDGBDX51e/1StDwTjpWyWllcGfz/D8vns=; b=SQWimRtCWw0VGe
	kfqxnBcoaJs/iQv9O0vngYZuriy+L6W+pUdoqOXPndYYg6dGpZC/LKbkfHukEW5D0lceNusdbYAAP
	6OOtfuD4wUcROoKu12cNxoPbHCE4AaDTRKsx1OFVn5K4/djKUtQKd48Zxktr+3qQ5zZeYlQnWG4cw
	N+I7LcBGmWgFRLhPQzixJlLWNfPzo/SsJOiPDg53e0Juo4o+pTaXFBkTPsheJRwiSHXi/rujWvnQS
	c7cRqlqhQnZdtvPK39YUmo4qy7ahAXadl2IsPGNw1ThmWRguTWGWxKnpk9hkv4KoveZlbWchWWqyg
	54fLjgLV6hbBd7d0AL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXwb-00000006fmM-1LTS;
	Mon, 09 Dec 2024 07:12:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXwY-00000006flM-2176
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:12:35 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3eb5a870158so208051b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728353; x=1734333153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBYCDLmiI5Ul4WtnczXeDvi2MdVWE89AendZ5YRaAK0=;
        b=bRS2vYzvMVXbK3N8XhKqZ609G3ARqOVbKoNxN09tV8iIbViXMjsQxy5Adt2X1WRl/H
         chH++9BTUViSE8e6Xbyo+z0+R/yTxQ0ZdNLbQW/UxC2423l7plyE3wgjcNo92xqDrpL3
         ORPjjCUxt86r+AHjiHKJlr7W6wjMRL9aDqsVxcpH7QVCiEPZDzB/iqxkKsBBvG95ShWt
         ZCTihqw533+ArH7G3GvOpYl+VQWJHvFvKz8g6F/9U7Dgr4UDbiqf6tk1WjxUxQD8Beid
         xLHkPCmlirKiR20Ck4/r+W2dwbCB2ry1/qKU6jHUrr0LTPZwiWmuopnauRhlcCVBWu1Z
         lHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728353; x=1734333153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBYCDLmiI5Ul4WtnczXeDvi2MdVWE89AendZ5YRaAK0=;
        b=C5VUeKkn1oQvqY2FwlzKWQ2Y2XAyL2bx+s30ownPF/b/oMD29oZeMK7hiB9VNma5ON
         YWUk+IYxCjU/5bZ1vQHjT5eBAEANkOgCSLzib19iVaS3OiCgJjhHldiqFCfSX2iFX6il
         UrZItIpmcbjnEvpfjzGNP8N1TTpu+Eg1MceU2zL+ErzREgQiRq5oKP8h8zpUxGrGU8NA
         cgC17Z98JuKmKJUKAq+L7sbpU794WSocEWOUM0zu4Uv1+hPn7rnvtWDaoxoYmSC2k0Wa
         Rgpyku5I+UejEs7+NPhm/BS5gX43PO0byZ9+f7MMDSRUp6jWzjuW5/VJwh8kW8ayfezS
         p1fA==
X-Forwarded-Encrypted: i=1; AJvYcCVZn776Z9YE7REZW9PiYN4UlXrIbZ/WMbuFblGqD2Y2RqASeumRBoVosZaYTq+UJfvISy/cOFt9Baj/hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYVvHQG+cr0gdFluvfF90gRIFM/guvx/JyjTA+6x+wOjuoH2gg
	/uHHvo3XWHdvWQJvAsFMr5Le+FVQCA579rD6n/IVC0ysqJFgBXTg
X-Gm-Gg: ASbGncujuP4rJRF/xRVtwbzZdYnPceyH11JQq4RO1aQA9Q7LDZ5hXKY+Mu642ZwTDHI
	5DMNGpuLG6KQAyvgowvqYy66RH07U0mdDfwetufkahb1zl5uEbIAExY9DbJseOe/vdzjmSi0+Gs
	hB6eRsePQXEaoR6/0/GtIAXzJy8bl03V9VxDwZyGWgDYs+R8dAi3NczzgVvoyQfMPiPqnzDYO9p
	I6TS1Gs78bod/taFe3WwucQcG4pDWE+rK8gN+kSkJdPgTGPCuuZqHP0OZMF
X-Google-Smtp-Source: AGHT+IFxb8pbBX+e/TYceKryXxdB/wQe+lQAG69/HoUcIQJsTXDcI32zHcg1iLxG5yHXc/sDK/0Ojw==
X-Received: by 2002:a05:6808:1802:b0:3e5:f4f9:3280 with SMTP id 5614622812f47-3eb19c770c5mr9478218b6e.10.1733728353439;
        Sun, 08 Dec 2024 23:12:33 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f2793249e8sm2011256eaf.39.2024.12.08.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:12:32 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 3/3] riscv: sophgo: dts: add msi controller for SG2042
Date: Mon,  9 Dec 2024 15:12:24 +0800
Message-Id: <ddfa1512140be756c0432084e18d5d29b1f653ff.1733726057.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726057.git.unicorn_wang@outlook.com>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_231234_538488_D0D75914 
X-CRM114-Status: UNSURE (   8.42  )
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

Add msi-controller node to dts for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..bda49a398daf 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,16 @@ pllclk: clock-controller@70300100c0 {
 			#clock-cells = <1>;
 		};
 
+		msi: msi-controller@7030010304 {
+			compatible = "sophgo,sg2042-msi";
+			reg = <0x70 0x30010304 0x0 0x4>;
+			reg-names = "clr";
+			msi-controller;
+			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			sophgo,msi-doorbell-addr = <0x00000070 0x30010300>;
+			interrupt-parent = <&intc>;
+		};
+
 		rpgate: clock-controller@7030010368 {
 			compatible = "sophgo,sg2042-rpgate";
 			reg = <0x70 0x30010368 0x0 0x98>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
