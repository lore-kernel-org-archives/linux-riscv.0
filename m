Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73C8CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrZTX8O/mF9ssTUZbrQq2vmv/5oZpMzzd0jt+OrrlE0=; b=mxc35DfIJIlduJ
	20F0PDyoGQV/KkuqPPtrJXgZ5tihF3eqPGDNgHltqkRSVqumYaa4zm/9HIkkrX+yInaa8nUy2m2FI
	86PTkynCYM4ImNNsSec/cKTIzb1ZV2H/vvuK10GTkfm2JS79Gny9Ftu4msl9wvsbTNDVQ5auOcpqH
	W14CUkF7Lrdr94jmjPYxH6/cv52yqwqSMpp+QBNARxjteWX1LKCP3ufhxSP+ZgszRYhnG/8aVWgv3
	yPQb3sj25n9Vq6JrWRuaNLkyDc4T+4dEnVhEOgRDPFaugMF0GoTikaZd1YPi/0Cjp+63tgBUpKer9
	o+d/scpuVs6X9WBEwICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ja2-000000040nC-3zUS;
	Thu, 16 Oct 2025 08:43:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ja0-000000040lu-0Xn0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760604203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
	b=IIlAqag2n8APAfaPgriYwUvfkqavRM1I5HC99J4J4aV3Uw0nqdA+/RvpBrTOegrQCa15hp
	4dTRYxBl6L886XXQP5dDooF6r4cU2BQeFYNisDnkcKY9S4n9b6D32hCT9KqQlOONL+yNyk
	YGGnbQMX/UGa0eVjdUR9DkfQa857Tqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-nRAI2K4uOL2zpkQSDiBxTA-1; Thu, 16 Oct 2025 04:43:22 -0400
X-MC-Unique: nRAI2K4uOL2zpkQSDiBxTA-1
X-Mimecast-MFC-AGG-ID: nRAI2K4uOL2zpkQSDiBxTA_1760604201
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f924ae2a89so746975f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 01:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604201; x=1761209001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
        b=MhmIgsr2itotB5ETZ4LSiqjL8eAmjS8/fOAMbQYon9vhPOw8tpmpL5ynQn7LfDiUaE
         LtIzxgYsZELk2jxYcB7G+ih3LBL5R7q41gEz7cVWIcFOV4UX8xKWjSQMxz8gJUQ6jubD
         EJOnFj3Mfc6gsjlh47xWCpybvXAVO2GjBFo1VNRRAyEHxF5nrEFz7YLXXWpnizaSz3QC
         2Pv2Jh/+k4WWBOF9x0TUBtPRVm3LHYXHhFOm1Es1t1Nx/pasMVz2CLPH+4WuwQD5e29c
         xs4fZHwqcx4kmrOzFc9O3ss4h6o4YGpqg7xwu168WgqnBfUcrUeX347HefQtiSKRrqzy
         zNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUprKt3rJgEa0mbrzLjxVHTxJ3joNA9Bq+GCpzZN/5QMR9rPmifzlW2izAN+4D8G/CStfVp7GwFxIFgmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywme83Kz7QhnYoKqVcI+UeoB5QlNf428/9ExLlJoBaCzdq0uOTl
	S/mWcuFIOVMPOayjJv3mUywqFii4+SkvUNnl6opzwhiB2bblB7xMZkEc9CGf9iTg3saqdh1CNAA
	qlNkoTjh4g88jz4XYN4Jw3x717sqP/jvrrebWpN1aUmdCjBdML4npgQLB2bNl45giopJxkg==
X-Gm-Gg: ASbGncsPn2lRTVb+RcOlaT9PBso9jeI1/Di4pRGtFfsQv/WjTqLAof+fTWGrnapvnx9
	iBIiHpWvIfkFKHtc07dzHVT4lJ1q19ksTkUxTC9aQ/BviKZbPkOn5jQbg4lLA9CxIIkI50ZDA52
	xu2jz/5OdZcYTsvk0aWlDxcq17OYuXYZFoW7+tR2xKYiSxMq7EiGFzmkZ8QheUSiGG4s13gsvsu
	8ye2roxmcTKo6u5KZXN+ZjnU1rUdGfFfu3dcUO3tvvkkjeCY75fHoTaKrrVsu8vNF49xDQyXG1M
	6SdXaeY3FXP4VGjajH7uX8mEDR1yWndDgL/9YPPagHsZrMp67FtxeqcXmaMQv+SAhSwF/klY+H6
	rn5MQOR9P
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr19688097f8f.23.1760604200717;
        Thu, 16 Oct 2025 01:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0ACtQECJERtveJFYTBKv8miWePlEgMHtUGK9YWdSNjEdnlQmSq4i4uyB7IbXH7bxLy1h6Ow==
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr19688070f8f.23.1760604200312;
        Thu, 16 Oct 2025 01:43:20 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33047565f8f.45.2025.10.16.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:43:19 -0700 (PDT)
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
Subject: [PATCH v5 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Thu, 16 Oct 2025 09:42:55 +0100
Message-ID: <20251016084301.27670-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016084301.27670-1-lzampier@redhat.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FMZQTgQMOpd1oP-llmuiU5bZfdbEP9fXrNVXSyWd4hw_1760604201
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_014324_230057_3A20E6BB 
X-CRM114-Status: UNSURE (   9.01  )
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
