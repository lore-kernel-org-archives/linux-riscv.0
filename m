Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DAAC27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ0TeboinGfAmuuLC/ZCjxmVTz+WMQds39qGK+cNJQI=; b=KXloIA8e1a/jxZ
	5UhQlYQDjv+ZpY2jBEmwsfa2cbQ5CayPCnuexdgaHGNi7Y3MK/Ie+bcQBVGFcQIdUh+ijIuCw21Cb
	bF3WqQaGG8PnCcTE8ZQ1Daq/N46BCuf106+3oAHVCc4v/j3cvR25Xyca/LQgmgnyr9aUTSrACXBBp
	SiZmdWZcyDtUZUZ95RbvJ6+XSJV3GKTLc2DPBdebcNPI6UCxD4J4xn9exhj4Z2T1ayPvyFedakWXy
	QJI4SrOrbc9VKhbAlNtCemB8umUstwTKPz6ijQwLYmkjTeBUbXI9y2maVyFz6lVlzpKPwcKW2ruSY
	nwXV4Zps9LF4dYzIZXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuh-00000003mSp-2znc;
	Mon, 10 Jun 2024 04:45:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuc-00000003mPR-3CWK
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6c4f3e0e3d2so3055648a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994741; x=1718599541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=NRbjwT8xJa0sHOPvthvH9ynGjA3mKocEjDykcphuCTMI8n57PTER8q5FpIm5rcSJrY
         yFXeAXRmgtu+B92KuePuYjibSQOtu4pa35W/3tC5Wr/GvYss7GgT3DpNXmI41LK4PUQm
         xo1/EDIqFm2tAkdXWSMPsQxmLpy2HzogXDFgyfMyRs9rmszfs7IBl+pXzcYvuRssNjc3
         Lc0v2Vo/OcLF0ixmOOc1RsQEBx/YEVGqCJ4B4tcZzaRNwMuTUhCccJJgIS6+ZDydSINC
         3dSxpwvlaEeV5wIOTYq8edsRZA26qvFgMvUYjZvlbm2fMVnsSiqc5cd6y7bhVunUffpn
         QRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994741; x=1718599541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=jAfj+HwZGGIq1/U5iNKKJv8L7u7zLeBXEhHZSqNs5K923VQ2qhcRJwWRIYBgGDlNxl
         Z8hw14pPTmn+N+XxYuRdKCnBm+NrbHDd7o3HPHEKmEyiuZjbDNE27V7BY98o0L5nAiPC
         eNPsApqE+Mcx5JSc4kgeQUn10U7hk6vADsjNc736b5usJ+2as5Uv2rUDByD+Bt0OtQDO
         WahDXjk/I1wojDEbeYwNQapje0UtMdARnAA7hYalwH5ydOlszsCMAksZCO5gWK/2sSVa
         qii9zcq1e/9K6lrDgRiLzTApdFSm3PiPt3HlPTCeLrKXbON9dsgjcVGP92MpZD/gcai7
         Fifw==
X-Gm-Message-State: AOJu0YwWz0o8dq6oyz75KSvWujuyr0rj3HJ/7JwNg01MV6PpGKlHO0tZ
	ZNNsLWjasBICrH8MAmVBGhpNgPOVdI3ZJ8G4hZZ55cyjo8Ghjytw/RULXCacEI0=
X-Google-Smtp-Source: AGHT+IHfXz/eqcApvPQDnA4xGEwd2uFPXgoMy/TBwiOmRs/TV62bMg4pq81xPe0jQyHMWsO+kgdruQ==
X-Received: by 2002:a05:6a20:3d81:b0:1b7:77ef:b125 with SMTP id adf61e73a8af0-1b777efc43amr2187647637.21.1717994741443;
        Sun, 09 Jun 2024 21:45:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:08 -0700
Subject: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=qMU9GEMHv/svOPJ5zghxy0bhqG/AbgzxOZ0AfXJrmBOvTNW3UuMX841ytI7NfGDiJh0BQgx9K
 BRhD0FN3VpWCnzzynK4/FI3j/f0VwYqtduoZBXh2eanJAoZrFHFaZvg
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214543_396352_F45BECCF 
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
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
