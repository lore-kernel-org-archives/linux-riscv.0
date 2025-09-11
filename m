Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB82CAC58F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3lkZj+UpzY3kZn4PLzmhH5oyrSV+zLQy3+O1JrgK04=; b=oK8dpBu+KzGW6A
	bPSksHphQ1b+OkyFG2KY+I39Jidb8KdiHsfWYhpRb8Chxi9qol5AwagpZPToRfGPab1YBuWbkXq4y
	/0SlGbiaLynGNNevGz6romErvKs6yjhVT6WRUihbuIQrrS6q+7PaJeNgjJoIqacIFxSL9e/b59UzB
	zitbmXO2CxCxmFawgv7CcUSd8yDw9oou00eE40ixqzUUllSNA93KF8MDwgLiRgfvXdyNtu+n2O3PD
	OA+Rv/nMKNgP2MaojKJLsR+d5Xck9uQudJvFx63yaE53sJLJk90baYHmdOxipTWrd6lKZIUevVKhs
	zhFXQ1KiFDzCN/yNcixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJ8-00000004ogd-3knq;
	Thu, 11 Sep 2025 18:46:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJ7-00000004ofC-0VU5
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:46:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1091951b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616368; x=1758221168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhIVMGmaQb5kHljyJByX74pnoIVwtpe3D/VkqUSXrh4=;
        b=jTVmlmv27edilD8jDgbXmj/2a4P0nAYNJ4FL78+nLaTZCTGAGi9sN/Y9Oahc5x16om
         kzqzXrULsOTRAqEhwer/iX4DmhnJ8V+rwstLE80F8yAeRHAfCD+DXnhloqS9itd95drn
         dmCwIrVYzh/97wKFf3wf4npNTjZFaV1yymArBApBCDd2R716SqccgehHiQbbq7vY6uhN
         D8HA+M1w2MaLIC/regC6ollF/2COHDYYxG0eJncwiJeFg0HIV7IiwY2Q7iL2UAgkiozU
         8OaVS0qXIe1Gu+d62Xpv/GC4uB2RM3MYtoWEQtb+4QP15PEn274Qmmpj71zCc2EIbBrS
         XS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616368; x=1758221168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhIVMGmaQb5kHljyJByX74pnoIVwtpe3D/VkqUSXrh4=;
        b=C673lhbzeUxYeXWXLhQ3JHwANb1NASxP8oA47dya7f/+Zxx0qn3KxCbBnGE9NoSr0Y
         SruinpcpxClKEsvGyFdCxtYs0hNgzvp0qUZjbXiVn5n03xeLDRW7ruePt8Mz0Zh7DKfW
         NmEbq6xhJi6btBIlQv3aepTVNixfNVhP/Q7VmrlmzabwQh55LO8fmXLPOH5Tbny/MEi7
         44GE0KJ5Pz/eK019457/8754wLc9smjfmHDSfvXGkYeTyQLu7TKT1EV/68HUpSwxuGkV
         gRRHoz8lw7uzZvFN0TvRNdu72lizvGAIt8kXTgv6WbugNUDyCUgT4hjWlo5/mo7xHxtF
         h0wQ==
X-Gm-Message-State: AOJu0YzZMD5Upn7xlHoe8hdwdGJ+S1STVpRc90LUP3KwPv7cJnB8sQ1p
	NNNMO0NMVlhW/viuNxDH063PMSY05iGJk+G6Jm7GAZotatoQTY2mHFqn
X-Gm-Gg: ASbGnctjdrBY6wonpE5ebRp4N0ugz4Yqj6ye3OzM+qHUKsNJAfg90nM+4Pe7uKpnYc4
	pyz1diQIqMgCtHWSvJ1ZHObYrQzKw7Ryf692/MjeF8RFa2CnFxzPdZtBnhPJzjreEyy6jpqzfMx
	vFol8td7pTgLfOkfoj4xvCtw+saXG4S44opEYn2J4lR1lV6y4W1BpgjroRQETXCjqgQV9qOjUJe
	46V/8REz1sv7WvTa0pCVj3PrDm9K2HnSRsYMxtpKM4wKVvSW03iE7F35K61gch2uKPf73VTLPbr
	Nip8Y7EaegDLr6p7SbUwVQ0m9KG6kMes96eBJ2lfp2ddlMipJ/QqivmuJcV0BfB89bojfXO3Y9r
	R5ElkrSGx0sanclOPPihPtsdmkSUwTny+D3sFd5MREY9wBr4MI+KxAP+yGJv7+4u6/cwWmfpOCg
	elZ4Ml2s4l/tw=
X-Google-Smtp-Source: AGHT+IEWVt/7gbdNel0eKUlbw06kyfO3o98uOlJcnfbdgYss2Gsvlp8j+D58SPIYP2pLknnU33ifPw==
X-Received: by 2002:a05:6a00:b89:b0:770:4753:b984 with SMTP id d2e1a72fcca58-776125cd045mr354124b3a.16.1757616368063;
        Thu, 11 Sep 2025 11:46:08 -0700 (PDT)
Received: from localhost.localdomain (static.148.173.216.95.clients.your-server.de. [95.216.173.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm2762616b3a.81.2025.09.11.11.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:07 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 2/3] riscv: dts: thead: add ziccrse for th1520
Date: Fri, 12 Sep 2025 02:45:27 +0800
Message-ID: <20250911184528.1512543-3-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911184528.1512543-1-rabenda.cn@gmail.com>
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114609_161258_419654DD 
X-CRM114-Status: UNSURE (   9.44  )
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

th1520 support Ziccrse ISA extension [1].

Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 59d1927764a6..7f07688aa964 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -24,8 +24,10 @@ c910_0: cpu@0 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
@@ -49,8 +51,10 @@ c910_1: cpu@1 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
@@ -74,8 +78,10 @@ c910_2: cpu@2 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
@@ -99,8 +105,10 @@ c910_3: cpu@3 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
