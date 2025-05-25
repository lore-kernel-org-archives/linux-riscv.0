Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9476C54F30
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1ihPV7/T1q2WptGIpex4qBvh57a2Wyv1ks8/0yzgWw=; b=QsccTORHTBZGfn
	zPN0tJtmbSREcOwL0BoZmQ86os89R5nGhJ38HJaW52XusQ6ppUIeNrJ8HGkefURIQA83WArgDik9u
	UPXnoLD6fbY2VTb6VlZB1dljuVLj4HtprNw+BFPYoyuPQv5QQX8eFQKirinwHgQiZJ6cXD9tf+e5D
	rVfmjCo7FoLidAd/UoLUA2p0zSTy2ANmV98znrTVxRIjKfTpUyhqIwpMM8cBqUprc5GxpUBznS/Mi
	Pu72BCatAYLfk7Qlvv9rv/Pc8Vl+GMCLYjaLZLalMrGL2ZO/Fm5tRSzsAWA62NIjnx9YnQi3U0bii
	k6TF7+wD7iY30oOu2nJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8D3-00000006vKy-0rDX;
	Sun, 25 May 2025 10:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73w-00000006nTb-1INV
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=; b=MRsSMraiNBM9eCht8lDgbu3qEz
	gb9/AIuJ/SDD2hDofJxdOVau32c8Gg20SwiMFDaIEXAxmjEI67mAe0QeVqndQ+tV9QtaLVRVfUun/
	jayJOBX/VsZnv0NHn9cygzykUzN8JDG5cPZY/OC7HyKrJjgB+ySFEJLhzwpbu9NuOo3u2bHO4Kiu8
	aWfrC3wQXAURI8M6tO5/Ml9Im9L6Mti9uXuWcplryqK+z92HwiZYxocxQ8E15aE45wZD9OcA1kx4q
	Oaql63JQTZMo1+FZzKZ0Rjtj1MD7U5+U9yTmHEUF2oFzTZ3PssJSZV7d5Af1OLVjIclPejrH+cZId
	xJ/o6JJQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ73q-00000001a5c-2xb1
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso966875b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163025; x=1748767825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=OzF0rHyPtTwNC7TQbKbPhuJRhSsOsjM7C7gIqNeVNOD1zv+PpOFgZG8+3uNx7diEOc
         LSo31iAGWG0mkOZ/OyLH5Zp8ITUXyzGUs1NPztdq58Mg397QeJP0on9UeZM+NrD7jbZs
         ITy2OumK9hFwQ+REOgSgP5FRpC+2JNX0rz4tr2ym05cE/1aICcZvBy1MRuI/AFSNlRJi
         Sn9FnH5rS0oXwU1HdMkkXy2pZAcEssthK+nPoFmAw+Tr8vQPq0EHIOHkmZ8t4N6858L+
         5vEyzWS4yb5VFAkSS6UEkYwofLfFW51pKGUazJGf/jM5H2td4Bob6yd5OYeGwSYfOZjl
         UkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163025; x=1748767825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=tIVsaXiFQafoZMuX607NVqUDll7lhPSVyogJnHympjNtSz7RlShW9sQ/OeZYaFkQs/
         6xIxwdEB6lkoQit4o8x3qaxKYqJPQw3beCXyhme7msx6r9Rtmv0zhxrDPRclJD5Huf2H
         vRA797j97slyW9OrQqqvTGIVHFepaHSsJWVKwRbeu9lK4nWq8UkD9yPM51Rz28In4uZM
         M8RrD5coqAZ3XMfzAfu61jewgB3f66OgfcWXEq+8hoJWFpQb0UMojR2pnwth+/z1ZXZl
         R80KmopgZZtDJAFRv14HcRfARIrxESuNjP531EXufkUfldmYFj50Xuh3NkG5Nt2Z7lw0
         NdFw==
X-Forwarded-Encrypted: i=1; AJvYcCUdZIDdFMClStu7SxXcQvfUsvPxY3QrumR+QEljKq2a9SK8WZXd0n2f39EwF0oyUTxLaetGd2GeJ8JIFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOlQ/F13m9zjStrPejqCVsHruK4pasAlanb4CXaXEsVU8nSTqg
	ZN1XOqYh48YZoEwhDjfOMnDAaSbhhH8NHLRLkQ7pOy+DBr5VQq6k2oCWB+WliScS5cI=
X-Gm-Gg: ASbGncvfJ7sYRXJUDLMfgFNKNVN9CNxaAW6lGsRTFUZxxcySDXSizRVMqDaAvP4yWHn
	eDLWq9QmCIUrqlReKxgizQAq1DsNuq0oJjh3uz/9sbCq/QRuQTnL28guS9kyxW9RJGMQk9x3SK9
	HdVR0cUkaHufivOfva+5C+RhGzXZSurkmVRnwk34/aRbCuoF7cdZ2ESmF+hPEZf/3HEgvHRYIrR
	ACXFl/h7ThHzPvWTYdH+Xs1WIVdb2TkMW2c0ZFrMbsjzLWZ789IE4sq/aKrhEDLdDe1riT5lSSr
	5Pq0mlLyT/QGl2WvmuaZBOlZCHuCYXHZpuEMvwW1jp0dzPQVvf6AtVci+IzEsobbR4KKerNtGiJ
	46mPtEblp
X-Google-Smtp-Source: AGHT+IFV8zP7Teq2vsm512nvDsFUymwEFpC0Lvaxr4DA6qwGTvoxd+WhM0Vc6uQMO7LrAvHUtRMGMg==
X-Received: by 2002:a05:6a20:cf8a:b0:1fd:f4df:9a89 with SMTP id adf61e73a8af0-2188c299354mr8476555637.25.1748163025062;
        Sun, 25 May 2025 01:50:25 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:24 -0700 (PDT)
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
Subject: [PATCH v4 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Sun, 25 May 2025 14:17:09 +0530
Message-ID: <20250525084710.1665648-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_095026_998390_663CDDCB 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 3c8e16d71e17..6aa330f4b67f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -141,6 +141,8 @@ CONFIG_MICREL_PHY=y
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
