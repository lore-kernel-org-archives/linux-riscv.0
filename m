Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC57C282D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5Iv3PRrEFaVTcSGSLsbIDxiY4ir3D7PGCL2bJs+mjA=; b=BkA3OpdqcqxE4X
	7OjO2pQEGqo3X3Z4E3aPD35CCoih9pg/kGL1CMTRXiTcl9OdxldQWzRQF5XCs0CT9o/HXYZAv29sS
	mvpZOn5DnouPCyz6nVnb6F/OsvHlw/4s1kViMf5ED57iQ2CvYqIwlSD3S2ujbr7ljERK3SJrUVNBx
	urnPgc6e8j88Z6I1eGTzf4JlRj2Cv/S7dRv5QMB0wNbct26yOud9meYFDuJ73Rff02oXFYtXFz2Qe
	00v8xYAZ7MzxS+6zog/RgEmdOqse+Irc8OH4B/1fn6oHwG71hX5OwhzAi0TXSuz8LYiA4TP9P2dR5
	WF5ST4Gh9j/Kq8bY64+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiYe-00000007Avo-3nhE;
	Wed, 05 Mar 2025 06:48:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQT-000000078k8-1eSd;
	Wed, 05 Mar 2025 06:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=; b=pDq0wYvKLiLn6ZOY9W6Bs0SGr4
	wnGq6L4n7WXadV3JDajIebB4DNBrfU5/3cNwMneyjqpxnK96HX+xUtomjNi1Qe3fTEMRT04Xq0rql
	1tc0R6kOPCBjTYspzZmNd119MWcaMLLrfex2+jSK8JmCSl/DjH7v4xxsOPw/+CymHkj0NYX/sxlrJ
	NvDuipUo/G2SgitgxoSXMV7mPlBucdaFcefAiqwdXsmdHvp4jdw43ggoIiraEdC5PArao3GIZHfjk
	FqG9oNNtQ1h3m7zx1DOaOZY5hxesoANqZWyE/bprwGLndkNfR6GSyoOiXtLuvJw5a2h3iBnwRvCbG
	i7D0iVyA==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQN-00000000O7k-3xbm;
	Wed, 05 Mar 2025 06:40:15 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e889e77249so51883596d6.1;
        Tue, 04 Mar 2025 22:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156799; x=1741761599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=TfMNmCiau/BZFyUpqeXLrLIaWkIfW6Pk4ApgHaCalFZbaL6kMgCyzgEMQYIoGFPhwx
         9hQCl9hnUmULg9FWfbH7Zm5mgGwohIvZhNrywOT+xb7uvfJU/2ENRP/khwgs7Wq84gUH
         H9Fm8QFeQxLMBODzcDcruPA6BROmH1gbrMXTSId/HLUxc+oHfEknqU1EMYkU9+mvqSU1
         9G1m42vGWNTnQXlfa3Dh3QL0nLQCIibOAZ3UGF0EH8JddMeov7TWX/C5y3maF6TI5/LP
         ItQFi6Sk/6StOELx93i6Z+4EUKvH5fiPBYOruIDcr7ERf39wtTOwIpepogIKedx2naq7
         3Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156799; x=1741761599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=wI0ZFMnx+VKkgrVULBLX+8l3ahBorOQFrghlJriiCC8gm/xO/UL9MnM3paD6CzRG6b
         +Mf16DVNMicS/sSEAGCBMSY7j4DtSxL/O6fyd5P5MeMg4St/hgugT7/q/deEomzB1/SY
         xhXcvU112qCDMK43LS1l2z897vGSQZ55N6YFjBXhX61gbpCixgSQUJceiXm3RV3LKUoJ
         QkD8BJOrYAVQ7zWE4c+sE+gDOz8F5DshaIG79wkoqABdVuwqlHMFyLJAQSbwvNftRgUW
         0qfxu57eIqK98QyzfNpLakZT6xQoM9/tK0ZqgW3Jm1wW3IfjaB1m5a62drjuIJDELCRo
         Z4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV1jLgC7ZSjtfvJo/XPFMGmZZCPsPWwaxORA2kNuE31wyd9is7c2sCgemuBaNuq3E6Q7scfsisyu+32J6U=@lists.infradead.org, AJvYcCXj+ROV1oG/2Gdgy7XhlCShuIoJSo5PkihCVUisub4dQp//RebVzzlxHt9FnZvIhHTh/5hJHrJNrTe8Q6A2iRSA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Qqb2zjg0wvc1DJLcCAL62pU9ca7w3NWU4hJgMKLb8wU3v/OS
	ZqrLMgRSjLaVQ/48qpUlnP96lm75h9GpWCHDm7ZYZfg92gejX8z6
X-Gm-Gg: ASbGncsi9v6jW8n1GQI89wW6+Ij7+P7lXFhEtW3XbRjpTCxf/DpXvcJ2oZGEChhxdCs
	hLIy+ou9agKrgcySBcfhcg7OOAluhtx2lJqJn2gfLkKh/umv0EK+WA1wunSPVz+XtjzojNLNfrk
	7rZVWNX9IQQnrXztOCJq/WrQBu+JjZkUTbonyfF2My8AU3oYZv6sF2fpxZgn+yinPbcrUaQOWPa
	/DNwDwh9VNT+tm763WQizkQsBAmD0aB4iDZ+pOa4TvSuhUTOeCAOwpbVfmA0mwJ7cX9osOSDKBp
	1WCjPYNbCKVyK4LhkzIZ
X-Google-Smtp-Source: AGHT+IEuoOgEWieVXYXs/BnBGn13ST7tq7MLg2Te/z0E0W/Uw2i3Q/8qgPco6xeoeTBuGR6vTw3lBg==
X-Received: by 2002:a05:6214:500f:b0:6e6:5e21:3b20 with SMTP id 6a1803df08f44-6e8e6da9f4emr26434836d6.35.1741156798831;
        Tue, 04 Mar 2025 22:39:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4750aee9694sm7883261cf.36.2025.03.04.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:58 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v6 2/4] net: stmmac: platform: Group GMAC4 compatible check
Date: Wed,  5 Mar 2025 14:39:14 +0800
Message-ID: <20250305063920.803601-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064013_490306_FFBEE976 
X-CRM114-Status: GOOD (  11.61  )
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
