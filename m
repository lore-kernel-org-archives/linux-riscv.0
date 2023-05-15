Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EEBC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xur3oikoASDXDO2x+zWTtL922E9GRtyItPWehrTqM7A=; b=E0mFLdcTLd4MFB
	kTrIOZy/MZud9wo20/ruUQg/knG0lxa+gprNKzHs/ofW65f3uCXywlj8jYvpxuTa/N9pR6qhP/LY8
	/U8qfL6FzejrcVBJgg7/EPlwTiHRxzI8ab6yxEJ85QU5OV99IFBvrx34lVbDTmQxjCgu1scLUE60E
	/FrOZ/7JY5WQ5KuVRWkdCJZRMZOgJPp2tIo5SptIe3E7yIGuU6UZauMUIAsqJg3kVgA4cNZGTE9ZD
	R+KhF6GFodAfaekuEHrSjOey6kStKmgHWCpQRIhpPc+Ls/Y5dAzT+zBZflOdTL/pjTPQ+ynujE/42
	XNw/Vd4OGfVPdOfNvKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR83-0010sL-0D;
	Mon, 15 May 2023 05:52:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7z-0010gy-2l
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:52:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aaec6f189cso83319605ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129913; x=1686721913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=DF3aOoyY2x5iaGKXW2mCt0x/pQaAbDiKZZA0gDxjyLTyhSF3crH1dqxukCLNdHLfzQ
         ZzllGl7O4cpL+1Ul+Ds+6Hlon19xGezeeBDycdpnw1yNTf8V0jBLjijIo+4x3N7mMVMm
         isEMw5L4IMR6Yb/m9GcCKifj8e3SKkJs+3i2W3GBRn5jdibK+1JCAXj2pMZ63lvDHW50
         sZfCOt8sZJqQyLYQ+Oq/WAW56pMLyY47+byTDjC10jgBeL3W30bL0F7M6vHfzau4iz4q
         t0kqk1PSabd2sPNafnYuKBGJfSKY19q3eIGZWj6Wm7bKwjIEx1AbGBqBd0HU8LRKruDN
         NGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129913; x=1686721913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=L2yzAip1vGXhQIU2/mqxVUoB+xrf0tGDMKk1FT6OCaQVCcJE2fqDNjIZbLdkX35ELc
         0cdo7CaOIcQoWsuq0ABe8ra9s5ux5fn2XwvHPVOxV/Lu8Z76KHGSTAklvlexG3FL9M0k
         xGsJtDaW90oBtp+jNYc1V2sHUhjfslt8yKm/UeRVVZHvKoG7sPNdpP7J9UJ3I5b7Pigw
         dw2hbL1L8zA6YuprVMWqYiIqdMa/p86qk2rrwRjIVF7ZpG6KVkQhlt1ejUKbyMuRo80Y
         tTS4m6SCCq7NGqYZhWgVV3QQv080pBHGzFOF10v41yuzU+KdabDb2SfQGrll32mdmz5Y
         ysLA==
X-Gm-Message-State: AC+VfDzC+xwWJvFTvzC8cSwGmB9CUXS3OaIZP9PWHELtZdoBx1Qm0j0H
	7zwF/33JLwMD+IZUc20YC0H+8A==
X-Google-Smtp-Source: ACHHUZ5cT0y2rm0ss7uQXiWI3AwrzqmHogjFI004ygSntqdlQauc3fg5I5daloTNm/BF5SXIXJdw8g==
X-Received: by 2002:a17:902:fa0f:b0:1a9:8ff5:af43 with SMTP id la15-20020a170902fa0f00b001a98ff5af43mr30429186plb.18.1684129913618;
        Sun, 14 May 2023 22:51:53 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 20/21] RISC-V: Enable ACPI in defconfig
Date: Mon, 15 May 2023 11:19:27 +0530
Message-Id: <20230515054928.2079268-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225211_897309_4C9AF67F 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..d3d1fbf2dd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -37,6 +37,7 @@ CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
+CONFIG_ACPI=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
