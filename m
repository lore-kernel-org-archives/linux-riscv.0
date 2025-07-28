Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E663C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2v4ZEtXYUdLzZZb9w4M2eZgQPcYjIChIV9EAp9Z3Qk=; b=TxPJOuO0oONZBc
	+JEfgPglcGIyQaRcmbTYKt3zJTVcGz9+JtAyhdg9u0++84hxArjVwzCgv4J2aFv6smkSwWDnR2BHF
	Et4JzDe4mujVtV7rKnlnPLiv/EVNG1gGhVy72Era0Fx7aZ+jqLa09A1vHXagWwDA4XFGDmZMXfjev
	kEq3HM7Z0siKglYi6zUf4Mwolxh9UX47YtwrCSKlPMdDZszmd5myzBYBYtdniVAFeXaSD/EcNCrm6
	nP8LqME92PZ0Hx/bZRlGh7ecUC8P7uZDzMBdYefmKF86SLfBvslmjV6hu/EtDGQFG3fJzkHQCom+8
	zp5kY62coCGcOvdyg30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKRi-0000000E9UI-446r;
	Mon, 28 Jul 2025 09:47:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPT-0000000E95A-1o4t
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3137c20213cso4084246a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695883; x=1754300683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=g0pLeLKm9l/NIsQRUY3b4jEV/88SNFtzqZ6R/unebr/6GUCqphbcxqv7JXZYHCOQAN
         +VV4ha6o2pIdXMeNWRxwVZuRIDZjqX8iSb/25vAV9TQjjiBKpWmuY1OtryUh1Qdj3wPA
         VDYHIh6bPlzeYMi7TOaIiJBkPcn6sWQ4JMAKDLjVYuEpXwD2LlVOU51HHzUp8ND0jbn4
         MdfpMOQwwZZAU7iCf4mwWqtAKduvlXO08wb2xdD8vJnoYzVZ72QpD+8vsOyuBlCvt5rn
         Z7l5qomr6Ij/idEvoXq4Gm+QYWKqExIUOPIGtAlnROask+bkn6+WXs+4ylbmRHCCItyP
         T4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695883; x=1754300683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=ucMoHTCSZEW21ClkvJRFumhWJQAmVSD8bJHX9JV+Bsj+cekECFPNz90btNzJlXwUrQ
         5xZ32W0R6OLKzqY1JWDx6zBbTN8mSSsNAKYwIPl2Gj0zA6puVA5hNtmwZGpRR94FhZiE
         FRETBwdXQrZyZLwi6yU6Tjrt32ZZGuu8mlZdviH9A54dQMrMbKf3Dl6yfRgw/v0ftCiE
         Waxk8JxLs3FRUE0g05M21Ioy89aoqkJuC44WA4+DH8++c6pjQ92YTHQrWa1RTkXUnRfS
         kPnRPhYNdnXiZCclNhBD1x9BgwZjk0mEsn7d6mWJBWVDgMkPYR3GtDiCANoK84eL/GFC
         GJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXqEkiqrEMBen5kgP2vA1BUR8hcrLYJhCg9DU2YquIS0g96TjJ7TdO/QhYNop0QaBuW5riOU780W+/XjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzliT6+RxTcyVQWGsvhigGN+lL4vUuY+h/miW/TofARhlefsCvX
	9CmlyMxNWzAb8UoCiJ6fuzQ3buhtn0OTCdwwgmkzfFZvD7VxKa02E67v14/NzJBF4Zc=
X-Gm-Gg: ASbGnctPlDP1civEvFLUOpfhNOr1Fjq6eGWtlgXdSS3z/Ab+8YXvERjBmA7cfyRBmov
	dhiDpBFuGGfDf3tQRQ14vEdd21RgTlGavnSYzCEMrMsCpP/EfnjkXAl/FoSoaP+GTtkx/C08gmQ
	Iu2sIh/psOp4aFrYjgSKVaTgEEpGHDkZssnd/Tgx9wttxTFrtHZSj1rEVPDpjgW/3QkSkhDouCt
	7DW/D4SHGFPPPmh2MVqSiOH8OPDSaKlFk1k/7Hb9PjuYhCBPBsgp9N864b/9UFSboH4kObd4uo3
	LiBf2tA5IvDjdOGIR1z+uYN1HHN3fuzDTq0uLwvkn1rz7wxyk/oea4v/mmaa5mTOHCmJzqifKu5
	gCQAHlcGLbMnYYW8NqrZ9c2QJKQytSPgIqsuwP2nIj37EUtdIv1Y+K0zH4yHN
X-Google-Smtp-Source: AGHT+IELZc1JoVLYVZkMGvFurZiEqv7IzPn8isjkF2mrjY4D12shOeNQi1Y8F1Z2Ck3l3/NTN/nxsQ==
X-Received: by 2002:a17:90b:264e:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-31e77a00816mr14125480a91.22.1753695882475;
        Mon, 28 Jul 2025 02:44:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:42 -0700 (PDT)
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
Subject: [PATCH v9 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon, 28 Jul 2025 15:10:31 +0530
Message-ID: <20250728094032.63545-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024443_470155_9BBD595E 
X-CRM114-Status: UNSURE (   9.45  )
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
