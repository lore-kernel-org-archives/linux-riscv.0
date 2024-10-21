Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810E3D0E6FB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Jd4n2D6hj5sjOOv6udfDzspHNW58N2/UrieesjnKMw=; b=13xvcevANOCRIa
	jSrHC+seBGM79cO850cbeV4KCFfTQCukZfwa4pgi8Gy+ebVRtTRD4tPG6qsp+Iuk5eXBEb7aLz5BQ
	AXv84AsD7EJGQQi42pJoIP/tEh5D8OMjSuaMixbxWRNlLPjgH0YqkY2PLje5S0AmG+P3JXTnDGKEG
	PFE8E+iF83a0W9r5JsBNfHtt8w8ru7Qx5vcfazAt8HOb6ma1TEE9awxVwtLzvr2BmLWusbsXVvNjw
	SVJ+EeejlneltgcC/RX+OwdS//AJuGjMV62zzzvtGZqw8BH29v1shfmVD81Z7h5uE+TUV5zFTAyyE
	Zaxo969ycD0PLlBzHs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qqn-000000075qT-15RJ;
	Mon, 21 Oct 2024 11:45:29 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pmM-00000006uU4-19wN;
	Mon, 21 Oct 2024 10:36:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso3358178a12.2;
        Mon, 21 Oct 2024 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507009; x=1730111809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
        b=DatMdYIs2RNY622C1jKymWL4S3QmrJo/i6Kbx6e6iuG0OkE2cfKWpVmdr/lZBvxeQd
         WFnSmwvKYk8uZKqtFcgu/5v/g0y9QAihhY3vYnjiDuK68o7WZZM0NXSdCY5fWM0Vu3/O
         WFHxVMwQ+6ZyC4B9/bxeQnLn30DByJglwzsN5I+sEjTdP32edqMpHn1otFqY5CKcxOl2
         WmyIGayVffgu1M43r7lV1wV87W8Rm29P6IQ+WLRsm/3DM4xZKBZeNXxSXamzleWfP1rZ
         WQY+0v2PMQAFly1ukVITk5xiWk+6Gq9nK2ozDeGomJ3w6uAl7daaWcq6e9wjMO2X6Os1
         /Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507009; x=1730111809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
        b=HkL9bLZzvGeAMQkqJJZLe/X/ZSuSgqOuqixQb2VqFCduGZGHcYMI64UbR6bsuzbJxx
         tUqqD60FfUBe3sl85aKFuBJLWJKGLx9YIyKQKmkJBCsDxsqxA8tkBOjAufx4a+6K1csC
         omqK3nxPNxB7COLQAj2DV5wuZhe0UTBYerxFUnXRu8c07XZ4xNbrmcDPj+Nx5hT/23Nu
         2yQgqfCu+a6P/BDQQqgqlvUQzOl8nEf7trDFv3VsowBh+8i5so9WSPLnzKghFTGb/MDt
         pKPhmQb0M5RmYgVuKB42lJ4RY35QnAMTbNj4wyOdtTpStJDum8ORAd/0cJyJYEL/Fcum
         RLAA==
X-Forwarded-Encrypted: i=1; AJvYcCV6CmelGJcxtPZ0YSAWadXh5QMzRQpNvy7BOZoz9qD3GNn+fs9b2pBWJLn0mKi9UGkxlU0vzf7jCjcIgDw=@lists.infradead.org, AJvYcCVaV+1+6tcR8kVMxSCBS7IlG28YnyAfgsrCyvtwNteKwvbNeajR5F7QJQW72YpzKgj+/NQsCAwA3BSCInofs/wQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJa277HZI3Daa5jPxFnViIj0woryoh4a564aumOfryfw02OSRc
	mljnjqqJ+41rlK/8xz4F0MnyqNrlm2JttcbjOHGy81Wh3zFv++Im
X-Google-Smtp-Source: AGHT+IHcfOB8KvzIPdr/4gmQUpcTvuERKiXFCsr6Yz6aTePpzQBGy3C9mW284sw41jWu8/yv/Ub+BA==
X-Received: by 2002:a05:6300:44:b0:1d8:a759:525c with SMTP id adf61e73a8af0-1d92c572670mr15063786637.39.1729507009210;
        Mon, 21 Oct 2024 03:36:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee63a1sm23044785ad.18.2024.10.21.03.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:36:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
Date: Mon, 21 Oct 2024 18:36:14 +0800
Message-ID: <20241021103617.653386-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_033650_337660_BE9880A9 
X-CRM114-Status: UNSURE (   8.49  )
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

Add compatible string for dwmac-5.30a IP.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..3c4007cb65f8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -31,6 +31,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -95,6 +96,7 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
@@ -627,6 +629,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
