Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC6C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0s/v8mPzdU2qO4sXxNcs360aTCR633kfnPpdqjKYFkk=; b=zMzFhxWMnmIRQf
	5h31Ei/ks9Im7QtSqQ9vmlGrqOlw0vPY3L/1Q2WylXaL6rS7wq0/twhuQFBzgtFShcXIKLRL5RX8a
	sjXlprGRWNWLAtLkeuVLf/ljFWXYZl0ZLtqqyjaZUFrE0fRViUQ9AEmjbxpjXVZw84ibWccBD+ca/
	23ZxD+kMlQTQMKiaP87//6pisj6KF8UYeH8fS/WMlvKFC/+hkewhppMSTwbt89qBSAb8NWKdzS1vy
	zN9hPRTkKZSG5dM4AcauewUClIz84QcIQfxNif1FGIW9pFZGxob44kAHFnJuoQTPVJjOxJbghILLS
	FnHvBDZ0uogX3GTYFRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwa-00DE6I-2h;
	Tue, 17 Oct 2023 20:45:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwW-00DE2K-1E
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27d45f5658fso3587894a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575531; x=1698180331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR/IFAv1lnI0y6g+8jA+bwtSS6VCFSGKbX2JFhOV5b0=;
        b=g8PylTso0Q+wk1/3ULvJfgNltwQ9mFfSnHUhgiM9yQlNjEjHaC+wR/Baz+jXZ1tlfO
         YQWMrLEwHwp0Yt8eOC7iH+eXRZ84sdN9IJWjuycEyVTvIs2+WMzcMImPNi/zLqc43ARl
         NFOiYuWqQ+5+08e2sXmlPuleVqP+qPDn6Q6W/SHPhKyotMISRjFjlgNd5kTh9nkd0CDQ
         0ZjJxj0+b0cAQB3IJhAQHGd3sIlbLVIymHUNdMlT/FxP/YhCIYw80g7QTvCUQzcYpJZB
         A2z0AUNoyJGUz1HkGNyw7RVFM4tMKEOsMbf+Xs2LUd53hDc/XxiPiVgw7igOFNVo/Ib5
         No1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575531; x=1698180331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR/IFAv1lnI0y6g+8jA+bwtSS6VCFSGKbX2JFhOV5b0=;
        b=lUGHOxly4djF7rIXxysPREXW7UJOsMCEU+siUeJkVVwxRUSwel4QJeA6r6mHegBn2N
         luT1QLfqrhKeda2qs1uZI2A9OWI2hTL419hJ3OzaCLMU687rAwPqND/TcgRqbdy1rqLb
         Y1ysU4kxgKHIO6UWEvOUo29YhS3iaZ2tIGG5xmB2qHzJZEZHXCTOhKNXk3HRolJbZ8V9
         frVUxxLxPAispuhR4l35uhRXUwPZBL1IZAARGK7yQPNsENLoRac67jajDdUGQmnrULNs
         d8L4wOnahP8ODQjgyiuXOvNn1hcNHQfN2VZ2tiK6+rUBks4ya85F3hU49lzR8EH009Sj
         FdIQ==
X-Gm-Message-State: AOJu0Yww+wxBo3fwz9cOm1+NNHvkMlILqbqld34XhmXaEX2EU3zgJdvs
	CGmSNoc0JXJJY0Z/QkZmU3c5Ww==
X-Google-Smtp-Source: AGHT+IG73caoxqESTeHk5XR1yvgGOUSKaOSDSG943bozBwmE7lSRPCi9n15GPtaVf1K5N2iNcWWPlg==
X-Received: by 2002:a17:90a:31b:b0:27d:50a:f8a6 with SMTP id 27-20020a17090a031b00b0027d050af8a6mr3293077pje.10.1697575530940;
        Tue, 17 Oct 2023 13:45:30 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:30 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:52 -0700
Subject: [PATCH v2 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-6-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=933;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vNFZt2gizhpsjzH9MAKHp09E78+qWWf2znY/lpZAKnk=;
 b=j5MwipA9159XueCAdESnb2EitXe9gLx6ENZSvmnLtlql41q832inr6iR4u+oaVwFG7pwLGGN0
 Vi3eKERq18FDVLSmbURSHVWxMLqysL2SMc3AwBaEAzRyYd2aeL6EEmC
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134532_417153_7B3BCDC3 
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add properties to the emmc node and enable it and set the frequency for
the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..bf55319ba950 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,6 +52,10 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -59,3 +63,13 @@ &dmac0 {
 &uart0 {
 	status = "okay";
 };
+
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
