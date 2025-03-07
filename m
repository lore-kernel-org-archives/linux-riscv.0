Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5337CC282D1
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 01:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5Iv3PRrEFaVTcSGSLsbIDxiY4ir3D7PGCL2bJs+mjA=; b=mh6AMOB078v0My
	yzsHReik/djHa5nUWSFtqVaULmkwvVF8QnpTSYxF6unXz1WeISdBnXnjC/wvFdzzThOmkOU6Soael
	bEdSSBTtaEsDjiVPzCd5dYNYKGBlP1Uhgb+aoLn9lU0ZfVpXoMxmu8qQdY2jd0p0qa/4bK4Os5p+p
	5Oj/dM7kwbxsy2RhAxjsDe/82QYB1uO/eJkhesa+Xlgym9MU+vYIY0GOPSTTyRowQvh9HeTfjLgnf
	YuMJqk5M8xPXxqJUuuKkj3tnHa6tr8g47Zyyni+7YX7saISMDSJjDhaSRh/T7nIFDNslH4JR1duIQ
	++UsIx9hqm+F6N34VHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMkl-0000000CpcK-1nkW;
	Fri, 07 Mar 2025 01:43:55 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMKo-0000000CmJv-1HZE;
	Fri, 07 Mar 2025 01:17:07 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c07b65efeeso125343185a.2;
        Thu, 06 Mar 2025 17:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310225; x=1741915025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=PsLjNdojdUlsjti5TgYz6UYRYoIR0/+Pwb8xqg1hyQ2ClEIg226kS4VySWpYH7k9ti
         qNfID6lyuxBfSMkIC4/YFEcMja6Fj3RtI0Zoq4eJzJVrySJ3VZk2R6TEEp3nKB321SbG
         rLf6HDWAQ9fArOpP7GTaxVNnMnlT4N4Fi6ySYv/GHgNU4V53Eud7lwFYFJ+5jbyg+W9g
         pQTmYqxs5b3JaVhv2IiovSUCfDBnF5tUo8MFjYVE0vRQb4yBRg8vpDVbOjh/lnes+Roq
         sr+VmBGGigsE7Ft02hTuunXA/uWEqlhnYrDuNLmsyXJro5ElqzG4tK79HnhBovMK7han
         nxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310225; x=1741915025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=XUYfApR+h7AivN/m1ZSIl9NDpn0FkaLnalz5sXyGYuE0BCw7vsc4In/gsihUMdkSa6
         Ur8wfcejuNbIhTr3cS98zn9A9cAPpoRhcFWvoy9pQQgeEF0VzwiwnJ1VX7WJT/4WWVew
         QZEFviBNu0AIJqJlV9XD+s1lTxQXJNpkXQy1IlIaM6MsLaDkVjs99rWu5CRZrAvTJgu6
         Q9xfrUTQa4ZP4eutFJMYzASh/m2G4Kor8X/SOpo10pNPWD9Mn/mw0YzPVCgrPGU344GC
         btrEilLfOi7GEh5YietUQP1mPzeTK2iDSf2Rs38kCOtasRhOIQIBzn78+YIUgUuwStl3
         4U3A==
X-Forwarded-Encrypted: i=1; AJvYcCVhlasHnc5PNe43M3znRll7lJKuqCZ4wWVWTabU8oSn1Hx4HD6JCVOwB3rMNggG9k7x9FmIPsi1AzERvuW6VupB@lists.infradead.org, AJvYcCWgf4+8FYx4VBcGjCJWQnAUZrvb4BFYPvCJKLxYlUiciZXwoh3n5a33gt0MDrIh9YZS+A4qKUu5gzlQfVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhIlXzPkZ9FGvtwtSX5Da6Oio9MjLhbksgkNkMNr/rI4+yZJsa
	CXMKr0uIsRs6lYHVlwpd699GrFTGAQGLHZmiDJkzxGUrrihH7pIp
X-Gm-Gg: ASbGncsxB7QV1f46zuicLiD/CbOYIXlpu0bdDJMMg/YNjU4f85PtkXsQmeWhBZPGxCi
	n9g7QM3iRcyLsDJlPrtxnABzVfJyVBlnYArOHZXuPhCeyUflxvH/BMG36zBQH5HL3DNM/IbNfcX
	DiRu7P55jyy6b/zePDN5imV2N6Sddrkn9YMusD+UDiUCu2I6D8zt9E3sWQD4xQR75+JAh1Zeshi
	oX5jLjNGzEm6o++cfLFkkpB2SYxepuVTH+GFT1v21zLmmkalp1m4OZXC3uTnHXrb9GYK5vw/rbt
	+C4Y9oWgTd29Uo5h++V1
X-Google-Smtp-Source: AGHT+IGYsH3sSP+qAZYndPm/6yCLkWYSNzyIRwRqHTgXvkWd663LqIaipq1S+8GRypyA2mF4w7TN/g==
X-Received: by 2002:a05:620a:8b14:b0:7c3:9d0a:6959 with SMTP id af79cd13be357-7c4e61137e4mr162902885a.27.1741310225187;
        Thu, 06 Mar 2025 17:17:05 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e7c0a266sm142441085a.30.2025.03.06.17.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:17:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v7 2/4] net: stmmac: platform: Group GMAC4 compatible check
Date: Fri,  7 Mar 2025 09:16:15 +0800
Message-ID: <20250307011623.440792-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171706_336815_35C7EB5C 
X-CRM114-Status: GOOD (  11.04  )
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

Use of_device_compatible_match to group existing compatible
check of GMAC4 device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..4a3fe44b780d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,16 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
