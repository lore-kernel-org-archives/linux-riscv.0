Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58754C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUZlcF3Di2txBVd4MYIpnuhegG041sOloLINZCngWrc=; b=dJ3s2bnzBwcIbf
	8Y49mx7sXRaivN+6JGK0nrCm1fk11SIv0c4XJhJc+v9r3sKEFs9kWzaGJQh5zIcDRB8OvY+z9GPzP
	mr26O0WN9/7Opc6HLr5Fy6ygqbefzWAmG5m2ndaLFicRRRotsz3nLuNbQJhxD4lRinYBfNfr4ErRU
	VNzUadeUYgyAF0ne7QxCAf10fusdwKhweoobB3OzDXA2KzTelN//jX/dty2pMKRo/BdTMisTSGgG4
	V4EDQ9B9yc8ZzDQH/s/J9DIJ0xde5V8rAj00zPteNot0x7hWijhifn8eTU2bJayl8WpDK75bR+z7N
	snYwolZMDEbhhiMIUdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjGB-00000008t35-0ZcV;
	Wed, 18 Jun 2025 03:14:47 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjEM-00000008sqU-3eHK
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:12:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3141f9ce4d1so2267105a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216374; x=1750821174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=bR37xfXYjk9dSVqKU4vtu+CDty3YHzNbv4BBwETb3zfwke0i8mkc/wAB1Z5K+VIaic
         3WHROUj4ri+9DNS+W7zHLFvHlC4y75c8oFWks0H8F9AAqkVkUL/6OT9i7hep3qDGK7wQ
         GEoRBDf+xEvUx2nDoKgDpde4ndJ6ALStiUyKf5PSn8IGt7z2N30wnmqkyALJa2aMrECd
         dYoIlK14xx7EsFeZcRgMoFXUriICylOA21iPNektFxlUkTOvUL7uZnroRQN7ECfIVhGx
         5LzvLz15+EheM+oyNCOkQ7sN8lwyrfk91H6Xy1ZBBjYJQw53zVl14G12R0RX3ChgOOE1
         FfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216374; x=1750821174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=KPGf/cBmlTr985klWm58n4fmLyxIlGOS4jACPJdpeV9MsaqPV7OBLjexweu4e6DJA5
         3ofBJvDphg90Dwb9FekwtL4OrlGHd2TRbqr8WXq0pw/TGVXsP3GSzD4QhzmwuBc80ai1
         Oy07Uwxs589nIj+d7dRS7bLVcqJHQXytr0Inr4EFrNjpxQr5AJoQV7armc6FRBkwUy03
         HXL5FsJ6EfjlVTTTpU31WdYQVPxE3Fi0XnZfKDYWWwFHwx2/m1ndDa7X5qP9avVPRm9j
         Lwj3AnLBTqRg9gF6NI9b1Jz5bqTAKD/9oMBNrvaKwEArdKilIth9X7S9PCSgjxYg/tyE
         WBVg==
X-Forwarded-Encrypted: i=1; AJvYcCUC9pk9anqkZ1u+hNcvVs68SdDezO1RmW4TSdeWa0Lv+QaR0bKNWBsmBqXn6YGUQRB9psIOUCY/1n1JCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweIhCWjARGTJE4XevUsDIeV+VMdgAo1ADBYzBllk+kO2sUULP0
	4IHgGOWnwVAAcydwPnZWC2MNQ70Jy4rYl0CjsM5oC1CSAVtsFO0c07Nw
X-Gm-Gg: ASbGnctHSYQSLSC3vCM6EMqOpC/mdX8Jm/KOoYLBy8561Yy0+Igq4GwxmeM7SfQAt0p
	knmgBk4cK7VkA9XPxelT8dZkewHwQLPY4WC/8Ybhmye3CBnNmcxw5tnie8x3kiXx7tLMEHQGHa7
	Y2zt7Ru2tMfIW1JmbfjPf0imXiNjXAwIPyugXr9ZhfHlI0fecgS0Hw3Dz3j+Ii5nJroEIktpcpl
	s/x46FTHOw87iqCZKBVuTUzfVtb1EHPdMZm4VSPGVaPDqHk7uwdSq3uNiG+wjiYCN2/Jxcuiwn6
	a86A0VAV8ePY0mgt3NagNvl2konHgUbFSLeIzYwb4JUVOUBNZiXyoLSHW4e7EQ==
X-Google-Smtp-Source: AGHT+IHRI7h23bZzE8G1/NzKXA2jFwp08Y53wfU3eAL9uKH1xrpt17pvruqfqTfEBZAik8++WIVP2A==
X-Received: by 2002:a17:90b:3a05:b0:313:62ee:45a with SMTP id 98e67ed59e1d1-313f1cd69femr22420814a91.13.1750216374059;
        Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf54sm89057425ad.46.2025.06.17.20.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: usb: dwc2: rename sophgo usb compatible string
Date: Wed, 18 Jun 2025 11:11:29 +0800
Message-ID: <20250618031132.373216-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_201254_907495_AE663546 
X-CRM114-Status: GOOD (  11.17  )
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

The support for Sophgo CV1800 series SoC introduces a wildcard compatible
string "sophgo,cv1800-usb", rename it to sophgo,cv1800b-usb to match a
real world SoC. As the compatible string is not used in any board dts.
It is safe to rename it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index e83d30a91b88..6c3a10991b8b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -59,7 +59,7 @@ properties:
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
-      - const: sophgo,cv1800-usb
+      - const: sophgo,cv1800b-usb
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg
       - const: st,stm32f7-hsotg
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
