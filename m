Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB55C8303C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 02:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpmdGLxtqB/zlmo8Li1Ghw2Vz/JV677QL/5d3eJ31eI=; b=AMnmjaqB4zAEi2
	c0H6dp+jo1OXpvTIJojJIaX/mb70waxdz1jdWLG1yeryEnR7RsmwWBie/YK4r21Ahm7RvA52yfr/I
	xjUhcQML0Ndstl6My4qcASi/K+YL2ubNDPQnsSb4J5CAtXDbc3LHp6QEkajc+BtHFAc00g1LL3TIp
	F3zopF4t2yocrgnDfiPPr9WeOBzOy2lcFn8G5u5a7gZ8K1Y1P8z5Vzl9e3TqZ0rC+uIxnKv9PtuWa
	Sstl6sE9zZ3kn00fdVnUDB5dT1bx1fYYsrmxXZZehtQuyh1zKGbsl3ZTu1rMku6y4HJORUAR/nc6F
	9FCaegpY4NtMKQ9wSclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9V2-0000000A0Ot-2JAi;
	Thu, 03 Jul 2025 02:16:32 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9V0-0000000A0O0-2aG8
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 02:16:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4603941b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 19:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508990; x=1752113790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=E1iNFbctTz2Zg/uY8ZJUVJ3qt/5Wjfyx5VgH10Hs0KNExZP3POw84QcSB6U+lVZG5e
         Bc3jy1iITElEUl6Cda6uC90t4oksG4qyjcjzCv4uvfIAOjzh+1bNKoXcMIxvRR9nU2p6
         nfJr5mcCY4l5jkz9SJ/VJRoJBgybPhj6hXE3xisPnQqpZgSyJOT4hggBAQMN8VYUTORu
         fczHDg02OmzvUyPl4zG424iE+O4wQmnqF+cS2J2NTR5rfclsaVMbBCfkV2bLzXuTm4vx
         SUAKFvkP7fGyYpbXXVB30m923pEwuJ2AM2DfqjEjMjmyn8zB8XywND6pnzWLERWTf/B8
         B8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508990; x=1752113790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=an+bOM/r6kNhn4UJ02vXXjGNfXvadYxjHwAjjkR/qCsI/DLasaVU149vobeROseQig
         CTsWRDfa7AwsHaDeLSEPT0m3rwVN1VVszQfQXGP50t6NiGGSSb9l6gmmTDXt/z+3o9OJ
         lZjhSMP/kc2pjnKTNA1uwUBaqf2Y7Rnr2zD3lyBNvhiiYyms6BcwTNJ2RooENK6r/6IY
         Pl76bo0AkF8Yo3CkRq4wjd5nW0CZ/gyBs555hH2ZYQsCYKw6Qm86V/CD9XBVLpBpkKvK
         vScgoCzFkW1Svfusav4bVpb1a4P1eoX4gRbWMYNid/k0SqycVHJS1CgZbdCjMfAAaaZI
         cnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyk54qayMIJamToYt9Pqm9gnhTSfi0XtAeh4ZijZXD6Fb8zzdtWH1nzZv5FRTMDCjisRvHet4W/eD9jA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs7J/r4jLtFSFs06ZC2eYgsIEHwbiRNzeH1n+YljkTC75N/Dev
	fg0Bqg5q+N1nQ3A4eWekpx+Jjjc2j4fhiLqidJvuAmRu1PSfen1GU0F7
X-Gm-Gg: ASbGncshhrN3YiLmiiJJMKQzgbWdU02TWZTKIrtml2Z628W7p/BoGgQmgEcQmyCsIx2
	ZFM3RPXI6TvXmR7fVVi0sm+qZAjbnrQVOXMwdvCAIFs2LwEZelqxEgAkmbA7YeVhSGVYloJ60v/
	nkcvqrpA2T+dkU+Apu2NG4lQwVx4aqOvJaYzoYGX5qn8wJP+CptbahpKF3Co8CC6UgvX2/QMsPk
	08Wz+oZN01bJyFssvfF3LyedwwsdaLOYTukvvsRxT44Z1Xdpyivw0NfgyG076N/DIQNRvHAZgqp
	+m05vmwcHBYFIBhuAsFzCoeLgx0n+FRL5dFlmmtJchJ1BAty0McOjbyUnZ4YeqSt9SudvNOb
X-Google-Smtp-Source: AGHT+IEpMsMQUhVEgvoZKgFsN3ulChI2nMRJELvAlPxYIYdKpwZvdxW8bpYzVJB4RTLdgFWxGCsHMQ==
X-Received: by 2002:aa7:88cf:0:b0:749:1d18:2c74 with SMTP id d2e1a72fcca58-74b50dfa0c2mr6495116b3a.10.1751508989779;
        Wed, 02 Jul 2025 19:16:29 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af54099ecsm15228303b3a.11.2025.07.02.19.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:29 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Thu,  3 Jul 2025 10:15:58 +0800
Message-ID: <20250703021600.125550-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191630_648428_FE58D910 
X-CRM114-Status: UNSURE (   8.25  )
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

Enable ethernet controller and mdio multiplexer device on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..4a5835fa9e96 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,14 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
