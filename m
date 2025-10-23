Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93396CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrZTX8O/mF9ssTUZbrQq2vmv/5oZpMzzd0jt+OrrlE0=; b=AL1IniCzOxeaGD
	wqwILOLODoaUqGQmQ5RkcyDigW3NAI4Yn6Pgmy9ft72saTYPP6axpj9Y3OJvo6XbZ1K8OTBGqFkzV
	Ww4B+Lu3Q60TBkJ37inM9/Uh65NJEcuWGHkGPOPEp95MF6wBVEQTTePTuJbiI0nYrNEBy5SO5kC2h
	jRxWCsUkirosIgcIZulhtSfYis3RofcZb1Oj6KIt3oruPPvRif9N3/Kz+Q8CkCshEz0ml86ukElGW
	0r0qYy6PnVOgV//H0MVe9BsThSYMoQZFAL3aML1Q4jPIsJc+hoMPz5960Q4boASvd+GM8JsNQ3pFI
	dW76do1lRhDRTgCZn9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvsQ-00000006VbJ-2cbf;
	Thu, 23 Oct 2025 14:01:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvsN-00000006VZt-3oXv
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 14:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761228071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
	b=CbMPWSMF25EALmZYUC+QYjHgOjdME7kbwgOHK24gfzPvlOKSh/9CY412RLg2KfGXwxhRVZ
	6iBUpC3yWrRJLAQlREGq9b3TfxCkHR073KuyTkzic6vKQx7FZYEyaMOAjwgumM+YvMWjDb
	2zKsKWv8YY/7zWoRdZNgyTIeYPwNoak=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-m8idPrl4NB6_CC4PqAkszw-1; Thu, 23 Oct 2025 10:01:08 -0400
X-MC-Unique: m8idPrl4NB6_CC4PqAkszw-1
X-Mimecast-MFC-AGG-ID: m8idPrl4NB6_CC4PqAkszw_1761228067
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4298b58bd3bso378700f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 07:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228067; x=1761832867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
        b=G72nWRc+0kDxdzhiZuxkASt4N2jCQlGuuJCwwP4v0k0G3p/Oz4ROHtUcj1DKJsRJFc
         it+08y4yo6jtczyWxtRUZ+H04+kXgUVXeOicd6cRp8sYZ58pLHaSAyEFC8cCb68XM5Ub
         uwQVhcqx2T5drERrYZDUes/2l2cwmadd4JkEZuVy3IzlRVsuIkF2GP56/u3uAcGSfPPK
         fEgDwZoQrzlOpTpGWQfoRo0mCVRJcCHUeHdFLT6GMz62SXrYrntdIdxdpgLAKCbg8JS8
         hWCpl+Ok5Q/DSTlur1GiOr5X9tAerCidBRwc+Q2DSRdbW9WUFXPXuNUoEJ3lABEKRvsl
         PBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhq79rJXYxLI1oYqdHtuxnZrlitKW9O23iiURpXpxY1mPzytB3ntjMFjwGVaSVc1qo2c+oA2YDAWf6Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx632UWNOxpdJMAzRqb4VyeKV0ENjo2wghvMDNNymMNGbAjnRpo
	7kLV6RPpCAdEtNgbLpS7D17UPay/RzeUoDCfSBgJ3/BlLpq8LDTWbQYK8GGb5sGXTCKBEeLzKBC
	SSun+PYWrh4uaK3iufm6oiTWqhz3akJQCRC1N85bGTrc2oXZmXE6D+BL+t8o68LNn1QKIRQ==
X-Gm-Gg: ASbGncvcXxOaxtoPYRR1wEz6LSqyuRvrKpd2MSrcNzb0PFjbK0f80WW7AW8FmKLaOoI
	+4p7l2GmyovGDdl0IJt3tPYOyIWQ+fR827ikrB8hkqnApJe7jymJuVb1YOnJ7VDeZ4UgpWkWQk1
	yjVbwathfByJTDNn2RWp5l2tD4wYZ72DWf1yDwIw3TYU1TdI/fOrN9OJo/pFIIXiXiBOwQmZ+Sn
	VI/+Ex+OkT6gKeqOIcjuWDSDZ4wrGme75zHEsTGvmet4+owxupKuNYlo6mE2t+MB9ROpuVySy1M
	8aKeN+5uqz4AGrjY7MdVIo2Plnu28jrweNMD5uT7NwFw4+ypGvYYqL8386sD60HtNtgYqam6+R3
	4vnk=
X-Received: by 2002:a5d:64c5:0:b0:427:55e:9a5c with SMTP id ffacd0b85a97d-4298a04e8f8mr1738158f8f.23.1761228066995;
        Thu, 23 Oct 2025 07:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQN5z1R3xUC1t8+U1Lp9SBqdA78YpSkYVZfQPRbMaP928lyLVm0iuMC51fQt6oNyhBCt5xuA==
X-Received: by 2002:a5d:64c5:0:b0:427:55e:9a5c with SMTP id ffacd0b85a97d-4298a04e8f8mr1738120f8f.23.1761228066468;
        Thu, 23 Oct 2025 07:01:06 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898add96sm4116154f8f.30.2025.10.23.07.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:01:05 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v6 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Thu, 23 Oct 2025 15:00:51 +0100
Message-ID: <20251023140057.204439-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140057.204439-1-lzampier@redhat.com>
References: <20251023140057.204439-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CucJVVjERizx2jLkJ_OAq7pmJv8qvMSc4EUt8eZOfto_1761228067
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070112_020660_51C31EC9 
X-CRM114-Status: UNSURE (   8.99  )
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

Add compatible strings for the PLIC found in UltraRISC DP1000 SoC.

The PLIC is part of the UR-CP100 core and has a hardware bug requiring
a workaround.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
