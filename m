Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05D8C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA6B60FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DA6B60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDGXAqleuEFY55pVghJfF+WfZppsPz4hrNOZcUq02NY=; b=eemJ3KXL5lpu/E
	GG4skpN1W8PEV8qoulDHPs3CKDEqj+qXC5D5jT7kd9KLVo6Nn3Ki8h9s8uQMUNBgs/1kEl2b24MFc
	jrZT5ESzqg8GYhd0nPtwzwEUVnkLa/wNX9Nl23lD9tLXnjA+mLIBctiKfZ/WO3xONVNkm1RLnOC4i
	QcLfjhKbVIPfxiTbNGmPFf0QYh77aT8nVQcS0xsdnyVDESs1n1YzknUPMVSb6j4alQCHwD/Lnlflq
	5ESKVG0N5JovhEx/gV9+gA3bz52SiZTCcnn701EjTX9J3t32Fq5eRUuCjOKaYakL7HOwl5ATiAclJ
	vEMKCGVwS4dTyB7qX03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq65-002gZb-D6; Mon, 27 Sep 2021 12:51:05 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUn-Gc
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:01 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 40FCE4079D
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747056;
 bh=HyJUjHjlK3mirIZ1mWbxEOM/yJgRijm4GthGtGsI3+o=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=sTaluSXJlk/YFnoSrKgHjFenPfTHMyatRl1VIaMgceJas6GzTFkJAty97NuE03G7b
 q6wkrHkUATYOs/awOSEWY/Q5rXuCY7exEplpcYBhtesvKgiUES25XJYtgiN5385f7F
 +8a10ACBxqR4vIhPJW/LCZHF1CMqPNo9a4Nfv4coPBGCTSkPUuan0w5PsltEP9uOBN
 /FQYkwzl7wEciAHfRd16PiPSw06CwLhKopZj7RbdnreF7MEdXqY3NwReEU/SiXGvbb
 4RLRCaZa4Lb4eAgVIE82jgkYLIBMb/9Fj0+FRKjnWID5zoc4fA2w/h2KWlwa3AciUu
 gj7loYYpE3ZGw==
Received: by mail-lf1-f72.google.com with SMTP id
 x4-20020a056512078400b003fc8e963f1dso12300716lfr.5
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HyJUjHjlK3mirIZ1mWbxEOM/yJgRijm4GthGtGsI3+o=;
 b=QlM0WZpaXL+v4WIvnaWQmEnoRoOMceCzfqBjlzW0pRc4UvhytxRwXeMqF8aXgJ3KHp
 jV1OwTG02nkCZfMHxejmns6Qg6TuTpBMjic5C4tq0sqJ3hb2mnt+6CHk21Y9sgGq0XQH
 r4jRXNoLJgjpdIxcjsYJPtf5458Op8tACS6g3qycvDrTMdcImqhg2V9xSh/a1iLVoaNk
 YE4Wv+FMO9duxUMnqL7qxHpLDZcPCb8wHf7rkFpYaXa3xi+LYBzgHWkXtk2gV08/WqUh
 GSNaZo3XZZDAJjH419oeaUp15fhpGEoamu0wAgoIpDdwMoCMVKGxzQ/DxwE+8YUkriGE
 /iPQ==
X-Gm-Message-State: AOAM533/U20Tqe9u42HGGZvnwNsWvyXSu0Czgerqo4cE6Xq9MQ6PuoRv
 KTcWloPtOTLtxMQFpRtkuoa7DPzyp4lAed49TvGull8l7I9zjHKUw6CVYU/L4Ah/M0d5GArpUVX
 10iVHcCs/g8u/AOtmAvRMhI6jOpCA0UxEwUuKXKwyFvOLyQ==
X-Received: by 2002:a05:6512:150b:: with SMTP id
 bq11mr24378584lfb.495.1632747055583; 
 Mon, 27 Sep 2021 05:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxub5gxPd0btgj0850I+iTNBnTY40Um3nPH4TVM4BxueRLq1HcvaTKOdlAvhZ1R1kGJjV++gQ==
X-Received: by 2002:a05:6512:150b:: with SMTP id
 bq11mr24378555lfb.495.1632747055433; 
 Mon, 27 Sep 2021 05:50:55 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 6/6] riscv: dts: microchip: use vendor compatible for
 Cadence SD4HC
Date: Mon, 27 Sep 2021 14:50:44 +0200
Message-Id: <20210927125044.20046-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_802716_85FA2562 
X-CRM114-Status: GOOD (  13.26  )
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

Licensed IP blocks should have their own vendor compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

---

Changes since v3:
1. Add tags.

Changes since v1:
1. New patch.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 63984e53c0b3..c9f6d205d2ba 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -264,7 +264,7 @@ serial3: serial@20104000 {
 
 		/* Common node entry for emmc/sd */
 		mmc: mmc@20008000 {
-			compatible = "cdns,sd4hc";
+			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88 89>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
