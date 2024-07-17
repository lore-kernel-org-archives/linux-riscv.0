Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FBEC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLqp9AmHaonddNZS1+6esOSCTv+UahrlDVR1CpfPqSY=; b=4qLSKTlIdLPmCc
	XPinfS0Hi04Ufw4rBjsU1+5E7D9eg5hhEBFGGQUVg6d1padFBurdqWfFFhoLuEJ7C7IlFZthOlF+5
	xRb36UOAPM2c/7Ag9bxkubGRHNxEvJPLUuOHdDJE4D6/py6J6HpgQlM+iXqsA7QDXcfoNKvzVa7ak
	pvEPG67OX5yce+SA782k8uH+rrB3ZV+1Ma9bG6T+Lu+YzfDzF+Q02KO27zhCa+2crqFFX6MyL0Gxq
	rDlv7AFccwU6P9J49zbmpw2jb5zJQLvo1HhXPEwTMgIS4G4V2rBbvofqt+AWWOPKgRbdo52eV/D5x
	cOD5aw+2VT8hP8umZzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxlM-0000000ClPt-2SzT;
	Wed, 17 Jul 2024 06:03:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxlJ-0000000ClOw-33Pr
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:03:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so45172125e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721196216; x=1721801016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArkPBFGt6K1MFhrYQ24ruK4j4xzpePBZL9fawM1R2H4=;
        b=FkkVb847PuHpiAvfT1Fd+sFk3OtShacssK1iY5FJ4NqU7h+D3x55j1sjG98JWwhwBS
         6fciLWPlMkVID1185sNF4KhrDWbUaXB4Ly4OMPg606BKGKoe9mPpViHgqJnrgW1Xu5tP
         ElIehNLsmtfDlDc6sgnsmEWMCe4KHvUKRyH0eFgAQA+bQDv1dbcSFuLXkQy03oJY+EEZ
         1aCSKXpeBkY0t7oD3N+jlK/J3pI6apNeJoFWsnWcBG29cQmec0sM+jfmNeVUmq1b9jVy
         Vg2mUHHKoWGZTf8RacNFSPP5XcuOQ2KfqUd5SDRJ4/Bz7vXKsWwtx6ogQjpQdnN71MYI
         IotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196216; x=1721801016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArkPBFGt6K1MFhrYQ24ruK4j4xzpePBZL9fawM1R2H4=;
        b=Xxabhjr0eJPCJ00+neUricqyaSFAEhHrWBkdvNMH+++2VjWBF/IAxXGzoZ2qJ2FJpE
         y0cHQv8/oS4Io2DOfLcIp8MMl3JiF3cEhxqDxHPjCJXEkjxOa2oGS9pPQUeeCpTvqhnA
         eA3SR/kLbrwTFPZPSokOM/0GivY2tUIeGoZ5CXa6e7cI9xxqU0kXgHWRhF8ZZLmBlH0P
         j+lDEJzPjMSm2llofvJslnWm0zOjYIryRiVaw0w/UD8uvUKMOkJKvBbnxHmawNoz7tvo
         y+0niC+09WwXuGSBv8d5wj0wfEhTdX6Kcs8l7iR+kOOuD0kz5fxmNKv0mutAoMWz+/EW
         lzPw==
X-Forwarded-Encrypted: i=1; AJvYcCVczXqttbNTUoMr2yOU4i9/qk2CKA4qebHQd/AhF4DWmj++uwqLed0mwNsjkMOdXIKj5YrcTGaJdl2kLR7btSMLd3NQXrK2vq04YGKRcTrd
X-Gm-Message-State: AOJu0YylFgHGpxWPeNSWAGmT8q2he6o3bU/TL5ZZ7bk1mm4SMSYg+Y+e
	azJ6boRuUGdSWRWcGeWjE/Ah9/N08SLQL+6cwqtRKZM7wN/k7hBM7OOFsnP9DFI=
X-Google-Smtp-Source: AGHT+IEGysgZPMM4acl6H0WMyDhumNTRPZzYYEvhuxVrBFVR//wZJdXVjhzyWhOID+qrmJtwitm53g==
X-Received: by 2002:a05:600c:4e94:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-427c2ce4a57mr4782015e9.17.1721196215982;
        Tue, 16 Jul 2024 23:03:35 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e8387fsm154887365e9.20.2024.07.16.23.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:03:35 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/4] dt-bindings: riscv: Add Svvptc ISA extension description
Date: Wed, 17 Jul 2024 08:01:23 +0200
Message-Id: <20240717060125.139416-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717060125.139416-1-alexghiti@rivosinc.com>
References: <20240717060125.139416-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_230337_787884_8459543D 
X-CRM114-Status: UNSURE (   7.64  )
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

Add description for the Svvptc ISA extension which was ratified recently.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..b52375bea512 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svvptc
+          description:
+            The standard Svvptc supervisor-level extension for
+            address-translation cache behaviour with respect to invalid entries
+            as ratified at commit 4a69197e5617 ("Update to ratified state") of
+            riscv-svvptc.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
