Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9501AC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2v4ZEtXYUdLzZZb9w4M2eZgQPcYjIChIV9EAp9Z3Qk=; b=hLcR6LnBEUI9yJ
	p3eu4yxJCMq3r8lQNTWJAyAd+JIuq2OiaSjOhA2UNjYOZ1P6gPz0yNdxBbX7vXJn53efU7Fjy6Fhj
	xtLyF8jnAdlcCHTqQfypUas/It90p2XZFLDsINQPQMrc9peebIuOXIzaAMSZ8ARuFLDDLz4+wQ3Vg
	CkP3xsWi00VnZ+YBv2UFo0j0P5JnNBTNr+l7HTSMBi4eAT2syAOsh0obRF9CnCx43HBLfYJ3+GMHD
	/I195J8dAxLHwljZ9Ext/XKVvMKNkjoLTu/NU5bmlMhFLl3b2pCkNZoFeaZv3saLsPptO4Zhy2Dmf
	PpHc8nMym2JQ6DcNdrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFP-00000007XyK-1Dem;
	Wed, 02 Jul 2025 07:51:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpq9-00000007GV4-0wpb
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:17:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-236377f00a1so65066105ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433420; x=1752038220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=TuEmG0L9fHFPqqhCRVMyey7OSwn6R0P+STYuq6TUulxb1C2moKpTk1Su02GIJhQMHt
         zbftvwdS//3hJgy5pN9ergxYPhjdtcWB+i1odRnWbLyFKOaQLQsFnB+mF1/FrJvSrPbz
         UGo8f6P/qHy+6X8tQ3AHby5RprYIAujLpHViJPtRAi61IJ52ajNcFhsvEX46mu+bx7b3
         gxMFIw9+uCScHD39Sh4THJlSDVf5scVP4TcRi8a/vBtmY0LPSBHzQNdAPrx+C0sdOorR
         V8YxNnu2UJ5TJgJX/WOlpV4GDDuLzRsEoZSOHPcD0SJSXitbb2y+OG0eNyup0X9ygThb
         qEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433420; x=1752038220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=N8RMjid1ruHdww21lcFEr72guyA0fgjxgC4db93lDjNER33ZZITQAwURhqrD7xW58l
         S06x2fPo8m7R7t6oBsYOYOQMuHMwN3pKKSjyfId5wF/gLAj+nGEY8YoV/GN9Y1IwRAbk
         uC7PRE9vQPbmY731/XaGHZBiicoC3g5yHBlKsG6taGUVQO2tHrOflnfcQ9sox8kW5pwO
         vMHn+xTyUVhOa/pq35T4IdfqsnyU26vUjmV62hAhhSxLWKuZXKdH67+1wae5xlvxevT2
         rcApwlLFoJLExtlC4oXv+CmW3ihD244kU0dIAQ3jvZLYhoYHSceT8wQFmVsOvhdk065x
         6Y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXEpKbGmbu0dR307osNttoe3DoQaoGRi36s8Id8wjEyT0P9m+K4mKvnZrADH1uFMaVXYbLysOKGhFvPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKW7if9+cOFPSNTc4srwD/ZXMBZM/Y3HLYklRG+q2RVausmZvS
	zVIdd1G1W7M+GsVw8XKvoAxaOpsa7OSq8IbJZEAL8JfuOT+LJW7nVfRlvSL8uAXmCnk=
X-Gm-Gg: ASbGnctL07kujlIJdQSxe1+hu/BRy0R8YksrDJTGnNLNdl34Dsc0BD/K4YdQbOTeCqA
	9NcQQY2aD/ITW0z0QujI/uWRP3SU2J50Zh7mIiTL60Jy7iOug0ebTlgV7Q/IErbUu45ozgGqPMm
	mN0ATuIErPGLjPPtpxROA3DI6m23sxqykwe5M49A7ZHTkw6+ikIIxQnkYbbAZHLDlvD5nsg/XQB
	LjXRfPvkeD/x8zRN9vJyoMOmuxU2KBWZ6A3HxbVGtjbI506BkWk+lSET28C2dEcq6C+9jKK8AJ5
	vgv9x8V4Q8y9+mD+Q/SsvMp0Naj3+rQVx1qQoLBbUPnoc3yIERAH1ZeBZ0bbPMdFuXSDGtqArPv
	bmbMqTMXCOICCpZqH
X-Google-Smtp-Source: AGHT+IHlJ+t9cxCWGd2RS36udv84be8wQSLtZiGp/SQb5nMAYqyEcYkpZ750MfgqwwlAexTx+Vl7eQ==
X-Received: by 2002:a17:903:1a27:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23c6e58df66mr23872195ad.28.1751433420424;
        Tue, 01 Jul 2025 22:17:00 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v7 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed,  2 Jul 2025 10:43:44 +0530
Message-ID: <20250702051345.1460497-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221701_262843_9FE8C150 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GPIO keyboard and event device can be used to receive graceful
shutdown or reboot input keys so let us enable it by default for
RV64 (just like ARM64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..bd5f97e1d1a0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -138,6 +138,8 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
