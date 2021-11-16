Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F74CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8A16320D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED8A16320D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqOeV5sLpKRd/IVeimASpI/hDNxlx5d7+pwc6vkBaws=; b=NWAgdgHBWejGSJ
	NgKWEE0G1S7U530aDoY6vhSwm92sRwQ0I7WCycRf3iaoRPcjbehAAM5DtLj96U65SOlcGn7a2DmQj
	XuYvKdcVn45bTBLB2ZhwAcVKjSBdbM5eD1WQ+JKG+9M4pz3WVBicyaecnvGfj4Q5vT69a7zrvDZ1m
	ZQn1VsXp4mb5iP/B5UEjSLPqai0T54PjEkQz2wtVPiwv8GPzqv/tIiY3d91iTxzh3BY1QgDL0EHSg
	vCAI0KSWjnPqJNH+Co+5PiD70bgN/PVBUwm6woeAZbVgV4KIbTPJPrZkh1O1aTaJweTqtFcrAYPuf
	1dnUaUC2hK3cGZM9Macg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Kq-00300x-Gv; Tue, 16 Nov 2021 23:57:56 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Ki-002zw1-6L
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:50 +0000
Received: by mail-pg1-x536.google.com with SMTP id 28so569999pgq.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lKn8U3vTkXK9ZBlzMtXDj+YHFGEgluUXaeDmujmDJDU=;
 b=MYBFr2IrCPsxtOescR/u9V3YhA8hvrw9TEvKwsfslqq26VneO16fyXkQ7r768npAbc
 gXRFft8rJ3RsXRpQn13tG40SKUJN+ZC/1JTp7ue4elz23wfeRFnj362LccsFIQ1J7Vam
 cTO80DFxGb22J5ciIRt7W7a1eqWaUePV6bUwX3kBy9pF8Ej1wff4hlNqCYcT5yt1GY24
 wfkJWbjeUrTbmREkEOm3qYwFPV7wJJxrAzErEBx8YUwLW4O/esKNlzDcQ1EMWi4iy7nO
 j/KjduD/0D0W5em1Les0P157nYMPT5LINhKkhgok3T2H5gP4gzprtM3FHp87LD/Gl9gf
 KOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKn8U3vTkXK9ZBlzMtXDj+YHFGEgluUXaeDmujmDJDU=;
 b=ED5SJ37V779A8WKY7lr6o11Zy3PjuqSZsRXKDX74IcjPcpq32balba2awAZzZva6ds
 RcTcwAnA6BaRKfYyFZE6HvgxknPV+rvbMmAh7U8FNStuw1nHymwTQ4+mDEhXu/KyjXVq
 5pKY8gk1WsoiuCnb7gruVl2c2lFrKcglykfhvZO+9PllVZE+bpeTdE5nMZpjuoTnSlP3
 m4vXDOMlAftbCGSYf+H3F/lZ4WBUcLGZ69hv95UTmg+kDQNMXK43rX0EyKs43DBuprYh
 WMHJLHOgr2Q40rYus//tTytzvrGTMqFCUL0aoLezvM/aLRCGXn/dPFbLfri1LmoBt3WB
 jMVA==
X-Gm-Message-State: AOAM532+mkibWfzXpRcHZoQRYOOGhg+dnfGa7LwCGO4xNfnE5k1vQX9G
 7sv0PX8T/4MsKgrT+hlXMPnBgKgOkYw4R/FK
X-Google-Smtp-Source: ABdhPJzjR/I+yZIEQg5XCsv58hcLYy2yU8CB0QdQdk/mWraFZCmiLWi/R/xzqlIXqFS3+BRz//FSqA==
X-Received: by 2002:a62:1d09:0:b0:4a2:82d7:17a5 with SMTP id
 d9-20020a621d09000000b004a282d717a5mr32135027pfd.64.1637107067442; 
 Tue, 16 Nov 2021 15:57:47 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id b10sm21210389pfl.200.2021.11.16.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:46 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id AF508900956;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 2/6] riscv: dts: sifive unmatched: Expose the board ID
 eeprom
Date: Tue, 16 Nov 2021 23:57:38 +0000
Message-Id: <be05f8604f72634fc21286623266a85fc12eae70.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155748_262859_57184DE7 
X-CRM114-Status: GOOD (  10.24  )
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

Mark it as read-only as it is factory-programmed with identifying
information, and no executable nor configuration:
- eth MAC address
- board model (PCB version, BoM version)
- board serial number
Accidental modification would cause misidentification which could brick
the board, so marking read-only seem like both a safe and non-constraining
choice.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

--
Changes since v1:
- Remove trailing "." on subject line.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 305a086e5207..cf8937708829 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -58,6 +58,16 @@ temperature-sensor@4c {
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	eeprom@54 {
+		compatible = "microchip,24c02", "atmel,24c02";
+		reg = <0x54>;
+		vcc-supply = <&vdd_bpro>;
+		label = "board-id";
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+	};
+
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
