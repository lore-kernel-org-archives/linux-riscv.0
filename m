Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D71D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVQDcDWDpP/52KmUT2BAitCmunW4qQT4wGN3Gu7g6tE=; b=gupee8SOubBPXW
	EWoaM/gWx/ZTehbuiPTZS3rW/6QScuDpZBUEE2XxhQUFxYvsxm/+HbS3YgkYzrKdJxs2ebj4q7/6c
	iHTzVg/XjRGoVfrXzQUxMm1SXXkmH4vucvDryLbGq58GavLWEiRcUlKeBMwdwgKKRvMn2yJyteMeh
	d+gUwsCa6Dy9oXcHPSXQ++zQhmsHgea6cd+haTSTntbj6f0bQ3o9nvXE25hTWeadcOfsWrRC78TgM
	ffSZlaVbvIlcxoscCZ5CHelHwSaT/XIKbPDrc6dM5bV2angy7gD+mv9u/Q230pSk1A/np3+R0gYjp
	qoMnMPaRx8CFORrVVgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WKy-00000004xar-1Zuy;
	Sun, 20 Oct 2024 13:51:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WKv-00000004xaL-1anK
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 13:51:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20ce65c8e13so31328125ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729432272; x=1730037072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mSKaigzCZh6DD67qUNYuh/ETwBUWDczHGXUVVmnZHc=;
        b=RelgWrX6AVbpu5l2URN/4aHJpbRYJJ4IGtc05wMn4TASX+9JklUmJOIFKMxRn7MJgj
         LjvcRKqzcFMdM/E4IQoFubL9lkL/5NPuqdcoRQ4sDtohcPdwJXzkoSvKjZKoJSlNnqkk
         v13yGVAET18oQ0pYXTzOvFPTVfrww+ZpVdGJ0GL+qrgrbkRY20gtzPH8/33u7t3Ueaye
         hNHkfA5PJ6ympM99z+8EpPS4Fiyx38Q2VP5dXaVRldbn5PfHysFYkIWDO2gxP9j/sy/L
         3+ikX3QPmJo7Eg1e5lbjoHbihjSi9cnmoRS58gHUR/4Erja0ZFTshzYsWx5Rq3wh+iAX
         0ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729432272; x=1730037072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mSKaigzCZh6DD67qUNYuh/ETwBUWDczHGXUVVmnZHc=;
        b=r06f0U2bd3z8InVV5xAA0UDvnT3Gz/+l/61tPtcQCnbhwNpw7rvhdh9ufLuuC/wTFj
         7mp1px5hXunntR7DK5IINPHkrOnneBgrxwJWqYJh3djht1+o+xabxyaKdyNWjAxLRCG3
         cVOF9FhO+dXh/o6IQkwed5j0nVwbfXhr/bwaMnVkj7heo+vKDGhquYay2m92EaI/EdzR
         seI+c7NHOu8ifImNhjKLJXIDDrU1U97Nbhzl9ZZWqar3frwdQS5YtyUezoxvu+DtS31y
         cvIym/KlR6A1d9WskZMBYi7bJziylucVFIjDMU/KH97kpVZ9XUnUAY9pyV7ws4Ao3Rdm
         eVHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmP2Chq+Jz2whQw4Ljy0jNaGHQJS90G35omC5ZYrX135a2Ys1fOziph5Op0Tl9WGi7CHU+duomttYpmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWAd2CVmCNhCyR96PwP3s7ZLHcjoB3dz1+Mo7JET+UVuN+vRR
	MAtc/ycVdUJ6ue8RwK91qendx65komxFMiwFnJ0NJ04vfLGJyyONbE8avy4dUM8=
X-Google-Smtp-Source: AGHT+IHwDpd5QJfP6/APfYz9jCZn27fX4Z5ntBmC4Na1PFB7aUjCldslVEpY68xkxkDoxwfvRQa+2Q==
X-Received: by 2002:a17:902:e54c:b0:20b:7ed8:3978 with SMTP id d9443c01a7336-20e5a8fe8d5mr104601955ad.26.1729432272577;
        Sun, 20 Oct 2024 06:51:12 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee63f0sm10554935ad.3.2024.10.20.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:51:11 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: vendor: add deepcomputing
Date: Sun, 20 Oct 2024 21:49:57 +0800
Message-Id: <20241020134959.519462-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020134959.519462-1-guodong@riscstar.com>
References: <20241020134959.519462-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_065113_443295_CCABE3D8 
X-CRM114-Status: UNSURE (   8.90  )
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
v5: Removed extra "From:" line in the commit message
v4: Updated description
v3: Add Krzysztof's ack
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
