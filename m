Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E60C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i3Tk4dO4u+v4hbPS8z6iO+HxlAmhNVA1q7ird/Rg81Q=; b=NIAmHDUvJMX0aQ
	f75+nbSuz6d5lD10nXps8sVSPTvFoSzvO4B7RHpUiJd3pxspUZqb9jJ996+9PfFtuLPsvkFTwHxmy
	x9PXoaaqKnIsrW37EAHPGGU8npDZ4FcZ5gfmBM0QBibRBi7pxSw/oH/xRe8/KXq+oZ/4Y1uy/GCcn
	L+sB3t3tNVyzhRcAZmPp1oUGFOl82ZnUD3WOVR0ZWF1p2ZKDdTso9ep14YmYxYcTyspxPZqSKvX+I
	ICknQhS0vsoFiGNQNKLGxv89HRCyCF0kxQQe1xs/sF4MqL4XS4WX2o3Yv4mqVMkD6ZhN0XU4pncHv
	jDmUlAMxqQ/hhbLTYVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVL-00000001rfD-3SEj;
	Fri, 29 Mar 2024 20:07:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVD-00000001rZa-2F6A
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 20:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711742821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SnHjQH48YnJt749mCO2kgMTpPbKk2F0bzExQRDPnK30=;
	b=eZB7PJr/afzmul2LLO43LzGv7A7+zmb6aYQ0Zxpuba3/5GGW6NcqwNpZ6cIfyuMpm5VTWP
	vsydIQwPbvSD342NFjhTBZD/dixbpeDgJmjbTJHo1Quy2zWJtGSyLdIg0TswUwIiXrpB8Z
	CCPtJD0YqQR4ah15E6ZO/chEWNpK7WI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-VUPzFQ_AOryAarY1dmXlDQ-1; Fri, 29 Mar 2024 16:05:06 -0400
X-MC-Unique: VUPzFQ_AOryAarY1dmXlDQ-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5c5c8ef7d0dso1703296a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 13:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742705; x=1712347505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnHjQH48YnJt749mCO2kgMTpPbKk2F0bzExQRDPnK30=;
        b=GHOMYUqtBKmJHWgG8xoo5T+qpA/IrukcApc+XeYo+pfdKRj57lqln8uQSs7dspskKJ
         7mk1wWCFLxxQ6AHjy13DIpvuESVhXgtERj0JIpgp+MgpB1l5JNWWxDPIAEMnAztYkPyf
         s7TAOOgHZbPHrKhzxU2h29AaIuZFiLpcz/nUXTG/VhsfrKRElF2zIE/SRo5F408YtbRP
         X+Rav10A6CW4b1dqsaEHu0tpFn0BHzFr7IpmPKiz1iayrZWjjXqZUQO/i5Eok0HuxQ8x
         x1wE31f1kiESEy92NSxQF2MN9HX8rP9EnGMHg1NeL0UuS42zfJ7+GfXAuhKfoRR7J4qT
         zNIA==
X-Gm-Message-State: AOJu0YyGFfIG5rnuGa++p9GIKWeLCRlfId7bYNmM4hvaW8K4l7HOEyPo
	hJf5zOH9rbfMpZYSytR6hu4Q7PX5wop3dX9nBetqupO3dcfdGyn8bH3qwIs5i+7jkXL8tbQOnHB
	1VtDhvwnezpMnYo2q5CT6py3Vc2UXfruCkUOIwZRYmtPunVLtF6h0ikSrjmAbddPd7l8J7Fv3mz
	bNnD8=
X-Received: by 2002:a05:6a21:193:b0:1a3:c8d5:707a with SMTP id le19-20020a056a21019300b001a3c8d5707amr3325566pzb.7.1711742704871;
        Fri, 29 Mar 2024 13:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzus5TYmyBQIJzw2X4oGKdRnzm+fHezhgpcMAHRkbhzjBiVvj5MPNNZHf4gEN4NnQQtcePCw==
X-Received: by 2002:a05:6a21:193:b0:1a3:c8d5:707a with SMTP id le19-20020a056a21019300b001a3c8d5707amr3325536pzb.7.1711742704523;
        Fri, 29 Mar 2024 13:05:04 -0700 (PDT)
Received: from localhost.localdomain ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dd6ebd88b0sm3830017plh.198.2024.03.29.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:05:04 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	guoren@kernel.org,
	conor@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jic23@kernel.org,
	lars@metafoo.de,
	andriy.shevchenko@linux.intel.com,
	nuno.sa@analog.com,
	marcelo.schmitt@analog.com,
	bigunclemax@gmail.com,
	marius.cristea@microchip.com,
	fr0st61te@gmail.com,
	okan.sahin@analog.com,
	marcus.folkesson@gmail.com,
	schnelle@linux.ibm.com,
	lee@kernel.org,
	mike.looijmans@topic.nl
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 0/3] iio: adc: add ADC driver for XuanTie TH1520 SoC
Date: Sat, 30 Mar 2024 04:01:23 +0800
Message-ID: <20240329200241.4122000-1-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_130703_771976_43ED6E2D 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Wei Fu <wefu@redhat.com>

This patchset adds initial support for XuanTie TH1520 ADC driver.
This is modified from XuanTie TH1520 Linux_SDK_V1.4.2(linux v5.10.113)
The original author is Fugang Duan <duanfugang.dfg@linux.alibaba.com>

Wei Fu (3):
  drivers/iio/adc: Add XuanTie TH1520 ADC driver
  riscv: dts: thead: Add XuanTie TH1520 ADC device node
  dt-bindings: adc: Document XuanTie TH1520 ADC

 .../bindings/iio/adc/thead,th1520.yaml        |  52 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         |  10 +
 drivers/iio/adc/Kconfig                       |  13 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/xuantie-th1520-adc.c          | 572 ++++++++++++++++++
 drivers/iio/adc/xuantie-th1520-adc.h          | 193 ++++++
 6 files changed, 841 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml
 create mode 100644 drivers/iio/adc/xuantie-th1520-adc.c
 create mode 100644 drivers/iio/adc/xuantie-th1520-adc.h

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
