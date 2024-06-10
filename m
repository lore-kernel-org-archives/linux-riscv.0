Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F7C27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWBZwdcT8xuqK9mORFvxBLARk0oRfS3ex5DYagV9OLE=; b=d7QNmLfQ9iHgJj
	YqOkC24qyhSXTtn4LQT5v6B9HRunSPKyZxUQp7lC2k/FSl1KKYrfR/FGe14x68hXqszrHk7eVWOhw
	XKddTrr6I2oyJOrTDSlRVC89NPXelWev6Z1eveKOOlemh8cPj+hDVHghLIVydf7VvpK0fNeSbHSmT
	T3e9wRWyZs8lj+6LOzQwvzXv1idGojfeXWvGxcyiBwWdwFKKuu2PGAXmRy3prNRiCZHbbNZ+L6Uwh
	XBHPxqvcpdi4TJ/bTbkYA1/gYKae+uZJyuABYGsJfRiiF1owy3g6fbQxXRZgjgNvEuwhKRnx9XFk7
	GRWGN9w59d1Zwm1bmiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwj-00000006jZD-2Pce;
	Mon, 10 Jun 2024 22:57:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwb-00000006jRR-3Lzx
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:56:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f6f031549bso3825135ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060212; x=1718665012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLK9thpeAz/050Te/UpgqMxOgYJJfX2L6p0aPfIuJ0g=;
        b=Yz2N94HFuLqsw1n5gEUHnrPo2UGLTfp61KkYmcnvLBaDqE0kEbbqXj/uH4dik3XEvk
         K31BANvzEfMDRMlr2r/iFqzMqE3HxEEW4m3q/21Ef80Qm/P/DRovSg+oqehAotlBSx+Z
         R4QPoF/yi2NGIDeKUKuhEnB1atX8BhN9LC+pPBGeTgrMlOPl6hacEa97uvKG1SjEt7c6
         7iixeahFKgT20qk86jfF4yqQoVi8n0thJcxt8nMeBK1rMzNr8Zk+80wYkxawDuVh3uiu
         H4yGgFeFh64XQN/CnyfZySkVzvJeQ37M9xRAMolyoKBRm5zum899bA0x/9p09tJVYBLB
         e7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060212; x=1718665012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLK9thpeAz/050Te/UpgqMxOgYJJfX2L6p0aPfIuJ0g=;
        b=s0cV7jWsvf88XjdZgLV1fyOxkikoUXCIizWbKM45tgpfwP3BBTubjBsE0xuVcQDBZF
         9MyeoyTT2E6APGvHU9pU6wObq8C4NlEeVSxxV6HOOBXOJzXa6PK8WsCN3zwLmahSSXNF
         tAc54JXs3VqGd2U5+Kl4ZDUAdiv3UhlV46pY4+YoFY9eedwawF9rZ/cMcKXIMAjx+vn1
         Jj4gW+oRYamXmvd+xy9JrSY2dZs0BVHE26/Q2i224LwJ09CMzc5ZLcEPl7cI6LR9cFuu
         Zrl5uGHzasS03HOhyy8+A0FA96uT0f2pTTB8q2ls0tWoVdZt4AJ+xUwhffElKnqHi9q2
         DnsA==
X-Gm-Message-State: AOJu0Yy53SXakCd0IOxyqgL+pj5kDmHxZUcLgHWPZzaoBDl9JqEcn6TA
	1Yi7+WDcjD8q/jvT1dl3V6zYOJz6UCwsz7CilkqgOXcHafq977CUijSWzDoejhzXoTGf32ZEEgV
	J
X-Google-Smtp-Source: AGHT+IEXlPdDC/cm3XWTMWZsSI+KISGfbRWYYRB+hu0C2M34wJmaILJ0Oapoz9vjpacbJKVuMQtTag==
X-Received: by 2002:a17:902:ec8d:b0:1f6:138e:59e8 with SMTP id d9443c01a7336-1f6d02e08f8mr123826495ad.22.1718060212108;
        Mon, 10 Jun 2024 15:56:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:40 -0700
Subject: [PATCH v2 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-3-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ca9316m2q7KsJpXKaUYuMTEdVfJhCps1VG/+w2MDk+w=;
 b=Rd1RqXyTjzNZ0C4JTbHLRL+/rb2toKlfKsgxM0n+m70IZEjfnVh7+2UZReMpFZCIoGWFDgLBO
 f1XeHlkh/ZqA4+v4M5bCfih8O8eBXibdkflJyyCKnWo6RjK1HHDZMVd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155653_950705_8B9FD8B2 
X-CRM114-Status: UNSURE (   9.37  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
