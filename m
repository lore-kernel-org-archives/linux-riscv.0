Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66107C3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xm19ZA4tHrSlcloPad6a8uNQ1aKtyxaM/RAlHICxoNw=; b=MqXR5jgNp+FLNx
	fPgoCMMP255tdFYznx8ltPJ3vBVPqgBZWyfXzAqAOV9HJtC2yee4SZ41rS1kvk/0H1uRPKuMb1Zqd
	bijkn+3qRY38PZ7v+orIEcaMWusNPNT0s54970tOdZawWfmADWevjTmuBTq3JxJHIlZ1wfa9zUuS9
	eZFUM14lV85sTFxmZHGkTmn8/XWLn9W/2S8OwPJbj9zgpufyhdAMMMLuBKhL5I30qXJyZYnsIYwXi
	pdYj08yYHmYNBjN5N7rh6SYZmWo66ek09yThxHchB+ug4OQuDZsXXcjvhSkA46WiehKL4+fBicfHE
	kp5b/aKF0MSTm65Ks+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hCV-0000000GqOw-2iGw;
	Mon, 07 Apr 2025 07:47:23 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gnt-0000000GjkY-1n4u
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 07:21:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b0c68092so3050964b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010516; x=1744615316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dP9TEDefRiCfKDK6dCXsCuGcFPJWg2jzI0nw7IpyNo=;
        b=DvrfWDdRXDrsL/IZlvIX9P7OQzX8YjTX3AT9UJJ5mlEiyPimIq8GnExLIEeKIr8PUz
         vHylevd6yqQ8gWazgqBtoLmbgPzg7EYDdRMtqggjgceEpg4wpny8PaXuNkHgzaOTvIRY
         q5IFiKFOvirJTucuOLfZBv98+mErfXJKie+uEcfslxVtH0xg8z8R6kVGpLNTIAaAFsmo
         WO1zJHfq6HT0qkhqLO3F43a6wwffIYz6pDvbxgURntSKvztaepx8M0viMd1GLvn43PcV
         3ewDZAF9XaiyNmXWcIIyr1tTAlRDuSB0nxZq0Qjo06mQ59ktYWh3OthLkrOk02LC5OCq
         PoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010516; x=1744615316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dP9TEDefRiCfKDK6dCXsCuGcFPJWg2jzI0nw7IpyNo=;
        b=ps1QXdsxJMmueHy+1H3zI/PUU5Jy7T4XqLN92+fJPTFgxJoxwpThAKwY4pL1jHm+D3
         fAjKcPT+OmNeTkvTGnXLlbtnGvojOir8kV4i2gO+3n0WWdXSe0xWfSXo+qqR1aQ6dWgg
         N3SPm7eFdb3ZAsPe0hQkEG4UbHJPepUjnfivctI53MLon1F5A850XFd8Oo0Jqu7yhYWo
         NdN4NO2aO0OGMMDot708MfDHmLpvObCEZmmZ2ZPkkTjXEbl+/HGXgFZquEgtpHrLICXV
         UvO1btMme+BVz1Usks0knJaLRNSstNrIJN4KshzhjV4TYXnoOW2ip5DxPB0K4/XRjsKL
         oIcw==
X-Forwarded-Encrypted: i=1; AJvYcCUZRuq/oVhjqVrdugAiuMr39FPPmbCEfkduabD61iaH7I1aerd8JGkIE1HgB8YM4ozHa4guk+98xoUGig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpO3pTvPDAZSSQVODdyzeyoSrsD5XhACCi3Mqi6yqcRnJ4vLJ
	vMjQTcyXY4oKm28PvKFe9DjZ2L1ynX9qnO3K0sBTZ6i8kdvXJzFIcxQUUZpa
X-Gm-Gg: ASbGncvCSTvwkHzf1nSbDGEKDdG6Qw8e+JylWqXYfvYbghbxjrvlDkCox3PhvU4cGEg
	j/lEf2zh+feP99W6jkHs3/7XtWJuuHVGkdB73x/ETZmFnn9IUPCRlI+yZVk+HkPlktd/abNnuwa
	lSHx/KcO90ucNA9RdgW6Syk3RAiDbfpNXCgc53iFpuuv3JxjzNq40SieLRsGO2Qu5wSiOv65K4i
	BKeQJ4gsl5857nRJyS/rbYY7Kni0YzOOepVtT0pMK2A7hAmL6vvudXSX6aeyr2wMmCFDH9/JRFo
	pb+8rdbwZpf3sNsaTrDQ+FBDZe3+cg==
X-Google-Smtp-Source: AGHT+IFQxRWIvC5wkqCh6heDsDs6qCBCvJgy83QuVa7jiqs/EDCg6zs/0W+VCWvbxeuO/25zv5oksg==
X-Received: by 2002:a05:6a00:2381:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-739e48cf381mr17596430b3a.3.1744010516171;
        Mon, 07 Apr 2025 00:21:56 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:55 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: pwm: sophgo: add pwm support for SG2044
Date: Mon,  7 Apr 2025 15:20:37 +0800
Message-ID: <20250407072056.8629-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002157_462938_3AEA70D4 
X-CRM114-Status: UNSURE (   7.25  )
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

This patch adds PWM controller support for four independent
PWM channel outputs.

ghost (2):
  dt-bindings: pwm: sophgo: add pwm controller for SG2044
  pwm: sophgo: add driver for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 162 +++++++++++++++---
 2 files changed, 141 insertions(+), 25 deletions(-)

--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
