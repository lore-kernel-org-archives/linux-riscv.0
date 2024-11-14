Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7397D637D9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYYVgZUlybl7UyjrEtLC94eyv9tqExg30Q+zC2tOCxA=; b=J4aBeVwUQib3GO
	XomnXUw3ymPI0RyoT9HWIEQa9pbpliYeMe5s7BKYKxjXOVsvlykIzfamKOdgs4qGqbUQzRQkPFUsM
	yJeI6k/0A+vXCNmH6cjGIUWgMU3Gp8TFFluYB930KYo+c5oFjpsv/d1XjUdUWqrm3xt2fDU5aaBA7
	T1C7cwOhHm6ditRXqddj4NvUKU2TMihlk50IuOFtoyZlF8METQYWO2cfLV8Cf/qv8FdS0AhbxvPqM
	6Bh4pPEBc45U1mMLjc7LOzKWWpgriM5eO/RCmjfiP675LLdzXAkYW6xyAW3Jgw769e8NWwIJmWpAu
	IOE7rG4BWc7FGY29OAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUH-00000008WUS-1bZy;
	Thu, 14 Nov 2024 02:21:37 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUE-00000008WSt-3uwv
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:21:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c767a9c50so778105ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550894; x=1732155694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AQO4nqVA0DOYwAj+teZfr8s4wmd7CRI3Tiiq9xY2/I=;
        b=Xeyjt3xkh6KmFMRD2dyuL42BfA9YmSNzoQJCmR6w5nbg9110qy9j/lGd5Lf1dhlKYP
         kF6C+ijJPZZX4/QSMdWwdpuhzlIvS9bMlO5DvIKACa+KhsDzMQMmzahbzLaLHt24J3D8
         biZRJfEN27BASsrJDZgeo7GSb0URAXf4WmLJSPFaG5RErT0R4r0j7MlPprpy8aDA1BeH
         meMYu94E6PMJILQ2P7jo0SXA9tivjozdcw+QxphrrlbtyFF5UXkDk4gnhJMHW3gYF0GN
         iqFZqqX0R+9gY8D0unSfacBcSv0UuWqSknsZKmhbK6VV+mzcdSNxO6cboUN5wF9GZPdV
         hb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550894; x=1732155694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AQO4nqVA0DOYwAj+teZfr8s4wmd7CRI3Tiiq9xY2/I=;
        b=vpNZmqNeJYpHGx1PXv9Z2vjjqdomedZ8IhemW0bZucOBK0HYgCtHmih2r12ZkndOe8
         4sasfE7BFOBS5BMHy6F+T2gccCFddyLTzO4Pkl9imoBeDcQ1EYOuENlgtxHQ/1bu1ZuJ
         Z+mMmq8EpvTq6KdO1vIfC2E0aTcO3yaC7QZ/1Rq01Xu2C/mnh2GNjwXX+NM2emYWXk4z
         uBb3qIRLtySfSTlQGIHLljEvY/cQyiuPrN99Eh1WzpKKYjHatxqC3igHqVLVhAxauPwY
         wzpCdPPnhtbd79swQiaVvVEtHLFMJRywIh/QqWH2QM7MlKp67Dlcf6+3JkcJsP300Sza
         vX5A==
X-Gm-Message-State: AOJu0Yx1bR7M01ZvPJy3YtYrAxBpQMR18DYN/rX3/fdqBs1UunP18v3O
	HptWJteBGI2iogigMrzp2qPzdpg8cajP/0ZDr/KOas5U2f4qYwg18oVynnq7ySM=
X-Google-Smtp-Source: AGHT+IGrPh2oth73h1ZOIX/aQlar1fzBZmI8dqyRsGqCIcqDReOIYeoEpa8CGkziuc8OoKH71ept5g==
X-Received: by 2002:a17:902:c406:b0:210:f07d:b3d9 with SMTP id d9443c01a7336-211c4fa2180mr7014155ad.6.1731550893974;
        Wed, 13 Nov 2024 18:21:33 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:33 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:09 -0800
Subject: [PATCH v11 03/14] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-3-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=o78oKmhk86m4HILZFTFFZV1kdWoTsr3pfs9WIhJp/x4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3PzuZYU1171+TxMpW/L2g8WBQ46GM78l12oy6hTd2
 Lpxp9nejlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbSKsfI8OxU4643JUuXfNwk
 GavmoMc/5SwLw36Juznun2eVP39WeJ/hn3FE6Ku32q9tr7xpPfj1SOM7izaLuD87Y5MOtt/lX3E
 /mwUA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182135_021589_EE47B9C2 
X-CRM114-Status: UNSURE (   8.57  )
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

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
