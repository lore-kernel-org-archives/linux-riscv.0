Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D6ECDE019
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FBy5kDN6Ul/BDzzP9Zq5YE9bKdjNs68UVcs9EdXPXAk=; b=zvmwNtJTPv7zn0
	OpaWWjms5CD9R+Va9gYrvCuHAk12VcJqNbAFNa9x5/DClW1YOwpswKwYhqZ1VMmOzdzxqJGjNm8th
	FYIwi/+BvQ9jXoI3BUXehwzqms912PG3f/ip6oSCEhBbo6XGgFHHCgmZCrQ+Rs4Iszu6A+6d6/53b
	BEeFx3NbVK2PJ5J7daJFxZoB4P+wQk2xrmw1RDXEiYCsa9KS+FaeN+y0Hde3c4JwIdBYbk2wnV/jl
	jMmFk8eGLq9FMtRBAKFfkA7MxYpRuDy5M+qcwZcUCAdK4SHJvAjW1AXrxBODWccreXwZySJXSNGKb
	4ejFFPMkRz66U2IlA67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo85-0000000Bk75-14zS;
	Fri, 14 Nov 2025 07:21:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJo83-0000000Bk6V-0o11
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 07:21:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29555b384acso18236415ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763104914; x=1763709714; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0A56XloRJJ4iR4AVr+dpf7bQO08a9B8xAoWaq7hlWg=;
        b=HkOY6uRisZTNKQvRFwd8JsyEc4IqR0KmuotTJVcUQ5h75pFi9L8jtinsExXBf5+P0D
         XCb8XBIDKmNJD4SmLsKM5E7aBcVGS+6mFQSZXFG8khWSNWTHEey5zoXhTMffsZr55AsJ
         Ctekol9kwtnHDv47hHBWg4FuUTdiZ2DHYgIV1aHGnhzvoWFoX7nairjIXfawyeupnoqt
         euB8Q9MjLJiEbm637osBcgNB53j3fvHhrae773J9zw13Boi8xZoQbKKK8zYPfah81qsN
         jLUFqLyTtn9bAewEcZmLBEs7XWF3tcFTYQDJeJ1bX2dzv/FMA0Qr6slV6pigvT9o2qhY
         EHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104914; x=1763709714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0A56XloRJJ4iR4AVr+dpf7bQO08a9B8xAoWaq7hlWg=;
        b=YVTh03YavQLT96W6yrgwDBAUOS9CwDQC3UQ4fzHwb2L4oJuNj3olntzvNsqIr55kBI
         GLGQpRE1dx/fSs+3GqszwYACGBPjkbARJFvwSgxU74bH3rGfllQ6/rSlXgot6bVZgr/4
         LALXjUMPpSULjiM+XY9+Llu1FbonXsBgVEq1nVXsP1JdoQ6oKSj4TgdGbL1+V6cWwa4b
         Lwaxelo20CdE1miY8zadzAUfu8PtRJm2wZ2ui6w8QnLvc30613GQXFC98t0BRY2oAgX3
         +ZVSnEeNAaAsTz7KpRqmtxz1yoKn37A0zA+C2KFH2ElXrtemFv6vMRMWMXuH3SiEYS4C
         tljw==
X-Gm-Message-State: AOJu0YxfE9aIsV5ynro6+x51Z0iNB93EfwLiP9WVcLEyf91lkuxyZAgg
	1dlVPo7yBQGCxixCEQcY8n3/na2sD1yDB24YsVPesvnG7jlquJmQqJP+Sl1l/Xk68GgWbsL/UJc
	l7k9kdBZEJ0fMtiW9IQSeaXz3hUyeAR2Cco6sx0V2gaFdOuIW5gkmLlCNbix6xYe0+h3eqnuiw0
	03Cw9lSWY5abbMLDQAxcF+NURoSQnRWxn670rhwfV4vYlFLNKcBwk=
X-Gm-Gg: ASbGnctHNO6lYF1BUj3gAeTKcKwQVTsHR2gHcHZov3mVC+vhLFHMxxHdawYPcoKvjjZ
	pCjSlQ1hOOaijmdXaX4zp2r7469WJ3BaUHJh+BcfHxE6Tnm1/AmsQlWMoboAWIFqhefjZOvY1v7
	V40/5xroq2F4IEBx9AJbvJF803YRWuQ0ZDiZwZV1i936mNonNyp1jU5JtWd8aZ57WC8++XUh25Z
	fcjfv35h9TDff7Ag1Ofs/bEHv9eCkLfviqqOZSWYnGCJ8oRryYv3MQ8a0fS2MF7DtyXlUJy7OKx
	g3bRu0iikp3Oxiq8DA71DMnUmddM5gdgLugErHGEOqn5cJKDp0i7VKScUwCXWx2xLbWbP54AEh3
	U7bRjHZCn6IFJ2o+LTevNSK4hUe1iPbwKIORudZaBj0uR3hv0ixTiyUNaXExaLqPFCOtJyx/Trg
	==
X-Google-Smtp-Source: AGHT+IFZWCpRl57XrDkA3YEIT1xGPAdDESDm2SlXVne7a70jhubHiCCs7CD2g0zrR/6Lx7iAuEA8Uw==
X-Received: by 2002:a17:903:1104:b0:295:9b39:4533 with SMTP id d9443c01a7336-2986a73b30emr23015655ad.30.1763104913954;
        Thu, 13 Nov 2025 23:21:53 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37703a0d9sm3859444a12.31.2025.11.13.23.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:21:53 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 14 Nov 2025 15:28:44 +0800
Subject: [PATCH] irqchip/riscv-intc: Fix missing .free callback for freeing
 local IRQs
MIME-Version: 1.0
Message-Id: <20251114-rv-intc-fix-v1-1-a3edd1c1a868@sifive.com>
X-B4-Tracking: v=1; b=H4sIACvaFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3aIy3cy8kmTdtMwKXQvzNJNEC0MgMjZWAuooKEoFCoNNi46trQU
 AVxlRXV0AAAA=
X-Change-ID: 20251114-rv-intc-fix-87f4a81a8133
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_232155_263000_93DEDEE7 
X-CRM114-Status: GOOD (  10.26  )
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

The irq_domain_free_irqs() helper requires that the irq_domain_ops->free
callback be implemented. Otherwise, the kernel reports the warning
message "NULL pointer, cannot free irq" when the user calls
irq_dispose_mapping() to release the per-HART local IRQs.

Set the irq_domain_ops->free to irq_domain_free_irqs_top() to free the
IRQs.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/irqchip/irq-riscv-intc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index e5805885394ee3892a9a9784a937e234490ba0ea..70290b35b3173eb1fd5eb448f5432735210b5444 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -166,7 +166,8 @@ static int riscv_intc_domain_alloc(struct irq_domain *domain,
 static const struct irq_domain_ops riscv_intc_domain_ops = {
 	.map	= riscv_intc_domain_map,
 	.xlate	= irq_domain_xlate_onecell,
-	.alloc	= riscv_intc_domain_alloc
+	.alloc	= riscv_intc_domain_alloc,
+	.free	= irq_domain_free_irqs_top,
 };
 
 static struct fwnode_handle *riscv_intc_hwnode(void)

---
base-commit: 6da43bbeb6918164f7287269881a5f861ae09d7e
change-id: 20251114-rv-intc-fix-87f4a81a8133

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
