Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CE6C677F1
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2pO8PJwJ9UrMyNjdXpkTCC5Da3VSiqyuYzNB7GflVI=; b=RgKpK0Rcs/3HO7
	TpFIAQejd9Vcy8XQY7uFgjDBK/BunTFdjETktb+WMHdwBsAXYTxQaykggGXnT1LrV4UIMeF20/byK
	O5pOv2GYuB0so9O7FS2G0IRlHIOWQHwWiqFgHLaStnsVrjT4SbvY84Q1Uh1EdCP8QcVh2K51cziEJ
	IeOJ4tZlHw9sU89tf7S52x4MepapxMRs6LSvA+3iUhXbiqjeeZpk2F7vAY+nEmAg2btFCI4HMgKHR
	jmgxza4NgcL1qokFhG3nqgJ0RoSCkZ8RcaJVV07qCGcuDOCCBxppcl1KEaA56Pxtb4LO6sUDnltfZ
	w6ySIhTIkhMWkM6o0Y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFTH-001F1h-7s; Fri, 13 Jan 2023 08:31:31 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFTC-001EyX-Al
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 08:31:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso26272235pjp.4
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 00:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIstlIhP9pl3goBvQueMqsqc9cYboCHYREaZayJsVqk=;
        b=VxkzPvdFgcDm1yhAVvF640GkpkEldw2iJ2plMjabFbxP/U2ml+k2FrHjB0c9vNhm9r
         b1ChL2D6l8uVud094zZmrky/pN6MrUtexVryIoLYRkUdX6PgJBxufcsJzOlXrtMtYUdG
         q7IR2lpZd0OLFR46EOsxwv0UxQ6wGSnQhUUZi1ZA3/mEO7onNLpI/FfhT7x3f2Xmsza+
         wkhCSxYbn0mAyZzaOOcHVSooIj51FH1QLpUnklX10mq/Dr9CRdWmyvC4yrbOA2mgPvRG
         F/rhfy9N/kQxKQDFhhLTqTa5mVC53drVDMFusknIexal5ErMvTgnBzlg/MmnL6tJHLRy
         NlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIstlIhP9pl3goBvQueMqsqc9cYboCHYREaZayJsVqk=;
        b=C/FxgaVEOPlVnLYlcsjnYgPuKty7P7PRqUvdoSAk2uzfCwhKcPoaCHfNNj1AYkNyzv
         tp0Pb4xxs+hnIxe+FXXu+04wb1a1Uk0i0/vTUPleKq7F1OV+sfmvG3qcrqkTAV3OfpHt
         KnGlr857j3DOmxqUvV4q0HacSFXxAA2ICrJ5mV2nF1v2shLuCmR9CPmaRbMF6AumEZnw
         hlaKcca5gRG/mMGgNPkmc2UyIPAJGQZ93357DyaCSx0OQ0aKKjSzTcHkTtQ0NWzJhrYa
         GL69JHk5MnwbRVf8qRvibf28nmYFgwmqaxe6N8jcBx3cN2xO2f0OyU3c3NWlzNBOuV+O
         NKDw==
X-Gm-Message-State: AFqh2kp5othXdx1SWTCCrT5HorWIsR53o28M3xbWvreHSzs+JJsdHWgr
	lYe+8ZgOqK+dZ75hBOoPIuHInw==
X-Google-Smtp-Source: AMrXdXtiMdLCb6FbPHWbu4MyygTsweBV7FsXTLoXbv682Z3U55psFNKQ/EyatQWxw1DVR/JXzi5TmA==
X-Received: by 2002:a17:902:ef4d:b0:194:65fa:c354 with SMTP id e13-20020a170902ef4d00b0019465fac354mr4402952plx.20.1673598683253;
        Fri, 13 Jan 2023 00:31:23 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0017f73caf588sm13466123plp.218.2023.01.13.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:31:22 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 1/2] riscv: dts: sifive unmatched: Remove PWM controlled LED's active-low properties
Date: Fri, 13 Jan 2023 16:31:14 +0800
Message-Id: <20230113083115.2590-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230113083115.2590-1-nylon.chen@sifive.com>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_003126_386659_9BA47AFD 
X-CRM114-Status: UNSURE (   7.31  )
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

This removes the active-low properties of the PWM-controlled LEDs in
the HiFive Unmatched device tree.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..11f08a545ee6 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -52,7 +52,6 @@ led-controller-1 {
 
 		led-d12 {
 			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -69,19 +68,16 @@ multi-led {
 
 			led-red {
 				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
 				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
 				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
