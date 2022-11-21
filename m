Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A283C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 04:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtCuUtsykUb4ZVx0EnmKxikG85epNi6ire6xkJnsJMs=; b=WS/AwfsFr8qWQe
	xtcm+sP5l+K1Qb0uN3BQanBLiEwWd/hJiBlIUnLbBNu67KFx2gZWNb9mn6bJKzyZmeTzMW3SELxqw
	J51cUS+HWBGP2NM8wVNrK7mnDsAuXbMbW9n9/N5XxmdQKLGf/zOSNjjQJRMHaKSjZmFfgkyFfCN02
	v+tGxh81gAQiMBGgT0cl4aumICC+7vQYOe+lQSvAegPPWyXb1D6ZVAafWMBASc8Vj3cuLqKSdaU+D
	fdOKaAVozA9CY+tGAWVISM9mMcYoB+flnvgGOxrgTVejV+5R0MKOdEHtWY7QaOMdEHwLYJQEZz1W/
	Acfo42nvrup92pkiokXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGg-009IMg-5I; Mon, 21 Nov 2022 04:18:50 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGd-009IKX-1W
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 04:18:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669004323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fyshxFY9Mc/+iJ1znLlt674Lkas5pFte2C+XYQTgLN7twzB6oiciAGD71SWwdKJYSWu9U14IBwlUNSCSiEQh3l7TUKYWlrhN/nNXMLG+Mt+xd65yPGBlPRn9+5GsKbAfdhrvrwNXnAJ94K6lG3MRI01cKHD6VwrwhSqOmja/7TQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669004323; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3mufr77oeRQMIDQ9BLCeK57+i5lF/oGGUHybbQbCGv0=; 
	b=SVO8XJ6yGlRfdKEtCycXw6K1MAX46QfAe8vf4WVf0/6apAEPkDzPKJ5PX8fVP714NYbxijEqQVOPq0l30Qzxwoer8d4M7Pgtzw6G+efKQY+mBWvk2JOSpAIImm/Aj24lOAi3NU9ZX3HKzD19kE47UJiQMAEU7npXXrTMwrdUGak=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669004323;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3mufr77oeRQMIDQ9BLCeK57+i5lF/oGGUHybbQbCGv0=;
	b=bgWiYmXimeGexCxx/i1ZdvkWwgnY8ctOaoF23X/GecU0aP0ozpndtbVvorG9XYuG
	jKJc4b90Y4mNnMsDYcjOYJp9RsKWkQ7RgvGnEJz2VHKIExV1WhLnh0DVOieKdrM8oPP
	yYVyQLcerP1Ib9tbj82kd2UHkIJQzgnsqraBpu94=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1669004322259164.1933466310711; Sun, 20 Nov 2022 20:18:42 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 3/3] dt-bindings: interrupt-controller: sifive,plic: add OpenC906 compatible
Date: Mon, 21 Nov 2022 12:17:57 +0800
Message-Id: <20221121041757.418645-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221121041757.418645-1-uwu@icenowy.me>
References: <20221121041757.418645-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_201847_153618_FAE583CF 
X-CRM114-Status: UNSURE (   8.17  )
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

T-Head OpenC906 is a open-source-licensed fixed-configuration of C906,
which is now public and able to be integrated.

Add a compatible for the PLIC shipped as part of OpenC906, which should
just be ordinary C9xx PLIC.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 99e01f4d0a69..4d14c5f5c611 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - thead,openc906-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
