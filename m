Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMk/VQLuoCA0KPW3wZpjr4k2RgNjVlb4yXwIi20ak7c=; b=RfkiV9a+6i0+qP
	9YsPhgtyqYKxz7HpvYa52hwxs94ySdOE52tPYNf2NrZbwPD+ONwNG/XpWEEdkbd6XVG7DlKbHSGx5
	DD5JsGjo9fh3VbGezWgn/QNgJSetVI3hXsVksB9diSAsaJa8Zl5JQu9qA7V5c4mpWLE6LyyC7OF7E
	JJq6tloEuikDdiF1m68itI3+2zeYIv1jqtCzSQhqocjq6bDwSqvq/eLgHtPmD3533QxjvODjKI6+e
	W2Q5Zee6cVJKYc8PAvwkGvCoTIxYrfYoRwgHMLcuP86Vic/+cXd21Pw9lzQ7tCGRGmVjbrI6UPZW/
	wvUlw6aPFBQk5u6HkKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bWK-000Ryx-U0; Fri, 24 Jun 2022 05:06:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bF7-000HLX-Vc
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id x1-20020a17090abc8100b001ec7f8a51f5so4683318pjr.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=vBU/QhGWkV1K4rpRU6iuVI+/0UvyZtTiMv0XrxYPMnY=;
        b=KBTXLVQ9Myy+5fRcw18yS0lVJWlJWOdd7MztywK2mmLs41m1QyL9u71UUmRkZsVufO
         WBGDCzLQmzxvYVvsyvL43mR/VUG7XnIdk39+oF8XwhmacjrZkaSZcXbdPN9I5HafTNer
         xr82vLEO3N2V2NbYCHw86NmaenfnQTgypXQywZ3rOFxQ8Ry2BA3Q6/1czAnoeM+amgXI
         PXNiI40EmhGP/RqKwo10U5bHYT3e2eMwbnXUA42H/MeYjCJBsRUSv0ePUpNifVLgVv1h
         EOnTPql0DKaJ4Wn1LDQyp0D911OQtivur+xe4+XmZBEwj8WkviY0CU/CFaC8mcdEguoD
         tZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=vBU/QhGWkV1K4rpRU6iuVI+/0UvyZtTiMv0XrxYPMnY=;
        b=KKDQ3bg8sUIQgsGwP2WpRDWqehKRI530Jojc4JC5Mi9+RFyuNw4DGUgV7frze52qUq
         X570RwazKvc0gdKFuRpANcpsXU6aK4sqEucxGU1RIGu4INamCYrMPxGpWkKgD8Z1x6dF
         8dub3uoGjA7gvglwOiz66DMtNs/rS5G6B8IA02Vzw6IQTI43Dh+qHJsujNCEkIh7rInn
         cNhRLO3TUzOXXB1VM/9DiRceKYs7d50Oqyo7B4kN73ScYz7lGYJ0aj9O86tTSAXSLjOu
         Si3JWYuo5aWTlqxhSCWh4tFQ25ZUtiOk9HUmX+bQrEzf+ngdaED/1qqDWoaG8OJ9Jy29
         7dBg==
X-Gm-Message-State: AJIora87tGAkcXJyGn3YwyE5bCt2jLv6RD8nZCHaF2CGu7p0XGDo/uXr
	6JBpg+/okjs30diP7TwzHgwwkNL7x7rQ7A==
X-Google-Smtp-Source: AGRyM1voXMrdQb1DI39mijMlt8wYaDCo2EZoNrpq8QsrSaFoZs/0+hNfar1BHQvqZ1cGC/I8u7r8Ug==
X-Received: by 2002:a17:902:7202:b0:167:6548:3f3e with SMTP id ba2-20020a170902720200b0016765483f3emr41641064plb.98.1656046105816;
        Thu, 23 Jun 2022 21:48:25 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id x13-20020a056a000bcd00b005206d4fd636sm559062pfu.2.2022.06.23.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:24 -0700 (PDT)
Subject: [PATCH v2 1/5] drivers: of: kexec ima: Support 32-bit platforms
Date: Thu, 23 Jun 2022 21:48:07 -0700
Message-Id: <20220624044811.9682-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624044811.9682-1-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214830_077712_D3380E4D 
X-CRM114-Status: GOOD (  11.31  )
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

RISC-V recently added kexec_file() support, which uses enables kexec
IMA.  We're the first 32-bit platform to support this, so we found a
build bug.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/of/kexec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index b9bd1cff1793..ed3451ec2b24 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -236,8 +236,8 @@ static int setup_ima_buffer(const struct kimage *image, void *fdt,
 	if (ret)
 		return -EINVAL;
 
-	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
-		 image->ima_buffer_addr, image->ima_buffer_size);
+	pr_debug("IMA buffer at 0x%pa, size = 0x%zx\n",
+		 &image->ima_buffer_addr, image->ima_buffer_size);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
