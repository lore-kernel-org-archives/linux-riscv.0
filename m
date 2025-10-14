Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEADACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eusZP0WVuQ7/si3a6BTuzoHHjfQAqNQwp5wtw3Mf08I=; b=j1EvlQi3jefH+e
	BhFWWZOP18HZwLDczOoctAPcNHu2lL4kaVaW7McWgs6GTZ1aGuUA/VJsP4dyjvoEVJmTjB7aCALZ/
	gvq0Rfs11z6uDQEHeobS8Oe9UnlQxwagFLaJbARGzpbutnBRa4WKZqIcMXYqjGuzvs+uXGeG05KZF
	M6Aghl3rux5SRhu3UvrK9KCjpMM1CzQmwLTv3J5EX5yaczv0aezkL8NED6ChJDU46RoKYYym4zjNX
	Yl6sVRvfx5Z1rVORDJxgmtJKSLMoG7DBitKLwSh+I4YsPCGX0SS3GJFfaio17xtLfUQxMhsLV2K2B
	1txvUd+FklYEU0/ly7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9N-0000000Gsjp-46Lq;
	Tue, 14 Oct 2025 15:41:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9L-0000000GsiL-12Wu
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 15:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760456478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTPFzDA4gqnwI93ROrI2z8yAKdVU1tIGagUjigwEBZY=;
	b=NOa3uoSEK0przX+VpnLtOFl5krV+4cPEfz8+vpJTfchilPG5ShqygIhNSBWKlqlnFjqA9z
	g8R+3jfsRM8fr1KD2PJD3Xzj+MO6c/wZEINEy8fkLWagZHKGPBJaEf1zcXnlsKvECnZxtQ
	dyatPT2uRDxWVp2aYa2UUaGJ7MHUkpI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-HKRdRx6TNBi30LwCsxwGuA-1; Tue, 14 Oct 2025 11:41:17 -0400
X-MC-Unique: HKRdRx6TNBi30LwCsxwGuA-1
X-Mimecast-MFC-AGG-ID: HKRdRx6TNBi30LwCsxwGuA_1760456476
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b3d525fb67eso702322966b.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456476; x=1761061276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTPFzDA4gqnwI93ROrI2z8yAKdVU1tIGagUjigwEBZY=;
        b=n0LLFJR/0v5RLTjERho2il4Oa4PH6jL/aed+rxko9Zlgpm8dsH6y3GKF0frRHz/jxs
         vj1f8neWSbcL73M305Wk6FHdgtsdeWtN9CGNiP++FkZnF2xDSeLFguVjOMxGpxl4Qa5N
         UdN0Mli6jzOlvRcXvFkCKZUdhhA1GkqYByPbO92C3qh/jwmXnrFGbGW9KjZKknOvchS/
         2jdUgs/VEh7rXDG/ri/OhXnQa5nmL5ELwDKQp8BKxK8hgREfKOVh2sZoWJRMnLCVWg/z
         suHjtdAGUi6RXL3oJ+6zPzMVg0/uQ8jSb4ZT2Yl84+6JxhHcC/GBZuHplE/+4AjwVA0o
         2drA==
X-Forwarded-Encrypted: i=1; AJvYcCUNLHINOKa7d98l47AlB4ZG3CMX24G5rAJdCIANBGXOwmcpCQudkUGZO8fLwJ8wVtB0SlrYt5pXqgTTDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmCifjVRiXOQdM+aKWKW7W0Jx1TgNk6ZJ8mIN1TVQKtOJkp5hC
	+uG2FXRiRrm+2M794/AFIlDmco9flMhyJCYQSi4eK/DzsdVOHfmgzm+h6Z+iX2bzFMyQx19/KUY
	5oBx4DQkSxsUja5cMsF9wc6qRhLQFJapf+v7EFj0oZRdVrQdfZt4akh3NIQPg9dC7sTlhIQ==
X-Gm-Gg: ASbGncuk0m9lVzHd3v40bvGiScqbQuv08tgjmm8Ft3zhy7fHSh/NmJhv4zZ04tGZI53
	cb2WVqBWIKPp4FQ66z5fANPDeRGEWNfgkvbu/4E0Iu4AvH8Vx4kA6HMPy2hG9oxm/RAS5EQhOqi
	GxUxsntMfbeBxccZhdwH548rZ2r7vP8IhXzVpd2ewsHDB0/6HFsTZKT3RVAUCVvG37Z6oeDw1Tq
	aJqRB5Lhae/BfKtZWP/8Vy1oM7PCn6hs+7y4PzCeKySh2smcKTAPV4l03ZMoXb9o2H2r9n5zNzj
	KS8fWPnLFL2A+678XTIN65BHY+SdN/V6c5BU6qzFIySakaa37Q==
X-Received: by 2002:a17:907:3d16:b0:b38:25b2:e71c with SMTP id a640c23a62f3a-b50ac1c0d4amr2628103766b.41.1760456475847;
        Tue, 14 Oct 2025 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfFeX9/H7k1uzVn/l6kjjHIirn4aGl9X4QusGUQ7kYgf87fvv7Z8/GRDPfHH8l7QuEqSTXEQ==
X-Received: by 2002:a17:907:3d16:b0:b38:25b2:e71c with SMTP id a640c23a62f3a-b50ac1c0d4amr2628101366b.41.1760456475461;
        Tue, 14 Oct 2025 08:41:15 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba45b3cbsm7897866b.40.2025.10.14.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:41:15 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v3 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Tue, 14 Oct 2025 16:40:56 +0100
Message-ID: <20251014154100.168236-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014154100.168236-1-lzampier@redhat.com>
References: <20251014154100.168236-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f9nEvEU9Si87TwDKzZOxj9gr6iMatEMQ94X_2ZnanEg_1760456476
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_084119_354939_030D7032 
X-CRM114-Status: GOOD (  10.15  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Add compatible strings for the PLIC found in UltraRISC DP1000 SoC.

The PLIC is part of the UR-CP100 core and has a hardware bug requiring
a workaround, so the driver will match on the more generic core-specific
compatible (ultrarisc,cp100-plic) to apply the quirk across all SoCs
using UR-CP100 cores.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc24301..34591d64cca3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -74,6 +74,9 @@ properties:
               - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
+      - items:
+          - const: ultrarisc,dp1000-plic
+          - const: ultrarisc,cp100-plic
       - items:
           - const: sifive,plic-1.0.0
           - const: riscv,plic0
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
