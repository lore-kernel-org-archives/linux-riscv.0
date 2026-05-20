Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968ACD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ya9YdbwzY+QrfBuP2un7rMrrWT4W6NgipE434SZVHeA=; b=qXU9xziMXLqsVf
	pJ30HrMgTk5TfkQJir1gqPwtyH2uEbSrEPuneykAX4cU8d00hlc0OPpqWKOLlV6YCW16hpzq91rH9
	iIEtsC0eZAKYFAemdyWEwcMMKjFb9+Xi9IjNQOcvImAa2XfYOxTegO2bqZT23/ZPt0Mwc/qQkf7eI
	nxVifcBWoMW+IfaEMCQa/HesEY3qgIgKKNNhlIEdebUXCHudv3YAs4Y4r0RtHP5ISG/z3bMOEM6ue
	ZkgUVok1sRAJB7nBUkXrA8sdbN/UEPDPwGk+Ol+Afcl0Rxb6hD6M4J0Xs9qq1qi+iW9najFrf4T8F
	F/nK1l9BL8GMgwpL1dDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPesf-00000004QO7-0bz4;
	Wed, 20 May 2026 11:14:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPesc-00000004QNV-2nqV
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 11:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779275664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
	b=faMNcJmEETfwjGQ5ocoWR5qIIoF3vsI/HpOvHC9T7ber3bGywKGxKfE9H7k64g3GP8mx83
	ybhXnTmDoRIPQx6a19BYtYWKpFxfMWtItGO2CyTHE0K1D7verYpabKLq/x3aShoA99y2J8
	HK2N97/yPhPHFx2+qLyt82rkbZu/Aqs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296--9NQgdrxPeCcDz4BxrSuPA-1; Wed, 20 May 2026 07:12:50 -0400
X-MC-Unique: -9NQgdrxPeCcDz4BxrSuPA-1
X-Mimecast-MFC-AGG-ID: -9NQgdrxPeCcDz4BxrSuPA_1779275570
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5156c85538cso135148651cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 04:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275570; x=1779880370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
        b=gMQr2Mh3yzo8K2I9S/BZXIeqiS1t8yZiiJfMlfv9T0hnT64qgLh31L54YdU2E/Ua5v
         0/rt0m4PfnkupXzWm22mqkRfHusisP50CyTqdky8ReaP1cLsklaMIsRNZZsJXUMqYV85
         gEQrKtIs3YpKJYVJ1vdDGLdkqhghAaVCRGV9otjPTVJcfa+aDpNZ7dyuhoGUb7TfAwFO
         PAgrOqkWtGGyeIMzoUCKBDl1Jt+cNfajVpSijjS+EO/Uhzz8Im67kFiJ5V397W7K4Nlm
         HpN5+8paEltYiOHowB+qeeSlEOqKRn9k+6YIchWF3vzJv2AQQ4o4CtulC0e8QuG/KsDX
         nFZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xCdRwkjl/3v9Gpy2uDYXm9F9R6ZabphIBeaEJ2Ewox5errsOWQQsI/LUrANVi/kyz05D8tGj3r5VgTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI8bVe94jlJnZS34UY0uj7icvQdbZX2/Q/AGJRBcMHmiunS6WA
	+eDJNlt41WOzhxlNrNYD2vPaiMzICNIyP7wIXAdSfSqfqefhRL4FN2I5ETp+iXBjZYR1sy3jkz+
	9sTMdxT223GJJ9y1m1AdvhNAuuCCm3E/aI/0cYrgsLNoQ7wMmH9Ns1J3VOXz8aFgdcBe9Rw==
X-Gm-Gg: Acq92OGhB5XReyL1aAxlgkGwwiSJsBpwZNth1Vr4MV7JKKWU3ooUCCYWecYhSqOQBAo
	eOKSjTPvBg3PG/yshXy8if158BetiIHXywE04/pxi2DUljHIZqb573J8pz75OEXKg85hnOgGxPi
	tVEyPasV0MlBJlSuJTPSY8ontH5P1N+VluVLA4pbge5QtY3GpCGw1IbvNo1Jf5Ob/f2A97oaUYu
	9GYgxPLP9v/7S84ZHOTOzQho63kEzv9eKIB+q3trVxEQmdTpw4xJ7JnjgbOz38MWJIu0tx0nnJ0
	fvbR+ydNhXZz2Pbd1/dB0O2Qx0oE8i+E49gwYXGtM+t5SrpmLSYOQOC4irWuKiePbgd40YyYRMu
	SzSR0PSEgJtds
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308794481cf.45.1779275570376;
        Wed, 20 May 2026 04:12:50 -0700 (PDT)
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308793991cf.45.1779275569917;
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
Received: from rhdev.redhat.com ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360979c2sm119479176d6.18.2026.05.20.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Wed, 20 May 2026 07:11:50 -0400
Message-ID: <20260520111150.3300707-1-jberring@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mMCPItm0Gs-JwtlQktH17ftfa8659jirJw1gh4mEAiI_1779275570
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_041426_773833_7B925846 
X-CRM114-Status: GOOD (  11.14  )
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

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f30..07dbd292eee33 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	pcie_vcc3v3: regulator-pcie-vcc3v3 {

base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
