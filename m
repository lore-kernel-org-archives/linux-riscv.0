Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D351C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1184661BFE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1184661BFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bppwJfk/ohpTL6mFQMTQFhoaIr7Xlo7772mvG5yb6Yg=; b=GLvjbMHFFHAqA9
	46IICKppQ0ekMfE17TO+5JVZV/p35bDgglBJJeiEFTig+itGvf9m62hrGNubQ45QMIcvMBHlLuRMH
	TOLV/9rrTIbBDDH2Zf6BuswttYrvlyw5nFUbrDPxWAGgYMAWkr8JhyNGr5XlTwE6lKrVXLsB+HRFL
	tfpY3D87KUAkuwMeOfsTtm71vtmSVlWuQE1gS5DYxG4B+jqM7+84tlv6GfqmAcy9bs7yYOYJF5Bfe
	GqHzP9ThTQkwEyK14yFdHRhgzwKnRZsingMMOKAdE5tzk2/V5nUoYeMC0Kil7XfdS2m62oasS8dG7
	s5DjbIvqeGIGQ3xkD2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Km-002zz8-KE; Tue, 16 Nov 2021 23:57:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Kh-002zvx-Rs
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id o14so577311plg.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vrbIOXmEg+gIS4wEDNBUS5d/guo/eziPZaC2mTYxZXc=;
 b=JWrZ4w7QNwVa8l2FZpPgy01wj1EYBBbDAwBRw1ZHUVQSJEAUVhd7Laz4aO1UhUJSOY
 /v2g56IJj/ybdHGNuNeh616KSX7ScKdPk4+NhebzZvlDJB+mJAOVEMk1zUV8HYhF4ozc
 2/LRBX6ZsthvqkmxwIuq0MWF9cXfyrzfohk66dvudtDYrvI9kh1Y8GGmuP402bAbFWoD
 l8if6KJYJ0nNIehrLc7UNbmoQgwDw1WUHLq+vFieDMACwjVK8A/1DXaz017T654YuSpl
 hnOffQobD248JAzLfLbRxZ3q7+ZM8aqfmF+ttkvPt1WwLqH4qTnQiUi9u7D8NEPQlUUm
 OIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vrbIOXmEg+gIS4wEDNBUS5d/guo/eziPZaC2mTYxZXc=;
 b=AesVBLSVaW969hl9X8KemlTv6xFsb2/x/xgHhv6YFWY1x/O94niP8k0wbukfIpp2Uf
 cHp5rnasQgJZ/nW+Yj8PWxY3S7ct2Etrw5zYa1Ywsm14+XojwZWwDLbggkLNBSDexbcA
 E0Rt3VF+9LzBIEUZoOy5Xts4as3Fm6gb89DjlNSVbHOAFsJmTXXhYG2jVquFDqLZswQ1
 BHb+leIsFGR4UdtvL48o4DZJVIrCkUzb8xkWy37wLjQe8Vxn1ZhzrC6R4v2VwbstaLyZ
 cvPNUv2hgNsaT/KUn8kNRAN4oTLX1RRbGzfi5PDRWBc7H0Vg/I0dhmAwkIn0FuyZopnw
 ZBAA==
X-Gm-Message-State: AOAM530+U2GzZWQvEtX2mTlHxLoT+RDq7hyTlXDePZx1jGhayZhm6mgc
 qFT+QD7U5dbpyOnHpMW5p/c=
X-Google-Smtp-Source: ABdhPJzmUhE6Hy6mniZz6KoEJb3wtxhjDBL/clLr9G1wQO8UmiPC+vpReQmMadnklyyhjTJymuFmeQ==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr3873436pjb.47.1637107067201; 
 Tue, 16 Nov 2021 15:57:47 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id o9sm10314408pfh.37.2021.11.16.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:46 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id A11D9900949;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 1/6] riscv: dts: sifive unmatched: Name gpio lines
Date: Tue, 16 Nov 2021 23:57:37 +0000
Message-Id: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155747_938290_A010DD6F 
X-CRM114-Status: UNSURE (   8.86  )
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

Follow the pin descriptions given in the version 3 of the board schematics.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

--
Changes since v1:
- Remove trailing "." on subject line.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 4f66919215f6..305a086e5207 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -245,4 +245,8 @@ &pwm1 {
 
 &gpio {
 	status = "okay";
+	gpio-line-names = "J29.1", "PMICNTB", "PMICSHDN", "J8.1", "J8.3",
+		"PCIe_PWREN", "THERM", "UBRDG_RSTN", "PCIe_PERSTN",
+		"ULPI_RSTN", "J8.2", "UHUB_RSTN", "GEMGXL_RST", "J8.4",
+		"EN_VDD_SD", "SD_CD";
 };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
