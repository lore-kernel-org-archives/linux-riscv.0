Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F04C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuA7uy3m9WYIV9YUvrEzNM4aovJbnnfxWHBw80tjsEQ=; b=4wjZtSbymeyWyS
	hc0KlZmNWHI8/hRu+PNUNmEpFZnMlw4zH7Ewf04vEojdSEUTTN3jxVC3ROnCbRUZFAx2+yNb3py9z
	mQHrrSCK4us9qhEbyPz6ReN5A2IKWS0pBHAID4WVkAvd1Ln7So2b6kaoVPBI7NnKWKx9PRQUmvZA1
	6RSf++yvgpEF0qQchdtWw3TyANvwDzz0fasx0hBSfmM4nHKmmhGEsGzXMRU099UJ/2P+W8hPWUwcs
	fdgraMhTISnBAgOHq/ONXLEvUzlBYF15UK5V8N8+10+y/9WhCYVm1cYiYHHtQdrsGaY5IJJxUMqCp
	jaW+D5Omk8fHZQWstyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKA-00000003EZu-1t2g;
	Fri, 19 Jul 2024 16:19:14 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqK6-00000003EWh-0G4N
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:11 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd66cddd4dso6620245ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405948; x=1722010748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=BPvfKzDM6yzfZHK6mN+zLrRi6wJzokYWOLqoi/7r6UHaO3OGd505HyQRY481iNiLWS
         Kl6FxxkLkZxatT5YLffVnt3nTWoAdTB2vnhiXsGJ6LujcCd7VD3wCh/SYaxYZKjTMW46
         1So+zqzsYqPUjeZ4nSp4a2IC6LMUin2RCEBkRsPh+ScJASJK1lh5zT/61dVXTZotv75V
         PoZB248q7/Mju4M53fFh7HUcmvv1JyqIINdW1gY7uCIqhjj/0tJy8laTMjRtqKe42iEf
         RRl4wC092Uebrw7bOdjJL8IFvZyYF/cYV0VuM2eTv2H2JtG4cB9jiUgEDBS0tjQiM6RZ
         UZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405948; x=1722010748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=wjzay+yAc15aERCfujZBRzmNmH4R7umngztyffWWhVV3u+2e7XEXzSCSD8iKoNp+Fy
         f3P8GdiiAJ0LSHQhLFhFobLqIc7II212Fw4yKVa9LBwIYG3MQ2wJGzYJVKnhmxOqpW46
         aDyY2z5Py5oJ47ZzY1PicpCxkDLH2zh6O/hXOMHhF5+YnK03gJViSVZQPYQR2M/qkZom
         uHyWDgvSOZNl2lAVyvwOveWn9x8kwOj6mE7N/dwpEmpQBdWBNbb1Z0Tl+8hvVR2QC9kj
         +2KwPmO7Ww1ZKt7l6H3QVO/MLHcHo5fHkNNKPy7PYF7V3FmRWd0QkujnV0A5Rnzf6S+3
         1N8Q==
X-Gm-Message-State: AOJu0YyvzqlHgFXshMDWrFRR3nunD4W1yrinCbDPuQHmPMxV+i4ana04
	a7K/HllZEP7MDhmbnKkijo4SKU5vLHlfIyR8UU3m4eC7ZqdTZFNH4/2J7jjbeFE=
X-Google-Smtp-Source: AGHT+IHcbYLzjsQXxyR12VWI6a/X+tuZJKGv0nHCdOgw0JTLJN74hjSslq1loINAIy5i8TPsdxBDMA==
X-Received: by 2002:a17:902:e741:b0:1fb:a1cb:cb25 with SMTP id d9443c01a7336-1fd74620ea1mr2584715ad.40.1721405948581;
        Fri, 19 Jul 2024 09:19:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:18:58 -0700
Subject: [PATCH v5 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-3-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=sngfflM5nSLL/9h3hkVIPkIG+9hFUZXHyVmtvYEqQE6t7Z9mbcoiiQMzdG9oZa1acy9OwwhRE
 fH5wzGZXreIDIJjAuA2dBNMbHed2lJBKOXFbMRmO5XQL9nGC0jjFrsq
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091910_291341_0F980CDE 
X-CRM114-Status: UNSURE (   9.34  )
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

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
