Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F6E77183
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsC6qX2OPDLqroKC0bA4ARS/wXtqcYZZuDua2aRNO0o=; b=Yl5uvio2CGYyVX
	yj9c6/E67PbwuEg4XuX3PPL+m2RqkCZJ/oZugkILwcvcpM7isPUrOHbtAirdIyNg+kV0hiGOF8p9N
	/Z6Wf9CHqEKenPxNWXLyEQMnSPG4aivSKO3I3cKbw/UBI/LuYdkcfQzxNz0p1ZyXXq5wygPFMKFXP
	dKViDD63/YuhgjFrBx++2c0rnnuQAKCTkJ5aXvaCUK0NsTBIm1aPY8r/GCBcRspacEK28RskvQiQD
	gtQXahphLzsrZ6Pn/tbd6RXA4vG80PlYof/As6fkUJpd54A/oP2jJx+/GKR3q4D42kW8UeP15CUDa
	fClWUeXNA7DvWJ53ZUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mQ-00000009RG7-21yb;
	Mon, 16 Dec 2024 08:48:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mO-00000009RFC-48vO
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:48:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216401de828so29581245ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338920; x=1734943720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eei5CeEAyNvf2PS4xwdFaq29ZOKnFWm89T3hqpCmQHw=;
        b=EiFeIgqc5kUAB7RPlA3ykItnNY/V3TGjE9mjx7vo7f4CQlEfWgDiAIg6huimlR+Mhr
         5+0wYg4Wji+AZlw6EYI+exF7v1AWvkN7uH/tf0jfdYF3lh3WAnOAWUpJ5MxOsU56WWHL
         Yu3ZnHAB88naVWNSizWcUmSVkJ1SZOGCoJcwiFDJ99cpexwjNwoOiIyur2Wc/FIH8Pu1
         DvGnoYn4/FvnqCpPKC8ft8zwm3H4iS4Xv99SPk+fVL6VsjYWY2h1C9Q0bteyTT609eqO
         JvYfIcXCxrJe2J8k/5NFUvptwF+sa+43PRh1VNIru5dY1ryoM/KHtQcsMRgqydjjJlKL
         OidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338920; x=1734943720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eei5CeEAyNvf2PS4xwdFaq29ZOKnFWm89T3hqpCmQHw=;
        b=VFIssCzp2+T5H/Wa2Zn73XHa0EvbR6jzzzyoIRWyjVkY/dNZeKWYm4GYNRioMPZ4G5
         GJzOD+xGhT7RDeHDYf8pWYvs87hFEaJTcYj94/aF92MH7DaqcJcCr9Hozj5WBf6s/4F+
         lu0k+uKyEplsCSlM5crDr+VPDgt02CcXWqgVDXBXJRAWqjrXt47M8eSHfFg5zf51yrFu
         rVPycuigxeLOHh3LEbWrAtP8KITPoJSQZ0iv5KRDhalPPS9KxF4x9MrIY3P3nmxvkXDp
         ZFj7CdFq6Bx0ZxfNrTrFPqt4zuaKPqE4e5l7fAyeucPpMAZe+KiSovna+IbCaiKpvSBn
         tq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHrP//xxtQTEKSc5dtn4zPxf7q9JVnbVHitA4l+zcsoMcQDmgiBXPtr9OIX4rMwfR7wzzcCrLqlL9xwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1blLg/Yad5k9CfMpLj+wKSGUzl3pglIihOmKMeHEY+UTNmmg
	F2qBpv+jxnO7+KN5BY5qjzeOuPCLrzMduyFpJLHL47xyEgWAoZwon2qvlXuP6ZY=
X-Gm-Gg: ASbGncteZ6lshAkPnkEoEYQ1l5ZGmhRNRCNd4vM/h+FEP6X2G9XamA5ybzaaohmhhHK
	ZBFJOyzo7DXtRFlegYFVDyWtJqT9BKg35nTXxhBaxR4R6aJ6+l9/Zyjn0KdNVsD0xO0yxV9kPBx
	A9yThOMX9LLFqa/zww6x7uTnvg3Ls7zmzrdYrDnscJcfCrhF6WKZ8Xl6HlKMdZ8P0wtXAClOhos
	o2H+Nq3Qe0K1rrtRrA6YgbMd4ngvy72hUs2v+sEx4rKcjtRfrEuFjfNdRoQ1SL1uDNKpS/IPze7
	AEeQ9P/Ke2v0gFw=
X-Google-Smtp-Source: AGHT+IH23xFB2kNx/gOskLUHtyyFSXX+WD7siqR8qRzGwZ+oJpSpIMc4NvB33gu7U5vEEvlRMs2S/A==
X-Received: by 2002:a17:902:ce85:b0:216:7cbf:951f with SMTP id d9443c01a7336-218929c72b5mr138434115ad.21.1734338919985;
        Mon, 16 Dec 2024 00:48:39 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 1/8] riscv: Add new error codes defined by SBI v3.0
Date: Mon, 16 Dec 2024 14:18:10 +0530
Message-ID: <20241216084817.373131-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004841_028307_49099B43 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 defines new error codes so add these new error codes
to the asm/sbi.h for use by newer SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6c82318065cf..bc35ad750e28 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -418,6 +418,10 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -504,9 +508,15 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
+	case SBI_ERR_BAD_RANGE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
