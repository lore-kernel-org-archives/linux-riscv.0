Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B180CE7C4D0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1diZVBuHGmiK0wwv82VF/9Goe8I29up5Ng9pLrHHtU=; b=sAj0X26UI69jpa
	vFZhR/wa/lDSx58Yxgd4wJAQyq4WvAv/imqsNAEgy+e30cdJ9hUsR19l7hfum3sMV/TgSaJJGu28p
	r8SHYRYOrZMCmRajqylWZNM5HpPb2JVxkmdHH2UolnMFTzD+Q8CIGN/fi1NOObSvzvRkXoASjcN7l
	0oSxLQEj6e/OHRxh1VOJFrUnG6f6y8mPLUQVVC0NzuyVThb7bMEb/HwttQurWLoIvoDFplrHJ6m5P
	45IknxaWAK3j+j+SdJed9f/KuimrDY6JMeCGw2IBQnM6fwN1VB+I3HClSJT0/TnEMmV4RfIAiA+VS
	wL5td7flRHwzJHf3gAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo41W-000O8x-28;
	Wed, 04 Oct 2023 15:42:54 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo41U-000O6t-0H
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:42:53 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3af65455e7fso1611771b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434168; x=1697038968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfM5XCGs2tSFYtxKjnEgC+KhHndiRz+hbU9xrIiDamk=;
        b=PM76+GiMFbsK9+DOfZskMo7pd1x6RMWcAlBOBYuwhNjsJmw/+VOQn0/udkZuA6N1WW
         naky3lABAalYzMnkyT1yXnn7gNFLrSGMSReHSbRKVd66I2yyG5TEB9zWNYnQ2irQfK2i
         ja2Nk1wyLbbmy3oz8p4rbG18v2BGJ0QQuKGKiGsI/Ek6Z8LLlIsgR+BHr7G+6keNVC0W
         R/WQcn15GNqRKksKB2sN9cFycRspP9Yb7PbS2916xTsj9w2oMT8/wNEgDlfCUxN9UVIJ
         r6JhZbGbw8LcJSwvAoXxQV7KzEsJSjYqceN/sEYuwAPw5MsmCphweaC+C2usrTyQ8cCy
         RbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434168; x=1697038968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfM5XCGs2tSFYtxKjnEgC+KhHndiRz+hbU9xrIiDamk=;
        b=M125NXtdHyk5+rzQMphNQarizMix4k0hF9bqVrFY2taJpwKzaKRJCZFr2HSuDY9FU3
         rzP6VzaLsKP4JciFM/CRwnbhFlVpcpp0BydthdFjy60k0hSjuKm8xvX+Yf3fM5HskAJw
         Y3hfK5vhUAL90t/gCcReFwisB0ZijLdm1Am8mPbpcMB2sdr2aG5U5MkZhudQbSFCqwBv
         xc2yoc48mYD2KAduvLX2uAWCLE0frXR/HXDhrKnjZFLshtBvvYwBkmHtHwPtH9J4pkEj
         iCmf/6h6J6kYpBPi8h78NuYGUKyFrZscq3NCa0YPPKCHQp3Mmi8vU6aPZkBMuhrYTvV8
         BIKw==
X-Gm-Message-State: AOJu0YxyneZ2icKBSRZi8j2AZTLnGnAV6/5OsaMTUR1lFmv/FxtZyiLT
	TinhLPMThRJIi0Z4ETPyZi4=
X-Google-Smtp-Source: AGHT+IHtVip/Sx3qhTmZhBJxHyVWkRBSXIODOPj/xBcCYq61Wz1gSwS6iTyG8GCGDEx8qhjHgg/n5A==
X-Received: by 2002:a05:6808:200c:b0:3a3:47c5:1de3 with SMTP id q12-20020a056808200c00b003a347c51de3mr3124437oiw.49.1696434168310;
        Wed, 04 Oct 2023 08:42:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 25-20020a544199000000b003ae59076b90sm540093oiy.14.2023.10.04.08.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:42:47 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 05/10] dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
Date: Wed,  4 Oct 2023 23:42:41 +0800
Message-Id: <ec837f89f5a23bd7b8ee34096fde8052351b0d5a.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084252_122883_DC290C7A 
X-CRM114-Status: UNSURE (   7.99  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add compatible string for SOPHGO SG2042 plic.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index dc1f28e55266..16f9c4760c0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
