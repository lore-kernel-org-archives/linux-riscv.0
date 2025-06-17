Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E451C71155
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sxrjZmeLo7vqGqV0BQVQ1OVkS3MrS1K291M5iZl5vI=; b=oK5b6rXvQSs2hC
	rlrn7lG1+0pYLZm3aL+9uD0vWTRxXZ5j2JWxoGFIvSMwdlmfd9PobybidxKd5ZLFm3dcfFS7GdGk9
	ZQzy4QVrUHwk0ecjerqvuCNhZ+tMZrzwMqmCNE5+m25MaHWLXgnYyJ29KUaabcE8n9vbcPZpaX4sR
	rHukWAcW9On1DPSPqgGJSGc4Gv4/efi6CZt8+lKHBvsFty7aSWzuadFbaJhVwaTSwY0ng7Ft5C6NL
	7LmXh1G1oHN5C31/WFb3Ov6cboret+A8DJm0QYpQ0X3gdd6zohh1bsDf64XXby7LSIlBzHzdiIbWT
	NzDAvAM7dB6xrq+sIrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQNh-00000006QD6-1OM2;
	Tue, 17 Jun 2025 07:05:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQLa-00000006PpY-1LEo
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:03:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4111877b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143785; x=1750748585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=DritKsJohnvwFbtNEfLNkTr2q7wGf22f8mt4SKHPwvP4WeDzpRY8AkEwKblk3UMNUL
         +/YnOw+N1iJ/zAR2IQhD64UabRCEP/EbBPcLwXIAcqwX+wgo8Jirip+iWte1j4iIdK3J
         haeDGWOLlv0m5NdwrlxcAEo+wYGyF3coxVgMg8caworcDkV1V/5v2U8AXOaPGqGKcHcE
         KFYaP8Yfp6Ra+Y8wchQiCqZ5f4WFJTxBWxevYW/5U27zefZbD9rMadlgVgpQxLrd8Doi
         YHf8IOFN1Iu6RB0vJCw5JU5Zj+Jo1L/AWmobfxdRZUIb+Q5X4TIEsFZDQNuEPFZjjd5v
         0m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143785; x=1750748585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=YBDAhIuYc8mCAvjkbKbj0GUslQJSGZebVrxBYYjkvv9Ti5TncgrbmGSX0wh1lBRhAl
         nDtuSNotsZislEx9gTtDyjmK0ZzfnUm/hTRShrxy7FjmXyztXNiEW6Q8bE2JXf1iLyB9
         k0GERTTZII+V7cpOzITFv0NtG+M/H/ySGP1CBV9buqhG4dwajGbIE6B+1D2FF5RPgFIZ
         ir2eAJodR7gSzili+KbGbm7YQ1v0h2Grj4TOP4NDU++1mLufBJZ0rLiMvTw7N8QVcwlz
         B7A6uSdJlXVkbU5gT1gosM9FvQE5G82xNtA+cJRit//tcsalDyf2PrJJ0dv/hMQ4rL0d
         dl8g==
X-Forwarded-Encrypted: i=1; AJvYcCUBTLLvH3ZQYAxlX3kuJ2EHF9paHEP6LgK+R/F3XEBYlRJPDN0oqf+5dPWkhGo22Lh+3ZuMEP+pVbKKOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEc2Y54OGtURaVBzENj6XGRxOghkH6O7/Zu275zayDA0wvVG3z
	ro6J+Cq4IxFP779SaFVYO6MhVYXQenZ6+ss1DWVfgBGE0+w0K3ZuEkLp
X-Gm-Gg: ASbGncuS5OlRr1TJpET3nT6HQKtWSKcftzvqPBmBTMzbCNci6mVnoGmmk//DvPblkpq
	sJS+PjcAotivvWi3SseJPho+9x22yUOtaC7AOxNBLnbvL6Hllnx830kbHmVfcban6WRjXc5cp9n
	CYrgVj/lC1FYelIG+MggjeE7XsFNunEsazf5uWiHWyH6cd5/XC5RzQDJFCrSh2soGMwZweUxJvo
	28Tnuf3wFOVWndKkJ2kvXfjA/xt+mcPtUQbPqrGGtMW04w6KZUMMPPmIoqfElNGU2DpfOzHHtZt
	gc18LexqY1It3Cz2fIl/Pe+gHJJNyoVqZhiG0sJxkVoMvGIDFcBzVO9OLNIhjQDb08m8R76x
X-Google-Smtp-Source: AGHT+IFqJ+76sZ5zKGvWfOL25dcAZxuQhj7lH5Cur5AxGcIirIkmcfil+8KNWWqlRuFJb6f7BVgQOg==
X-Received: by 2002:a05:6a00:4f82:b0:748:2ebf:7418 with SMTP id d2e1a72fcca58-7489d00e68bmr18901543b3a.24.1750143785393;
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900cec7dsm8065760b3a.153.2025.06.17.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Tue, 17 Jun 2025 15:01:39 +0800
Message-ID: <20250617070144.1149926-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_000306_360101_4B07F96A 
X-CRM114-Status: UNSURE (   9.42  )
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

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..08d28313b870 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -16,7 +16,9 @@ properties:
           - enum:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
-      - const: sophgo,sg2042-reset
+      - enum:
+          - sophgo,cv1800b-reset
+          - sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
