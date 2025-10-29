Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B47CCF9F2
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9blIDueF4+cNUMZm+AbqeHcJMtqdlHBZlKo4Xp86B+A=; b=Ske7QD9WahlO27
	8yw7+jw6WTZyRsq32pZxNWfsWqLOwyVFxDNiaiTxgA3sg4GmwUnkyjDVBDYZEVuCjIvUxkbSAbmFt
	K7y39gZGYuaqWrg7T2/vIDaf6fFenaAgsuJijo4+6moFMsrXS9UKkwfXkIWYx833VhcJgrBLoBTf8
	W10ZUVQ4EiWnl6FEqTU1rUA+Iw8beK4Uw5C44DiaL/inxV6ikjFcifcFMcDit7YFjFpjhoXQ8vC4m
	07pP9fa5HeQgmyZ0S5ndZHS1Cvrhi+EJLdggYERpryIqO+sxOPAmvrDwusYsKE1BDECHJi7QeYnNo
	dP033ewIDOeSIgv7qYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtmz-0000000GqIt-2R7x;
	Wed, 29 Oct 2025 00:11:45 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtmx-0000000GqHm-3Y69
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:45 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-87dfba1b278so69724646d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696703; x=1762301503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xT2Rb2PqwexlMD3Y7gKJkUff1N1w8n3j13bjOXJoVA=;
        b=ZeMZhdJXfABaSPkYhyaoMl4l9qjDRPPQsDt/c05QpFsqi1p8cGzskBKyVGCk/VYLjK
         I53J3vPBGhair4U25gq2i9wMgIi06iCUpPKILcLRgEX7Dc4DE36xPoyZb0AzAw1s8xey
         XXBfPz/w29Zpa6gu2eZGoe8+YdQa/QHqYpgBb7LpQXV3UXUaUwG5LYTZ7xF7xWoDwXhA
         6y9VHj0tmhDrv6teAKSOLOtYgjKvfM8fIFvwr1059CZ3/AjWYwPpflH2Mfm5VHgHSz5h
         nBaM9tib6+l9BjNIErIcnyxu2IksxbEvsBilMuNuzDpvnD9oN1uiT+kLTh7XH+yOv+rx
         wSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696703; x=1762301503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xT2Rb2PqwexlMD3Y7gKJkUff1N1w8n3j13bjOXJoVA=;
        b=mMxqpHMQZhun5yjTmKAkzG+jyTnamVgEopeVkFdpjNNkxmh68QWonfm1CgC9OB+PBq
         JJk1hnFdzMnJRdQLfs33BkUWAHzpPomjac06BIWgWNHMXSWmsOGvz+tJztcWvO4Qwz1D
         RmKJKkHOaMv+a+WxOkQSEbHCvAsWV4ltjx2EoeLveqsSUYb/UA3tn/GPM+frgzm0FxG8
         zZyVsjTBfCul0CrIpwb+FiDn4RX0OLT1NXySNvSyF0g2vV7MSBjaBs53eeQBxZZMvdPO
         vYJe6sUep/tKzGxCcRxNnO+hVZRyaSX9TQJTtbLQLeTXIcGUku3/Ik/hDFALNBFiUqyZ
         vrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtrUFAdB3POYGHR1aVZkfvKesMirhgUgdtH9KEaKnllSG9aJvxeU3XDvcyk55n3hhdgkyxA0x4XSPzoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj5fxXPR+m4yEOiKFfROhqamCydEw3oCd5SOOjU4trBARc9lF6
	DyjlI1Ewanuu+QSOniPwmKCwBGj7kswgCzdXXCbfdCjiJ+kM4y1iSVNa
X-Gm-Gg: ASbGncuMpIXFyXP27jqxfHx+62mQDpee2u7cbJhHqpBMYgwBxaiJmNS7GRR5yQ9GpDz
	OWyrJPlGW28oiN8AhbqmqgN1tYguMjEnND8doYb6qiPE2LElHmOohWM1ZEUarTD8alCgpJStn0P
	ZMlIsra2F5kcCRExpWysqMJrdP5GVNXfktmEgDOItjp7RM5cNBUGwe4O4nQG2nELeNwf8tRq0yf
	YXGq+43tfEygpNY1FokuccQHqnvTR61NYji3O2mW+e7yqp2tQELY2iNXYYt5Ll17Qu8maNS5acM
	7bXjHWWMrBps9t7kE8FlxPtMr1NqVtXxwKHD8l/00CIKzbaWyPGR6OraJURJ6v+qbXPMRXDoSX8
	oe01Qd3YCSh38N6zK9zw35aj5fRA5kn/itrADF5qr+T3vPR06LaiQO40/MzqiX5ZE3ZZbOgvXsA
	+hYDyWUs2rjsyoF7LMe9zFqcJ5/5wah+3IQg==
X-Google-Smtp-Source: AGHT+IE4SQO4yCAzGuZzWxWUxkwVcez+Sp+Ibm3DoBI0g5gxVw79H8XGehLNVKd2c7qV1ykgdkqPSQ==
X-Received: by 2002:a05:6214:c85:b0:7d6:c615:ecd1 with SMTP id 6a1803df08f44-88009c12eaemr14080336d6.61.1761696702575;
        Tue, 28 Oct 2025 17:11:42 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:42 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Tue, 28 Oct 2025 20:10:48 -0400
Message-ID: <20251029001052.36774-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171143_889524_79A58054 
X-CRM114-Status: UNSURE (   8.08  )
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

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC [2].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
