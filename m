Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D20FC7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxcR/zLSiEZMgfC86wbIVeqbQCJSjVF9LZXELUKz7fU=; b=rfbsw8/IFkvuau
	MrpMHBMPgtk/YvJ/AFgTtCpEnbmzBKEcz28mZc9v0Oi5XZVAzW1VosbVw0Kl/aRogaa+hocYEN4rG
	t0wv9aTbM8BYggr+N/K2A/nGcSFLlqKhjTcx0z+/ATdBcz96WHW9B3Cn239AwdoVWWJ7s7HLfykgE
	mNs7Lim8VIYUONtYYSQNwgyUvG4re8D4RkeckpNC46c8V1EyZl1W/XoJu7t0CLCdrOIEoB2CIh7Qn
	inAZmquklRcVHpSG2WPuCilaxjMHUbQXVjjGL8rbL9Sr+kan0hupNTt+AZi0bfwWMYvq5xfk5KWpK
	CHqF3lnSZFDOg/pn+THQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR68-000znc-0o;
	Mon, 15 May 2023 05:50:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR63-000zkt-2e
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-52867360efcso8659389a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129810; x=1686721810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=kaAUDpih0jUhuzYDaFUs796OI6OybZW4z1nZqfRrHyrOXA+SPlupF/HJwn/i2GenOO
         MzyPPOY4cGJe4KaAehRUscWd+g2qgi8mDJQ9bV0QRIy55KGVkS+5Wk9vi6J00+PhKh1u
         N13JLuabsr15XiNoT3fNj0HSUfjN+FKWcifF7TyTZk9aAkXAbQ8gkFXOZBmwSAAvKCTL
         3MYAgN0dA6NXMFKHeV4RfH99zIFnQR+6KkKrPs+T9iojC+ZpnXnY93sTEa2NEpBYdBce
         P9i55KrjWZeJfCegm9P77kc0uLXvZQKRDHAALHHW7sYc2vBxeu+5x3taTtSMYGVDdqR5
         dNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129810; x=1686721810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=kVRDeeFBhlpv4qUxKCQ6bFrkWS43iDzrXgNkoL3xVfCdGJv8zVTpqlA6xU6OLKaF7t
         1eOqwhL6znoOxBfCb40D84CBb+A+2loVkMG7bs1e8VL7M02Nlq5FzAM7Rlky+j8EEBWJ
         BxFSNVDDQUOFdtz3CtcMrk93xeDT6WJ84OwW5tPo1a01MAd8wz2WAXnZxzOSAJVZXEUW
         m0K9qdGeY6XfBO+HYmoWXfnI5Z+HsORKOweHVgyQSObFYf9n7yk9alV4+s9NhFDeMUMt
         GvsHZIi6AY75YM7g3xiQw31Jmd7FRcQRRL3twnxi/fSiFLta4UzizIeUnmwFVWGNLZIv
         181Q==
X-Gm-Message-State: AC+VfDxXw+6XMrlJFToNkpayvJ/sqdW86zFRpVvmiDyYuf9HbC+X3VOO
	wnuj3hW+50jdCToq++tL7/TRxg==
X-Google-Smtp-Source: ACHHUZ7BcBI2fVa1bsi418TFvoRF8XzHHzGww+BnI1uyuoLqplEZz7lN9zxikSRf/UzeyKFTR+WUzw==
X-Received: by 2002:a17:902:db02:b0:1ae:89a:9e with SMTP id m2-20020a170902db0200b001ae089a009emr5693741plx.61.1684129810542;
        Sun, 14 May 2023 22:50:10 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 05/21] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date: Mon, 15 May 2023 11:19:12 +0530
Message-Id: <20230515054928.2079268-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225011_859741_474F4950 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
