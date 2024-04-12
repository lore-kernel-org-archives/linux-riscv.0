Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2459C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAnaQ3/9M1ulcxx0jCYOg0vV/A22TpVBQxMvnbsR+yo=; b=ML1BG6CyPkvywj
	yZm05+zShy4+ax96KNMn/ZLEKtxt+8qkb7tb1FcH+8XR1I9wZa/DDhlAvQzjOfGlrUvyovfkc01RH
	WxWdX8DV6t+oo5iEtoJOv3bPhjcIJx8tVkJhWMR5Tvl8ofDKdHZ1Lwvo5rRFV5IOVu/pIdkslGfsA
	6NzF0MwSUjN9zps5dLLwH7l9HTNttEUeyXekjskAwJYRxlaUFZ3m7cF+UN9KtFeQvN3BlGbSYD2NU
	BPG9/xjU2OO5JXzVJYY9WDggBCQN5brTkbitKm3QL/ZMwzD4v36qnsyAC58GnVrE69VxX9VnK7QHs
	ZxFUaJS2fQkMxc7tGxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsG-0000000FxuP-2r4F;
	Fri, 12 Apr 2024 08:03:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBs9-0000000Fxq5-3eOI
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yKfHvWoABRl5sMyudqLBw3GDuqqgdkusDwKI6CPTPQ=;
	b=ArvH3ExoftBy5OR5VUssPacDl1OaL68xY+WpawPvLndH+NBcDCzI+VLXoSqVeFQxgc3QRL
	WBXC2biOYMqqzUMFY/tITeRbqqPu4XQGp9lFieS3U040zMQJC7U5b4QVl8sQH8jzXCykK/
	f4rjiRL4TUI4fgGAsLJVOiow/boMTCo=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-B52Oo8oRMu6A59j560d3gQ-1; Fri, 12 Apr 2024 04:02:55 -0400
X-MC-Unique: B52Oo8oRMu6A59j560d3gQ-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5ce12b4c1c9so514178a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908975; x=1713513775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yKfHvWoABRl5sMyudqLBw3GDuqqgdkusDwKI6CPTPQ=;
        b=AnM1g5Q4AQaX7hkjc4Zd5WUP7g6x2UT7+2awGOehSPbz2X74nLzEIAATDhNRKJsdFl
         JnXXWOsbg5g7rx4XCUy2bvlkppNE3yYrhBHPw9pMd3uU+vPiC30ys3iRGNPKgjjh0aax
         e/g44hkhqiDCLwRvXpgzdkwF9Swq3UD94IjKQNIziHtP9i/P0coK9yJivaxhamGinyDP
         i0F6XQBbnRgfyLTB6qO0XldmudMg3RX8ruXdbocMWe79Hoki/eH6Jx8Dsg85EtCv3ZHB
         cBUttK+O/eTAaSHDOl5Bc1jW7PMMQC7Zo3+mbTj5uSwBL9Ok19j5Kmi1Z/tg8QcsDbai
         PzHw==
X-Gm-Message-State: AOJu0YxQvSra1sE5lUDG6n4VISrtPHsPmLIFMfnGxTZf536miesNrT9s
	v8GwXr4cBPzJaUH9F0Jj4V99Ja9rm7ZemRCdnf5MLFbgElJ+IX8k0VgUEzIut6PnVt22mHIJ/3c
	c/z4KBPE7tmWLQQalKI9AzHSB1sDAh2/5We8RqRjSDyx7hhT6XctQnLy3jPokxi2FNg==
X-Received: by 2002:a05:6a20:b2a0:b0:1a8:f807:a683 with SMTP id ei32-20020a056a20b2a000b001a8f807a683mr1742244pzb.60.1712908974685;
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyJtX0wgUO4lmH74Sd9uNUsfNyAttTAHPN/Xd+GfCO9uPzni84bxgj709jf0ECV6wA4qcFQ==
X-Received: by 2002:a05:6a20:b2a0:b0:1a8:f807:a683 with SMTP id ei32-20020a056a20b2a000b001a8f807a683mr1742233pzb.60.1712908974342;
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: rtc: Add optional property "prescaler" in APM X-Gene RTC Document
Date: Fri, 12 Apr 2024 16:01:44 +0800
Message-ID: <20240412080238.134191-3-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010258_017676_E2D91595 
X-CRM114-Status: UNSURE (   9.19  )
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

Add optional property "prescaler" for APM X-Gene RTC.
The clock source on some platform to RTC is NOT 1HZ,
so we need to prescale the clock to make the input clock become 1HZ,
like (32K/prescaler) = 1HZ on the XuanTie TH1520 AP sub-system RTC.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 .../devicetree/bindings/rtc/xgene-rtc.txt        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
index fd195c358446..25ba8cf0cc31 100644
--- a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
@@ -10,6 +10,9 @@ Required properties:
 - #clock-cells: Should be 1.
 - clocks: Reference to the clock entry.
 
+Optional properties:
+- prescaler: Reference to the Value of Counter Prescaler.
+
 Example:
 
 rtcclk: rtcclk {
@@ -26,3 +29,16 @@ rtc: rtc@10510000 {
 	#clock-cells = <1>;
 	clocks = <&rtcclk 0>;
 };
+
+Example XuanTie TH1520 RTC node with Counter Prescaler(prescaler):
+
+rtc: rtc@fffff40000 {
+	compatible = "snps,dw-apb-rtc";
+	reg = <0xff 0xfff40000 0x0 0x1000>;
+	interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&osc_32k>;
+	clock-names = "osc_32k";
+	wakeup-source;
+	prescaler = <0x8000>;
+	status = "okay";
+};
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
