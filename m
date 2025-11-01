Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB3FCCFA03
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbCYNq9JeRShB0gDF6IrmYKx4mwVUhOL96BNRZjMTKA=; b=TsOu8MHc9oSe0U
	SaDZgB0A9eId0CHOxgCTJug4h1nvobPPnLK6OKev+ra/wN4IuP2/TGNa0iYIyp3U94A3He92gFDNe
	EyjkOiyNdWOw4PGr4UnqxSKgwSZ7uGTbZGRxMKevaoxzQhwgB1Bb9vzTPMuHv1pwDTWJ9qFMQh/qy
	oWfwMSX9fue2wy8/KzNUHV47EkhfmWfYp8uDvR6vTrYP6X7a2P/eX33BAS9+0zv3jwIByOOxLXPk+
	8VOkv8eFWuLhCM0aINADXT/TyjYRTKF44Kg5pYVz9XOTVtjtCiZwS2MQglysc5/CwxLXFCi4ywUza
	PbzbCU1HmFauPb5GEs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDm3-00000007tCs-3dL7;
	Sat, 01 Nov 2025 15:44:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDm1-00000007tBb-0JM3
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:44:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29470bc80ceso35233305ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011852; x=1762616652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2XwcEWhGPqe4YWn8OiU0EgUYXN4uylgwxXcr7hecLU=;
        b=bOxF135zDBHVSZsCs5jgUwOA5UbSt3nXQqMGfBgcMKE1doDQukmkARVAx8gY4a8Y2Z
         +K68SamoZ4ao9Eg9z+ux3a09jDU/AyOhEirfxiLHNRllP9p0eyGncgDPXlk3RDCcaZ5p
         N8kJewEN01mo42cL01igGyGTb+O5gGIZnZpUfZiJKeZ0TJrWmiyLiPSa+zLQecdmUlw/
         V67NTrKNaTKZJcGIu6dNlZ3R1r6mRBlYuPxBwmMqKBkjMchjVLuZo9cBx8UDJWdXVtSR
         7YzbwY5cT3F9frU+E7LCYYvgKrGOo507PkL8NI5YsrVtLXKWenyYxw07owzyIjJQ5ZBh
         HUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011852; x=1762616652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2XwcEWhGPqe4YWn8OiU0EgUYXN4uylgwxXcr7hecLU=;
        b=sv+9U8IVKoUN+ctzjwMI20O6/eeYXeL9bnC26AACwd5N41SkThxQWYO8xsbNClM1eO
         PVlDV4TTW7z31/K4yvCnoXcl7A5I0fXSAu+QIjgb9Gj+YUBW9vZFrUgW4U4nYgbuG8ok
         qR9+IdNWAXiiCX02SGP4YWxMCxmVVj4WKylLxm0/TdQg8HYWyMH0nBdroLiV+gotb5vP
         cNaDu3HgunB5cPGmAUNmu2eHTw2mgKM63b+Urxh8jvuYiYETSHegZm9QnjTonO5E1Lkc
         e7tmLNWsX4JW8GncwTK9ml/ylRaHq7RJUsgoKj/yThzFZ4qqGHW5NxPm02hwgzm67RuX
         RJlg==
X-Forwarded-Encrypted: i=1; AJvYcCVb69t5djoao6qgq3dgg8IOrO//5O/UT+1mlwHuMlbQ3jAAtvZpTQw4aadqLWM69faXWb5w8Xmkh7n6ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydhfd2j1FIL4KYETgTX6uBdhPIy/CYMgkEaQPxHuFg+CYnCmcj
	29n4IrFWRJuJp7TUWfB+3OVWo4Kg9kJCvC37aZ3bP7b/X4L0AXCV1CoCHJkulvK068s=
X-Gm-Gg: ASbGncsBhviB68MfYpZwG3xrIrV75qE1zha6ONiYJ5/SVJhTLKPTn0fr9KyuvlrI5Vq
	fAciV9+DuzkxkaKH37ERO451Rs9fN84t5V8GgFT9lSibgg6YJBZJpzUpHCCbcKlhTaH4uTe2ypO
	kMj7ZAQglPQLKZFDiHhtmELaAgiqmM8gGEW/rg44ccUm3DlbxpcHETm/xmY1aLK/hTSWSEKItru
	ZjgLKHCWFxkJD/2guJOYuHZZ/sMFGcgnN7xgU8QfwiOF4dKZFGOWacJHhdMQhyq57gMdieLovEv
	PlkN/csfR+Q5aK31IV5SGdVmhrEaetoFHUISd2OaOf55rLJSt8McdW4nQFoJNpigERAGFDPMv0L
	eMYjWcMs1wiqBdhBQQbY0vNOkNi2c6AUQ6RSQu5u2yad3XJ1A390mYCvdGCD+rNL4KUwoUh3UWT
	twd2xybOmOpt192fvCmK9+gCa/8fvPldw=
X-Google-Smtp-Source: AGHT+IFLXAEw3tjU/Pr/6wioFbhUuNkqtSYjBkNNCIo72pud4xy2at7NIHMIFUUJC02TK+9WqwH1GA==
X-Received: by 2002:a17:902:cece:b0:295:5898:ff5c with SMTP id d9443c01a7336-295589900b9mr26809925ad.16.1762011848203;
        Sat, 01 Nov 2025 08:44:08 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:44:07 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 08/12] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Sat,  1 Nov 2025 21:12:41 +0530
Message-ID: <20251101154245.162492-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084413_116419_3398BDFC 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d2c1ea2a866c..4e870b8f2220 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -305,6 +305,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
