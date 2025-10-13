Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA60BCCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juZrb1RJxnqwJ5HqakCfCrqiiN/s9rqBPUpOr6gMSbA=; b=dOo+N51PkDms4y
	CRHgcrdw20dEpj+Ytj42OIHQHGMJZ0ODd3cXeK6qRwcT7CkPNIDciy36mGLRkagSo8LdtaFgVRGWe
	8cUoIlBobdDEvktePNjE58WwIjCm0NwaQ4qWvBO+8b9toXO8w5l5QefT8kg2aNGW8VE2MbGGgM7Qf
	DfrOgqZfmAyIlnmOu7vQZucW+8ZQDZk9opf0SG2fjBIUKzc9gV90hsaA2HpXA3Z0wg7D3rM8BKTDM
	chEQKKXmgDr7mAUX72HiKmy5LjfVgCFkRTk5AaePNDXybR1vQCoOhkovg7WpSd+lndsQjiMIWmlu7
	fHTHeYeBpuEMdg3sLsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX8-0000000D00P-1oLq;
	Mon, 13 Oct 2025 11:16:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX5-0000000CzyK-22b3
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 11:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760354162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXbaRxtuztYp/s40WDhl1rowOsrsCdyuZCaCXhLX8Gw=;
	b=YAQjkP2mkrKDL+wX75SDUhfZ0FgVymTrFQS3qo+p9YFhwsSyqx5mrB+q2O0eVdSVYwEi5W
	4uqHyFQs/9IixfUpZnZ7Hf3Z9b713MJDJVo8a7bLupiv9/114DqZ7efXakBR70gUqtLPNX
	p8O24GXeCCbupJstx1IXjkvJQLT98+k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-r040bRWyN_aHrVsgwvM7Fg-1; Mon, 13 Oct 2025 07:16:01 -0400
X-MC-Unique: r040bRWyN_aHrVsgwvM7Fg-1
X-Mimecast-MFC-AGG-ID: r040bRWyN_aHrVsgwvM7Fg_1760354160
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b5ad0887b1bso17437166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 04:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354160; x=1760958960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXbaRxtuztYp/s40WDhl1rowOsrsCdyuZCaCXhLX8Gw=;
        b=GoaY2G81MfqwKbtLjp50yiS5AsOoM6XWjjpIqnmgCt7AV1oxqACjA9YJIDaM5kwME3
         dYNLn9p633cp9gSyoLdyPuX1/7V6TJoFaJkjnuTO3BrG0dqjJpF0INTeeKRDDbIt7SW3
         oahWBlZmq/8peovkLPCOwBw+nFQ3uZ/XQorznb7wbeWxemc/imF0uVJXmo9DV21062yp
         5i+OXZyaihpZMGXtTlnc9r0hxK5jokRFliGBXE2EwnnjsPndf6iL9a1EQSdVee3o7GiB
         +nV7SxNHD5e4Kws4OCuDdYOatMs6zuBeJK7rcI3DWR2OXFkq2E5vm2P9Bl/kR/NNpRAh
         Reaw==
X-Forwarded-Encrypted: i=1; AJvYcCW2BJU11tOeBUwKM7En+z841GNgEHWrV9cDxP6NYRNdWxslMlJQySaQU595IeJLuwHdYEmR3s08qflTbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVdoRkRgADDG+MO/E+LDTfkUXAMNQ6fD1ZU03IqPPsVa0JAHai
	gJUaNEcyWuiYtHeT6RD9T/B31jEebaf9SYS6nMOWO9//1jJlONKdNhSj+Ny/stD2vbwfeLE9xHB
	rufVbKxr8y/0vch5IEqs7/2onS9NgLjHy+p5UXBjHC/Z1qLI9UIn9PWCd0V5EkzG5KFSzCA==
X-Gm-Gg: ASbGncssR7xvsJO7IckCEWZzoW5N0O1uB+6dFiTg1WGdsChAIC3oKsjbB+IOt0VKvJ6
	GObt6Y9n5MjddYJT1j1ZL8kZBhM0p0jcxb8RAydsvmo/361K4sfJvp2vWjnVw48+OZ6YDqBKnzB
	1jXKQp+7jVVdOC75U0s+LA7SyctfqZe4dn+AqVY3JgVaU8ue9kyaacYI9qmZKRXGfuBr63l/0TI
	QS2tCs4W56CtLwvq3ulA1NeoM/mZ79/nS28O+NXoPya5My3b3zsIJfKTGk1+bisuEe9mi1Ga/Xk
	lrsN8RfDwglQWqcpk869bxhMsaZUIo9clU9cSg78WZ2Q
X-Received: by 2002:a17:907:3e14:b0:b0e:83e7:f6e1 with SMTP id a640c23a62f3a-b50bedbf399mr141599066b.15.1760354159925;
        Mon, 13 Oct 2025 04:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuUdQXqYYYnB0IxjzxM4QXupFhWiFIY6GmjbzKu7BcvIGOI8cjNpSplnLC3KbMobuV7VWnOg==
X-Received: by 2002:a17:907:3e14:b0:b0e:83e7:f6e1 with SMTP id a640c23a62f3a-b50bedbf399mr141594866b.15.1760354159482;
        Mon, 13 Oct 2025 04:15:59 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm917336966b.7.2025.10.13.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:15:59 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: devicetree@vger.kernel.org
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v2 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Mon, 13 Oct 2025 12:15:37 +0100
Message-ID: <20251013111539.2206477-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013111539.2206477-1-lzampier@redhat.com>
References: <20251013111539.2206477-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cgpYbrGokSkVNisFysN-Zrcl15K-5_YfrHQ9GmUh0Bw_1760354160
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_041603_602466_059EA300 
X-CRM114-Status: UNSURE (   8.69  )
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
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 3 +++
 1 file changed, 3 insertions(+)

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
