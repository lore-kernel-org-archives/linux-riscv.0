Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D2CC87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjeRD0orUmP491zDMMmDZc+HX0DGM93xfYn3ja0cZFQ=; b=cWF9xI3Kz0SorX
	8ZUkvmf8dFAz1LPvRyWvZjzYM9ocrUXsnq7E8RQNRwjvUjRtPAzBg2jfyv0fhryHF0xcs7wPhxCK9
	4Q91bGDdHQMcKvzfkVZs8jkULl2rWeaaDB5m4xL5wOIIpEBXPr4BKB56oQOlEf0/9aVgfyCjfYQTz
	E3uV2W/aIfXs0zbTv0VwhxOt0kHgCpos8GamZRY/KMRJkWkTEg/+3M7rCgim9kqJJ+yOS1ofL2k/n
	HxgI5768occjg9+fL3kISJ6ttGTdlKuQQaIfUGJkGfPZh10PldEvzUwmkxv9cffsLhORyt+gxk7HD
	EAOEDFrFUTaC7JpnTzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefS-0000000BUDR-16Ju;
	Sat, 26 Jul 2025 13:10:26 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefO-0000000BUAh-3vj6
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:24 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso114514539f.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535422; x=1754140222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=NL15FjJDsx5+ClNhl3rtdWQygTKwiir6eFUC7kIhDhTsLL6BEmgb2L34WoHzpSfr6e
         5JEgwtyEnMLJPNYVTxD8jVlOjGtb3y4edvojxWh994wzCOgUryEoqBZnvHjw4MVtV38d
         AwRhqLxX6/0FRxDPNoFb46nfdw7SAs7G6VuRVpKKhtGWv4XZ/nV/TRHlq9uxzLo3BPWL
         jMz+NY5Aq2xcYc4KSj0g1sXnsEjJulhan0Sb3tShYQklszG7jC4bQWySjRrysNyQ+a6E
         43r6xatwexHkMHrbafigy7QIO0NjlvZK2O7iqLiEHyhuwZBRIhD6zcOBGzUE+Slh8lne
         wBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535422; x=1754140222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=kqJHbZ25AwWZg/s1Rxio6KvLacHw2AnGLHBs+62aiPsT2KdvH1V5BYXC1WM8Ygiict
         Vyj4HTjpfAWfCUFruPgfH1lVf0ulmETIxIkzYfqxyaQH7lmz0oAl1BAWhGiW3QUsTgm9
         cf4G1ERk7mhyD44FJRuQ5uvlUtPOnu2Gplz9RRs/v5VOH4ebavgPgGj+UNawkXXBswpg
         hfsJBoY7hXFl55wNBLxIZpGdo6Z0ZcHiiFXajWozc5gkCkCBwM0TaLY86bBAWYG/R88x
         kusmYzNBw+SyImEu0anwmWC7WF9T+YANpF34zxZ3d+gosDhsehfd4ayGnuB7qanq1WUH
         Tydg==
X-Forwarded-Encrypted: i=1; AJvYcCWEKoOhTCnDLNEy+GhxKKKDCRdhrFwuMkoENV9rhTFL3HiLySKKQhvhgbGPB/hb4k5fP3CpTAIxpxKJVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze6cVagAqrQ67P1fHZ262Vvw+2Nm5HrT3veZm9+FR8iLhXbEKE
	f14woBAVdyti7JONQvpG+up0SMS80wXWvzSZcWqoffjrru/+jzrmYRykcE5cZpJrqfY=
X-Gm-Gg: ASbGncsIxeQ7GusXNmWA9E7KOQEcux8L9yNJDS58kTd4+A3kfxJMQFW911RQu6Mps+z
	Dik7Jw7fRKb2lkNeTvocrJWXmz2ZMlhnASHdYvlH+Kw0fuoVH7bO+ftjbHKaZiMOBFhndPDMMlH
	HguaoK62E3KY9QA6IZCP0Fz9Ci82njBD8gySZR9QM2dhwyYBz/ddDDt801kGEDaZ1nhK7RcHVQu
	yQJHHEaCKNZiZ00BTMOP+1ICMHKCUKjFFQFCtOlb6rwJqqyjlBIAQ6BruSoou0zKVc22mOdgaGD
	z33u4DuzOCKleQ5gRc2P0ydPDn17Be+QGMeBCEA8t6Xuvv5vKmOACMCGNWZyXRQXfLfaDAMtsUh
	McsHFHvLGFZS7o4GOPTFHK+kawgnmqbg4RrMAoEKfFg0pEvgzRoGA03b2izoh0GY6JA==
X-Google-Smtp-Source: AGHT+IEpZQvcDQ2Fiuw6rkA+hiigtzBH5kJa9koi+D0lRnfSJ/J4FDcv2OYkyFVUHNTZGcQVha87bQ==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr913033239f.13.1753535422246;
        Sat, 26 Jul 2025 06:10:22 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 7/8] riscv: dts: spacemit: define fixed regulators
Date: Sat, 26 Jul 2025 08:10:01 -0500
Message-ID: <20250726131003.3137282-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061022_980858_22433D42 
X-CRM114-Status: UNSURE (   8.25  )
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index ae9409fe398b2..a11a60b9f369b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
