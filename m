Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE57CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkoWtXsytmIFFvLoEEJTlh+g7C2nOe4P3jBK3IOe0Z8=; b=iWrZeIrRIoGFpw
	JTprMh3/gCo21knIqgNtHRMR+S0qPOYx5maSEufcZFfXQCXIIl0lQ6cwrm8iCa5KjZS7+ik5Kmulr
	QwcL8FrkxsAEKebvzHj8mj8f8m/+NYZsxbUA0xF7ln1Y8ss2tKM6KVraMesKYHk/Jty9HR2VTH5k9
	D+UhjUJOQeD4MhjB6X+CyiN+nOIO9wqQ6/M45SCIaRNkVp5ICk5Bp3c0AT3d2cpfrbtSxx8enDJe0
	mLkLnB7XS9xdRV03kA2true+KHjo9jnaGu0BHaOiHaALOCKNmngoVCdiQU2qYD1OFeUh8uLI0hpdx
	jMsIROVjVd0Wx1CRL0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lu5-00000005VML-1nfW;
	Thu, 09 Oct 2025 08:21:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lu3-00000005VKu-2dZl
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759998094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJVyxgI9Fg/pvM8nQUTMBYCnsJurTQ/jDlhcr7O+2R4=;
	b=ILZb2gVdu/KgB4gtk+VwJ2NPHHgiWhCr7feU/hfXqS48sByWngm72ZS2EvmhT+dsdUdDSj
	Ee8wBq9b8270nR0xNHb07boZrLppGz+Qv1V7XLAHFriLo9KaIr44J0zjzRZ8Gq3tgJfswM
	11DOtyjsIK6Q8s5Q7fBFE4kHHnKYRJI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-T219UCU7O_mrCoXR1fTSLA-1; Thu, 09 Oct 2025 04:21:33 -0400
X-MC-Unique: T219UCU7O_mrCoXR1fTSLA-1
X-Mimecast-MFC-AGG-ID: T219UCU7O_mrCoXR1fTSLA_1759998093
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b47cf7544e0so62825666b.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998091; x=1760602891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJVyxgI9Fg/pvM8nQUTMBYCnsJurTQ/jDlhcr7O+2R4=;
        b=jaZ7yt1DWMtE0zsT3LYWK7RKvTw9nRIoAXH2JKGReC92mgtrXNFFU4vBgwZDToK+b3
         wJrvmEd5gZSus5TV8avtuhK/qzvng2KjKDFdaPB0cpdOWzTD2iHNNmx+9BvzOaxvRUqJ
         3t7g32iuSKJdrkPLUKlh3V+KoCiEYqv5K9zuooUpX7x4nyUSXdijsp2eBuGw/5eVNWvz
         uiVSNghpjSoFibNbvk7KOdgi6IwV/nBli0UFoUOws8xUIdl6jTHV19Yd6i995utZpGaw
         QOCblDvryzzoPJCbUBxZEFi/ddYNBxDtVNocjGGMjMCwuJoSZjuaNzmgKqJ7eF4sEj7I
         PZFg==
X-Gm-Message-State: AOJu0YwtJGS7pmPe1t/U60xqG7s96J4V73qj6Da7ER9DTzsEGCQ7Aw9S
	3+UUdt+tZgqpTZQWJEPwwvoTs+GwXhAFVWjARXt+nWVOduPwrGM6qTqvnYnsqSJ/WZKAqFw8jqn
	3KOtG2j5IN8qTi7KMBAVD/2M1fL+JEiBn+IucpTZqnLz6K8Fn8NFmoS1rLRhJN7PxXXeEHw==
X-Gm-Gg: ASbGncsBb/GRY5wXZJ9IbNlbbIQ05q0zc88KM9S4EKzr6fRIWCNs7Y8Z9HJK5j7f2Dt
	8WDWCSUjJWfpM0W7JtE2OFGEcgTFzETK5Pv9h8viF4GvNsXKTSDNStsnmQqIsR4o/8zgdyCutwO
	XwcITKmhXeISlGxj5dOEfj6sY7mwGQuXs6mN8vMUThQ73R7JRY8upU1sQ8R3IcIKzaubPuhE15l
	PHTTWduk7hSvuH6Ev9ZivW820qm2O6Akg9EQnN/kRDuOmzrCPFyeZM61JPYyfAkiRD6L1wQ58yq
	6DzeQ8lkZXzeqTrzx8yXM/QivxKmcH+J0sznAKwC/IbMqzA0ZPzg
X-Received: by 2002:a17:907:9349:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b50aba9daa2mr758264366b.37.1759998091232;
        Thu, 09 Oct 2025 01:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExcmQ8eTxCm2s2PTF2ZEP2FFTRKkcyMU7KFMgI3ry7TZh/TDeJ/CUdqVKsrHFgFuODCXnOZA==
X-Received: by 2002:a17:907:9349:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b50aba9daa2mr758260966b.37.1759998090808;
        Thu, 09 Oct 2025 01:21:30 -0700 (PDT)
Received: from holism.redhat.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e27dsm1832988266b.70.2025.10.09.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:21:30 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Thu,  9 Oct 2025 09:20:12 +0100
Message-ID: <20251009082013.1331361-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009082013.1331361-1-lzampier@redhat.com>
References: <20251009082013.1331361-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m1i0vvc4PGa8hbFyg8xGXyEW9InSvJ7vhskslzKrQOs_1759998093
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012135_742897_5E340AE6 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Add a new compatible string for UltraRISC DP1000 PLIC.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc24301..a419de50f5a8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -74,6 +74,8 @@ properties:
               - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
+      - items:
+          - const: ultrarisc,dp1000-plic
       - items:
           - const: sifive,plic-1.0.0
           - const: riscv,plic0
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
