Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB06D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpLwMkJ0v3dhxS4bdHyHh31AWkkJTv/FlphP/9tL30s=; b=RQmcvvDEASirnl
	sCVMvB7j8tt2Vnmk2FbTj1Gcmiet4/0a/faUGyuwe3VhD7vHtUtlkvsZ5DWqlLod+k6N9RdZwJ313
	wrX3wjvqiHDi6YFwU5fHWDPWFtbs00sfuaiyaQKzSdtIo/cB3ujWjGPOdvqQQh09A5RcR+uXtJPMI
	6e0/Tv9OFZq3i9wPap8gRKiXD+o6RZ8HmokypKZb2ahuXpwDGUnn7SaGMMUkz7kENK9R6xv/lWYLq
	BKdnVyk2NWpDbZx9AW+CIxl2jMziS4tLXjIed5/OUBCo3RMMQC9P4nSIxrfwnFXc7gKn1BlPMmqSg
	uTBouLcgzCta0+6y/EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7J-0000000A5fh-1uAv;
	Mon, 28 Oct 2024 08:28:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L6m-0000000A5W3-2CCn
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 08:28:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e4e481692so3210189b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 01:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730104095; x=1730708895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqXCN/PxPQRRYnCXep+m11qCzkhu9vZNihUxCEwHTfg=;
        b=L+oTOJkotVmMvTSE4vVYLNTjPx245DfaWUtGmFi5Qcrcqu36J1ei/KJhQLApGARiTj
         MbHvv9CDgiu0syT4i2aZVwDvJB0m8Y7W7yyRC4VoSkE1WXVpf6duEZdAwCuybFRLqr7X
         dOuuVjSiM1T59K9fHQiPGFGweyo+s3mxtQasdIvI9ans7zuhRgalgD7Gx3UN8IEduJ/B
         RNDkoPnF/isCtCwFSlrQS2ytZoTbi1/pMdLJ1wA6KAaTgdsFNUcSmZGH3GKZahkUj+tH
         at6yQ9xfB2MblPOibVOfZlfxswkgHJiy3V8xWoiSv524k1Fdm/lxRfybBJs7jNknYChM
         JRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104095; x=1730708895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqXCN/PxPQRRYnCXep+m11qCzkhu9vZNihUxCEwHTfg=;
        b=e6Jn9qTuZMT2FqGtm8Rl4Ys/XB4LQyJr4H7wRvx3nc/NRLG8CKZZo8TA+KJK1g/3wW
         AxQCkJo6m3FKvbKQgROMf7HTIb14vp2oWYjyJOYotcf6W0uyMqcuTq9jymI/2DqjiRxX
         2XNeaxlvTzknA151s1EIIgIBfp94XWwx4ph1WZiL5vCmuKU32+f3O4Dp0SRRBhRhhcqF
         Keerp96XAgMEC7rANI17YhowHWpuUgIm/rnfudV5t6lDAAMu79LIoZ7KygNL8iHQ+/C2
         xyIXKNXWYCIV0zmClx4kluYfNEsGpwupu5iKacBglOQJQkglUHawmbR+14IZ1Uf9ODSV
         B7aA==
X-Forwarded-Encrypted: i=1; AJvYcCUUbR1IYmYsihbtU9xw9hUaYA3yVZL3QiAkQ0LsTBe74SL9T2a4h0gzd8iEuwRq4HknZmoqQ2cSp9JJyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5HUPlzXw0GomGwViciwYexM9zMRZfc6fC27Ij3qOFCXL/ufUf
	dYCzQkHaUU4eMXgau/jNF6lnmNKPLSmrYsEM4aesT0r7qyJv0qI5IEgYYbKQOwk=
X-Google-Smtp-Source: AGHT+IHZq0hWR04lWWSn4VEvShFoeXQ4WUdujwmai4DH9ODyeYFBL8qZVtGaYzDQnQwGj4MtLa5Yhw==
X-Received: by 2002:a05:6a00:84a:b0:71e:3eed:95c9 with SMTP id d2e1a72fcca58-7206306d443mr9996199b3a.22.1730104095411;
        Mon, 28 Oct 2024 01:28:15 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm5195419b3a.24.2024.10.28.01.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:28:15 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v7 3/5] dt-bindings: vendor: add deepcomputing
Date: Mon, 28 Oct 2024 16:25:51 +0800
Message-Id: <20241028082553.1989797-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012816_598458_BDE0C97C 
X-CRM114-Status: UNSURE (   9.05  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
[elder@riscstar.com: revised the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v7: No change
v6: No change
v5: Removed extra "From:" line in the commit message
v4: Updated description
v3: Add Krzysztof's Ack
v2: Add deepcomputing into Vendor Prefix Registery

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de7fe..f8bb3df65797 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -356,6 +356,8 @@ patternProperties:
     description: DataImage, Inc.
   "^davicom,.*":
     description: DAVICOM Semiconductor, Inc.
+  "^deepcomputing,.*":
+    description: DeepComputing (HK) Limited
   "^dell,.*":
     description: Dell Inc.
   "^delta,.*":
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
