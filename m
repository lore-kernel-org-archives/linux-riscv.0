Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F1CCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrZTX8O/mF9ssTUZbrQq2vmv/5oZpMzzd0jt+OrrlE0=; b=12HM5vObKxVqTj
	YXlJDnztzJd1qRA+y2muE6pRyfkEAmg4svP5igdeAcqzxMOG9SD1JPTwcpfOZrLlIqH4Z4x7H16dd
	5Db0SLPnNyn1eQHtfYVjhdVIu8xFrvK+I22BdhvC2ROY7aHi4NkRKH5GiHPT8eDj7pfir7vmJ9Hru
	7siXu6fc8WRqtY2hATLNfgWPaQVRkpWvhXIR9G8T7RJMkPuxGjPrhgRrUTFAYoh4zp2GZTJUVqvMD
	7gBlc3OTYaTm8VRgZtui9Evh4U1YDislkHgbi9BO/45A/lu6QCoigg/p3rbV96+f6xGTUT+jV3wx5
	Wm1ooU8aR97LuVmqUxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92XE-00000001tQp-3kP0;
	Wed, 15 Oct 2025 14:31:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92XC-00000001tP6-1nvP
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 14:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760538681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
	b=A1j/QUMHwQeM4lM/Q7qC7Mr6TgQ6F+oH1qo31TfQ8H97CKUCCZRLgP46JxfDqHpIlJXBYX
	USOOcc5OAu50cJQmuw4w/3pz74QX3dpIBD57U+Zv691iTxBboyJ9CCpkgTUUEd8KfcvmpI
	pGU+8QJHHPmvJhI6nIUIXyHIRwvEmvE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-BleYYO3gN1KVnMG9k0w_6g-1; Wed, 15 Oct 2025 10:31:19 -0400
X-MC-Unique: BleYYO3gN1KVnMG9k0w_6g-1
X-Mimecast-MFC-AGG-ID: BleYYO3gN1KVnMG9k0w_6g_1760538678
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso5717639f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538678; x=1761143478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSXzVZNzjEJV0QCm7fFsQIpGaaXg5MfSXavQS0cQlLY=;
        b=TmyOvjIRFtdyG6Hf0cpwiBS2VMnpMn9gSw5mDmL3gsq+rgY31SfM3sgo/tMH2RXv+I
         wGXwadHUYzaC5E50Oqn5IZsjTIa7VHrmjcyI/QOPyceG3QQ0KhNIpmMSwDO7r0rUYm/k
         LKfMndCCCY7+wd7aMEx7AGgv7tvoeIXFX8FMmJbw2t/yaaRuNrL0S1hs13tSvr3FKIRy
         BDllSE68vEG1Bphb4m0T+UlXaXwsRK5XhnQABcsJOiIyLyIxn5nyq/mHfdTAlowDuItO
         BmKzKCgX32Kj07YASem1C9ZOv82xmPNpFH3/YkHC3sa66Iwm3q5D0yN3m5MIWSAOABNG
         iy0g==
X-Forwarded-Encrypted: i=1; AJvYcCWBtzEWapTpyG3GQZ+IGuDR2Ow//E+RfKVMI7ff7VDII5d+g77IykxpPVbnAfh8cYxftvMBxWt4QkCjbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQgpUa3ZDFJzlVSxofyiqB7klu+vJXLy9D8IG1TkgYCtk9r4Ks
	DSZlflyOlvwHUNFgzPq7L3glHbAI5j4PfCHp+CNnalYFXWaom86Rx5UY5NKtlidcUSHtNpCm/tp
	jf6atnLHNIhGzoys7qt3TCeVimLjAb3hAJaGxUhguPIv92Xul3270KEo7xEBv0qeMWe3LMg==
X-Gm-Gg: ASbGncuFtDBQWkC64nF9fdzuAADrBQBX/mg6dAAPfGluuUFsPvM1wkrmARiKrfv3L8Y
	Q1bVLhPzW5DA+WZi4dwcI/FxiugrMtzPmbflatTVer7W8uukdJ7pb+vzHU8r8SAyvFbMgmcS3tT
	8yinr76sxO/dAkobBzV/N3JxjYzhPmnuI1OVrJt+mTs/1OC/batmmkaugPww+WCkNazAuC2hx2f
	WxjjUpLfCs2Giegof8n+V1cu2F7a3lmrcBgGvrT9O4kNvbXPJKYPQRfVuqcYiDtYWguWI298eJ8
	YTOVLUt3Wve7ZY7nD0xydXYQekBDB2KeS6MnuKTf98DVp93rSaSjIac=
X-Received: by 2002:a05:600d:11:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-46fb43aaf25mr108180825e9.38.1760538677942;
        Wed, 15 Oct 2025 07:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG683Uu0GDZc9bo630j+NWQaTw6T0Q6n9Za7jgl4kwN5Wnz8kfYe9OZzC9Ddj1aZld04KGuRA==
X-Received: by 2002:a05:600d:11:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-46fb43aaf25mr108180605e9.38.1760538677489;
        Wed, 15 Oct 2025 07:31:17 -0700 (PDT)
Received: from holism.lzampier.com ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c02377sm32617005e9.6.2025.10.15.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:31:17 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
Date: Wed, 15 Oct 2025 15:31:06 +0100
Message-ID: <20251015143108.441291-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015143108.441291-1-lzampier@redhat.com>
References: <20251015143108.441291-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ygC_yOB09wvdqc5blGv0h0oNKXD9tpjzYGBBsu1L77M_1760538678
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073122_539945_849727CF 
X-CRM114-Status: UNSURE (   9.22  )
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
