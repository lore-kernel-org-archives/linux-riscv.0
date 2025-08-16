Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF72ACA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRbJT7SFoK4dHBka8VVNB5NnIXdKTnXyCXmqaN38Spg=; b=khTgG5OlpehbaO
	F3H0q4RoH1g+nwW1Q882RPndH41fd1rJI1qJfVjGUxghGMcnEV6bkRFQzdfqk2Jtn38KlIt4PCpgs
	inrPnj+RjxHOeyxryes0PS6mAiaeTA3Usy//mFEACyJgaBMzaxyi4qHGa29wmyeBMQ0/PINHmEKEO
	bTdok8aSwQBX9xhBSYtndZlWihOC0gxlN5ecoavWQR/EgmJ+fYwEJw4eB9EaugxrdHr3whiCpvF3T
	c6adwS8Pf+/8oGoqqPVhuS+p8FEhuLJbmGc44/RK949Pvfuq4oLJtEOku9hzKvyeMMU9SphqqZ0D3
	O43AzESAQygNaAQ90JKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDOv-00000004PYv-20bj;
	Sat, 16 Aug 2025 09:40:37 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDHQ-00000004OeK-1vBc
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755336766; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZUVD1jKbcycpJoOHNYt6loehgxTSeRCDJag3kw2I2QnzA+ypHO88tNyQqye1FylJlD1mnBs+EFnle10N+R/eGNjCIxG3mqzHbqJs0kxF313+bGsVuJSNnncrc3GFzLfAGS+cfNNcC9QDsjFSP+aqh3fDaKsLYYIIUXdXWOQKVbo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755336766; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T93m/qBDDnHV3ndKiLSsbo6LGiGCBHHPOQ9wTTk4DHs=; 
	b=DC04lwQgdsvQi67rgSxznHA3hJeSQj2Vn4sF+M7mknA368ZE+sWzO65z/+0Ju4mf/Ppr2TYXDhl30iuhi3NciyhP3KV26N5Q2cAitPpbLF28HgiJxlx4YkNVx2J0GVy5mHZEBQS97evZ5iizG3IFwBjqd2dum3LqXErplzt1UTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755336766;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T93m/qBDDnHV3ndKiLSsbo6LGiGCBHHPOQ9wTTk4DHs=;
	b=cu++eg9n1Z7p9md9w6Hqnxk23dieTThLkzdyjxuBokoEuIYqdp/ezHSbfK+1hqO6
	oBfyAPzX3ddH45cGu8U090vE97Y8Etbx79Sjj7P2pO1yj2WxTvF/iSU5RaB1wnE9qiQ
	xPFKDojTlNQNYwmnC0/fK1aRrcTKLVhFuIy93c/f1xslO9VfoYLYlDsUxyd+dIvU7h+
	wiH4rMOGQISG1D+ELvvAa7Q/zGxYkaSLMATp4VAMSQRlEOGWZuBESxGWL25+JgoHrmy
	vjAzv3bsSSEMHPmsSEO603t/+CfCZRXedlXpNTNwJ2EtSCqdhF9UhXdtMlB9Nxi9ZaG
	Mxkbc4B6xw==
Received: by mx.zohomail.com with SMTPS id 1755336765084748.2338970354662;
	Sat, 16 Aug 2025 02:32:45 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/3] riscv: dts: thead: th1520: add initial thermal zones
Date: Sat, 16 Aug 2025 17:32:08 +0800
Message-ID: <20250816093209.2600355-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816093209.2600355-1-uwu@icenowy.me>
References: <20250816093209.2600355-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_023252_561671_2A5BF454 
X-CRM114-Status: UNSURE (   7.84  )
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

As the PVT sensors's "T" means thermal, add thermal zones for the
thermal sensors.

Because of the current lack of DVFS, only a critical trip point is added
now.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index e9c81bdabed8a..a48eca5def606 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -701,4 +701,29 @@ gpio4: gpio-controller@0 {
 			};
 		};
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <15000>;
+
+			thermal-sensors = <&pvt 0>;
+
+			trips {
+				cpu_crit: crit-trip {
+					/* milliCelsius */
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrc-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <15000>;
+
+			thermal-sensors = <&pvt 1>;
+		};
+	};
 };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
