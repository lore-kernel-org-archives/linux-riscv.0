Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44678C04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lrGP1pueBmfgBlCf7FrU7FuhqgaOgMWv7zbMTqWkmLI=; b=1TiUmbP3DM7QjC
	mp89KZbYWgLlI3ZPqGjtro/jRnfI1D64ONxC0WbSss7EYSSiEx/AfBfun5hCHDI+4R1lj15EFsdq2
	vgFdp+2Zx0ZyShofJpe+uZ9acvX7pVJ02SCultFWJvgCCFz7wNGV066TXXZvhchHPJkxP64U5rUag
	z0jz99BLNrnHQpTFMBoYupf6E4LFFrIrM5ykVboSMmuxpak72d1pBcmatN8Ip3NwyidhWUbtSb/n1
	lsNNeiE6GisFA3cOsy0to+N0alXa39W0mTki6I4SxEjJJzchv2nhiBlyV4nivL4UJ1i6EQjjy42ko
	onc+ruAZYG7p0DkVwZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBs8-0000000FxpZ-28Sx;
	Fri, 12 Apr 2024 08:02:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBs2-0000000Fxmo-3E7E
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k7/OapXEM9hlZWA7yCBRs/93mN3l17NGNZqV6UA5j9E=;
	b=itS/2W9SUgYmbPNcIFUhwk6FmFILOpHeCj+zEB6qqLfK/Cywi7MjO9y58PkobTmoAAdHm3
	glOze+QAoi0sOT05NanydXOR3pmdJTi8jLAdysmwPWP7c8Zll6lLBjzz1eE+LMLRdgrJqs
	x/3wQEPKod1LTxkTO4cU1/JL8U4zfUc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-_jB9mNbnOa-bTa71OLk3ZA-1; Fri, 12 Apr 2024 04:02:47 -0400
X-MC-Unique: _jB9mNbnOa-bTa71OLk3ZA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a6f2c7c1b8so375619a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908966; x=1713513766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7/OapXEM9hlZWA7yCBRs/93mN3l17NGNZqV6UA5j9E=;
        b=iCe3SJSZBCo11xZOyxuoNdtA1WmpvmEdYcU+dwOQsoSgJCPNQNqOFPozxmP4syqbBW
         dA+JSjYcCSM0MnDWRJDc6+rNZDl5RXH6uny1E3w2s52EKsAVEoMKCC+vQDyhvXVYwN4L
         b2AROjR+ZGtmiW0UxNFiiqWR+36ZVf3edTb7VbvGZLPtOzry8qm0HJFyXItP9sKCbsyX
         wfb+mD51cmyjdMvVve7xsa+tBD4oDfI3rb0jqdwzHEX65eywOpjuEVZa24tIw7z5RZfl
         elzryk4wNAYiHm92ho+tjqzQmT8nJkKHOeTOgxZB4oKpSxPOXa0dQMTPOdY8sUynM63n
         X+cg==
X-Gm-Message-State: AOJu0YxuusQJFzaAI3nz6Fk0T6TyeAUNA8bNNmzU5cSuwd2NWShJ3ksH
	ZUOX7xDBN1sCW3KqN5PFCM7Je/mImptbv8nqvQUbnkxebekTO0/yR6d1j0JsZXqOwDqeg33BMyH
	Y8E2kkxZ89LqueamzHUz1cg0Q9Ta1myCEef+xOseL31mfAyIdFt6qbSfpCB4jNb7f4Q==
X-Received: by 2002:a17:90a:e501:b0:2a2:616b:f3b0 with SMTP id t1-20020a17090ae50100b002a2616bf3b0mr1913809pjy.35.1712908966064;
        Fri, 12 Apr 2024 01:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSc4T0+QC9jHg1hidzbPxP03+A7jHsSw9GJe34xPb1pjDLvNStx2JhXJsXAeuWkfAFN1B3Zw==
X-Received: by 2002:a17:90a:e501:b0:2a2:616b:f3b0 with SMTP id t1-20020a17090ae50100b002a2616bf3b0mr1913709pjy.35.1712908965676;
        Fri, 12 Apr 2024 01:02:45 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:45 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 0/5] RTC: update APM X-Gene RTC driver by adding the pre-scaler support
Date: Fri, 12 Apr 2024 16:01:42 +0800
Message-ID: <20240412080238.134191-1-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010250_914783_C69C4C72 
X-CRM114-Status: GOOD (  10.64  )
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

This patch add Counter Prescaler support in APM X-Gene RTC driver by
getting prescaler (Optional) property value from dtb. 

This hardware support can only be found in DW_apb_rtc after v2.06a.

And adds the optional property "prescaler" in bindings for APM X-Gene RTC.
Because the clock source on some platform to RTC is NOT 1HZ,
so we need to prescale the clock to make the input clock become 1HZ,
like (32K/prescaler) = 1HZ on the XuanTie TH1520 AP sub-system RTC.

This patch also add "snps,dw-apb-rtc" into the "compatible".

Since XuanTie TH1520 is using the same RTC, so this patch enables 
APM X-Gene RTC driver for XuanTie TH1520, and add a device node in 
the XuanTie TH1520 Soc dts: th1520.dtsi.

Wei Fu (5):
  drivers/rtc/rtc-xgene: Add prescaler support in APM X-Gene RTC driver
  dt-bindings: rtc: Add optional property "prescaler" in APM X-Gene RTC
    Document
  drivers/rtc/rtc-xgene: Add "snps,dw-apb-rtc" into the "compatible"
  Kconfig: Enable APM X-Gene RTC for XuanTie TH1520
  riscv: dts: thead: Add XuanTie TH1520 RTC device node

 .../devicetree/bindings/rtc/xgene-rtc.txt     | 16 ++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 11 +++++++
 drivers/rtc/Kconfig                           | 12 ++++++-
 drivers/rtc/rtc-xgene.c                       | 32 +++++++++++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
